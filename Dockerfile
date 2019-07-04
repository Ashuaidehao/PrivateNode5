FROM mcr.microsoft.com/dotnet/core/runtime:2.2 AS base

RUN apt-get update && apt-get install -y \
  libleveldb-dev \
  sqlite3

# APT cleanup to reduce image size
RUN rm -rf /var/lib/apt/lists/*

COPY neo-cli/ app/
WORKDIR /app

# No need use "EXPOSE",use commmand "docker run -p 50002:50002"
# EXPOSE 50002
# EXPOSE 50003

ENTRYPOINT ["dotnet", "neo-cli.dll","-r"]