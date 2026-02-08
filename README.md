Panoramica
Hexesoft-BTicino è un gateway software ad alte prestazioni scritto in C# (.NET) che funge da ponte tra il sistema domotico BTicino/Legrand MyHome (SCS) e il protocollo MQTT.

Il sistema permette di integrare un impianto fisico MyHome con piattaforme di Home Automation moderne come Home Assistant, gestendo la traduzione bidirezionale dei comandi e degli stati.

Caratteristiche Chiave
Architettura a Doppia Sessione: Gestisce separatamente la sessione Monitor (eventi in tempo reale) e la sessione Comandi (invio richieste).

Gestione Code Asincrone: I comandi vengono accodati e inviati sequenzialmente (FIFO) per rispettare i tempi di pacing del bus SCS ed evitare collisioni.

Autenticazione HMAC Robusta: Supporta sia connessioni trusted che l'autenticazione sicura HMAC-SHA256 richiesta dai gateway moderni (F454, MyHOMEServer1, etc.).

Auto-Discovery: Scansione automatica del bus all'avvio per sincronizzare gli stati.

Astrazione a Oggetti: Ogni dispositivo fisico (Luce, Termostato, Tapparella) è mappato su una classe C# dedicata.
