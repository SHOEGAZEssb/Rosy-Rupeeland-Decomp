    .text
    .extern func_ov001_021fc4b4
    .extern func_ov001_021fc5dc
    .extern func_ov001_021fc644
    .global func_ov001_021fc250
func_ov001_021fc250: ; 0x021fc250
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x1bc]
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021fc2dc
    ldr r3, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fc2cc
    mov r0, #0x24
    mul r1, r3, r0
    ldr r0, [r4, #0x1b4]
    rsb r1, r1, #0x34
    sub r1, r1, r0
    str r1, [r4, #0x1b8]
    ldr r0, [r4, #0x8]
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x1bc]
    mov r0, r4
    ldr r1, [r1, #0x74]
    bl func_ov001_021fc5dc
    ldr r1, [r4, #0x1bc]
    mov r0, r4
    ldr r1, [r1, #0x70]
    bl func_ov001_021fc4b4
L_021fc2cc:
    mov r0, r4
    bl func_ov001_021fc644
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fc2dc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_ov001_021fc250, .-func_ov001_021fc250
