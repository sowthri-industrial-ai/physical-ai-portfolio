# VSS Blueprint — Pinned Reference

P1 targets the NVIDIA Metropolis Blueprint for Video Search & Summarization (VSS), pinned for reproducibility. The blueprint itself is NOT vendored here — it is pulled at deploy time on the GPU host (via NGC + git). This file records exactly what we build against.

| Field | Value |
|-------|-------|
| Blueprint | NVIDIA Metropolis VSS |
| Version | v3.1.0 |
| Deployment | Developer Profile |
| Repo | https://github.com/NVIDIA-AI-Blueprints/video-search-and-summarization |
| Docs | https://docs.nvidia.com/vss/3.1.0/ |
| Build card | https://build.nvidia.com/nvidia/video-search-and-summarization |

## At deploy time (Phase 1)
On the GPU host, clone the blueprint at the pinned tag:

    git clone --branch v3.1.0 --depth 1 https://github.com/NVIDIA-AI-Blueprints/video-search-and-summarization.git

Then follow DEPLOYMENT_RUNBOOK.md.

Note: confirm the exact tag name on the repo's releases page; if the v3.1 tag differs, update this file to the precise tag/commit.
