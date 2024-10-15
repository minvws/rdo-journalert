# Introduction

Journalert is a Python application that processes (remote) systemd logs and
reports any errors. Journalert is meant to be run on an centralized log server
running systemd-journal-remote, which will receive logs from clients running
systemd-journal-upload.

Journalert can be run in 'learning mode' to capture existing errors that are
known but can't be resolved on short notice. Once in 'alerting mode', journalert
only alerts on new unknown errors, not on errors previously learned. New errors
are matched against known errors and if _similar_, won't report on them.

Journalert is build to alert to Nagios / Icinga. The alert status is written to
a file for Nagios / Icinga to process.

# Prerequisites

- Have a log server with
  [systemd-journal-remote](https://www.freedesktop.org/software/systemd/man/latest/systemd-journal-remote.html)
  setup
- Have clients log to the log server with a configured
  [systemd-journal-upload](https://www.freedesktop.org/software/systemd/man/latest/systemd-journal-upload.html)
  service

# Installation

1. Create a system user on the server that will run the journalert service
   (out-of-scope for this readme)
2. Copy the journalert folder to a desired folder location on the system
   (/usr/local, /opt, etc)
3. Edit config.yaml and change settings to your needs
4. Install the systemd service file in /etc/systemd/system
5. Install + edit NRPE comand files and scripts for Nagios / Icinga alerting.
6. start the journalert service
