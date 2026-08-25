    .text
    .extern __destroy_arr
    .extern AnimationResourceState_Destroy
    .extern AnimationResourceState_ReleaseResources
    .extern GraphicsSpriteGroup_Clear
    .extern GraphicsSpriteGroup_Destroy
    .extern GraphicsSpriteCanvas_FillRect
    .extern TitleCharacterResourceCollection_Destroy

/* Exact fallbacks; see src/overlays/ov016/overlay016_panel_helpers.c. */
    .global Overlay016_Panel_Destroy
    .global func_ov016_021fd9dc

Overlay016_Panel_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0xd4
    bl TitleCharacterResourceCollection_Destroy
    add r0, r4, #0x78
    bl AnimationResourceState_Destroy
    add r0, r4, #0x6c
    bl AnimationResourceState_Destroy
    add r0, r4, #0x24
    mov r1, #0x6
    mov r2, #0xc
    ldr r3, L_021fd9d8
    bl __destroy_arr
    add r0, r4, #0x18
    bl AnimationResourceState_Destroy
    add r0, r4, #0xc
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd9d8: .word AnimationResourceState_Destroy

    .global func_ov016_021fd9dc
func_ov016_021fd9dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    cmp r1, #0x0
    beq L_021fda14
    mov r0, #0xb8
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x20
    mov r2, #0x28
    mov r3, #0xf8
    bl GraphicsSpriteCanvas_FillRect
L_021fda14:
    ldr r0, [r6, #0x4]
    bl GraphicsSpriteGroup_Clear
    add r0, r6, #0x18
    bl AnimationResourceState_ReleaseResources
    mov r5, #0x0
    add r4, r6, #0x24
    mov r7, #0xc
L_021fda30:
    mla r0, r5, r7, r4
    bl AnimationResourceState_ReleaseResources
    add r2, r6, r5, lsl #0x2
    ldr r1, [r2, #0x8c]
    add r5, r5, #0x1
    ldrh r0, [r1, #0x24]
    cmp r5, #0x6
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r2, #0xa4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r2, #0xbc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    blt L_021fda30
    ldr r1, [r6, #0x84]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r6, #0x88]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

    .size Overlay016_Panel_Destroy, func_ov016_021fd9dc - Overlay016_Panel_Destroy
    .size func_ov016_021fd9dc, . - func_ov016_021fd9dc
