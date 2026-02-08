FROM alpine:latest

# Installa bash, jq (per leggere i parametri di HA) e sed (per pulire i file Windows)
RUN apk add --no-cache libstdc++ libgcc icu-libs bash jq sed

WORKDIR /app

# Copia solo i file che servono al programma per girare
COPY Hexesoft-BTicino .
COPY appsettings.json .
COPY devices.json .
COPY run.sh /

# --- SOLUZIONE ERRORE FATALE ---
# Converte il file run.sh dal formato Windows (CRLF) al formato Linux (LF)
RUN sed -i 's/\r$//' /run.sh

# Permessi di esecuzione
RUN chmod +x /app/Hexesoft-BTicino
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
