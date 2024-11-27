## Introduction

Journalert is a Python application that processes systemd logs to report any
errors found within.

Journalert is meant to be run on an centralized log server running
[systemd-journal-remote][remote], which will receive logs from clients running
[systemd-journal-upload][upload].

When deploying journalert for the first time, it's recommended to run it in
'learning mode' for a week or so to capture al existing 'known errors'.

Once some time has passed without new unknown errors being registered, it makes
sense to enable alerting mode. This assures that only new unknown issues are
reported, preventing alert fatigue.

Journalert is build to alert to Nagios / Icinga. The alert status is written to
a file for the monitoring system to process.

## Prerequisites

- Have a log server with [systemd-journal-remote][remote] setup
- Have clients log to the log server with a configured
  [systemd-journal-upload][upload] service

## Installation

1. Create a system user on the server that will run the journalert service
   (out-of-scope for this readme)
2. Copy the journalert folder to a desired folder location on the system
   (/usr/local/journalert, /opt/journalert, etc)
3. Edit config.yaml and change settings to your needs, take a particular
   interest in the 'keywords' section.
4. Install the [systemd service](journalert/systemd/journalert.service)
   file in /etc/systemd/system (edit parameters where relevant)
5. Install + edit NRPE comand files and scripts for Nagios / Icinga alerting.
6. start the journalert service

[remote]:
  https://www.freedesktop.org/software/systemd/man/latest/systemd-journal-remote.html
[upload]:
  https://www.freedesktop.org/software/systemd/man/latest/systemd-journal-upload.html

## Throubleshooting

Journalert itself creates logs in learning and alerting mode for
throubleshooting. The paths can be configured in config.yaml

It's often best to throubleshoot journalert running as a service with

```
journalctl -f -u journalert
```

If you want to run journalert manually on the cli, run:

```
./journalert <config.yaml>
```

You can generate test log messages messages on a client with:

```
echo "this is a test error" | logger
echo "this is a test error" | systemd-cat
```

If relevant keywords are present within the test message, journalert should
either alert or register the message within the files used to track 'known
alerts' (see config.yaml for more info).

## License

Journalert is available under the EU PL 1.2 license. This license was chosen
because it provides a reasonable degree of freedom while ensuring public
character. The EU PL 1.2 license is retained upon further distribution of
the software. Modifications and additions can be made under the EU PL 1.2
license or under compatible licenses, which are similar in nature.
