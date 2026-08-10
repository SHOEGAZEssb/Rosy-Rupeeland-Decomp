.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_widget.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov025_02202de8
.extern data_ov025_02202f28
.extern func_02071ea4
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_02073e48
.extern func_02073ffc
.extern func_02074110
.extern func_020742cc
.extern func_02092798
.extern func_02092814
.extern func_020befec
.extern gRuntimeContext


    .global func_ov025_021fd5dc
func_ov025_021fd5dc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    mov r9, r1
    bl func_02071ea4
    add r0, r10, #0x30
    bl func_02092798
    ldr r1, L_021fd9c0
    mov r0, #0x34
    ldr r1, [r1, #0x0]
    mov r2, #0x0
    add r1, r1, #0x38
    mla r4, r9, r0, r1
    str r9, [r10, #0x78]
    mov r3, r2
L_021fd618:
    add r0, r10, r2, lsl #0x1
    add r2, r2, #0x1
    strh r3, [r0, #0x54]
    cmp r2, #0x10
    blt L_021fd618
    mov r1, #0x0
L_021fd630:
    add r0, r10, r3, lsl #0x2
    add r3, r3, #0x1
    str r1, [r0, #0x14]
    cmp r3, #0x6
    blt L_021fd630
    str r1, [r10, #0x2c]
    str r1, [r10, #0x8c]
    mov r1, #0x51
    ldr r0, L_021fd9c4
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    mov r0, r10
    mov r2, #0x4f
    mov r3, #0x50
    bl func_02071ee0
    ldr r0, L_021fd9c8
    ldr r0, [r0, #0x0]
    bl func_020742cc
    mov r1, #0x3c
    mul r1, r9, r1
    str r0, [r10, #0xc]
    mov r2, #0x58
    str r2, [r0, #0x18]
    add r1, r1, #0x28
    str r1, [r0, #0x1c]
    ldr r0, [r10, #0xc]
    mov r1, r10
    mov r2, #0x1
    bl func_02073ffc
    str r0, [r10, #0x10]
    ldrh r0, [r4, #0x0]
    cmp r0, #0x1
    bne L_021fd960
    mov r2, #0x0
L_021fd6b8:
    add r0, r4, r2, lsl #0x1
    ldrh r1, [r0, #0x14]
    add r0, r10, r2, lsl #0x1
    add r2, r2, #0x1
    strh r1, [r0, #0x54]
    cmp r2, #0x8
    blt L_021fd6b8
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    str r0, [r10, #0x7c]
    ldr r1, [r4, #0x10]
    mov r0, #0x1
    str r1, [r10, #0x84]
    str r0, [r10, #0x74]
    str r0, [r10, #0x88]
    str r0, [sp, #0x0]
    mov r0, #0x10
    stmib sp, {r0, r2}
    ldr r0, [r10, #0x10]
    mov r3, r2
    mov r1, #0x2
    bl func_02073e48
    ldrb r0, [r4, #0x3]
    str r0, [r10, #0x80]
    cmp r0, #0x0
    beq L_021fd914
    ldr r8, [r10, #0x7c]
    cmp r8, #0xa
    bge L_021fd800
    ldr r0, [r10, #0xc]
    mov r1, r10
    mov r2, #0x1
    bl func_02073ffc
    str r0, [r10, #0x14]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0xf
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r1, L_021fd9cc
    ldr r3, [r10, #0x7c]
    ldr r0, [r10, #0x14]
    ldr r2, [r1, #0xf8]
    add r1, r3, #0xa
    mov r3, #0xc
    bl func_02073e48
    ldr r0, [r10, #0xc]
    mov r1, r10
    mov r2, #0x1
    bl func_02073ffc
    str r0, [r10, #0x18]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0xf
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x18]
    mov r1, #0x30
    ldr r2, L_021fd9cc
    mov r3, #0xc
    ldr r2, [r2, #0xfc]
    bl func_02073e48
    ldr r0, [r10, #0xc]
    mov r1, r10
    mov r2, #0x1
    bl func_02073ffc
    str r0, [r10, #0x1c]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0xf
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x1c]
    mov r1, #0xa
    ldr r2, L_021fd9cc
    mov r3, #0xc
    ldr r2, [r2, #0x100]
    bl func_02073e48
    b L_021fd920
L_021fd800:
    mov r4, #0x0
    cmp r8, #0x0
    ldr r0, L_021fd9d0
    movlt r8, r4
    cmp r8, r0
    ldr r5, L_021fd9d4
    ldr r11, L_021fd9d8
    movgt r8, r0
    mov r7, #0x0
L_021fd824:
    cmp r7, #0x2
    bne L_021fd87c
    cmp r4, #0x0
    beq L_021fd904
    ldr r0, [r10, #0xc]
    mov r1, r10
    mov r2, #0x1
    bl func_02073ffc
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x14]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0xf
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x14]
    ldr r2, [r11, r7, lsl #0x2]
    mov r1, #0x1e
    mov r3, #0xc
    bl func_02073e48
    b L_021fd904
L_021fd87c:
    mov r0, r8
    mov r1, r5
    bl func_020befec
    movs r6, r0
    cmpeq r4, #0x0
    bne L_021fd89c
    cmp r5, #0x1
    bne L_021fd8f4
L_021fd89c:
    mov r4, #0x1
    ldr r0, [r10, #0xc]
    mov r1, r10
    mov r2, r4
    bl func_02073ffc
    add r2, r10, r7, lsl #0x2
    str r0, [r2, #0x14]
    mov r0, r4
    str r0, [sp, #0x0]
    mov r0, #0xf
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r2, #0x14]
    ldr r2, [r11, r7, lsl #0x2]
    add r1, r6, #0xa
    mov r3, #0xc
    bl func_02073e48
    mov r0, r8
    mov r1, r5
    bl func_020befec
    mov r8, r1
L_021fd8f4:
    mov r0, r5
    mov r1, #0xa
    bl func_020befec
    mov r5, r0
L_021fd904:
    add r7, r7, #0x1
    cmp r7, #0x6
    blt L_021fd824
    b L_021fd920
L_021fd914:
    ldr r0, [r10, #0x10]
    mov r1, #0x2e
    bl GraphicsSpriteState_SetAnimationIndex
L_021fd920:
    ldr r0, [r10, #0xc]
    mov r1, r10
    mov r2, #0x1
    bl func_02073ffc
    str r0, [r10, #0x2c]
    mov r0, #0x1
    mov r2, #0x0
    str r0, [sp, #0x0]
    mov r0, #0xf
    mov r1, r9, lsl #0x1
    stmib sp, {r0, r2}
    ldr r0, [r10, #0x2c]
    mov r3, r2
    add r1, r1, #0x4
    bl func_02073e48
    b L_021fd994
L_021fd960:
    cmp r0, #0x2
    mov r1, #0x0
    moveq r0, #0x1
    streq r0, [r10, #0x8c]
    str r1, [r10, #0x74]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x10
    stmib sp, {r0, r1}
    ldr r0, [r10, #0x10]
    mov r2, r1
    mov r3, r1
    bl func_02073e48
L_021fd994:
    ldr r1, L_021fd9dc
    add r0, r10, #0x30
    bl func_02092814
    ldr r1, L_021fd9e0
    add r0, r10, #0x30
    bl func_02092814
    ldr r0, [r10, #0xc]
    bl func_02074110
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd9c0: .word gRuntimeContext
L_021fd9c4: .word data_020f4e18
L_021fd9c8: .word data_020f4e14
L_021fd9cc: .word data_ov025_02202de8
L_021fd9d0: .word 0x1869f
L_021fd9d4: .word 0x2710
L_021fd9d8: .word data_ov025_02202f28
L_021fd9dc: .word 0x7001
L_021fd9e0: .word 0x7005
.size func_ov025_021fd5dc, .-func_ov025_021fd5dc

