    .text
/* Exact fallback; see src/overlays/ov019/overlay019_selection_runtime.c. */
    .extern GameWork_SetFlag
    .extern data_ov019_021fd600
    .extern data_ov019_021fd608
    .extern func_02010b64
    .extern func_02092260
    .extern func_ov002_021fbb68
    .extern func_ov002_021fbc54
    .extern func_ov002_021fbd64
    .extern func_ov002_021fbd98
    .extern func_ov002_021fbdb0
    .extern func_ov019_021fce00
    .extern func_ov019_021fd170
    .extern gGameWork
    .extern gLupyContext
    .extern genrand_int32

.global func_ov019_021fd278
func_ov019_021fd278:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fd4a0
L_021fd290: ; jump table
    b L_021fd2bc ; case 0
    b L_021fd2cc ; case 1
    b L_021fd330 ; case 2
    b L_021fd358 ; case 3
    b L_021fd45c ; case 4
    b L_021fd4a0 ; case 5
    b L_021fd4a0 ; case 6
    b L_021fd4a0 ; case 7
    b L_021fd4a0 ; case 8
    b L_021fd4a0 ; case 9
    b L_021fd484 ; case 10
L_021fd2bc:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_021fd2cc:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fd4a0
    ldr r0, [r4, #0x5c]
    add r1, r4, #0x30
    bl func_ov002_021fbb68
    cmp r0, #0x0
    blt L_021fd4a0
    bl genrand_int32
    tst r0, #0x1
    beq L_021fd30c
    mov r0, r4
    mov r1, #0x3c80
    bl func_02092260
    b L_021fd318
L_021fd30c:
    ldr r1, L_021fd4b0
    mov r0, r4
    bl func_02092260
L_021fd318:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd4a0
L_021fd330:
    ldr r0, [r4, #0x5c]
    bl func_ov002_021fbd98
    cmp r0, #0x0
    bne L_021fd4a0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd4a0
L_021fd358:
    ldr r0, [r4, #0x5c]
    bl func_ov002_021fbc54
    cmp r0, #0x0
    beq L_021fd380
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd4a0
L_021fd380:
    ldr r0, [r4, #0x5c]
    bl func_ov002_021fbd64 ; func_ov005_021fbd64
    ldr r1, [r4, #0x5c]
    ldr r0, [r1, #0x8c]
    cmp r0, #0xc
    beq L_021fd448
    cmp r0, #0xd
    bne L_021fd4a0
    ldr r0, [r1, #0x90]
    cmp r0, #0x0
    beq L_021fd42c
    ldr r0, [r4, #0x54]
    cmp r0, #0x1
    bne L_021fd3ec
    ldr r0, L_021fd4b4
    ldr r5, [r1, #0x88]
    ldr r0, [r0, #0x0]
    bl func_02010b64
    cmp r5, r0
    blt L_021fd3ec
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd4a0
L_021fd3ec:
    ldr r1, L_021fd4b8
    mov r0, r4
    bl func_02092260
    ldr r1, [r4, #0x5c]
    ldr r0, L_021fd4bc
    ldr r3, [r1, #0x88]
    ldr r2, [r0, #0x0]
    mov r1, #0x390
    str r3, [r2, #0x7cc]
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r1, L_021fd4c0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov019_021fce00
    b L_021fd4a0
L_021fd42c:
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd4a0
L_021fd448:
    ldr r1, L_021fd4c4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov019_021fce00
    b L_021fd4a0
L_021fd45c:
    ldr r0, [r4, #0x5c]
    bl func_ov002_021fbdb0
    cmp r0, #0x0
    beq L_021fd4a0
    ldr r0, [r4, #0x5c]
    bl func_ov002_021fbd64 ; func_ov005_021fbd64
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd4a0
L_021fd484:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x14
    movgt r0, #0x0
    strgt r0, [r4, #0x4]
    strgt r0, [r4, #0x8]
L_021fd4a0:
    mov r0, r4
    bl func_ov019_021fd170
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fd4b0: .word 0x3c81
L_021fd4b4: .word gLupyContext
L_021fd4b8: .word 0x3c82
L_021fd4bc: .word gGameWork
L_021fd4c0: .word data_ov019_021fd608
L_021fd4c4: .word data_ov019_021fd600
    .size func_ov019_021fd278, . - func_ov019_021fd278
