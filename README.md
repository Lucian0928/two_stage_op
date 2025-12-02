## Design Objective

The goal of this project is to design and verify a **high-gain, unity-gain stable, low-power two-stage OTA** operating at **1.8 V** with the following objectives:

- High DC gain for accurate error amplification  
- Wide unity-gain bandwidth for fast transient tracking  
- Adequate phase margin for unconditional stability  
- Low input offset through device matching and biasing  
- Compact layout area with clean DRC/LVS verification  

The OTA architecture consists of:

- NMOS differential input pair  
- PMOS active load  
- Second-stage common-source output stage  
- Constant-gm bias circuit  
- Miller compensation with series zero-nulling resistor  

---

## Supply & Operating Conditions

| Parameter | Value |
|----------|-------|
| Supply Voltage (VDD) | 1.8 V |
| Ground (VSS) | 0 V |
| Input Common-Mode Voltage | 1.2 V |
| Output Common-Mode Target | 0.9 V |
| Process | UMC 0.18 µm CMOS |
| Temperature | 60 °C |

---

## Final Performance Summary (Pre-Layout vs. Post-Layout)

| Metric | Spec | Pre-Sim | Post-Sim |
|--------|------|---------|----------|
| Open-Loop Gain | > 60 dB | 63.88 dB | 63.91 dB |
| CMRR | > 60 dB | 71.13 dB | 70.93 dB |
| PSRR | > 60 dB | 111.05 dB | 99.61 dB |
| Unity-Gain Bandwidth | > 30 MHz | 37.79 MHz | 36.86 MHz |
| Phase Margin | 65° (55–75°) | 66.26° | 65.14° |
| Slew Rate (Rise / Fall) | > 25 V/µs | +43.67 / −28.13 | +43.5 / −27.45 |
| Settling Time (Rise / Fall) | < 100 ns | 35.99 / 63.67 ns | 36.12 / 65.5 ns |
| Input Offset Voltage | < 900 µV | 12.6 µV | −15.1 µV |
| DC Power Dissipation | Minimize | 0.40 mW | 0.39 mW |
| Layout Area | Minimize | — | **679.25 µm²** |

---

## Circuit Architecture

- Stage 1: NMOS differential input pair with PMOS current-mirror load  
- Stage 2: Common-source amplifier driving capacitive load  
- Bias Network: Constant-gm reference generating stable bias currents  
- Compensation: Miller capacitor (Cc) + series zero-nulling resistor (Rz)  

This structure provides strong low-frequency gain while maintaining high unity-gain bandwidth and stable phase margin under load.

---

## Final Device Dimensions

| Device | Unit W/L (µm/µm) | Multiplier (m) | Total Width (µm) |
|--------|------------------|----------------|-----------------------------|
| M1, M2 | 4.33 / 1 | 1 | 4.33 |
| M3, M4 | 4 / 1 | 1 | 4 |
| M5 | 1 / 1 | 2 | 2 |
| M6 | 7.98 / 0.5 | 4 | 31.92 |
| M7 | 5 / 0.5 | 2 | 10 |
| M8, M9, M13 | 1 / 1 | 1 | 1 |
| M10 | 3 / 1 | 3 | 9 |
| M11 | 3 / 1 | 1 | 3 |
| M12 | 0.37 / 1 | 1 | 0.37 |

**Passive Components**

| Component | Value |
|----------|--------|
| Compensation Capacitor (Cc) | 0.45 pF |
| Zero-Nulling Resistor (Rz) | 13.4 kΩ |
| Source Degeneration (Rs) | 38 kΩ |
| Bias Resistor Network (Rg) | 93.6 kΩ |

---
