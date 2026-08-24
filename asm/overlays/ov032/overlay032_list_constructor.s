.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_helpers.c for documented portable C. */
.extern Heap_Alloc
.extern data_020f4e18
.extern data_ov032_02202308
.extern data_ov032_02202358
.extern func_02071ee0
.extern GraphicsSpriteState_ApplyRenderConfig
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern InventoryScroll_ConfigureRange
.extern InventoryScroll_UpdateArrowAnimations
.extern Presentation_SetPosition
.extern SpritePresentation_Init
.extern SpritePresentation_SyncPosition
.extern Overlay032ListBase_Init
.extern gHeapContext

    .global func_ov032_02201f80
func_ov032_02201f80:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    mov r4, r1
    mov r9, r2
    mov r8, r3
    ldr r7, [sp, #0x38]
    bl Overlay032ListBase_Init
    ldr r0, L_022021dc
    mov r1, #0x9
    str r0, [r10, #0x0]
    str r4, [r10, #0x4c]
    str r7, [r10, #0x6c]
    ldr r0, L_022021e0
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r10, #0x54
    mov r2, #0x7
    mov r3, #0x8
    bl func_02071ee0
    ldr r0, [r10, #0x4c]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r2, [sp, #0x30]
    str r0, [r10, #0x50]
    str r2, [r0, #0x18]
    ldr r1, [sp, #0x34]
    mov r2, #0x1
    str r1, [r0, #0x1c]
    ldr r0, [r10, #0x50]
    add r1, r10, #0x54
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x2
    str r1, [sp, #0x0]
    mov r1, #0x4000
    str r1, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    mov r1, #0x6
    mov r3, #0x2e
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0x50]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x2
    str r1, [sp, #0x0]
    mov r1, #0x4000
    str r1, [sp, #0x4]
    mov r2, #0x0
    mov r1, #0x7
    add r3, r7, #0x2e
    str r2, [sp, #0x8]
    bl GraphicsSpriteState_ApplyRenderConfig
    cmp r7, #0x0
    ble L_02202098
    ldr r0, [r10, #0x50]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r7, r7, lsr #0x1f
    mov r3, #0x2
    mov r1, r1, asr #0x1
    ldr r2, L_022021e4
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r2, #0x0
    add r3, r1, #0x2e
    mov r1, #0x8
    str r2, [sp, #0x8]
    bl GraphicsSpriteState_ApplyRenderConfig
L_02202098:
    add r0, r7, #0x5c
    mov r5, r0, lsl #0xc
    mov r6, #0x0
    mov r11, #0x2
L_022020a8:
    ldr r1, L_022021e8
    ldr r3, L_022021ec
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_022020e4
    ldr r0, [r10, #0x50]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, r4
    bl SpritePresentation_Init
    mov r4, r0
L_022020e4:
    add r2, r10, r6, lsl #0x2
    str r4, [r2, #0x64]
    ldr r1, [r4, #0x9c]
    mov r0, #0x3000
    strb r11, [r1, #0x3a]
    strh r0, [r1, #0x28]
    cmp r6, #0x0
    ldr r0, [r2, #0x64]
    mov r1, #0x0
    bne L_0220211c
    mov r2, r1
    mov r3, r1
    bl Presentation_SetPosition
    b L_02202128
L_0220211c:
    mov r2, r5
    mov r3, r1
    bl Presentation_SetPosition
L_02202128:
    add r0, r10, r6, lsl #0x2
    ldr r0, [r0, #0x64]
    bl SpritePresentation_SyncPosition
    add r6, r6, #0x1
    cmp r6, #0x2
    blt L_022020a8
    ldr r0, [r10, #0x50]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x60]
    mov r0, #0x2
    mov r2, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x2000
    stmib sp, {r0, r2}
    ldr r0, [r10, #0x60]
    mov r3, r2
    mov r1, #0x4
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r0, r10
    mov r1, r9
    mov r2, r8
    mov r3, #0x0
    bl InventoryScroll_ConfigureRange
    mov r0, #0x0
    str r0, [r10, #0x3c]
    mov r0, #0x10
    str r0, [r10, #0x40]
    add r1, r7, #0x3c
    mov r0, r10
    str r1, [r10, #0x44]
    bl InventoryScroll_UpdateArrowAnimations
    ldmib r10, {r0, r1}
    cmp r1, r0
    blt L_022021d0
    ldr r1, [r10, #0x60]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r10, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
L_022021d0:
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_022021dc: .word data_ov032_02202308
L_022021e0: .word data_020f4e18
L_022021e4: .word 0x4001
L_022021e8: .word data_ov032_02202358
L_022021ec: .word gHeapContext
.size func_ov032_02201f80, .-func_ov032_02201f80

