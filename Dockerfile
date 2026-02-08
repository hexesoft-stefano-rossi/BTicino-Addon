# Immagine super leggera per far girare l'eseguibile
FROM alpine:latest

# Installa le librerie necessarie per .NET su Alpine e bash per lo script
RUN apk add --no-cache libstdc++ libgcc icu-libs bash jq

WORKDIR /app

# Copiamo solo il necessario dal tuo PC al container
COPY Hexesoft-BTicino .
COPY appsettings.json .
COPY devices.json .
COPY run.sh /

# Permessi di esecuzione
RUN chmod +x /app/Hexesoft-BTicino
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
