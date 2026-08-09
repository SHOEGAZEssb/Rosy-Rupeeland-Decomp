.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_ov085_02213194

.global func_ov085_02214300
func_ov085_02214300:
    ldr ip, .L_0221430c
    add r0, r0, #0x23c
    bx ip
.L_0221430c: .word func_ov085_02213194
.size func_ov085_02214300, . - func_ov085_02214300
