# Introduction
Journalert is a Python application that processes (remote) systemd logs and reports any errors.

Journalert can be run in 'learning mode' to capture existing errors that are known but can't be resolved on short notice. Once in 'alerting mode', journalert only alerts on new unknown errors, not on errors previously learned.

New errors are matched against known errors and if *similar*, won't report on them.

