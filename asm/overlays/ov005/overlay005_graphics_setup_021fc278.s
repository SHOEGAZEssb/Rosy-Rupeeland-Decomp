    .text
    .extern func_020925dc
    .extern func_02092618
    .extern func_02092688
    .extern func_020afce8
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern func_020b44e8
    .extern GraphicsResourceSet_Apply
    .extern func_02070f34
    .extern func_020706c4
    .extern func_02070bc4
    .extern func_02070eac
    .extern func_02070874
    .extern func_0209285c
    .extern GraphicsResourceSet_Destroy
    .extern data_020f4e18

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_graphics_setup.c. */
    .global func_ov005_021fc278
func_ov005_021fc278: ; 0x021fc278
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r1, #0x19
    mov r0, #0x0
    str r1, [r4, #0x4c]
    bl func_020925dc
    ldr r1, L_021fc5a8
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x8
    orr r0, r0, #0xe000
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0x4
    orr r0, r0, #0x400
    strh r0, [r1, #0x6]
    bl func_02092618
    mov r0, #0x2
    mov r1, r0
    mov r2, r0
    mov r3, #0x3
    bl func_02092688
    ldr r3, L_021fc5ac
    mov r1, #0x19
    ldr r2, [r3, #0x0]
    add r0, r3, #0x50
    bic r2, r2, #0xe000
    orr r2, r2, #0x8000
    str r2, [r3, #0x0]
    mov r2, #0x0
    bl func_020afce8
    ldr r2, L_021fc5b0
    add r0, sp, #0x4
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3f00
    orr r1, r1, #0x3900
    strh r1, [r2, #0x0]
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3f
    orr r1, r1, #0x19
    strh r1, [r2, #0x0]
    bl GraphicsResourceSet_Init
    ldr r0, [r4, #0x68]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b L_021fc494
L_021fc338: ; jump table
    b L_021fc494 ; case 0
    b L_021fc360 ; case 1
    b L_021fc360 ; case 2
    b L_021fc360 ; case 3
    b L_021fc360 ; case 4
    b L_021fc410 ; case 5
    b L_021fc410 ; case 6
    b L_021fc410 ; case 7
    b L_021fc494 ; case 8
    b L_021fc494 ; case 9
L_021fc360:
    ldr r0, [r4, #0x6c]
    cmp r0, #0x1
    beq L_021fc380
    cmp r0, #0x2
    beq L_021fc3a4
    cmp r0, #0x3
    beq L_021fc3c8
    b L_021fc3ec
L_021fc380:
    ldr r3, L_021fc5b4
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fc514
L_021fc3a4:
    ldr r3, L_021fc5bc
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    b L_021fc514
L_021fc3c8:
    ldr r3, L_021fc5c0
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x5
    bl GraphicsResourceSet_Load
    b L_021fc514
L_021fc3ec:
    ldr r3, L_021fc5c4
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x7
    bl GraphicsResourceSet_Load
    b L_021fc514
L_021fc410:
    ldr r0, [r4, #0x6c]
    cmp r0, #0x5
    beq L_021fc428
    cmp r0, #0x6
    beq L_021fc44c
    b L_021fc470
L_021fc428:
    ldr r3, L_021fc5c8
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0xb
    bl GraphicsResourceSet_Load
    b L_021fc514
L_021fc44c:
    ldr r3, L_021fc5cc
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0xd
    bl GraphicsResourceSet_Load
    b L_021fc514
L_021fc470:
    ldr r3, L_021fc5d0
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0xf
    bl GraphicsResourceSet_Load
    b L_021fc514
L_021fc494:
    ldr r0, [r4, #0x6c]
    cmp r0, #0x8
    beq L_021fc4ac
    cmp r0, #0x9
    beq L_021fc4d0
    b L_021fc4f4
L_021fc4ac:
    ldr r3, L_021fc5d4
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x13
    bl GraphicsResourceSet_Load
    b L_021fc514
L_021fc4d0:
    ldr r3, L_021fc5d8
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x15
    bl GraphicsResourceSet_Load
    b L_021fc514
L_021fc4f4:
    ldr r3, L_021fc5dc
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x17
    bl GraphicsResourceSet_Load
L_021fc514:
    bl func_020b44e8
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    bl GraphicsResourceSet_Apply
    ldr r3, L_021fc5e0
    ldr r0, L_021fc5b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0xf
    bl func_02070f34
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x8]
    mov r1, #0x1e0
    bl func_02070bc4
    ldr r0, [sp, #0xc]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02070eac
    ldr r0, [sp, #0x8]
    bl func_02070874
    ldrh r0, [r0, #0x0]
    strh r0, [r4, #0x84]
    bl func_0209285c
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fc5a8: .word 0x4001008
L_021fc5ac: .word 0x4001000
L_021fc5b0: .word 0x400104a
L_021fc5b4: .word 0xb088
L_021fc5b8: .word data_020f4e18
L_021fc5bc: .word 0xb08a
L_021fc5c0: .word 0xb08c
L_021fc5c4: .word 0xb08e
L_021fc5c8: .word 0xb092
L_021fc5cc: .word 0xb094
L_021fc5d0: .word 0xb096
L_021fc5d4: .word 0xb09a
L_021fc5d8: .word 0xb09c
L_021fc5dc: .word 0xb09e
L_021fc5e0: .word 0xc00e

    .size func_ov005_021fc278, .-func_ov005_021fc278
