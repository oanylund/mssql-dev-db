FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

# RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/ubuntu/16.04/prod xenial main"
RUN apt-get update && apt-get install -y unzip curl libunwind8 libicu60

RUN curl -Lq https://go.microsoft.com/fwlink/?linkid=2134311 -o sqlpackage-linux-x64-latest.zip
RUN ls -alh
RUN unzip sqlpackage-linux-x64-latest.zip -d /opt/sqlpackage
RUN chmod +x /opt/sqlpackage/sqlpackage

RUN mkdir -p /usr/bootstrap
WORKDIR /usr/bootstrap

COPY ./bootstrap /usr/bootstrap

COPY ./backup/${BACKUP_NAME} /usr/bootstrap

RUN chmod +x /usr/bootstrap/restore-db.sh

EXPOSE 1433

# USER mssql
CMD /bin/bash ./entrypoint.sh

HEALTHCHECK --interval=60s CMD /opt/mssql-tools/bin/sqlcmd -U sa -P $SA_PASSWORD -Q "select 1" && grep -q "MSSQL CONFIG COMPLETE" ./config.log