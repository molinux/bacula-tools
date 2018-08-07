# Project Title

Bacula Outage Tool

## Getting Started

Sometimes, I had to do some intervention on Bacula, but some backups were running.
I needed to cancel all backups, perform maintenance, and soon after, see which backups would have to run again.

bacula-outage helps you with this work, automating the entire process.

### Prerequisites

You need to have the Bacula environment up and running

### Installing

Download the bacula-outage.sh file and configure the global variables

```
BOF=$HOME/bacula-outage-jobs-to-run.txt   # Where the jobs running will be save
CATJOB=MyCatalog   # Your Bacula catalog name
```


Download the bacula-outage.sh file and put them in your system

```
mv bacula-outage.sh /usr/sbin/bacula-outage
```

then run the bacula-outage command:

```
bacula-outage
```

## Funcionalities

- Automate the process to interrupt and recovery Bacula jobs that are running
- Save the current jobs in a file to re-run the jobs later
- Cancel all the running jobs to permit maintenance in Bacula
- Recover the previous canceled jobs
- Recover the previous jobs setting up different priorities thus allowing a correct sequence
- Recover the jobs with an interval between the different levels thus allowing then to run in the correct sequence
- Menu help to explain the Bacula Outage Tool usage

![Bacula Outage Tool](https://github.com/molinux/bacula-tools/blob/master/bacula-outage/bacula-outage-001.png)

![Bacula Outage Tool](https://github.com/molinux/bacula-tools/blob/master/bacula-outage/bacula-outage-002.png)


## Authors

* **Marcus "Molinux" Molinero** - *Development* - [Molinux](https://github.com/molinux)

## License

 Redistributions of source code must retain the above copyright notice, and the name of the original author.
