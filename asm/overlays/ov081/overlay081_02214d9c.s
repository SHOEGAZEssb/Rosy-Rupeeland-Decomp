.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern gGamePhaseRuntime

.global func_ov081_02214d9c
func_ov081_02214d9c:
    ldr r2, [r0, #0xd0]
    ldr r1, .L_02214dc4
    bic r2, r2, #0x2
    str r2, [r0, #0xd0]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    str r1, [r0, #0x210]
    mov r0, #0x0
    bx lr
.L_02214dc4: .word gGamePhaseRuntime
.size func_ov081_02214d9c, . - func_ov081_02214d9c
