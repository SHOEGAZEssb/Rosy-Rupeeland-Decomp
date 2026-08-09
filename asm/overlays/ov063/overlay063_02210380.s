.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern data_ov063_022105cc

.global func_ov063_02210380
func_ov063_02210380:
    ldr r2, .L_0221039c
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
.L_0221039c: .word data_ov063_022105cc
.size func_ov063_02210380, . - func_ov063_02210380
