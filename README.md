# mssql-dev-db

Deploy a microsoft sql server locally that is bootstraped with a backpac file of your choosing.
NOTE! This will restore database back to the state of the bacpac file every time it's restarted.

### Usage

Requires docker & docker-compose to be installed.

Steps:
- Clone repository
- Create a folder in of repo folder named "backup"
- Copy your x.bacpac file to this folder
- Open the "docker-compose.yml" file and set ENV variables BACKUP_NAME to the file name of your bacpac (x.bacpac)
- Also set the ENV variable DB_NAME to the name of the database you have backed up
- To build and start container use `docker-compose up` in terminal
- mssql server should now be available on port 1433
- To rebuild use `docker-compose build`

### Utility scripts

#### createbackup.sh:

Creates a new backup inside the container and then copies it out to the host into the ./backup folder.

Usage: `./createbackup.sh {backupname}` 

{backupname} you replace with the name you want for the backup. For example `./createbackup.sh mybackup`

Then a new backup will created as ./backup/mybackup.bacpac in your repo folder