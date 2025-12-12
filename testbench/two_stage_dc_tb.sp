* tb_dc_op.sp

.option post
.temp 60

VDD vdd 0 1.8
VSS vss 0 0
VINP vip 0 1.2
VINN vin 0 1.2

* load
CL vout 0 5p

XOTA vin vip vout vdd vss two_stage_op
.op
.meas op vout  find v(vout) at=0
.meas op IDC   param='i(VDD)' 
.END