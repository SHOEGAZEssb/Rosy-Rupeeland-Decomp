    .text
/* Exact fallback; see src/overlays/ov021/overlay021_panel_runtime.c. */
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_021e9ac0
    .extern data_ov021_02202fa0
    .extern OverlaySlot_LoadOverlay
    .extern func_02064d90
    .extern func_ov000_021fbcc4
    .extern func_ov000_021fc59c
    .extern func_ov000_021fc5ec
    .extern func_ov000_021fcab4
    .extern func_ov000_021fcae8
    .extern func_ov000_021fcb64
    .extern func_ov021_021fea50
    .extern gHeapContext

.global func_ov021_021fe8e8
func_ov021_021fe8e8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r10, r0
    ldr r0, [r10, #0x354]
    cmp r0, #0x0
    bne L_021fea2c
    ldr r0, L_021fea3c
    ldr r1, [r10, #0x54]
    ldr r0, [r0, #0x0]
    bl func_02064d90
    add r0, r10, #0x1c
    ldr r1, L_021fea40
    add r0, r0, #0x400
    bl OverlaySlot_LoadOverlay
    ldr r1, L_021fea44
    ldr r3, L_021fea48
    mov r0, #0x2b0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe944
    ldr r1, L_021fea4c
    ldr r1, [r1, #0x0]
    bl func_ov000_021fbcc4
L_021fe944:
    mov r8, #0x1
    mov r9, #0x0
    str r0, [r10, #0x354]
    mov r6, r9
    mov r7, r8
    mov r4, r8
    mov r5, r9
    b L_021fe9bc
L_021fe964:
    mov r1, r9
    bl func_ov000_021fcab4
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    beq L_021fe9b8
    ldr r1, [r1, #0xc]
    cmp r1, #0x0
    movne r1, r7
    moveq r1, r6
    cmp r1, #0x0
    beq L_021fe9b0
    cmp r8, #0x0
    beq L_021fe9b8
    ldr r0, [r10, #0x354]
    mov r2, r9
    add r1, r10, #0x35c
    mov r8, r5
    bl func_ov000_021fcb64
    b L_021fe9b8
L_021fe9b0:
    mov r1, r4
    bl func_ov021_021fea50
L_021fe9b8:
    add r9, r9, #0x1
L_021fe9bc:
    ldr r0, [r10, #0x354]
    ldr r1, [r0, #0x254]
    cmp r9, r1
    blt L_021fe964
    ldr r1, [r10, #0x374]
    cmp r1, #0x0
    blt L_021fea0c
    bl func_ov000_021fcab4
    cmp r0, #0x0
    ldrne r0, [r0, #0xc]
    cmpne r0, #0x0
    beq L_021fea0c
    ldrh r0, [r0, #0x0]
    ldr r1, [r10, #0x378]
    cmp r1, r0
    bne L_021fea0c
    ldr r0, [r10, #0x354]
    ldr r2, [r10, #0x374]
    add r1, r10, #0x35c
    bl func_ov000_021fcb64
L_021fea0c:
    ldr r0, [r10, #0x354]
    add r1, r10, #0x35c
    mov r2, #0x0
    bl func_ov000_021fcae8
    ldr r0, [r10, #0x354]
    bl func_ov000_021fc59c
    ldr r0, [r10, #0x354]
    bl func_ov000_021fc5ec
L_021fea2c:
    mvn r0, #0x0
    str r0, [r10, #0x374]
    str r0, [r10, #0x378]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fea3c: .word data_021e9ac0
L_021fea40: .word 0x0
L_021fea44: .word data_ov021_02202fa0
L_021fea48: .word gHeapContext
L_021fea4c: .word data_020f4e14
    .size func_ov021_021fe8e8, . - func_ov021_021fe8e8

