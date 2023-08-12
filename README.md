# mailrelay

`mailrelay` is a simple mail relay that can take unauthenticated SMTP emails (e.g. over port 25) and relay them to authenticated, TLS-enabled SMTP servers.

Forked from [wiggin77/mailrelay](https://github.com/wiggin77/mailrelay)

## Configuration

| Environment Variable | Description                 | Example           | Default |
| -------------------- | --------------------------- | ----------------- | ------- |
| PORT                 | Listen on port              | `25`              | 2525    |
| SMTP_HOST            | SMTP server hostname        | `smtp.google.com` |         |
| SMTP_PORT            | SMTP port                   | `25` `2525` `465` | 465     |
| SMTP_STARTTLS        | Enable StartTLS             | `true`            |         |
| SMTP_USERNAME        | SMTP auth user name         | `user@google.com` |         |
| SMTP_PASSWORD        | SMTP auth user password     | `password`        |         |
| SMTP_MAX_LETTER_SIZE | Max. letter size            | `134217728`       | 83 MB   |
| ALLOWED_HOSTS        | Allowed IPs/host names list | `10.100.250.50`   | *       |
| TIMEOUT              | Network timeout, sec        | `600`             | 30      |
