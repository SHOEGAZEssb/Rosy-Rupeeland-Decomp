.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_022152b0
.extern func_ov081_02213710

.global func_ov081_02213560
func_ov081_02213560:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r3, r2
    ldr r2, .L_02213598
    str r3, [r5, #0x234]
    mov r4, r1
    ldmia r2, {r1, r2}
    bl func_ov081_02213710
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0xcc]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.L_02213598: .word data_ov081_022152b0
.size func_ov081_02213560, . - func_ov081_02213560
