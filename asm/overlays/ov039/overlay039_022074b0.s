.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern Sound_PlayDirectSequence
    .extern VecFx32Object_Assign
    .extern func_020befec
    .extern GXx_SetMasterBrightness_
    .extern func_ov039_0220713c
    .extern func_ov069_0221099c
    .extern func_ov039_02203990
    .extern gSoundContext
    .global func_ov039_022074b0
func_ov039_022074b0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x80]
    ldr r4, [r5, #0x48]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    addne r0, r0, #0x1c00
    ldrneh r0, [r0, #0xac]
    ldreq r0, [r1, #0x18]
    addeq r0, r0, #0x1c00
    ldreqh r0, [r0, #0xa8]
    sub r2, r0, #0x20
    ldrsh r0, [r5, #0xbc]
    cmp r0, #0x14
    addlt r0, r0, #0x1
    strlth r0, [r5, #0xbc]
    ldmltia sp!, {r3, r4, r5, pc}
    bne L_02207538
    ldr r0, [r4, #0xc]
    mov r1, #0x23
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r4, [r4, #0xc]
    ldr r0, L_02207604
    ldrh r3, [r4, #0x24]
    mov r1, #0x32
    mov r2, #0x7f
    bic r3, r3, #0x2
    strh r3, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl Sound_PlayDirectSequence
    ldrsh r0, [r5, #0xbc]
    add r0, r0, #0x1
    strh r0, [r5, #0xbc]
    ldmia sp!, {r3, r4, r5, pc}
L_02207538:
    cmp r0, #0x15
    bne L_02207580
    ldr r0, [r4, #0xc]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, #0x1b
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldrsh r0, [r5, #0xbc]
    add r0, r0, #0x1
    strh r0, [r5, #0xbc]
    ldmia sp!, {r3, r4, r5, pc}
L_02207580:
    cmp r2, #0x0
    bge L_022075a4
    mov r0, #0x1a
    str r0, [r1, #0x74]
    ldr r0, [r5, #0x54]
    add r1, r4, #0x2c
    add r0, r0, #0x2c
    bl VecFx32Object_Assign
    ldmia sp!, {r3, r4, r5, pc}
L_022075a4:
    cmp r2, #0xb4
    bge L_022075d0
    ldrsh r0, [r5, #0xbe]
    mov r1, #0x12
    add r0, r0, #0x1
    strh r0, [r5, #0xbe]
    ldrsh r0, [r5, #0xbe]
    bl func_020befec
    mov r1, r0
    ldr r0, L_02207608
    bl GXx_SetMasterBrightness_
L_022075d0:
    mov r0, r5
    bl func_ov039_0220713c
    ldr r1, [r5, #0x80]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq L_022075f4
    add r1, r4, #0x2c
    bl func_ov069_0221099c
    ldmia sp!, {r3, r4, r5, pc}
L_022075f4:
    ldr r0, [r1, #0x18]
    add r1, r4, #0x2c
    bl func_ov039_02203990
    ldmia sp!, {r3, r4, r5, pc}
L_02207604: .word gSoundContext
L_02207608: .word 0x400006c
    .size func_ov039_022074b0, .-func_ov039_022074b0

