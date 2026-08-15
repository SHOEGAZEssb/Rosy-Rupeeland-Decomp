.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_collections.c. */
.extern SpritePresentation_SetAnimation


    .global func_ov023_021fe5f8
func_ov023_021fe5f8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x398]
    cmp r0, #0x1
    ldr r0, [r4, #0x380]
    ble L_021fe628
    mov r1, #0x8
    bl SpritePresentation_SetAnimation
    ldr r0, [r4, #0x384]
    mov r1, #0xa
    bl SpritePresentation_SetAnimation
    ldmia sp!, {r4, pc}
L_021fe628:
    mov r1, #0x9
    bl SpritePresentation_SetAnimation
    ldr r0, [r4, #0x384]
    mov r1, #0xb
    bl SpritePresentation_SetAnimation
    ldmia sp!, {r4, pc}
.size func_ov023_021fe5f8, .-func_ov023_021fe5f8

