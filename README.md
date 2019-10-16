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

### Dependencies

This application relies on Erlang's `:disksup.get_disk_data/0` function (part of `os_mon`). That function calls out to a system command, based on your OS. On a Linux machine, for example, it uses `/bin/df`. You'll need to ensure that the relevant command for your OS is installed, [see the source code](https://github.com/erlang/otp/blob/master/lib/os_mon/src/disksup.erl) for details.
