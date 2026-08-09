.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_022152d8
.extern func_ov081_02213710

.global func_ov081_02215120
func_ov081_02215120:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    str r1, [r4, #0x210]
    ldr r2, [r0, #0x0]
    add r1, r4, #0x214
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r1, .L_02215158
    mov r0, r4
    mov r3, #0x12c
    ldmia r1, {r1, r2}
    bl func_ov081_02213710
    ldmia sp!, {r4, pc}
.L_02215158: .word data_ov081_022152d8
.size func_ov081_02215120, . - func_ov081_02215120
