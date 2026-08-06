    .text
    .extern func_ov000_021fc96c
    .extern func_ov000_021fc84c
    .extern func_ov000_021fc9d4
    .extern func_ov000_021fc714
    .global func_ov000_021fc460
func_ov000_021fc460:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x26c]
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021fc4f4
    ldr r3, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fc4dc
    mov r0, #0x24
    mul r1, r3, r0
    ldr r0, [r4, #0x264]
    rsb r1, r1, #0x34
    sub r1, r1, r0
    str r1, [r4, #0x268]
    ldr r0, [r4, #0x8]
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x26c]
    mov r0, r4
    ldr r1, [r1, #0x74]
    bl func_ov000_021fc96c
    ldr r1, [r4, #0x26c]
    mov r0, r4
    ldr r1, [r1, #0x70]
    bl func_ov000_021fc84c
L_021fc4dc:
    mov r0, r4
    bl func_ov000_021fc9d4
    mov r0, r4
    bl func_ov000_021fc714
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fc4f4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_ov000_021fc460, .-func_ov000_021fc460
