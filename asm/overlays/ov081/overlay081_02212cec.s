.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_022152c8
.extern func_ov081_022130dc
.extern func_ov081_02213710

.global func_ov081_02212cec
func_ov081_02212cec:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02212d18
    mov r4, r0
    ldmia r1, {r1, r2}
    mov r3, #0x78
    bl func_ov081_02213710
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x210]
    bl func_ov081_022130dc
    ldmia sp!, {r4, pc}
.L_02212d18: .word data_ov081_022152c8
.size func_ov081_02212cec, . - func_ov081_02212cec
