.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_collections.c. */
.extern SpritePresentation_Show
.extern SpritePresentation_Hide


    .global func_ov023_021fe640
func_ov023_021fe640:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq L_021fe680
    ldr r0, [r4, #0x398]
    cmp r0, #0x1
    ldr r0, [r4, #0x380]
    ble L_021fe670
    bl SpritePresentation_Show
    ldr r0, [r4, #0x384]
    bl SpritePresentation_Show
    ldmia sp!, {r4, pc}
L_021fe670:
    bl SpritePresentation_Hide
    ldr r0, [r4, #0x384]
    bl SpritePresentation_Hide
    ldmia sp!, {r4, pc}
L_021fe680:
    ldr r0, [r4, #0x380]
    bl SpritePresentation_Hide
    ldr r0, [r4, #0x384]
    bl SpritePresentation_Hide
    ldmia sp!, {r4, pc}
.size func_ov023_021fe640, .-func_ov023_021fe640

