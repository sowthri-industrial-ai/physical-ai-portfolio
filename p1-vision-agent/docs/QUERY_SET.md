# P1 — Query Set

The natural-language questions the inspection agent must answer. Doubles as the Phase 1 smoke test and the demo-reel script. Each query should return ranked, timestamped clips plus a short written answer.

## Thermal anomalies
- Show every thermal anomaly on bank 3 this shift.
- Which assets ran hotter than their neighbours during the walkthrough?
- When did the pump bearing first show an elevated temperature?

## Gauges & readings
- What pressure does the inlet gauge read at each pass?
- Flag any gauge reading outside its normal band.
- Summarise all dial/gauge readings captured on the route.

## Leaks & spills
- Are there any visible leaks or spills along the route?
- Show the clearest clip of the flange seepage.

## Surface condition
- Find visible corrosion or surface defects on the vessels.
- Show any damaged or missing insulation.

## Safety / PPE
- Was anyone on site without a hard hat or required PPE?
- Flag any blocked walkway or exit.

## Shift summary
- Summarise this inspection shift: what is normal, what needs attention, what is urgent.
- Generate a written shift report with timestamps for each flagged item.
