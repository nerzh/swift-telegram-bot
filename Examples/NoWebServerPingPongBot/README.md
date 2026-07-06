# Telegram Bot

A sample Telegram bot written in Swift.

This example uses **Long Polling** as the transport mechanism.

If you need to handle updates via **Webhooks**, refer to the corresponding Webhook examples instead.

> [!WARNING]
> **Long Polling is intended for development and testing only.**
>
> - It has significant performance and scalability limitations.
> - Bot responses may be noticeably slower than with Webhooks.
> - For production deployments, Webhooks are the recommended solution.

> [!WARNING]
> This example uses Long Polling via `getUpdates`.
>
> Long Polling is suitable for development, testing, and SMALL deployments.
> For scalable production deployments, Webhooks are generally the recommended approach.

> [!WARNING]
> This example uses Long Polling via `getUpdates`.
>
> If you have troubles with answer speed from your bot - you need to switch to Webhooks

| Characteristic | Long Polling (`getUpdates`) | Webhooks |
|----------------|-----------------------------|----------|
| Delivery model | Client requests updates | Telegram pushes updates via HTTPS POST |
| Maximum updates per request | **100** (`limit`: 1–100, default 100) | Not applicable |
| Update retention | Up to **24 hours** | Up to **24 hours** |
| Connection type | Long-lived HTTP request (`timeout`) | Incoming HTTPS requests |
| Public HTTPS endpoint required | No | Yes |
| TLS certificate required | No | Yes (or upload a self-signed certificate) |
| Can run on localhost | Yes | No (unless exposed via a public tunnel) |
| Horizontal scaling | Poor (only one polling consumer can actively receive updates) | Good (multiple workers can process incoming webhook requests) |
| Multiple bot instances | Not practical without external coordination | Supported behind a load balancer with a shared backend |
| Webhook concurrency | N/A | `max_connections`: **1–100** (default **40**) |
| Network traffic while idle | Continuous polling requests | None |
| Latency | Depends on polling timeout and network latency | Usually lower because updates are pushed immediately |
| Typical use case | Development, testing, small deployments | Recommended for production deployments |

### Long Polling (`getUpdates`)

- Maximum **100** updates per request.
- `limit` accepts values **1–100**.
- Only **one polling consumer** can actively receive updates for a bot.
- Cannot be used while a webhook is configured.
- Updates are stored for at most **24 hours**.
- Requires correct handling of the `offset` parameter.

### Webhooks (`setWebhook`)

- Requires a publicly accessible HTTPS endpoint.
- `max_connections` accepts values **1–100** (default **40**).
- Suitable for horizontally scalable deployments.
- Cannot be used while `getUpdates` is active.
- Updates are stored for at most **24 hours** if delivery fails.
- Telegram retries failed deliveries (retry policy is not documented).
