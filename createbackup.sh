#!/bin/bash

docker exec mssqldev /usr/bootstrap/create-backup.sh $1
docker cp mssqldev:/usr/bootstrap/$1.bacpac ./backup