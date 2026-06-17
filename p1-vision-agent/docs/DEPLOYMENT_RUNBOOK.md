# P1 — VSS Deployment Runbook (Phase 1)

Status: draft. Exact image tags and compose paths come from the official VSS v3.1 docs (linked below) and are confirmed at deploy time.

## Prerequisites

### 1. NGC account + API key
- Create an account at https://ngc.nvidia.com (or sign in).
- Top-right username -> Setup -> Generate API Key.
- Store the key in a git-ignored `.env` (never commit it): `export NGC_CLI_API_KEY='<your-key>'`
- Verify access: `ngc registry resource info nvidia/vss-developer/dev-profile-compose:<version>`

### 2. NGC CLI
Install NGC CLI 4.10.0+ (per the prerequisites doc) and authenticate with the key above.

### 3. Host / GPU
- GPU: 1x NVIDIA L40S (validated VSS GPU).
- Host minimums: ~18-core CPU, 128 GB RAM, 1 TB SSD, 1 Gbps NIC.
- Targets: AWS g6e.4xlarge / g6e.8xlarge (1x L40S) on-demand, or the IndiaAI/Yotta L40S node.
- OS / driver: Ubuntu 22.04 / 24.04 + the NVIDIA driver per v3.1 prerequisites; Docker + NVIDIA Container Toolkit.
- Cost discipline: launch the GPU instance only during build sessions; stop/terminate when done (relaunch from the AWS AMI as needed). IndiaAI L40S preferred once approved.

## Deploy (Developer Profile)
1. Pull the VSS Developer Profile compose bundle from NGC.
2. Configure remote NIM endpoints (OpenAI-compatible) for the LLM and VLM so no extra local GPU is needed -- point the compose config at hosted endpoints (e.g. build.nvidia.com).
3. Bring up the stack with `docker compose up` per the v3.1 quickstart.
4. Confirm services are healthy and the UI is reachable.

## Smoke test
1. Upload a sample inspection clip (see `../sample-data/`).
2. Run a query from `QUERY_SET.md`; confirm captioning + clip retrieval + summary work end to end.
3. Capture a short screen recording for the demo reel.

## Teardown
- Stop the compose stack.
- Stop/terminate the GPU instance to end compute billing (work and configs live in git; the environment relaunches from the AMI or this runbook).

## References
- VSS prerequisites: https://docs.nvidia.com/vss/3.1.0/prerequisites.html
- VSS quickstart + architecture: https://docs.nvidia.com/vss/3.1.0/
- Blueprint repo: https://github.com/NVIDIA-AI-Blueprints/video-search-and-summarization
- Blueprint card: https://build.nvidia.com/nvidia/video-search-and-summarization
