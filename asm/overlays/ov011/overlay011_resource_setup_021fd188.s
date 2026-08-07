    .text
    .extern GraphicsResourceSet_Load
    .extern func_020b44e8
    .extern func_ov011_021fd374
    .extern func_0207043c
    .extern func_020706c4
    .extern func_02070bc4
    .extern func_02002700
    .extern func_020b1bfc
    .extern GraphicsResourceSet_Apply
    .extern func_02070874
    .extern func_ov011_021fd3a8
    .extern data_020f4e18
    .extern data_ov011_021fe618
    .extern gHeapContext

    ; Exact matching fallback; see the documented portable reconstruction in
    ; src/overlays/ov011/overlay011_resource_setup.c.
    .global func_ov011_021fd188
func_ov011_021fd188: ; 0x021fd188
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0xd0]
    ldr r1, L_021fd364
    add r0, r4, r0, lsl #0x2
    ldr lr, [r0, #0xe8]
    ldr ip, [r0, #0x84]
    add r0, r4, #0x78
    add r3, ip, lr, lsl #0x5
    ldr r2, [r3, #0x8]
    str r2, [sp, #0x0]
    ldr r1, [r1, #0x0]
    ldmia r3, {r2, r3}
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0xcc]
    cmp r0, #0x0
    beq L_021fd2bc
    ldr r0, [r4, #0x7c]
    mov r2, #0x12
    ldr r0, [r0, #0x20]
    mov r3, #0x4
    ldrh r0, [r0, #0x4]
    cmp r0, #0x10
    moveq r1, #0x0
    mov r0, #0x0
    movne r1, #0x1
    str r0, [sp, #0x0]
    bl func_ov011_021fd374
    ldr r0, [r4, #0x78]
    mov r5, #0x0
    bl func_0207043c
    ldr r1, [r4, #0x7c]
    mov r2, #0x0
    ldr r1, [r1, #0x20]
    ldrh r1, [r1, #0x4]
    cmp r1, #0x100
    moveq r1, r0, asr #0x5
    addeq r0, r0, r1, lsr #0x1a
    movne r1, r0, asr #0x4
    moveq r6, r0, asr #0x6
    addne r0, r0, r1, lsr #0x1b
    movne r6, r0, asr #0x5
    ldr r0, [r4, #0x78]
    mov r1, #0x1
    moveq r5, #0x2000
    bl func_020706c4
    ldr r0, [r4, #0x7c]
    mov r1, r5
    bl func_02070bc4
    ldr r1, L_021fd368
    ldr r3, L_021fd36c
    mov r0, #0x800
    mov r2, #0x4
    bl func_02002700
    mov r5, r0
    mov r2, #0x0
    b L_021fd280
L_021fd274:
    mov r0, r2, lsl #0x1
    strh r2, [r5, r0]
    add r2, r2, #0x1
L_021fd280:
    cmp r2, r6
    blt L_021fd274
    mov r1, #0x0
    b L_021fd29c
L_021fd290:
    mov r0, r2, lsl #0x1
    strh r1, [r5, r0]
    add r2, r2, #0x1
L_021fd29c:
    cmp r2, #0x400
    blt L_021fd290
    bl func_020b44e8
    mov r0, r5
    mov r1, #0x0
    mov r2, #0x800
    bl func_020b1bfc
    b L_021fd354
L_021fd2bc:
    ldr r0, [r4, #0x80]
    ldr r1, [r0, #0x20]
    ldr r0, [r1, #0xc]
    cmp r0, #0x20
    ldr r0, [r1, #0x10]
    ble L_021fd2e4
    cmp r0, #0x20
    movgt r0, #0x3
    movle r0, #0x1
    b L_021fd2f0
L_021fd2e4:
    cmp r0, #0x20
    movgt r0, #0x2
    movle r0, #0x0
L_021fd2f0:
    ldr r1, [r4, #0x7c]
    mov r2, #0x0
    ldr r1, [r1, #0x20]
    mov r3, #0x4
    ldrh r1, [r1, #0x4]
    cmp r1, #0x10
    moveq r1, #0x0
    str r2, [sp, #0x0]
    movne r1, #0x1
    mov r2, #0x12
    bl func_ov011_021fd374
    ldr r0, [r4, #0x7c]
    mov r2, #0x0
    ldr r0, [r0, #0x20]
    mov r1, #0x1
    ldrh r0, [r0, #0x4]
    cmp r0, #0x100
    moveq r2, #0x2000
    add r0, r4, #0x78
    bl GraphicsResourceSet_Apply
    ldr r0, [r4, #0x7c]
    bl func_02070874
    ldrh r1, [r0, #0x0]
    ldr r0, L_021fd370
    strh r1, [r0, #0x0]
L_021fd354:
    mov r0, r4
    bl func_ov011_021fd3a8
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fd364: .word data_020f4e18
L_021fd368: .word data_ov011_021fe618
L_021fd36c: .word gHeapContext
L_021fd370: .word 0x5000400

    .size func_ov011_021fd188, . - func_ov011_021fd188
