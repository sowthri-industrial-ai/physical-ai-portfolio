# P1 — Vision AI Inspection Agent · Architecture

## What it is
A natural-language video-analytics agent for industrial inspection: ingest inspection footage, auto-caption it, index it, and answer questions like *"show every thermal anomaly on bank 3 this shift"* with ranked, timestamped clips and a written summary.

## The decision: build on NVIDIA VSS, don't hand-roll it
P1 is built on the **NVIDIA Metropolis Blueprint for Video Search & Summarization (VSS), v3.1.0**, deployed via its **Developer Profile**. The blueprint already implements the full pipeline; our work is to deploy it and skin it for industrial inspection — the JD-aligned pattern of assembling NVIDIA blueprints rather than rebuilding them.

## Architecture (three VSS layers)
1. **Real-time video intelligence** — chunk the video, sample frames per chunk, caption each chunk with a VLM, generate embeddings.
2. **Downstream analytics** — enrich the caption/metadata streams into searchable, indexed insights.
3. **Agentic & offline processing** — a top-level agent (via the Model Context Protocol) exposes video understanding, semantic search, long-video summarization, and clip retrieval as tools.

### Pipeline flow
Inspection video (file / RTSP)
→ chunk + frame sampling
→ VLM dense captioning
→ caption embeddings (NeMo Retriever NIM) into vector + graph databases
→ Context-Aware RAG + LLM for tool-calling and Q&A
→ ranked, timestamped clips + written shift summary

## Deployment decision: single L40S + remote NIM endpoints
- L40S is a validated VSS GPU, so the IndiaAI / AWS g6e card fits.
- The LLM and VLM run on **remote NVIDIA NIM endpoints** (OpenAI-compatible), which means **no additional local GPU** is required — a single L40S host is enough.
- A fully-local deploy of all models would instead need one large card (H100 / A100-80GB) or 4x L40S; we avoid that by using hosted endpoints.
- Host target: ~18-core CPU, 128 GB RAM, 1 TB SSD + the L40S, i.e. AWS g6e.4xlarge/8xlarge on-demand, or the IndiaAI/Yotta L40S node.

## Industrial-inspection customization
- Captioning prompts tuned for industrial cues: thermal anomalies, gauge/dial readings, visible leaks/spills, corrosion/surface defects, PPE compliance.
- Query set mirrors operator/inspector questions (see QUERY_SET.md).
- Sample data: industrial walkthrough / thermal-inspection clips.

## Tech stack
NVIDIA Metropolis VSS (v3.1.0) · NIM microservices · VLM (e.g. Cosmos Reason) · LLM (e.g. Nemotron) · NeMo Retriever embeddings · vector + graph DB · DeepStream ingestion · Docker Compose · AWS g6e / IndiaAI L40S

## What it proves (JD)
Metropolis blueprint deployment · perception · agentic AI · "art of the possible" — a polished, credible first artifact on Gen-AI home turf.
