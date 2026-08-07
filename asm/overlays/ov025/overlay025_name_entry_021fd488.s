.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */
.extern gSystemState


    .global func_ov025_021fd488
func_ov025_021fd488:
    stmdb sp!, {r3, lr}
    mov ip, #0x0
    mov lr, ip
    b L_021fd4b8
L_021fd498:
    add r2, r0, lr, lsl #0x1
    add r2, r2, #0x100
    ldrh r3, [r2, #0x80]
    add lr, lr, #0x1
    cmp r3, #0x20
    movne r2, ip, lsl #0x1
    strneh r3, [r1, r2]
    addne ip, ip, #0x1
L_021fd4b8:
    ldr r2, [r0, #0x17c]
    cmp lr, r2
    blt L_021fd498
    ldr r0, L_021fd5c8
    ldrb r0, [r0, #0x5f]
    cmp r0, #0x0
    beq L_021fd54c
    cmp ip, #0x6
    bne L_021fd5c0
    ldrh r0, [r1, #0x0]
    cmp r0, #0x54
    cmpne r0, #0x74
    bne L_021fd5c0
    ldrh r0, [r1, #0x2]
    cmp r0, #0x49
    cmpne r0, #0x69
    bne L_021fd5c0
    ldrh r0, [r1, #0x4]
    cmp r0, #0x4e
    cmpne r0, #0x6e
    bne L_021fd5c0
    ldrh r0, [r1, #0x6]
    cmp r0, #0x47
    cmpne r0, #0x67
    bne L_021fd5c0
    ldrh r0, [r1, #0x8]
    cmp r0, #0x4c
    cmpne r0, #0x6c
    bne L_021fd5c0
    ldrh r0, [r1, #0xa]
    cmp r0, #0x45
    cmpne r0, #0x65
    bne L_021fd5c0
    mov r0, #0x0
    strh r0, [r1, #0xc]
    mov r0, #0x1
    ldmia sp!, {r3, pc}
L_021fd54c:
    cmp ip, #0x4
    bne L_021fd5c0
    ldrh r2, [r1, #0x0]
    ldr r0, L_021fd5cc
    cmp r2, r0
    addne r0, r0, #0x60
    cmpne r2, r0
    bne L_021fd5c0
    ldrh r2, [r1, #0x2]
    ldr r0, L_021fd5d0
    cmp r2, r0
    addne r0, r0, #0x60
    cmpne r2, r0
    bne L_021fd5c0
    ldrh r2, [r1, #0x4]
    ldr r0, L_021fd5d4
    cmp r2, r0
    addne r0, r0, #0x60
    cmpne r2, r0
    bne L_021fd5c0
    ldrh r2, [r1, #0x6]
    ldr r0, L_021fd5d8
    cmp r2, r0
    addne r0, r0, #0x60
    cmpne r2, r0
    moveq r0, #0x0
    streqh r0, [r1, #0x8]
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
L_021fd5c0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_021fd5c8: .word gSystemState
L_021fd5cc: .word 0x3061
L_021fd5d0: .word 0x3093
L_021fd5d4: .word 0x304f
L_021fd5d8: .word 0x308b
.size func_ov025_021fd488, .-func_ov025_021fd488

