* tb_tran_slew_settle.sp

.option post=2
.temp 60
.param VSTEP=50m

VDD vdd 0 1.8
VSS vss 0 0

* unity-gain feedback

VIP vip 0 PWL(0 500m 10n 500m 10.2n 1.3 200n 1.3 200.2n 500m 300n 500m)

CL vout 0 5p
*unit-gain buffer: vin=vout
XOTA vout vip vout vdd vss two_stage_op

.tran 0.1n 300n
.meas tran slewrate_positive MAX deriv(v(vout)) FROM=0n TO=300n
.meas tran slewrate_negative MIN deriv(v(vout)) FROM=0n TO=300n
.END
