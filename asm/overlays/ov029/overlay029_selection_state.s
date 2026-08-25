.text

/* Exact fallback; see src/overlays/ov029/overlay029_selection_state.c. */
.extern data_ov029_021fec08
.extern data_ov029_021feca0
.extern data_ov029_021fecb0
.extern data_ov029_021fecb8
.extern GamePhaseCurrencyHud_GetCurrency
.extern GraphicsSpriteText_FormatDecimal
.extern SceneSound_PlayPackedEffect
.extern DisplayBrightness_StartMaskedTransitions
.extern TitleDialog_ClearTextRect
.extern func_ov002_021fbb68
.extern func_ov002_021fbc54
.extern func_ov002_021fbd64
.extern func_ov002_021fbd98
.extern func_ov002_021fbdb0
.extern func_ov029_021fce4c
.extern func_ov029_021fd6fc
.extern func_ov029_021fd7a8
.extern func_ov029_021fd850
.extern GameWork_SetFlag
.extern genrand_int32
.extern gGameWork
.extern gGamePhaseCurrencyHud


    .global func_ov029_021fdc5c
func_ov029_021fdc5c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_ov029_021fd850
    ldr r0, [r4, #0x4]
    cmp r0, #0xb
    bgt L_021fdcb0
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b L_021fe098
L_021fdc80: ; jump table
    b L_021fdcbc ; case 0
    b L_021fdccc ; case 1
    b L_021fdd30 ; case 2
    b L_021fdd58 ; case 3
    b L_021fdff4 ; case 4
    b L_021fe098 ; case 5
    b L_021fe098 ; case 6
    b L_021fe098 ; case 7
    b L_021fe098 ; case 8
    b L_021fe098 ; case 9
    b L_021fe01c ; case 10
    b L_021fe050 ; case 11
L_021fdcb0:
    cmp r0, #0x14
    beq L_021fe07c
    b L_021fe098
L_021fdcbc:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_021fdccc:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fe098
    ldr r0, [r4, #0xa8]
    add r1, r4, #0x30
    bl func_ov002_021fbb68
    cmp r0, #0x0
    blt L_021fe098
    bl genrand_int32
    tst r0, #0x1
    beq L_021fdd0c
    mov r0, r4
    mov r1, #0x3c80
    bl SceneSound_PlayPackedEffect
    b L_021fdd18
L_021fdd0c:
    ldr r1, L_021fe0a8
    mov r0, r4
    bl SceneSound_PlayPackedEffect
L_021fdd18:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe098
L_021fdd30:
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbd98
    cmp r0, #0x0
    bne L_021fe098
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe098
L_021fdd58:
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbc54
    cmp r0, #0x0
    beq L_021fdd80
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe098
L_021fdd80:
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbd64 ; func_ov005_021fbd64
    ldr r1, [r4, #0xa8]
    ldr r0, [r1, #0x8c]
    cmp r0, #0xc
    beq L_021fdedc
    cmp r0, #0xd
    bne L_021fe098
    ldr r0, [r1, #0x90]
    cmp r0, #0x0
    beq L_021fdebc
    ldr r0, [r1, #0x88]
    str r0, [r4, #0xac]
    ldr r0, [r4, #0x5c]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b L_021fe098
L_021fddc4: ; jump table
    b L_021fde60 ; case 0
    b L_021fde60 ; case 1
    b L_021fdde4 ; case 2
    b L_021fdde4 ; case 3
    b L_021fdde4 ; case 4
    b L_021fdde4 ; case 5
    b L_021fdde4 ; case 6
    b L_021fdde4 ; case 7
L_021fdde4:
    ldr r0, L_021fe0ac
    ldr r5, [r4, #0xac]
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    cmp r0, r5
    bgt L_021fde1c
    mov r0, r4
    mov r1, #0x9
    bl SceneSound_PlayPackedEffect
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021fe098
L_021fde1c:
    ldr r0, [r4, #0x5c]
    cmp r0, #0x7
    cmpeq r5, #0x0
    bne L_021fde60
    ldr r0, [r4, #0x9c]
    bl TitleDialog_ClearTextRect
    mov r1, #0x3
    ldr r0, L_021fe0b0
    str r1, [r4, #0x6c]
    ldr r0, [r0, #0x0]
    ldr r1, L_021fe0b4
    bl GameWork_SetFlag
    ldr r1, L_021fe0b8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe098
L_021fde60:
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    bne L_021fde8c
    mov r0, r4
    mov r1, #0x9
    bl SceneSound_PlayPackedEffect
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021fe098
L_021fde8c:
    ldr r0, [r4, #0x9c]
    bl TitleDialog_ClearTextRect
    ldr r1, [r4, #0xac]
    ldr r2, L_021fe0bc
    add r0, r4, #0xb0
    mov r3, #0x0
    bl GraphicsSpriteText_FormatDecimal
    ldr r1, L_021fe0c0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe098
L_021fdebc:
    mov r0, r4
    mov r1, #0x9
    bl SceneSound_PlayPackedEffect
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021fe098
L_021fdedc:
    ldr r0, [r4, #0x5c]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b L_021fe098
L_021fdeec: ; jump table
    b L_021fdf38 ; case 0
    b L_021fdf38 ; case 1
    b L_021fdf54 ; case 2
    b L_021fdf54 ; case 3
    b L_021fdf0c ; case 4
    b L_021fdf54 ; case 5
    b L_021fdf54 ; case 6
    b L_021fdfb0 ; case 7
L_021fdf0c:
    mov r0, r4
    mov r1, #0x2
    bl func_ov029_021fd7a8
    mov r1, #0xa
    mov r0, #0x1
    str r1, [r4, #0x4]
    mov r2, #0x0
    sub r1, r0, #0x9
    str r2, [r4, #0x8]
    bl DisplayBrightness_StartMaskedTransitions
    b L_021fe098
L_021fdf38:
    mov r0, r4
    mov r1, #0x9
    bl SceneSound_PlayPackedEffect
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe098
L_021fdf54:
    sub r0, r0, #0x5
    cmp r0, #0x1
    mov r0, r4
    bhi L_021fdf70
    mov r1, #0x1
    bl func_ov029_021fd7a8
    b L_021fdf78
L_021fdf70:
    mov r1, #0x2
    bl func_ov029_021fd7a8
L_021fdf78:
    mov r0, r4
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    mov r2, #0x0
    mov r0, #0x1
    str r2, [r4, #0xac]
    sub r1, r0, #0x9
    str r2, [r4, #0x6c]
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, L_021fe0c4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe098
L_021fdfb0:
    ldr r0, [r4, #0x9c]
    bl TitleDialog_ClearTextRect
    mov r0, r4
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    mov r1, #0x0
    str r1, [r4, #0xac]
    ldr r0, L_021fe0b0
    str r1, [r4, #0x6c]
    ldr r0, [r0, #0x0]
    ldr r1, L_021fe0b4
    bl GameWork_SetFlag
    ldr r1, L_021fe0c8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe098
L_021fdff4:
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbdb0
    cmp r0, #0x0
    beq L_021fe098
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbd64 ; func_ov005_021fbd64
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe098
L_021fe01c:
    mov r0, r4
    bl func_ov029_021fd850
    cmp r0, #0x0
    beq L_021fe098
    mov r0, r4
    mov r1, #0x1
    bl func_ov029_021fd7a8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe098
L_021fe050:
    mov r0, r4
    bl func_ov029_021fd850
    cmp r0, #0x0
    beq L_021fe098
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe098
L_021fe07c:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x14
    movgt r0, #0x0
    strgt r0, [r4, #0x4]
    strgt r0, [r4, #0x8]
L_021fe098:
    mov r0, r4
    bl func_ov029_021fd6fc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fe0a8: .word 0x3c81
L_021fe0ac: .word gGamePhaseCurrencyHud
L_021fe0b0: .word gGameWork
L_021fe0b4: .word 0x38a
L_021fe0b8: .word data_ov029_021feca0
L_021fe0bc: .word 0xff676980
L_021fe0c0: .word data_ov029_021fec08
L_021fe0c4: .word data_ov029_021fecb8
L_021fe0c8: .word data_ov029_021fecb0
.size func_ov029_021fdc5c, .-func_ov029_021fdc5c
