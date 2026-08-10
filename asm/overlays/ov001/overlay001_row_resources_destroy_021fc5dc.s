    .text
    .extern GraphicsSpriteState_ReleaseFromGroup
    .extern func_02071f38
    .global func_ov001_021fc5dc
func_ov001_021fc5dc: ; 0x021fc5dc
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, #0x0
    mov r8, r0
    add r5, r1, r1, lsl #0x2
    mov r4, r6
    b L_021fc638
L_021fc5f4:
    ldr r0, [r8, #0x1a4]
    add r7, r5, r6
    cmp r7, r0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r8, #0x20c]
    add r0, r0, r7, lsl #0x5
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq L_021fc634
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r8, #0x20c]
    add r0, r0, r7, lsl #0x5
    str r4, [r0, #0x10]
    ldr r0, [r8, #0x20c]
    add r0, r0, r7, lsl #0x5
    bl func_02071f38
L_021fc634:
    add r6, r6, #0x1
L_021fc638:
    cmp r6, #0x5
    blt L_021fc5f4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size func_ov001_021fc5dc, .-func_ov001_021fc5dc
