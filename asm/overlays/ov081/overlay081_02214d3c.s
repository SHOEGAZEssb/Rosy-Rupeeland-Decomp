.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_022153e0
.extern func_020bf1f8
.extern func_ov081_02213710
.extern genrand_int32

.global func_ov081_02214d3c
func_ov081_02214d3c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl genrand_int32
    tst r0, #0xf
    bne .L_02214d60
    mov r1, #0x3c
    mov r4, #0x6
    bl func_020bf1f8
    b .L_02214d74
.L_02214d60:
    tst r0, #0x1
    movne r4, #0x4
    mov r1, #0x78
    moveq r4, #0x1
    bl func_020bf1f8
.L_02214d74:
    add r0, r1, #0x3c
    str r0, [r5, #0x234]
    ldr r0, .L_02214d98
    ldr r3, [r5, #0x234]
    add r1, r0, r4, lsl #0x3
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov081_02213710
    ldmia sp!, {r3, r4, r5, pc}
.L_02214d98: .word data_ov081_022153e0
.size func_ov081_02214d3c, . - func_ov081_02214d3c
