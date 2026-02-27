## 🛠 Guida alla Configurazione
Ogni dispositivo deve essere inserito nel file di configurazione sotto la categoria corretta. Tutti i dispositivi richiedono questi due parametri comuni:
***`bus`**: Identificativo del bus (0 per locale, 1-15 per bus remoti tramite interfacce F422).
***`model`**: Modello hardware del dispositivo (es. "F411", "H4691", "F520").

### 1. Luci (`lights`)
Gestisce relè e dimmer.
***`a`**: Ambiente (0-9).
***`pl`**: Punto Luce (1-15).
***`timer`**: (Opzionale) Valori ammessi: `none`, `0.5s`, `2s`, `30s`, `1m`, `2m`, `3m`, `4m`, `5m`, `10m`, `15m`.

### 2. Tapparelle e Tende (`shutters`)
Automazioni WHO 2 con supporto a stati e posizione.
***`a`**: Ambiente.
***`pl`**: Punto Luce.

### 3. Termostati (`thermostats`)
Gestione climatica WHO 4.
***`zone`**: Numero della zona termica (1-99).
***`canHeat` / `canCool`**: Abilita Riscaldamento o Raffrescamento.
***`manageFan`**: Se `true`, abilita il controllo ventola (auto, low, medium, high).

### 4. Contatori Energia (`energy_meters`)
Monitoraggio tramite moduli F520.
* **`id`**: Indirizzo fisico (1-255).L'indirizzo SCS viene calcolato automaticamente (es. ID 1 -> 51).

### 5. Interruttori (`switches`)
Attuatori ON/OFF generici.
***`a` / `pl`**: Indirizzo ambiente e punto luce.
***`timer`**: Stessi valori ammessi per le luci (`0.5s` a `15m`) .

### 6. Pulsanti (`buttons`)
Comandi impulsivi manuali.
***`a` / `pl`**: Indirizzo fisico.
***Logica**: Invia un impulso temporizzato di 0.5 secondi (WHAT 18).

### 7. Relè Termici (`relays`)
Monitoraggio attuatori pompe e valvole.
***`id`**: Identificativo del relè.
***`bus`**: Indica la zona della centrale termica di appartenenza.

### 8. Sensori Binari (`binary_sensors`)
Contatti e allarmi.
***`a` / `pl`**: Indirizzo fisico.
***`invert`**: Se `true`, inverte la logica (per contatti NC).
* **`device_class`**: Definisce l'icona in Home Assistant. Valori ammessi:
 `none`, `door`, `window`, `motion`, `smoke`, `moisture`, `opening`, `presence`, `problem`, `power`.