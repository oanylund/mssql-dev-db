#!/bin/bash
/opt/sqlpackage/sqlpackage /A:Export /ssn:localhost /sdn:$DB_NAME /su:sa /sp:$SA_PASSWORD /tf:"$1.bacpac"