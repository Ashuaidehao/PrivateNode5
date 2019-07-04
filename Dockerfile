FROM mcr.microsoft.com/dotnet/core/runtime:2.2 AS base

RUN apt-get update && apt-get install -y \
  libleveldb-dev \
  sqlite3 \
  libsqlite3-dev \
  libunwind8-dev

# APT cleanup to reduce image size
RUN rm -rf /var/lib/apt/lists/*


COPY . app/

WORKDIR /app

EXPOSE 50333
EXPOSE 50332

ENTRYPOINT ["dotnet", "neo-cli.dll"]