// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a checklist.

 SeeAlso Telegram Bot API Reference:
 [Checklist](https://core.telegram.org/bots/api#checklist)
 **/
public final class TGChecklist: Codable, Sendable {

    /// Custom keys for coding/decoding `Checklist` struct
    public enum CodingKeys: String, CodingKey {
        case title = "title"
        case titleEntities = "title_entities"
        case tasks = "tasks"
        case othersCanAddTasks = "others_can_add_tasks"
        case othersCanMarkTasksAsDone = "others_can_mark_tasks_as_done"
    }

    /// Title of the checklist
    public let title: String

    /// Optional. Special entities that appear in the checklist title
    public let titleEntities: [TGMessageEntity]?

    /// List of tasks in the checklist
    public let tasks: [TGChecklistTask]

    /// Optional. True, if users other than the creator of the list can add tasks to the list
    public let othersCanAddTasks: Bool?

    /// Optional. True, if users other than the creator of the list can mark tasks as done or not done
    public let othersCanMarkTasksAsDone: Bool?

    public init (title: String, titleEntities: [TGMessageEntity]? = nil, tasks: [TGChecklistTask], othersCanAddTasks: Bool? = nil, othersCanMarkTasksAsDone: Bool? = nil) {
        self.title = title
        self.titleEntities = titleEntities
        self.tasks = tasks
        self.othersCanAddTasks = othersCanAddTasks
        self.othersCanMarkTasksAsDone = othersCanMarkTasksAsDone
    }
}
