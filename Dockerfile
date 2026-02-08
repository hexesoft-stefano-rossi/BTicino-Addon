# Usa Alpine come base
FROM alpine:latest

# Installa bash e le librerie per .NET
RUN apk add --no-cache libstdc++ libgcc icu-libs bash jq

# Crea la cartella di lavoro
WORKDIR /app

# Copia i file necessari
COPY Hexesoft-BTicino .
COPY appsettings.json .
COPY devices.json .
COPY run.sh /

# Forza i permessi e pulisce eventuali rimasugli di Windows
RUN chmod +x /run.sh && \
    chmod +x /app/Hexesoft-BTicino && \
    sed -i 's/\r$//' /run.sh

# Avvio tramite lo script nella root
ENTRYPOINT ["/run.sh"]
