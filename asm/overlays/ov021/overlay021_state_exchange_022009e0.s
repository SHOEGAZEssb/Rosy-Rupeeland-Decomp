    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_exchange.c. */
    .extern data_ov021_02202e80
    .extern data_ov021_02202e88
    .extern data_ov021_02202e90
    .extern GamePhaseCurrencyHud_GetCurrency
    .extern GraphicsSpriteText_FormatDecimal
    .extern func_0207c4cc
    .extern func_02092260
    .extern func_02092c8c
    .extern func_020939d8
    .extern func_ov002_021fbb68
    .extern func_ov002_021fbc54
    .extern func_ov002_021fbd64
    .extern func_ov002_021fbd98
    .extern func_ov002_021fbdb0
    .extern func_ov021_021fd1b8
    .extern func_ov021_021fd7c0
    .extern func_ov021_021feea4
    .extern func_ov021_021ff1d0
    .extern func_ov021_021ff274
    .extern func_ov045_0220c028
    .extern genrand_int32
    .extern gLupyContext

.global func_ov021_022009e0
func_ov021_022009e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov021_021ff274
    ldr r0, [r4, #0x4]
    cmp r0, #0xa
    bgt L_02200a30
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b L_02200ce8
L_02200a04: ; jump table
    b L_02200a3c ; case 0
    b L_02200a4c ; case 1
    b L_02200ab0 ; case 2
    b L_02200ad8 ; case 3
    b L_02200c78 ; case 4
    b L_02200ce8 ; case 5
    b L_02200ce8 ; case 6
    b L_02200ce8 ; case 7
    b L_02200ce8 ; case 8
    b L_02200ce8 ; case 9
    b L_02200ca0 ; case 10
L_02200a30:
    cmp r0, #0x14
    beq L_02200cc0
    b L_02200ce8
L_02200a3c:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_02200a4c:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02200ce8
    ldr r0, [r4, #0x390]
    add r1, r4, #0x30
    bl func_ov002_021fbb68
    cmp r0, #0x0
    blt L_02200ce8
    bl genrand_int32
    tst r0, #0x1
    beq L_02200a8c
    mov r0, r4
    mov r1, #0x3c80
    bl func_02092260
    b L_02200a98
L_02200a8c:
    ldr r1, L_02200cf8
    mov r0, r4
    bl func_02092260
L_02200a98:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200ce8
L_02200ab0:
    ldr r0, [r4, #0x390]
    bl func_ov002_021fbd98
    cmp r0, #0x0
    bne L_02200ce8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200ce8
L_02200ad8:
    ldr r0, [r4, #0x390]
    bl func_ov002_021fbc54
    cmp r0, #0x0
    beq L_02200b00
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200ce8
L_02200b00:
    ldr r0, [r4, #0x390]
    bl func_ov002_021fbd64 ; func_ov005_021fbd64
    ldr r1, [r4, #0x390]
    ldr r0, [r1, #0x8c]
    cmp r0, #0xc
    beq L_02200bfc
    cmp r0, #0xd
    bne L_02200ce8
    ldr r0, [r1, #0x90]
    cmp r0, #0x0
    beq L_02200be0
    ldr r0, [r1, #0x88]
    str r0, [r4, #0x394]
    cmp r0, #0x0
    bne L_02200b68
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021fd1b8
    cmp r0, #0x0
    bne L_02200b68
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200ce8
L_02200b68:
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021fd1b8
    cmp r0, #0x1
    bne L_02200bb0
    ldr r0, L_02200cfc
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    ldr r1, [r4, #0x394]
    cmp r0, r1
    bgt L_02200bb0
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    mov r0, #0xa
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02200ce8
L_02200bb0:
    ldr r0, [r4, #0x388]
    bl func_020939d8
    ldr r1, [r4, #0x394]
    ldr r2, L_02200d00
    add r0, r4, #0x398
    mov r3, #0x0
    bl GraphicsSpriteText_FormatDecimal
    ldr r1, L_02200d04
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02200ce8
L_02200be0:
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200ce8
L_02200bfc:
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r0, [r4, #0x3e0]
    cmp r0, #0x0
    beq L_02200c5c
    mov r0, #0x1
    sub r1, r0, #0x9
    bl func_02092c8c
    ldr r0, [r4, #0x388]
    bl func_020939d8
    ldr r0, [r4, #0x2bc]
    mov r1, #0x2
    bl func_0207c4cc
    mov r1, r0
    mov r0, r4
    bl func_ov021_021ff1d0
    ldr r0, [r4, #0x38c]
    bl func_ov045_0220c028
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02200ce8
L_02200c5c:
    ldr r0, [r4, #0x388]
    bl func_020939d8
    ldr r1, L_02200d08
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02200ce8
L_02200c78:
    ldr r0, [r4, #0x390]
    bl func_ov002_021fbdb0
    cmp r0, #0x0
    beq L_02200ce8
    ldr r0, [r4, #0x390]
    bl func_ov002_021fbd64 ; func_ov005_021fbd64
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200ce8
L_02200ca0:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x14
    movgt r0, #0x0
    strgt r0, [r4, #0x4]
    strgt r0, [r4, #0x8]
    b L_02200ce8
L_02200cc0:
    mov r0, r4
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_02200ce8
    ldr r0, [r4, #0x388]
    bl func_020939d8
    ldr r1, L_02200d0c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_02200ce8:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200cf8: .word 0x3c81
L_02200cfc: .word gLupyContext
L_02200d00: .word 0xff676980
L_02200d04: .word data_ov021_02202e90
L_02200d08: .word data_ov021_02202e88
L_02200d0c: .word data_ov021_02202e80
.size func_ov021_022009e0, . - func_ov021_022009e0
