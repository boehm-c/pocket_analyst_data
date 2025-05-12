FROM mcr.microsoft.com/mssql/server:2022-latest

USER root
RUN apt-get update && apt-get install -y curl gnupg apt-transport-https && \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg && \
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev && \
    ln -sfn /opt/mssql-tools/bin/* /usr/local/bin/

COPY AdventureWorksDW2022.bak /var/opt/mssql/backup/
COPY restore.sql /var/opt/mssql/scripts/
COPY entrypoint.sh /usr/src/app/entrypoint.sh

RUN chmod +x /usr/src/app/entrypoint.sh

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
