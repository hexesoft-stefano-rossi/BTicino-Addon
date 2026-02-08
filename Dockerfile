# Questa immagine riconosce automaticamente se sei su Raspberry o PC
FROM mcr.microsoft.com/dotnet/runtime:9.0-alpine

# Installa bash e jq (necessari per HA)
RUN apk add --no-cache bash jq

WORKDIR /app

# Copia i file
COPY Hexesoft-BTicino .
COPY appsettings.json .
COPY devices.json .
COPY run.sh /

# Sistema i permessi e il formato Windows
RUN chmod +x /app/Hexesoft-BTicino && \
    chmod +x /run.sh && \
    sed -i 's/\r$//' /run.sh

# Avvio
CMD [ "/run.sh" ]
