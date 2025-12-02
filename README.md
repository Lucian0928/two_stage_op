# Two-Stage Operational Transconductance Amplifier (OTA)
**UMC 0.18 µm | 1.8 V | Constant-gm Bias | Miller Compensation**

This repository presents the complete design workflow of a **two-stage CMOS OTA** developed for the *Analog Integrated Circuits Laboratory (AICLAB) Midterm Project*. It includes the **final topology-only HSPICE netlist**, **specification table**, **pre- and post-layout simulation results**, and **layout verification**.  

All publicly shared files are **technology-agnostic and sanitized** for open academic and professional portfolio use.

---

## 1. Design Objective

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

## 2. Supply & Operating Conditions

| Parameter | Value |
|----------|-------|
| Supply Voltage (VDD) | 1.8 V |
| Ground (VSS) | 0 V |
| Input Common-Mode Voltage | 1.2 V |
| Output Common-Mode Target | 0.9 V |
| Process | UMC 0.18 µm CMOS |
| Temperature | 27 °C |

---

## 3. Final Performance Summary (Pre-Layout vs. Post-Layout)

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

## 4. Circuit Architecture

- Stage 1: NMOS differential input pair with PMOS current-mirror load  
- Stage 2: Common-source amplifier driving capacitive load  
- Bias Network: Constant-gm reference generating PVT-robust bias currents  
- Compensation: Miller capacitor (Cc) + series zero-nulling resistor (Rz)  

This structure provides strong low-frequency gain while maintaining high unity-gain bandwidth and stable phase margin under load.

---

## 5. Final Device Dimensions

| Device | W/L (µm/µm) |
|--------|-------------|
| M1, M2 | 4.33 / 1 |
| M3, M4 | 4 / 1 |
| M5 | 2 / 1 |
| M6 | 31.92 / 0.5 |
| M7 | 10 / 0.5 |
| M8, M9, M11, M13 | 1 / 1 |
| M10 | 9 / 1 |
| M12 | 0.37 / 1 |

**Passive Components**

| Component | Value |
|----------|--------|
| Compensation Capacitor (Cc) | 0.45 pF |
| Zero-Nulling Resistor (Rz) | 13.4 kΩ |
| Source Degeneration (Rs) | 38 kΩ |
| Bias Resistor Network (Rg) | 93.6 kΩ |

---

## 6. Layout Verification

- ✅ DRC Clean  
- ✅ LVS Matched  
- ✅ Post-Layout RC Extraction Performed  
- ✅ Final Area: **679.25 µm²**

**Observed Pre- vs. Post-Layout Differences**

Performance degradation after layout is mainly attributed to **parasitic capacitances and routing resistance**, which introduce additional non-dominant poles and slightly degrade large-signal behavior. Despite these effects, **all specifications remain fully satisfied**.

---

## 7. Design Strategy Highlights

- Miller capacitor selected to dominate parasitic poles and stabilize the second stage  
- Constant-gm bias used to improve PVT robustness of transconductance  
- Unity-gain bandwidth prioritized over raw DC gain  
- Bias current optimized to balance **slew rate vs. power dissipation**  
- Layout floorplanning focused on minimizing routing parasitics near high-impedance nodes  




