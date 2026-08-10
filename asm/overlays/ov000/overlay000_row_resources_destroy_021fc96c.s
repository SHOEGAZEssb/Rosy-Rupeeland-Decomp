    .text
    .extern GraphicsSpriteState_ReleaseFromGroup
    .extern func_02071f38
    .global func_ov000_021fc96c
func_ov000_021fc96c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, #0x0
    mov r8, r0
    add r5, r1, r1, lsl #0x2
    mov r4, r6
    b L_021fc9c8
L_021fc984:
    ldr r0, [r8, #0x254]
    add r7, r5, r6
    cmp r7, r0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r8, #0x250]
    add r0, r0, r7, lsl #0x5
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq L_021fc9c4
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r8, #0x250]
    add r0, r0, r7, lsl #0x5
    str r4, [r0, #0x10]
    ldr r0, [r8, #0x250]
    add r0, r0, r7, lsl #0x5
    bl func_02071f38
L_021fc9c4:
    add r6, r6, #0x1
L_021fc9c8:
    cmp r6, #0x5
    blt L_021fc984
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size func_ov000_021fc96c, .-func_ov000_021fc96c
