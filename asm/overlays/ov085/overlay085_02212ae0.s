.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_ov085_02213ae4

.global func_ov085_02212ae0
func_ov085_02212ae0:
    ldr ip, .L_02212ae8
    bx ip
.L_02212ae8: .word func_ov085_02213ae4
.size func_ov085_02212ae0, . - func_ov085_02212ae0
