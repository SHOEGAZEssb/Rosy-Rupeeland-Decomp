.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_controller.c for documented portable C. */
.extern data_020f4e14
.extern data_020f4e18
.extern GraphicsArchive_ReleaseResourceE4
.extern GraphicsSpriteRenderer_ClearFontResource
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern func_ov032_0220147c

    .global func_ov032_022018ac
func_ov032_022018ac:
    stmdb sp!, {r4, lr}
    ldr r1, L_0220190c
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x18
    bl func_ov032_0220147c
    ldr r0, L_02201910
    ldr r1, [r4, #0x48]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseResourceE4
    ldr r0, L_0220190c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearFontResource
    ldr r0, L_0220190c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldmia sp!, {r4, pc}
L_0220190c: .word data_020f4e14
L_02201910: .word data_020f4e18
.size func_ov032_022018ac, .-func_ov032_022018ac

