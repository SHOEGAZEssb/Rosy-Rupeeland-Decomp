.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern SpritePresentation_Hide


    .global func_ov025_022005e4
func_ov025_022005e4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x508]
    ldr r0, [r4, #0xe0]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0xe4]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r5, #0xdc]
    bl SpritePresentation_Hide
    ldr r0, [r5, #0xe0]
    bl SpritePresentation_Hide
    mov r2, #0x0
L_02200614:
    add r0, r5, r2, lsl #0x2
    ldr r1, [r0, #0xc4]
    add r2, r2, #0x1
    ldrh r0, [r1, #0x24]
    cmp r2, #0x6
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    blt L_02200614
    ldr r1, [r5, #0xc0]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov025_022005e4, .-func_ov025_022005e4

