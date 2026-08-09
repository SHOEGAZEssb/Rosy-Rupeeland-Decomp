.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern GameWork_TestFlag
.extern data_021052fc
.extern data_ov080_02213e68
.extern data_ov080_02213e70
.extern data_ov080_02213e78
.extern func_02033ed0
.extern func_02033f44
.extern func_0203e7c8
.extern func_ov080_02212ae0
.extern gGameWork

.global func_ov080_02212de8
func_ov080_02212de8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r4, #0xd0]
    ldr r0, .L_02212f54
    orr r1, r1, #0x80000
    str r1, [r4, #0xd0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl func_02033f44
    ldr r1, .L_02212f58
    str r0, [r4, #0x24]
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x7d
    bl func_ov080_02212ae0
    add r1, r4, #0x200
    mov r0, r0, lsl #0x10
    ldrh r2, [r1, #0xa0]
    mov r3, r0, lsr #0x10
    cmp r2, r0, lsr #0x10
    beq .L_02212f18
    ldr r0, .L_02212f5c
    strh r3, [r1, #0xa0]
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x10]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02212f60
    bne .L_02212e8c
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02212e8c:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02212ee4
    ldr r0, .L_02212f5c
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02212f64
    bne .L_02212ed0
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02212ed0:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02212f18
.L_02212ee4:
    mov r0, r4
    bl func_02033ed0
    add r0, r4, #0x200
    mov r1, #0x1
    strh r1, [r0, #0x5a]
    ldr r1, [r4, #0x260]
    ldr r0, .L_02212f5c
    bic r1, r1, #0x800
    str r1, [r4, #0x260]
    ldr r1, [r0, #0x20]
    ldr r0, [r0, #0x24]
    str r1, [r4, #0x218]
    str r0, [r4, #0x21c]
.L_02212f18:
    ldr r0, .L_02212f58
    ldr r1, .L_02212f68
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldr r0, [r4, #0x10]
    orreq r0, r0, #0x10000
    bicne r0, r0, #0x10000
    str r0, [r4, #0x10]
    mov r0, r4
    bl func_0203e7c8
    ldmia sp!, {r4, pc}
.L_02212f54: .word data_021052fc
.L_02212f58: .word gGameWork
.L_02212f5c: .word data_ov080_02213e68
.L_02212f60: .word data_ov080_02213e78
.L_02212f64: .word data_ov080_02213e70
.L_02212f68: .word 0x3ee
.size func_ov080_02212de8, . - func_ov080_02212de8
