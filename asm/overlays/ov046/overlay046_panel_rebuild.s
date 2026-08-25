.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_graphics_recovery.c.
.extern GraphicsResourceSet_Apply
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov046_0220cd14
.extern data_ov046_0220cdf0
.extern GraphicsResourceSet_ApplyToMainBg
.extern func_020b44e8
.extern func_ov046_0220bc80

.global func_ov046_0220bd14
func_ov046_0220bd14:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    ldr r1, [r5, #0x10c]
    ldr r0, [r5, #0x110]
    mov r4, #0x0
    ldr r2, .L_0220bfe8
    mov r8, r4
    sub ip, r1, #0x80
    sub lr, r0, #0x60
    add r6, r1, #0x80
    add r7, r0, #0x60
    add r11, sp, #0x10
    mvn r9, #0x0
.L_0220bd4c:
    mov r0, #0x28
    mla r3, r8, r0, r2
    ldr r10, [r3, #0x18]
    ldr r0, [r3, #0x20]
    add r1, r10, #0x40
    add r0, r10, r0
    sub r0, r0, #0x40
    cmp ip, r0
    ldr r0, [r3, #0x1c]
    ldr r3, [r3, #0x24]
    add r10, r0, #0x30
    add r0, r0, r3
    sub r0, r0, #0x30
    cmple lr, r0
    bgt .L_0220bd94
    cmp r6, r1
    cmpge r7, r10
    bge .L_0220bdc4
.L_0220bd94:
    ldr r0, [r5, #0xc8]
    cmp r0, r8
    streq r9, [r5, #0xc8]
    beq .L_0220bdcc
    ldr r0, [r5, #0xcc]
    cmp r0, r8
    streq r9, [r5, #0xcc]
    beq .L_0220bdcc
    ldr r0, [r5, #0xd0]
    cmp r0, r8
    streq r9, [r5, #0xd0]
    b .L_0220bdcc
.L_0220bdc4:
    str r8, [r11, r4, lsl #0x2]
    add r4, r4, #0x1
.L_0220bdcc:
    add r8, r8, #0x1
    cmp r8, #0x7
    blt .L_0220bd4c
    mov r6, #0x0
    b .L_0220bf70
.L_0220bde0:
    add r0, sp, #0x10
    ldr r1, [r5, #0xc8]
    ldr r3, [r0, r6, lsl #0x2]
    cmp r1, r3
    ldrne r0, [r5, #0xcc]
    cmpne r0, r3
    ldrne r0, [r5, #0xd0]
    cmpne r0, r3
    bne .L_0220be14
    cmp r1, r3
    ldrne r0, [r5, #0xcc]
    cmpne r0, r3
    b .L_0220bf6c
.L_0220be14:
    mov r7, #0x0
    b .L_0220bf64
.L_0220be1c:
    add r2, r5, r7, lsl #0x2
    ldr r0, [r2, #0xc8]
    cmp r0, #0x0
    bge .L_0220bf60
    ldr r1, .L_0220bfe8
    mov r0, #0x28
    mla r9, r3, r0, r1
    str r3, [r2, #0xc8]
    ldr r1, [r9, #0x4]
    sub r0, r0, #0x29
    cmp r1, r0
    ldr r0, [r9, #0x0]
    add r0, r5, r0, lsl #0x2
    bne .L_0220be68
    ldr r0, [r0, #0xe0]
    cmp r0, #0x0
    addne r8, r9, #0x8
    addeq r8, r9, #0xc
    b .L_0220be98
.L_0220be68:
    ldr r0, [r0, #0xe0]
    cmp r0, #0x0
    add r0, r5, r1, lsl #0x2
    ldr r0, [r0, #0xe0]
    beq .L_0220be8c
    cmp r0, #0x0
    addne r8, r9, #0x8
    addeq r8, r9, #0xc
    b .L_0220be98
.L_0220be8c:
    cmp r0, #0x0
    addne r8, r9, #0x14
    addeq r8, r9, #0x10
.L_0220be98:
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldrh r2, [r8, #0x2]
    ldr r1, .L_0220bfec
    ldr r3, .L_0220bff0
    str r2, [sp, #0x0]
    ldrh r2, [r8, #0x0]
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    bl GraphicsResourceSet_Load
    ldr r3, [r9, #0x0]
    add r0, r5, r3, lsl #0x2
    ldr r0, [r0, #0xe0]
    cmp r0, #0x1
    bne .L_0220beec
    ldr r1, .L_0220bff4
    mov r0, #0x14
    mla r2, r3, r0, r1
    ldr r1, [sp, #0xc]
    mov r0, r5
    bl func_ov046_0220bc80
.L_0220beec:
    ldr r3, [r9, #0x4]
    mvn r0, #0x0
    cmp r3, r0
    beq .L_0220bf24
    add r0, r5, r3, lsl #0x2
    ldr r0, [r0, #0xe0]
    cmp r0, #0x1
    bne .L_0220bf24
    ldr r1, .L_0220bff4
    mov r0, #0x14
    mla r2, r3, r0, r1
    ldr r1, [sp, #0xc]
    mov r0, r5
    bl func_ov046_0220bc80
.L_0220bf24:
    bl func_020b44e8
    ldr r0, .L_0220bff8
    ldr r1, [r5, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    cmp r1, r0
    add r0, sp, #0x4
    mov r1, r7
    bne .L_0220bf50
    bl GraphicsResourceSet_ApplyToMainBg
    b .L_0220bf54
.L_0220bf50:
    bl GraphicsResourceSet_Apply
.L_0220bf54:
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    b .L_0220bf6c
.L_0220bf60:
    add r7, r7, #0x1
.L_0220bf64:
    cmp r7, #0x3
    blt .L_0220be1c
.L_0220bf6c:
    add r6, r6, #0x1
.L_0220bf70:
    cmp r6, r4
    blt .L_0220bde0
    mov r0, #0x18
    str r0, [r5, #0xc0]
    mov r1, #0x0
.L_0220bf84:
    add r0, r5, r1, lsl #0x2
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    blt .L_0220bfd4
    cmp r1, #0x0
    beq .L_0220bfb8
    cmp r1, #0x1
    beq .L_0220bfc8
    cmp r1, #0x2
    ldreq r0, [r5, #0xc0]
    orreq r0, r0, #0x4
    streq r0, [r5, #0xc0]
    b .L_0220bfd4
.L_0220bfb8:
    ldr r0, [r5, #0xc0]
    orr r0, r0, #0x1
    str r0, [r5, #0xc0]
    b .L_0220bfd4
.L_0220bfc8:
    ldr r0, [r5, #0xc0]
    orr r0, r0, #0x2
    str r0, [r5, #0xc0]
.L_0220bfd4:
    add r1, r1, #0x1
    cmp r1, #0x3
    blt .L_0220bf84
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220bfe8: .word data_ov046_0220cdf0
.L_0220bfec: .word data_020f4e18
.L_0220bff0: .word 0xb10e
.L_0220bff4: .word data_ov046_0220cd14
.L_0220bff8: .word data_020f4e14
.size func_ov046_0220bd14, . - func_ov046_0220bd14
