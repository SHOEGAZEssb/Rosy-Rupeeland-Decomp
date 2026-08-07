.text

/* Exact fallback; see src/overlays/ov023/overlay023_state_machines.c. */
.extern data_ov023_021ffb48
.extern func_02092260
.extern func_02092288
.extern func_02093de4
.extern func_02093ffc
.extern func_020946a8
.extern func_020946c8
.extern func_02094738
.extern func_ov023_021fd968
.extern func_ov023_021fd9d0
.extern func_ov023_021fe6e4
.extern func_ov023_021fe77c


    .global func_ov023_021ff7d8
func_ov023_021ff7d8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x478]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x48]
    cmp r0, #0x0
    beq L_021ff808
    cmp r0, #0x1
    beq L_021ff828
    cmp r0, #0x2
    beq L_021ff894
    b L_021ff8fc
L_021ff808:
    mov r0, r4
    mov r1, #0x4
    bl func_020946a8
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021ff828:
    mov r0, r4
    bl func_02093ffc
    cmp r0, #0x0
    beq L_021ff878
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_021ff860
    mov r0, r5
    mov r1, #0x8
    bl func_02092288
L_021ff860:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ff894
L_021ff878:
    ldr r0, [r5, #0x478]
    bl func_ov023_021fd968
    cmp r0, #0x0
    beq L_021ff8fc
    mov r0, r5
    bl func_ov023_021fe6e4
    b L_021ff8fc
L_021ff894:
    mov r0, r4
    bl func_02093de4
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    mov r0, r4
    beq L_021ff8e4
    add r1, r5, #0x30
    bl func_020946c8
    cmp r0, #0x0
    beq L_021ff8fc
    mov r0, r5
    mov r1, #0x8
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ff8fc
L_021ff8e4:
    mov r1, #0x6
    bl func_02094738
    ldr r1, L_021ff90c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
L_021ff8fc:
    mov r0, r5
    bl func_ov023_021fe77c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021ff90c: .word data_ov023_021ffb48
.size func_ov023_021ff7d8, .-func_ov023_021ff7d8

