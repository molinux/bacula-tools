# Project Title

Bacula PostgreSQL Lab

## Getting Started

~~Sometimes, I had to do some intervention on Bacula, but some backups were running.~~
~~I needed to cancel all backups, perform maintenance, and soon after, see which backups would have to run again.~~

~~bacula-outage helps you with this work, automating the entire process.~~

### Prerequisites

~~You need to have the Bacula environment up and running~~

### Installing

#### Oracle Linux / CentOS / Red Hat / Rocky Linux

```bash
yum install postgresql-server
/usr/bin/postgresql-setup --initdb --unit postgresql
/usr/bin/pg_ctl -D /var/lib/pgsql/data -l logfile start
systemctl restart postgresql

su - postgres
psql -U postgres

# List databases
\l
CREATE DATABASE cadastro;
\c cadastro;
\q

wget https://raw.githubusercontent.com/molinux/bacula-tools/master/bacula-postgresql-lab/pgsql-random-data.sql
psql -U postgres -d cadastro < /tmp/pgsql-random-data.sql


psql -U postgres -d cadastro
# List Tables
\d 
SELECT * FROM assinantes;
\q
```

## Funcionalities

SOON

## Authors

* **Marcus "Molinux" Molinero** - *Development* - [Molinux](https://github.com/molinux)

## License

 Redistributions of source code must retain the above copyright notice, and the name of the original author.
