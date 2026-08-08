.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_delete_states.c. */
.extern data_ov025_02202e20
.extern data_ov025_02202e48
.extern data_ov025_02202e98
.extern func_0207f248
.extern func_020802f4
.extern func_02092260
.extern func_02095dd4
.extern func_ov025_021ff254
.extern func_ov025_02200178
.extern func_ov025_022001f4
.extern func_ov025_02200224
.extern func_ov025_022002b0
.extern func_ov025_02200398
.extern func_ov025_02200438
.extern func_ov025_02200468
.extern func_ov025_02200480
.extern func_ov025_022006c4
.extern func_ov025_02200824
.extern gRuntimeContext


    .global func_ov025_02201abc
func_ov025_02201abc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_02201cd8
L_02201ad4: ; jump table
    b L_02201ae8 ; case 0
    b L_02201b08 ; case 1
    b L_02201ba8 ; case 2
    b L_02201c30 ; case 3
    b L_02201c90 ; case 4
L_02201ae8:
    mov r1, #0x15
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201b08:
    mov r0, r4
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x59c]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    movs r5, r0
    bmi L_02201cd8
    mov r0, r4
    bl func_ov025_022002b0
    cmp r5, #0x1
    beq L_02201b50
    cmp r5, #0x2
    beq L_02201b8c
    b L_02201cd8
L_02201b50:
    mov r0, r4
    mov r1, #0x5
    mov r2, #0x3
    bl func_ov025_02200398
    ldr r0, L_02201ce8
    ldr r1, [r4, #0x54]
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl func_020802f4
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201cd8
L_02201b8c:
    mov r0, r4
    bl func_ov025_022001f4
    ldr r1, L_02201cec
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201cd8
L_02201ba8:
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r0, L_02201ce8
    ldr r0, [r0, #0x0]
    bl func_0207f248
    cmp r0, #0x0
    beq L_02201cd8
    mvn r1, #0x0
    cmp r0, r1
    mov r0, r4
    bne L_02201c14
    mov r1, #0x1
    bl func_ov025_02200438
    ldr r0, L_02201ce8
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x10]
    cmp r0, #0x4
    bne L_02201cd8
    mov r0, r4
    mov r1, #0x1f
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201cf0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201cd8
L_02201c14:
    bl func_ov025_02200468
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201cd8
L_02201c30:
    mov r1, #0x4
    bl func_ov025_02200824
    mov r0, r4
    bl func_ov025_02200480
    cmp r0, #0x0
    beq L_02201cd8
    mov r0, r4
    bl func_ov025_022006c4
    mov r0, r4
    mov r1, #0x0
    bl func_ov025_02200438
    mov r0, r4
    mov r1, #0x16
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201cf4
    mov r0, r4
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201cd8
L_02201c90:
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x59c]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02201cd8
    mov r0, r4
    bl func_ov025_022002b0
    mov r0, r4
    bl func_ov025_022001f4
    ldr r1, L_02201cf8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
L_02201cd8:
    mov r0, r4
    bl func_ov025_02200178
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02201ce8: .word gRuntimeContext
L_02201cec: .word data_ov025_02202e98
L_02201cf0: .word data_ov025_02202e48
L_02201cf4: .word 0x2d03
L_02201cf8: .word data_ov025_02202e20
.size func_ov025_02201abc, .-func_ov025_02201abc

