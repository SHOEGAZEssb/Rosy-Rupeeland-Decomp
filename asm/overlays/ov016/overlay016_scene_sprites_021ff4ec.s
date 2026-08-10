    .text

/* Exact fallback; see src/overlays/ov016/overlay016_scene_sprites.c. */
    .extern GraphicsSpriteGroup_Clear
.global func_ov016_021ff4ec
func_ov016_021ff4ec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xe0]
    bl GraphicsSpriteGroup_Clear
    mov r0, #0x0
    str r0, [r4, #0xe4]
    str r0, [r4, #0x184]
    str r0, [r4, #0x230]
    ldmia sp!, {r4, pc}
    .size func_ov016_021ff4ec, . - func_ov016_021ff4ec

