
import Foundation
import Darwin

enum SingleInstance {
    @MainActor private static var lockFD: Int32 = -1
    
    @MainActor @discardableResult
    static func acquireLock(appName: String) -> Bool {
        let fm = FileManager.default
        
        guard let appSupport = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            return false
        }
        
        let directory = appSupport.appendingPathComponent(appName, isDirectory: true)
        
        do {
            try fm.createDirectory(at: directory, withIntermediateDirectories: true)
        } catch {
            return false
        }
        
        let lockFile = directory.appendingPathComponent("lock")
        
        let fd = open(lockFile.path, O_CREAT | O_RDWR, 0o644)
        guard fd != -1 else {
            return false
        }
        
        if flock(fd, LOCK_EX | LOCK_NB) != 0 {
            close(fd)
            return false
        }
        
        lockFD = fd
        
        ftruncate(fd, 0)
        let pid = "\(getpid())\n"
        _ = pid.withCString { write(fd, $0, strlen($0)) }
        
        return true
    }
}
