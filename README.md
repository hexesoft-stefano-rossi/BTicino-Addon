# Hexesoft Bridge Bticino

## 📝 Descrizione del Sistema
**Hexesoft Bridge Bticino** è un'applicazione basata su **.NET 9.0** progettata per interfacciarsi con il sistema domotico **BTicino MyHome (bus SCS)**. Il software funge da ponte (bridge) tra il gateway fisico Bticino e **Home Assistant**, utilizzando il protocollo **MQTT** per la comunicazione.

### Funzionalità Principali
* **Sincronizzazione Automatica**: All'avvio, il sistema pubblica tutti i dispositivi configurati e rimuove automaticamente da Home Assistant quelli eliminati dal file di configurazione.
* **Monitoraggio Real-Time**: Intercetta istantaneamente ogni variazione di stato sul bus SCS e aggiorna Home Assistant tramite MQTT.
* **Controllo Bidirezionale**: Traduce i comandi MQTT in pacchetti **OpenWebNet** per azionare luci, tapparelle e termostati.
* **Monitoraggio Energetico**: Interroga ciclicamente i moduli F520 per riportare potenza istantanea (W) ed energia totale (kWh).
* **Gestione Thread-Safe**: Utilizza protezioni **Interlocked** per prevenire conflitti sul bus durante le scansioni manuali.

### Tecnologie Utilizzate
* **Librerie**: MQTTnet, Microsoft.Extensions.Hosting, System.Text.Json.
* **Connettività**: TCP Socket sulla porta 20000 del Gateway Bticino.
