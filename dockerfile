FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y

COPY entrypoint.sh /entrypoint.sh
COPY init.template.sql /init.template.sql

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]