.text

/* Exact fallback; see src/overlays/ov038/overlay038_exit_render.c for documented portable C. */

    .extern func_020946a8
    .extern func_02093ffc
    .extern func_02092288
    .extern func_ov038_021fd578
    .extern func_02093de4
    .extern func_020946c8
    .extern func_02092260
    .extern func_02094738
    .extern func_ov038_021fce04
    .extern func_ov038_021fd37c
    .extern func_ov046_0220c1d8
    .extern Heap_Free
    .extern data_ov038_021fdcd8
    .extern gSystemState

    .global func_ov038_021fdacc
func_ov038_021fdacc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fdaf4
    cmp r0, #0x1
    beq L_021fdb14
    cmp r0, #0x2
    beq L_021fdb74
    b L_021fdbdc
L_021fdaf4:
    ldr r0, [r4, #0x314]
    mov r1, #0x4
    bl func_020946a8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fdb14:
    ldr r0, [r4, #0x314]
    bl func_02093ffc
    cmp r0, #0x0
    beq L_021fdb68
    ldr r0, [r4, #0x314]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_021fdb50
    mov r0, r4
    mov r1, #0x8
    bl func_02092288
L_021fdb50:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fdb74
L_021fdb68:
    mov r0, r4
    bl func_ov038_021fd578
    b L_021fdbdc
L_021fdb74:
    ldr r0, [r4, #0x314]
    bl func_02093de4
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    ldr r0, [r4, #0x314]
    beq L_021fdbc4
    add r1, r4, #0x30
    bl func_020946c8
    cmp r0, #0x0
    beq L_021fdbdc
    mov r0, r4
    mov r1, #0x8
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fdbdc
L_021fdbc4:
    mov r1, #0x6
    bl func_02094738
    ldr r1, L_021fdbec
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov038_021fce04
L_021fdbdc:
    mov r0, r4
    bl func_ov038_021fd37c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fdbec: .word data_ov038_021fdcd8
    .size func_ov038_021fdacc, .-func_ov038_021fdacc

    .global func_ov038_021fdbf0
func_ov038_021fdbf0:
    stmdb sp!, {r3, lr}
    bl func_ov038_021fd37c
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size func_ov038_021fdbf0, .-func_ov038_021fdbf0

    .global func_ov038_021fdc00
func_ov038_021fdc00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021fdc60
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c1d8
    mov r3, #0x4000000
    ldr r1, [r3, #0x0]
    ldr r0, [r4, #0x48]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r3, #0x0]
    ldr r2, [r4, #0x33c]
    ldr r0, L_021fdc68
    ldr r1, L_021fdc6c
    and r2, r0, r2, lsl #0x10
    str r2, [r3, #0x10]
    ldr r2, [r1, #0x64]
    and r1, r2, r0, lsr #0x10
    and r0, r0, r2, lsl #0x10
    orr r0, r1, r0
    str r0, [r3, #0x1c]
L_021fdc60:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fdc68: .word 0x1ff0000
L_021fdc6c: .word gSystemState
    .size func_ov038_021fdc00, .-func_ov038_021fdc00

    .global func_ov038_021fdc70
func_ov038_021fdc70:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov038_021fdc70, .-func_ov038_021fdc70

