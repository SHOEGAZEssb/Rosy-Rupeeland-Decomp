.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.

.global func_ov071_02211190
func_ov071_02211190:
    ldr r3, [r0, #0x4]
    ldr r2, [r1, #0x4]
    add r2, r3, r2
    str r2, [r0, #0x4]
    ldr r2, [r0, #0x8]
    ldr r1, [r1, #0x8]
    add r1, r2, r1
    str r1, [r0, #0x8]
    bx lr
.size func_ov071_02211190, . - func_ov071_02211190
