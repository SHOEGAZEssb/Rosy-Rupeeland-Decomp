    .text
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteState_ReleaseFromGroup
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern InventoryScroll_UpdatePresentation
    .extern func_ov016_021fd628

/* Exact fallbacks for row sprite and selection refresh; see src/overlays/ov016/overlay016_list_runtime.c. */
    .global func_ov016_021fd270
    .global func_ov016_021fd310
    .global func_ov016_021fd358

func_ov016_021fd270:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldr r0, [r6, #0x54]
    mov r5, r1
    cmp r5, r0
    bge L_021fd308
    mov r0, #0x14
    mul r4, r5, r0
    ldr r0, [r6, #0x4c]
    add r0, r0, r4
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    bne L_021fd308
    ldr r0, [r6, #0x4]
    add r1, r6, #0xc
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    ldr r1, [r6, #0x4c]
    add r1, r1, r4
    str r0, [r1, #0x4]
    ldr r2, [r6, #0x4c]
    add r1, r2, r4
    ldrh r1, [r1, #0xc]
    and r1, r1, #0x7
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    add r1, r2, r4
    ldrsh r2, [r1, #0x8]
    ldrsh r3, [r1, #0xa]
    addeq r5, r5, #0x32
    mov r1, r5
    bl GraphicsSpriteState_ApplyRenderConfig
L_021fd308:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}

    .global func_ov016_021fd310
func_ov016_021fd310:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x54]
    cmp r1, r0
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0x14
    mul r4, r1, r0
    ldr r0, [r5, #0x4c]
    add r0, r0, r4
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r5, #0x4c]
    mov r1, #0x0
    add r0, r0, r4
    str r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, pc}

    .global func_ov016_021fd358
func_ov016_021fd358:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x58]
    bl InventoryScroll_UpdatePresentation
    ldr r0, [r4, #0x50]
    cmp r0, #0x0
    beq L_021fd3e4
    mov r0, r4
    bl func_ov016_021fd628
    ldr r2, [r0, #0x0]
    cmp r2, #0x0
    beq L_021fd3d4
    ldr r0, [r2, #0x0]
    mov r3, #0x0
    ldr lr, [r0, #0x100]
    mov ip, r3
    mov r0, #0x24
    b L_021fd3b4
L_021fd3a0:
    ldr r1, [r2, #0x0]
    mla r1, ip, r0, r1
    ldrh r1, [r1, #0x2c]
    add ip, ip, #0x1
    add r3, r3, r1
L_021fd3b4:
    cmp ip, lr
    blt L_021fd3a0
    ldr r1, [r4, #0x60]
    ldr r0, [r4, #0x24]
    add r1, r1, r3
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fd3e4
L_021fd3d4:
    ldr r1, [r4, #0x60]
    ldr r0, [r4, #0x24]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
L_021fd3e4:
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x8]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}

    .size func_ov016_021fd270, func_ov016_021fd310 - func_ov016_021fd270
    .size func_ov016_021fd310, func_ov016_021fd358 - func_ov016_021fd310
    .size func_ov016_021fd358, . - func_ov016_021fd358
