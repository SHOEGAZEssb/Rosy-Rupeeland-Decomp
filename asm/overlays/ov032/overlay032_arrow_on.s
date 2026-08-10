.text

/* Exact fallback; see src/overlays/ov032/overlay032_unlock_effect.c for documented portable C. */
.extern GraphicsSpriteState_SetAnimationIndex

    .global func_ov032_022001a0
func_ov032_022001a0:
    mov r1, #0x1
    str r1, [r0, #0xc]
    ldr r1, [r0, #0x10]
    ldr ip, L_022001bc
    ldr r0, [r0, #0x0]
    and r1, r1, #0xff
    bx ip
L_022001bc: .word GraphicsSpriteState_SetAnimationIndex
.size func_ov032_022001a0, .-func_ov032_022001a0

