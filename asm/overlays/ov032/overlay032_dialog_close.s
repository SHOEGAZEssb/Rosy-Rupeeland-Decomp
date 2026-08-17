.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */
.extern GraphicsSpriteState_SetFrameIndex
.extern TitleDialog_ClearTextRect
.extern func_ov032_021fe0c4

    .global func_ov032_021fe10c
func_ov032_021fe10c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x10]
    bl TitleDialog_ClearTextRect
    add r0, r4, #0xc4
    bl func_ov032_021fe0c4
    ldr r0, [r4, #0xc4]
    mov r1, #0x0
    bl GraphicsSpriteState_SetFrameIndex
    ldmia sp!, {r4, pc}
.size func_ov032_021fe10c, .-func_ov032_021fe10c

