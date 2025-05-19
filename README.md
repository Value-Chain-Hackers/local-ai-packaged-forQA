# Zelfgehost AI Pakket

Met dit pakket draai je op je eigen computer een complete AI-omgeving. Je kunt hiermee lokaal AI-modellen gebruiken, taken automatiseren, en informatie verwerken — zonder dat er data naar de cloud gaat.

---

## Wat kun je ermee?

* Chatten met een AI-model (zoals ChatGPT, maar lokaal)
* Bestanden automatisch laten verwerken
* Documenten samenvatten
* AI-agents bouwen zonder te programmeren
* Zoekopdrachten uitvoeren zonder tracking

---

## Wat zit erin?

| Tool       | Functie                                         |
| ---------- | ----------------------------------------------- |
| n8n        | Visuele workflow builder                        |
| Open WebUI | Chatinterface voor je taalmodellen              |
| Ollama     | Lokaal LLM-model draaien (zoals LLaMA, Mistral) |
| Supabase   | Database en opslag                              |
| Flowise    | Low-code AI agent maker                         |
| Qdrant     | Vector zoekmachine (voor RAG)                   |
| SearXNG    | Eigen zoekmachine (zonder tracking)             |
| Langfuse   | Inzicht in je AI-interacties (optioneel)        |

---

## Installatie

1. Zorg dat je deze programma's hebt:

   * [Docker Desktop](https://www.docker.com/products/docker-desktop)
   * [Python 3.10+](https://www.python.org/downloads/)
   * [Git](https://git-scm.com/)

2. Download en start het pakket:

```bash
git clone --recurse-submodules https://github.com/coleam00/local-ai-packaged.git
cd local-ai-packaged
cp .env.example .env
python start_services.py --profile cpu
```

> Gebruik `--profile gpu-nvidia` of `--profile gpu-amd` als je een GPU wilt gebruiken.

3. Wacht tot alles draait. Open dan in je browser:

| Tool       | URL                                            |
| ---------- | ---------------------------------------------- |
| n8n        | [http://localhost:5678](http://localhost:5678) |
| Open WebUI | [http://localhost:3000](http://localhost:3000) |
| Flowise    | [http://localhost:3001](http://localhost:3001) |
| SearXNG    | [http://localhost:8080](http://localhost:8080) |

---

## Aan de slag

### In n8n:

1. Open `http://localhost:5678`
2. Log in en open de standaard workflow
3. Vul de volgende gegevens in:

   * Ollama: `http://ollama:11434`
   * Supabase DB host: `db`
   * Qdrant: `http://qdrant:6333`
4. Klik op "Test workflow"
5. Wacht tot het model klaar is met downloaden

### In Open WebUI:

1. Open `http://localhost:3000`
2. Ga naar "Functions"
3. Voeg een functie toe met de code van `n8n_pipe.py`
4. Zet de functie aan
5. Plak je n8n webhook-URL erin (die vind je bovenaan je workflow in n8n)
6. Selecteer de functie in je model dropdown linksboven

---

## Bestand verwerken

Plaats je bestanden in de map `shared/`. Deze wordt automatisch gedeeld met n8n.

Gebruik in n8n de "Local File Trigger" om bijvoorbeeld PDF's te laten analyseren of samenvatten.

---

## Updaten

```bash
docker compose down
docker compose pull
python start_services.py --profile cpu
```

---

## Meer info

* Meer workflows: [https://n8n.io/workflows/?categories=AI](https://n8n.io/workflows/?categories=AI)
* AI agent maken zonder code: [https://flowiseai.com/](https://flowiseai.com/)
* Chat-interface en pipelines: [https://openwebui.com/](https://openwebui.com/)

---

Dit pakket is open source en bedoeld voor lokale toepassingen, zonder cloud, accounts of licenties.

Licentie: Apache 2.0
