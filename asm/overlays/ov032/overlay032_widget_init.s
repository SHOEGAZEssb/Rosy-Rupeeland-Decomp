.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_controller.c for documented portable C. */
.extern Heap_Alloc
.extern data_020f4e14
.extern data_020f4e18
.extern data_021f5f18
.extern data_ov032_02202350
.extern GraphicsArchive_AcquireVfdResource
.extern GraphicsSpriteRenderer_SetFontResource
.extern GraphicsSpriteRenderer_GetObjectPaletteAddress
.extern InventoryScroll_SetSpritePriority
.extern InventoryScroll_UpdatePresentation
.extern Overlay032Controller_CreateObject
.extern func_ov032_022014c0
.extern func_ov032_02201f80
.extern gHeapContext

    .global func_ov032_0220173c
func_ov032_0220173c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r4, r0
    mov r2, #0x0
    str r1, [r4, #0x0]
    str r2, [r4, #0x10]
    ldr r0, L_02201888
    str r2, [r4, #0x8]
    ldr r0, [r0, #0x460]
    sub r1, r0, #0x1
    add r0, r1, #0x1
    cmp r0, #0x5
    str r1, [r4, #0xc]
    movge r1, #0x4
    str r1, [r4, #0x14]
    ldr r2, [r4, #0x0]
    add r0, r4, #0x18
    ldr r1, [r2], #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x24
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r3, #0x0
    mov r1, #0x15
    str r3, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r3, [sp, #0x10]
    mov r2, r1
    add r0, r4, #0x18
    mov r3, #0x78
    bl func_ov032_022014c0
    ldr r5, [r4, #0x18]
    mov r2, #0x0
    ldrh r3, [r5, #0x24]
    ldr r0, L_0220188c
    ldr r1, L_02201890
    bic r3, r3, #0x4
    strh r3, [r5, #0x24]
    str r2, [r4, #0x4]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireVfdResource
    str r0, [r4, #0x48]
    ldr r0, L_02201894
    ldr r1, [r4, #0x48]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, L_02201894
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldr r2, L_02201898
    ldr r1, L_0220189c
    strh r2, [r0, #0x4]
    strh r1, [r0, #0x6]
    ldr r2, L_022018a0
    ldr r1, L_022018a4
    strh r2, [r0, #0x8]
    ldr r3, L_022018a8
    mov r0, #0x80
    mov r2, #0x4
    ldr r5, [r4, #0xc]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0220186c
    mov r1, #0xd4
    str r1, [sp, #0x0]
    mov r1, #0x28
    str r1, [sp, #0x4]
    mov r2, #0x0
    ldr r1, L_02201894
    str r2, [sp, #0x8]
    ldr r1, [r1, #0x0]
    add r2, r5, #0x1
    mov r3, #0x5
    bl func_ov032_02201f80
L_0220186c:
    str r0, [r4, #0x4c]
    mov r1, #0x2
    bl InventoryScroll_SetSpritePriority
    ldr r0, [r4, #0x4c]
    bl InventoryScroll_UpdatePresentation
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
L_02201888: .word data_021f5f18
L_0220188c: .word data_020f4e18
L_02201890: .word 0x7006
L_02201894: .word data_020f4e14
L_02201898: .word 0x4210
L_0220189c: .word 0x4a52
L_022018a0: .word 0x294a
L_022018a4: .word data_ov032_02202350
L_022018a8: .word gHeapContext
.size func_ov032_0220173c, .-func_ov032_0220173c

