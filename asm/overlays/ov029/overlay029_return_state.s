.text

/* Exact fallback; see src/overlays/ov029/overlay029_lifecycle_tail.c. */
.extern data_ov029_021fec38
.extern data_ov029_021fec40
.extern data_ov029_021fec50
.extern data_ov029_021fec58
.extern data_ov029_021feca8
.extern DisplayBrightness_IsMainTransitionComplete
.extern GamePhaseCurrencyHud_GetCurrency
.extern GamePhaseCurrencyHud_AddCurrency
.extern func_02092260
.extern func_02092c8c
.extern func_020939d8
.extern func_020948e4
.extern func_ov002_021fbe68
.extern func_ov029_021fce4c
.extern func_ov029_021fd6fc
.extern func_ov029_021fd7a8
.extern func_ov029_021fd850
.extern func_ov029_021fd9b4
.extern func_ov029_021fe798
.extern func_ov045_0220b924
.extern func_ov045_0220b9b8
.extern func_ov045_0220bc34
.extern func_ov045_0220bdd0
.extern gLupyContext


    .global func_ov029_021fe870
func_ov029_021fe870:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_021feae0
L_021fe888: ; jump table
    b L_021fe898 ; case 0
    b L_021fe918 ; case 1
    b L_021fea3c ; case 2
    b L_021fea98 ; case 3
L_021fe898:
    bl func_ov029_021fd850
    cmp r0, #0x0
    beq L_021feae0
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    beq L_021fe8c0
    mov r0, #0x0
    str r0, [r4, #0x74]
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bdd0
L_021fe8c0:
    ldr r0, [r4, #0x9c]
    bl func_020939d8
    ldr r0, L_021feaf0
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0xd0]
    ldr r2, [r4, #0xac]
    mov r3, #0x1
    bl func_ov045_0220b924
    ldr r1, [r4, #0xac]
    ldr r3, L_021feaf0
    rsb r1, r1, #0x0
    mov r2, r0
    ldr r0, [r3, #0x0]
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021feae0
L_021fe918:
    ldr r0, [r4, #0xd0]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_021feae0
    ldr r0, [r4, #0xd0]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_021feae0
    ldr r1, [r4, #0x5c]
    cmp r1, #0x7
    bne L_021fe958
    ldr r1, L_021feaf4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021feae0
L_021fe958:
    ldr r0, [r4, #0x6c]
    sub r0, r0, #0x1
    cmp r0, #0x1
    bhi L_021fea28
    cmp r1, #0x4
    bne L_021fe9b0
    ldr r0, L_021feaf0
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    cmp r0, #0x1
    bne L_021fe9d0
    mov r2, #0x0
    str r2, [r4, #0xac]
    mov r0, r4
    mov r1, #0x5
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
    ldr r1, L_021feaf8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021feae0
L_021fe9b0:
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    bne L_021fe9d0
    ldr r1, L_021feafc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021feae0
L_021fe9d0:
    mov r0, r4
    bl func_ov029_021fd9b4
    ldr r0, [r4, #0xa0]
    mov r1, #0x2
    add r0, r0, #0xc
    mov r2, #0x160
    bl func_020948e4
    ldr r2, [r4, #0xa0]
    mov r0, #0x10
    str r0, [r2, #0x7c]
    mov r1, #0x0
    str r1, [r2, #0x80]
    mov r0, r4
    str r1, [r4, #0x6c]
    mov r1, #0x1
    bl func_ov029_021fd7a8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021feae0
L_021fea28:
    ldr r1, L_021feb00
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021feae0
L_021fea3c:
    bl func_ov029_021fd850
    cmp r0, #0x0
    beq L_021feae0
    ldr r0, [r4, #0xa0]
    bl func_ov029_021fe798
    cmp r0, #0x0
    beq L_021feae0
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fea70
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fea70:
    mov r1, #0x0
    str r1, [r4, #0xa0]
    mov r0, #0x1
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021feae0
L_021fea98:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021feae0
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbe68
    ldr r0, [r4, #0x58]
    cmp r0, #0x5
    mov r0, r4
    bne L_021feac8
    mov r1, #0x6d
    bl func_02092260
    b L_021fead0
L_021feac8:
    mov r1, #0x69
    bl func_02092260
L_021fead0:
    ldr r1, L_021feb04
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
L_021feae0:
    mov r0, r4
    bl func_ov029_021fd6fc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021feaf0: .word gLupyContext
L_021feaf4: .word data_ov029_021fec58
L_021feaf8: .word data_ov029_021fec50
L_021feafc: .word data_ov029_021feca8
L_021feb00: .word data_ov029_021fec40
L_021feb04: .word data_ov029_021fec38
.size func_ov029_021fe870, .-func_ov029_021fe870
