*ac_tb
*===========================================================
* Two-Stage OTA - AC Testbench
* Includes:
*   1) Differential AC Response (Open-Loop Gain / UGB / PM)
*   2) CMRR (Common-Mode Rejection Ratio)
*   3) PSRR (Power Supply Rejection from VDD)
*-----------------------------------------------------------
.option post=2
.temp 60

* Core OTA subcircuit (assumes .SUBCKT two_stage_ota in ../two_stage_op.sp)
.INCLUDE "../two_stage_op.sp"

*-----------------------------------------------------------
* Case 1: Differential AC Response (Open-Loop Gain)
*   - VIN / VIP: differential excitation around 1.2 V CM
*   - Observation: V(vout) / (VIN-VIP)
*-----------------------------------------------------------
* Supply
VDD vdd 0 1.8
VSS vss 0 0

* Differential inputs
VIN vin 0 DC 1.2 AC -0.5
VIP vip 0 DC 1.2 AC  0.5

* Load capacitance 
CL vout 0 5p

* OTA instance
XOTA vin vip vout vdd vss two_stage_op

* AC sweep
.ac DEC 100 1 1e8
.meas AC DC_GAIN FIND VDB(vout) AT=10
.meas AC UGB WHEN VDB(vout)=0
.meas AC PHASE_AT_UGB FIND VP(vout) WHEN VDB(vout)=0
.meas AC PHASE_MARGIN PARAM='180 + PHASE_AT_UGB'
.meas AC ADM_100 FIND VDB(vout) AT=100

*===========================================================
.alter CMRR

VIN vin 0 DC 1.2 AC 1
VIP vip 0 DC 1.2 AC 1
.meas AC ACM_100 FIND VDB(vout) AT=100

* CMRR(dB) = Adm(dB) - Acm(dB)
.meas AC CMRR_100 PARAM='ADM_100 - ACM_100'

*===========================================================
.alter PSRR_VDD

VDD vdd 0 DC 1.8 AC 1
VIN vin 0 DC 1.2 AC 0
VIP vip 0 DC 1.2 AC 0
.meas AC ADD_100 FIND VDB(vout) AT=100

* PSRR_DD(dB) = Adm(dB) - Add(dB)
.meas AC PSRR_DD_100 PARAM='ADM_100 - ADD_100'

.END
