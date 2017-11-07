# Disk Usage Logger

### Overview

Applications can fail when disks are full.

This is a small Elixir application that you can start with your application that
will log disk usage for each drive every minute in the following format:

```
[info] diskusage_report label=/ percent_used=63
[info] diskusage_report label=/Volumes/Other percent_used=93
```

This data can be aggregated in a central repository where it can visualized and
alarms can be sent when usage is too high.
