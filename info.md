# Preparation

## How to Install PostgreSQL on WSL and Configure PostgreSQL for Remote Access

* Update Packages:
```bash
sudo apt update && sudo apt upgrade
```

* Install PostgreSQL:
```bash
sudo apt install postgresql postgresql-contrib
```

* Start PostgreSQL:
```bash
sudo service postgresql start
```

* To check status or to stop PostgreSQL:
```bash
sudo service postgresql status
sudo service postgresql stop
```

* Create user and database:
```bash
sudo -u postgres psql
```
```sql
CREATE USER yokoevan PASSWORD 'password';
CREATE DATABASE sql_bootcamp OWNER yokoevan;
```

* Exit from SQL Shell (psql):
```sql
\q
```

### Configure PostgreSQL for Remote Access:
* Edit the postgresql.conf File:
```bash
sudo vim /etc/postgresql/<version>/main/postgresql.conf
```
* Find the line containing listen_addresses and change it to:
```
listen_addresses = '*'
```
* Edit the pg_hba.conf File:
```bash
sudo vim /etc/postgresql/<version>/main/pg_hba.conf
```
* Add the following line at the end of the file to permit connections from any IP address::
```
host all all 0.0.0.0/0 md5
```

* Restart PostgreSQL Service:
```bash
sudo service postgresql restart
```

## How to Configure pgAdmin

* Install pgAdmin from [here](https://www.pgadmin.org/download/) for Windows

* Steps of configuration:
    * Launch pgAdmin and navigate to “Register New Server” to start setting up a connection to your PostgreSQL server.
    * In the General tab, assign a meaningful name to your server connection such as (e.g. PostgreSQL Local).
    * Switch to the Connection tab and input the following details:
        * Hostname/address: Enter the WSL Ubuntu IP address which can be obtained by running ifconfig in WSL, or just use *localhost* if pgAdmin is on the same machine as WSL.
        * Username and Password: Use the user and password from the PostgreSQL installation stage.
        * Port: The port number should be the same as default 5432.
        * Maintenance database: name of created database.
    * Confirm and save your settings by clicking “Save”.

## How to delete tables

```sql
DROP TABLE menu, person, person_order, person_visits, pizzeria;
```

## psql

* Open psql terminal:
```bash
sudo -u postgres psql
```
or
```bash
sudo -i -u postgres
psql
```

* Connect to database:
```psql
\c db_name
```