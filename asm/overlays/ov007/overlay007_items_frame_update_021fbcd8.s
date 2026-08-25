    .text
    .extern Overlay007_SetupGraphics
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern VecFx32Object_InitCopy
    .extern func_020adc40
    .extern VecFx32Object_Destroy
    .extern gFx32CosSinTable

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov007/overlay007_items_frame_update.c. */
    .global Overlay007_UpdateItemFrames
Overlay007_UpdateItemFrames: ; 0x021fbcd8
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r1, [r4, #0x4c]
    cmp r1, #0x0
    beq L_021fbfc8
    ldrb r1, [r4, #0xd0]
    cmp r1, #0x0
    bne L_021fbfc8
    ldr r1, [r4, #0xd4]
    cmp r1, #0x1
    bne L_021fbd10
    bl Overlay007_SetupGraphics
    b L_021fbfc8
L_021fbd10:
    ldr r0, [r4, #0x48]
    mov r1, #0xb4000
    ldr r0, [r0, #0x8]
    ldr r2, L_021fbfd0
    ldr r0, [r0, #0xb0]
    rsb r1, r1, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r2, [r2, r0]
    mvn r0, #0x0
    umull ip, r3, r2, r1
    mla r3, r2, r0, r3
    mov r0, r2, asr #0x1f
    adds r2, ip, #0x800
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x88]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0xac]
    cmp r0, #0xa
    bne L_021fbd90
    ldr r0, [r4, #0x4c]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x1
    strb r0, [r4, #0xa0]
L_021fbd90:
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    beq L_021fbe08
    sub r1, r0, #0x10
    str r1, [r4, #0x9c]
    cmp r1, #0x100
    bge L_021fbdf4
    cmp r1, #0x0
    bge L_021fbdd0
    mov r0, #0x0
    str r0, [r4, #0x9c]
    ldr r1, [r4, #0x78]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b L_021fbe08
L_021fbdd0:
    ldr r0, [r4, #0x9c]
    mov r1, #0x100
    add r0, r0, #0x8
    str r0, [r4, #0x9c]
    ldr r0, [r4, #0x78]
    strh r1, [r0, #0x3c]
    ldr r0, [r4, #0x78]
    strh r1, [r0, #0x3e]
    b L_021fbe08
L_021fbdf4:
    ldr r0, [r4, #0x78]
    strh r1, [r0, #0x3c]
    ldr r1, [r4, #0x9c]
    ldr r0, [r4, #0x78]
    strh r1, [r0, #0x3e]
L_021fbe08:
    ldrsh r0, [r4, #0xd8]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgth r0, [r4, #0xd8]
    ldrb r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fbe38
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0xac]
    cmp r0, #0x0
    beq L_021fbe64
L_021fbe38:
    ldrb r0, [r4, #0xa1]
    cmp r0, #0x0
    beq L_021fbe58
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x8]
    ldrsh r0, [r0, #0xb6]
    cmp r0, #0x0
    beq L_021fbe64
L_021fbe58:
    ldrsh r0, [r4, #0xd8]
    cmp r0, #0x1
    bne L_021fbe84
L_021fbe64:
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    strb r0, [r4, #0xa1]
    strb r0, [r4, #0xa0]
    strh r0, [r4, #0xd8]
L_021fbe84:
    mov r0, #0xa
    sub r3, r0, #0x1
    mov r2, #0x0
L_021fbe90:
    add r1, r4, r3, lsl #0x2
    ldr r0, [r1, #0xa4]
    cmp r0, #0x0
    ble L_021fbec0
    add r0, r0, #0x1
    str r0, [r1, #0xa4]
    cmp r0, #0x8
    ldrgt r1, [r1, #0x50]
    ldrgth r0, [r1, #0x42]
    orrgt r0, r0, #0x4
    strgth r0, [r1, #0x42]
    b L_021fbec4
L_021fbec0:
    add r2, r2, #0x1
L_021fbec4:
    subs r3, r3, #0x1
    bpl L_021fbe90
    ldr r0, [r4, #0x94]
    cmp r0, #0x0
    ble L_021fbf00
    subs r0, r0, #0x1
    str r0, [r4, #0x94]
    bne L_021fbf3c
    ldr r0, [r4, #0x7c]
    ldr r1, [r4, #0x90]
    ldr r0, [r0, #0xc]
    rsb r1, r1, #0xa
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fbf3c
L_021fbf00:
    ldr r0, [r4, #0x90]
    cmp r0, r2
    beq L_021fbf3c
    sub r0, r0, #0x1
    str r0, [r4, #0x90]
    subs r0, r0, r2
    moveq r0, #0x18
    movne r0, #0xd
    str r0, [r4, #0x94]
    ldr r0, [r4, #0x7c]
    ldr r1, [r4, #0x90]
    ldr r0, [r0, #0xc]
    rsb r1, r1, #0x15
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
L_021fbf3c:
    ldr r1, [r4, #0x48]
    add r0, sp, #0x0
    ldr r1, [r1, #0x8]
    add r1, r1, #0x84
    bl VecFx32Object_InitCopy
    ldr r2, [sp, #0x8]
    ldr ip, [sp, #0x4]
    smull r1, r0, r2, r2
    smull r3, r2, ip, ip
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    add r0, r0, r0, lsl #0x2
    mov r0, r0, asr #0xc
    ldr r1, [r4, #0xcc]
    add r0, r0, #0x1
    sub r2, r1, r0
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x18
    add r3, r1, r0, ror #0x18
    str r2, [r4, #0xcc]
    ldr r1, L_021fbfd4
    ldr r2, L_021fbfd8
    add r0, sp, #0x0
    str r3, [r4, #0xcc]
    and r1, r3, r1
    str r1, [r2, #0x0]
    bl VecFx32Object_Destroy
L_021fbfc8:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fbfd0: .word gFx32CosSinTable
L_021fbfd4: .word 0x1ff
L_021fbfd8: .word 0x4001010

    .size Overlay007_UpdateItemFrames, .-Overlay007_UpdateItemFrames
