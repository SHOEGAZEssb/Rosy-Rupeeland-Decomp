.text

/* Exact fallback; see src/overlays/ov024/overlay024_state_callbacks.c. */
.extern data_ov024_021fe250
.extern data_ov024_021fe254
.extern data_ov024_021fe2c8
.extern data_ov024_021fe2d0
.extern data_ov024_021fe2d8
.extern data_ov024_021fe2f8
.extern data_ov024_021fe308
.extern func_02092260
.extern func_020922f0
.extern func_02092314
.extern IndexedSelectionController_ResetTransition
.extern IndexedSelectionController_SnapTransitionOrigin
.extern IndexedSelectionController_Increment
.extern IndexedSelectionController_Decrement
.extern IndexedSelectionController_AdvanceTransition
.extern IndexedSelectionController_AdvancePacing
.extern func_02095860
.extern func_ov005_021fbdf8
.extern func_ov024_021fce04
.extern func_ov024_021fd86c
.extern func_ov024_021fd968
.extern func_ov024_021fdab0
.extern gGameWork


    .global func_ov024_021fdcdc
func_ov024_021fdcdc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fdd04
    cmp r0, #0x1
    beq L_021fdd2c
    cmp r0, #0x2
    beq L_021fdd78
    b L_021fe00c
L_021fdd04:
    ldr r0, [r4, #0x2bc]
    mov r1, #0x1
    str r1, [r0, #0x158]
    add r0, r4, #0x284
    bl IndexedSelectionController_ResetTransition
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fdd2c:
    add r0, r4, #0x284
    bl IndexedSelectionController_AdvancePacing
    cmp r0, #0x0
    beq L_021fdd6c
    ldr r1, [r4, #0x290]
    ldr r0, [r4, #0x294]
    cmp r1, r0
    beq L_021fdd54
    mov r0, r4
    bl func_ov024_021fd968
L_021fdd54:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fdd78
L_021fdd6c:
    mov r0, r4
    bl func_ov024_021fd968
    b L_021fe00c
L_021fdd78:
    add r0, r4, #0x284
    bl IndexedSelectionController_SnapTransitionOrigin
    ldr r0, [r4, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021fdda4
    tst r0, #0x100
    bne L_021fdda4
    add r0, r4, #0x284
    bl IndexedSelectionController_Increment
    b L_021fdfdc
L_021fdda4:
    tst r0, #0x80
    beq L_021fddc0
    tst r0, #0x100
    bne L_021fddc0
    add r0, r4, #0x284
    bl IndexedSelectionController_Decrement
    b L_021fdfdc
L_021fddc0:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fdfdc
    add r0, r4, #0x80
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021fde30
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021fe01c
    mov r0, r4
    ldr r1, [r1, #0x0]
    mvn ip, #0x0
    add r3, r1, #0x100
    mov r1, #0x3e
    mov r2, #0x10
    strh ip, [r3, #0xde]
    bl func_02092314
    ldr r1, L_021fe020
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov024_021fce04
    b L_021fe00c
L_021fde30:
    add r0, r4, #0x12c
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021fde84
    mov r0, r4
    mov r1, #0x2e80
    bl func_02092260
    ldr r2, [r4, #0x290]
    ldr r1, L_021fe024
    mov r0, r4
    ldr r1, [r1, r2, lsl #0x3]
    mov r2, #0x1e
    bl func_ov024_021fdab0
    ldr r1, L_021fe028
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov024_021fce04
    b L_021fe00c
L_021fde84:
    add r0, r4, #0x1d8
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021fded8
    mov r0, r4
    mov r1, #0x2e80
    bl func_02092260
    ldr r2, [r4, #0x290]
    ldr r1, L_021fe02c
    mov r0, r4
    ldr r1, [r1, r2, lsl #0x3]
    mov r2, #0x1e
    bl func_ov024_021fdab0
    ldr r1, L_021fe030
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov024_021fce04
    b L_021fe00c
L_021fded8:
    ldr r0, [r4, #0x2bc]
    ldr r1, [r4, #0x290]
    add r2, r4, #0x30
    bl func_ov005_021fbdf8
    cmp r0, #0x0
    beq L_021fdf5c
    ldr r0, [r4, #0x290]
    cmp r0, #0x0
    ble L_021fdf4c
    ldr r1, L_021fe034
    mov r0, r4
    bl func_02092260
    mov r0, r4
    mov r1, #0x3e
    mov r2, #0x20
    bl func_02092314
    mov r0, r4
    mov r1, #0x39
    bl func_020922f0
    ldr r0, L_021fe01c
    ldr r2, [r4, #0x290]
    ldr r0, [r0, #0x0]
    ldr r1, L_021fe038
    add r0, r0, #0x100
    strh r2, [r0, #0xde]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov024_021fce04
    b L_021fe00c
L_021fdf4c:
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    b L_021fe00c
L_021fdf5c:
    mov r5, #0x0
    b L_021fdfd4
L_021fdf64:
    ldr r0, [r4, #0x290]
    cmp r5, r0
    beq L_021fdfd0
    ldr r0, [r4, #0x2bc]
    mov r1, r5
    add r2, r4, #0x30
    bl func_ov005_021fbdf8
    cmp r0, #0x0
    beq L_021fdfd0
    ldr r0, [r4, #0x60]
    cmp r5, r0
    mov r0, r4
    bgt L_021fdfc4
    mov r1, #0x2e80
    bl func_02092260
    mov r0, r4
    mov r1, r5
    mov r2, #0xc
    bl func_ov024_021fdab0
    ldr r1, L_021fe03c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov024_021fce04
    b L_021fdfdc
L_021fdfc4:
    mov r1, #0x9
    bl func_02092260
    b L_021fdfdc
L_021fdfd0:
    add r5, r5, #0x1
L_021fdfd4:
    cmp r5, #0xb
    blt L_021fdf64
L_021fdfdc:
    add r0, r4, #0x284
    bl IndexedSelectionController_AdvanceTransition
    cmp r0, #0x0
    beq L_021fe00c
    mov r0, r4
    mov r1, #0x2e80
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fe00c:
    mov r0, r4
    bl func_ov024_021fd86c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fe01c: .word gGameWork
L_021fe020: .word data_ov024_021fe2c8
L_021fe024: .word data_ov024_021fe250
L_021fe028: .word data_ov024_021fe308
L_021fe02c: .word data_ov024_021fe254
L_021fe030: .word data_ov024_021fe2d8
L_021fe034: .word 0x2e81
L_021fe038: .word data_ov024_021fe2f8
L_021fe03c: .word data_ov024_021fe2d0
.size func_ov024_021fdcdc, .-func_ov024_021fdcdc

