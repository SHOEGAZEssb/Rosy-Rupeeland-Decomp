    .text
    .extern data_ov016_02201520
    .extern PresentationList_DeleteAll

/* Exact fallbacks for small base-state helpers; see src/overlays/ov016/overlay016_sprite_wrapper.c. */
    .global func_ov016_021fe0d4
    .global func_ov016_021fe0d8
    .global func_ov016_021fe0f8

func_ov016_021fe0d4:
    bx lr

    .global func_ov016_021fe0d8
func_ov016_021fe0d8:
    ldr r2, L_021fe0f4
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fe0f4: .word data_ov016_02201520

    .global func_ov016_021fe0f8
func_ov016_021fe0f8:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe114
    mov r4, r0
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fe114: .word data_ov016_02201520

    .size func_ov016_021fe0d4, func_ov016_021fe0d8 - func_ov016_021fe0d4
    .size func_ov016_021fe0d8, func_ov016_021fe0f8 - func_ov016_021fe0d8
    .size func_ov016_021fe0f8, . - func_ov016_021fe0f8
