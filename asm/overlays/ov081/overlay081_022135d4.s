.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_022153e0
.extern func_020bf1f8
.extern func_ov081_02213710
.extern genrand_int32

.global func_ov081_022135d4
func_ov081_022135d4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl genrand_int32
    mov r6, r0
    tst r6, #0xf
    bne .L_02213600
    mov r1, #0x3c
    mov r4, #0x5
    bl func_020bf1f8
    add r0, r1, #0x3c
    b .L_0221363c
.L_02213600:
    mov r1, #0x9
    bl func_020bf1f8
    ldr r0, [r5, #0xd0]
    mov r4, r1
    tst r0, #0x10
    ldrb r0, [r5, #0x4a]
    addne r4, r4, #0x1
    mov r1, #0x78
    cmp r0, #0x0
    addne r4, r4, #0x2
    cmp r4, #0x5
    mov r0, r6
    movgt r4, #0x5
    bl func_020bf1f8
    add r0, r1, #0x50
.L_0221363c:
    str r0, [r5, #0x234]
    ldr r0, .L_0221365c
    ldr r3, [r5, #0x234]
    add r1, r0, r4, lsl #0x3
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov081_02213710
    ldmia sp!, {r4, r5, r6, pc}
.L_0221365c: .word data_ov081_022153e0
.size func_ov081_022135d4, . - func_ov081_022135d4
