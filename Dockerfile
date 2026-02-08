# Usa l'immagine ufficiale Microsoft ottimizzata per Alpine e .NET 9
FROM mcr.microsoft.com/dotnet/runtime:9.0-alpine

# Installa bash e jq per lo script di avvio di Home Assistant
RUN apk add --no-cache bash jq

WORKDIR /app

# Copia il tuo file unico e gli altri file
COPY Hexesoft-BTicino .
COPY appsettings.json .
COPY devices.json .
COPY run.sh /

# Permessi di esecuzione e pulizia file Windows
RUN chmod +x /app/Hexesoft-BTicino && \
    chmod +x /run.sh && \
    sed -i 's/\r$//' /run.sh

CMD [ "/run.sh" ]
