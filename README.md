# Hexesoft Bticino Bridge

.NET Worker Service that bridges MQTT <-> Bticino SCS, designed to run in Docker/Linux (Home Assistant friendly).

## Features (planned)
- Bidirectional MQTT communication
- SCS gateway communication
- Reconnect/retry strategies
- Structured logging and configuration
- Optional Home Assistant topic conventions / discovery

## Configuration
Configuration is provided via appsettings.json and environment variables (Docker-friendly).

1. Luci (lights)
Dispositivi semplici On/Off.

name: Nome visualizzato su Home Assistant.

bus: Numero della dorsale/interfaccia (di solito 0 per impianto locale, 1, 2... per espansioni).

a: Ambiente (da 0 a 9).

pl: Punto Luce (da 0 a 9).

2. Tapparelle / Automazioni (shutters)
bus, a, pl: Come per le luci.

isAdvanced:

true: Se il motore supporta nativamente la percentuale (es. "Vai al 50%").

false: Se è un motore vecchio tipo (Solo Su/Giù).

fullRunTimeSec: Tempo in secondi per apertura completa (serve per calcolare la percentuale simulata se il motore non è Advanced).

3. Termostati (thermostats)
Gestione Clima (WHO=4).

name: Nome della zona.

zone: Numero della zona termica configurata (da 1 a 99).

hasFan:

true: Se è un Fan Coil (mostra comandi velocità ventola 1-2-3-Auto).

false: Se è un radiatore o riscaldamento a pavimento (nasconde le ventole).

4. Energia (energy_meters)
Gestione Consumi (WHO=18).

name: Cosa stiamo misurando.

id: Il numero progressivo del toroide/misuratore (solitamente da 1 in su).

model: (Opzionale) Modello del dispositivo (es. F521 per centrale con memoria, F520 per misuratore istantaneo).


Spiegazione per l'utente (campi Binary Sensors)
bus, a, pl: L'indirizzo fisico dove Bticino legge il contatto.

deviceClass (Opzionale): Dice ad Home Assistant che icona usare.

"door": Icona porta (Aperta/Chiusa).

"window": Icona finestra.

"problem": Segnala un guasto (OK/Problema).

"power": C'è corrente/Non c'è corrente.

"connectivity": Connesso/Disconnesso.

(Se lasciato vuoto, usa un'icona generica ON/OFF).


## Development
- .NET 8/10 Worker Service
- MQTT: MQTTnet
- Logging: Microsoft.Extensions.Logging (optionally Serilog)

## Project rules
- Async only (no blocking calls)
- DI everywhere
- Services split: MQTT / SCS / Router
- Channels for internal message passing
