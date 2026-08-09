.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_02210508

.global func_ov059_022104f0
func_ov059_022104f0:
    str r1, [r0, #0x60]
    str r2, [r0, #0x64]
    ldr ip, .L_02210504
    ldr r1, [r0, #0x60]
    bx ip
.L_02210504: .word func_ov059_02210508
.size func_ov059_022104f0, . - func_ov059_022104f0
