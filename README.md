# Physical AI Portfolio

**One inspection & predictive-maintenance pipeline — built once on NVIDIA Omniverse, Isaac, Cosmos and Metropolis, then re-skinned across Manufacturing and Energy.**

Five projects. Each is a standalone, demo-able portfolio piece *and* a reusable layer of a single end-to-end capstone — nothing built is wasted. Train and simulate on AWS G-series; run edge inference on a Jetson Orin Nano Super.

## The reusable pipeline (build once)

| Layer | Capability |
|------:|------------|
| 1 | Digital Twin |
| 2 | Synthetic Data |
| 3 | Perception + Vision Agent |
| 4 | Robot Navigation & Control |
| 5 | Closed Loop + Predictive Maintenance |
| 6 | Edge Deployment |
| 7 | Agentic Operator Dashboard |

## The five projects

| # | Project | Builds | Proves | Status |
|---|---------|--------|--------|--------|
| P1 | Vision AI Inspection Agent | Layers 3 + 7 | Perception + agentic, on NVIDIA VSS | In progress (Phase 0) |
| P2 | Industrial Digital Twin | Layer 1 | OpenUSD twin in Omniverse | Planned |
| P3 | Synthetic-Data Perception Pipeline | Layers 2 + 3 | Trained-on-synthetic, works-on-real | Planned |
| P4 | Autonomous Inspection Robot | Layer 4 | Isaac Lab nav / patrol (RL) | Planned |
| P5 | Integrated Reference Solution + Dual Skins | Layers 5–7 + integration | End-to-end, Manufacturing ⇄ Energy | Planned |

## Infrastructure

- **Train / simulate:** AWS G-series (G6 · G6e / L40S), on-demand
- **Edge inference:** Jetson Orin Nano Super (JetPack 6.2, 67 TOPS)

## Build sequence

Priority **P1 → P2 → P3 → P4 → P5** · Critical path **P2 → P3 → P4 → P5** · Minimum lovable cut **P1 + P2 + P3 + re-skin**

---
*Built by Sowthri Somasundaram — Industrial AI Solutions Architect.*
