.text

/* Exact fallback; see src/overlays/ov025/overlay025_intro_state.c. */
.extern data_ov025_02202e00
.extern data_ov025_02202e38
.extern data_ov025_02202e50
.extern data_ov025_022033b4
.extern DisplayBrightness_IsMainTransitionComplete
.extern func_02071eb8
.extern GraphicsSpriteGroup_Destroy
.extern func_0207f248
.extern func_0207f2e0
.extern func_020802f4
.extern func_02091b98
.extern func_02091c7c
.extern func_020922f0
.extern func_020927b8
.extern func_02095dd4
.extern func_ov025_021fd5dc
.extern func_ov025_021ff254
.extern func_ov025_02200178
.extern func_ov025_02200224
.extern func_ov025_022002b0
.extern func_ov025_02200398
.extern func_ov025_02200438
.extern func_ov025_02200468
.extern func_ov025_02200480
.extern func_ov025_02200824
.extern GameWork_Reset
.extern gHeapContext
.extern gRuntimeContext
.extern Heap_Alloc
.extern Heap_Free


    .global func_ov025_022009d8
func_ov025_022009d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b L_02200e2c
L_022009f0: ; jump table
    b L_02200a18 ; case 0
    b L_02200a40 ; case 1
    b L_02200aec ; case 2
    b L_02200b5c ; case 3
    b L_02200b94 ; case 4
    b L_02200c1c ; case 5
    b L_02200c80 ; case 6
    b L_02200d00 ; case 7
    b L_02200da4 ; case 8
    b L_02200e0c ; case 9
L_02200a18:
    bl GameWork_Reset
    ldr r0, L_02200e3c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_0207f2e0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02200a40:
    ldr r0, L_02200e3c
    ldr r0, [r0, #0x0]
    bl func_0207f248
    cmp r0, #0x0
    mvnne r1, #0x0
    cmpne r0, r1
    beq L_02200e2c
    ldr r7, L_02200e40
    ldr r5, L_02200e44
    mov r9, #0x0
    mov r8, #0x90
    mov r6, #0x4
L_02200a70:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200a94
    mov r1, r9
    bl func_ov025_021fd5dc
L_02200a94:
    add r1, r4, r9, lsl #0x2
    add r9, r9, #0x1
    str r0, [r1, #0xe4]
    cmp r9, #0x3
    blt L_02200a70
    ldr r1, [r4, #0x20]
    mov r0, r4
    bic r1, r1, #0x1
    orr r2, r1, #0x1
    mov r1, #0xe2
    str r2, [r4, #0x20]
    bl func_020922f0
    add r0, r4, #0x1fc
    add r0, r0, #0x400
    mov r1, #0x89
    bl func_02091b98
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200e2c
L_02200aec:
    add r0, r4, #0x1fc
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02200e2c
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200e2c
    ldr r0, [r4, #0xdc]
    mov r3, #0x0
    str r3, [r0, #0x90]
    add r0, r4, #0x1c4
    ldr r2, [r4, #0xe0]
    add r0, r0, #0x400
    mov r1, #0x12c
    str r3, [r2, #0x90]
    bl func_02091b98
    add r0, r4, #0x1fc
    add r0, r0, #0x400
    mov r1, #0x3c
    bl func_02091b98
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200e2c
L_02200b5c:
    mov r1, #0x4
    bl func_ov025_02200824
    add r0, r4, #0x1fc
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02200e2c
    mov r1, #0x0
    str r1, [r4, #0x638]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b L_02200e2c
L_02200b94:
    ldr r2, [r4, #0x638]
    add r1, r4, r2, lsl #0x2
    ldr r1, [r1, #0xe4]
    ldr r1, [r1, #0x8c]
    cmp r1, #0x0
    beq L_02200bfc
    cmp r2, #0x0
    bne L_02200bc4
    mov r1, #0x22
    mov r2, #0x0
    bl func_ov025_02200224
    b L_02200be4
L_02200bc4:
    cmp r2, #0x1
    mov r2, #0x0
    bne L_02200bdc
    mov r1, #0x23
    bl func_ov025_02200224
    b L_02200be4
L_02200bdc:
    mov r1, #0x24
    bl func_ov025_02200224
L_02200be4:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200e2c
L_02200bfc:
    add r1, r2, #0x1
    str r1, [r4, #0x638]
    cmp r1, #0x3
    blt L_02200e2c
    ldr r1, L_02200e48
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02200e2c
L_02200c1c:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x59c]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02200e2c
    mov r0, r4
    bl func_ov025_022002b0
    mov r0, r4
    mov r1, #0x5
    mov r2, #0x3
    bl func_ov025_02200398
    ldr r0, L_02200e3c
    ldr r1, [r4, #0x638]
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl func_020802f4
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200e2c
L_02200c80:
    ldr r0, L_02200e3c
    ldr r0, [r0, #0x0]
    bl func_0207f248
    cmp r0, #0x0
    beq L_02200e2c
    mvn r1, #0x0
    cmp r0, r1
    mov r0, r4
    bne L_02200ce4
    mov r1, #0x1
    bl func_ov025_02200438
    ldr r0, L_02200e3c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x10]
    cmp r0, #0x4
    bne L_02200e2c
    mov r0, r4
    mov r1, #0x1f
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02200e4c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02200e2c
L_02200ce4:
    bl func_ov025_02200468
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200e2c
L_02200d00:
    bl func_ov025_02200480
    cmp r0, #0x0
    beq L_02200e2c
    ldr r0, [r4, #0x638]
    add r0, r4, r0, lsl #0x2
    ldr r5, [r0, #0xe4]
    cmp r5, #0x0
    beq L_02200d40
    ldr r0, [r5, #0xc]
    bl GraphicsSpriteGroup_Destroy
    add r0, r5, #0x30
    bl func_020927b8
    mov r0, r5
    bl func_02071eb8
    mov r0, r5
    bl Heap_Free
L_02200d40:
    ldr r1, L_02200e40
    ldr r3, L_02200e44
    mov r0, #0x90
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200d64
    ldr r1, [r4, #0x638]
    bl func_ov025_021fd5dc
L_02200d64:
    ldr r2, [r4, #0x638]
    mov r1, #0x0
    add r2, r4, r2, lsl #0x2
    str r0, [r2, #0xe4]
    mov r0, r4
    bl func_ov025_02200438
    mov r0, r4
    mov r1, #0x16
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200e2c
L_02200da4:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x59c]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02200e2c
    mov r0, r4
    bl func_ov025_022002b0
    ldr r0, [r4, #0x638]
    add r0, r0, #0x1
    str r0, [r4, #0x638]
    cmp r0, #0x3
    blt L_02200df4
    ldr r1, L_02200e50
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02200e2c
L_02200df4:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200e2c
L_02200e0c:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0xa
    movgt r0, #0x4
    strgt r0, [r4, #0x4]
    movgt r0, #0x0
    strgt r0, [r4, #0x8]
L_02200e2c:
    mov r0, r4
    bl func_ov025_02200178
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_02200e3c: .word gRuntimeContext
L_02200e40: .word data_ov025_022033b4
L_02200e44: .word gHeapContext
L_02200e48: .word data_ov025_02202e38
L_02200e4c: .word data_ov025_02202e50
L_02200e50: .word data_ov025_02202e00
.size func_ov025_022009d8, .-func_ov025_022009d8

