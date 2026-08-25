    .text
    .extern GraphicsSpriteGroup_ReleaseIndexedEntries

/* Exact fallbacks for list callbacks and visibility helpers; see src/overlays/ov016/overlay016_list_helpers.c. */
    .global Overlay016_ListDescriptor_NoOp
    .global func_ov016_021fd0e0
    .global func_ov016_021fd188
    .global func_ov016_021fd1e0

Overlay016_ListDescriptor_NoOp:
    bx lr

    .global func_ov016_021fd0e0
func_ov016_021fd0e0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r6, [r0, #0x4c]
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r5, [r0, #0x54]
    ldr r4, [r0, #0x50]
    cmp r5, r4
    ldmgeia sp!, {r4, r5, r6, pc}
    mov lr, #0x14
    mul r4, r5, lr
    str r1, [r6, r4]
    ldr r6, [r0, #0x54]
    ldr r1, [r0, #0x4c]
    mov ip, #0x18
    mla r5, r6, lr, r1
    mov r1, #0x0
    mul r4, r6, ip
    strh r1, [r5, #0x8]
    strh r4, [r5, #0xa]
    ldr ip, [r0, #0x4c]
    ldr r4, [r0, #0x54]
    mov r3, r3, lsl #0x10
    mla ip, r4, lr, ip
    ldrh r4, [ip, #0xc]
    cmp r2, #0x0
    orr r3, r4, r3, lsr #0x10
    strh r3, [ip, #0xc]
    beq L_021fd178
    mov r3, lr
L_021fd154:
    ldr ip, [r0, #0x4c]
    ldr lr, [r0, #0x54]
    ldrb r4, [r2, r1]
    mla ip, lr, r3, ip
    add ip, r1, ip
    add r1, r1, #0x1
    strb r4, [ip, #0xe]
    cmp r1, #0x6
    blt L_021fd154
L_021fd178:
    ldr r1, [r0, #0x54]
    add r1, r1, #0x1
    str r1, [r0, #0x54]
    ldmia sp!, {r4, r5, r6, pc}

    .global func_ov016_021fd188
func_ov016_021fd188:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r3, #0x1
    str r3, [r4, #0x5c]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq L_021fd1bc
    ldr r2, [r4, #0x58]
    ldmib r2, {r0, r1}
    cmp r1, r0
    ldrlt r0, [r2, #0x50]
    strlt r3, [r0, #0x20]
    b L_021fd1c8
L_021fd1bc:
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
L_021fd1c8:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    str r1, [r0, #0x20]
    ldr r0, [r4, #0x8]
    str r1, [r0, #0x20]
    ldmia sp!, {r4, pc}

    .global func_ov016_021fd1e0
func_ov016_021fd1e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x5c]
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x8]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r4, pc}

    .size Overlay016_ListDescriptor_NoOp, func_ov016_021fd0e0 - Overlay016_ListDescriptor_NoOp
    .size func_ov016_021fd0e0, func_ov016_021fd188 - func_ov016_021fd0e0
    .size func_ov016_021fd188, func_ov016_021fd1e0 - func_ov016_021fd188
    .size func_ov016_021fd1e0, . - func_ov016_021fd1e0
