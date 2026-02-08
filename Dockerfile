# Usiamo Debian Slim: ha le librerie giuste per i file di Visual Studio
FROM debian:bookworm-slim

# Installiamo i componenti minimi richiesti da .NET
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libssl-dev \
    bash \
    jq \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia i tuoi file
COPY Hexesoft-BTicino .
COPY appsettings.json .
COPY devices.json .
COPY run.sh /

# Pulizia formati e permessi
RUN chmod +x /app/Hexesoft-BTicino && \
    chmod +x /run.sh && \
    sed -i 's/\r$//' /run.sh

CMD [ "/run.sh" ]
