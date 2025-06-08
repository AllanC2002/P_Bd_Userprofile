FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
COPY init.sql /init.sql

CMD /bin/bash -c "\
    /opt/mssql/bin/sqlservr & \
    sleep 30 && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P \"$MSSQL_SA_PASSWORD\" -i /init.sql && \
    wait"