    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_construct.c. */
    .extern GameWork_TestFlag
    .extern Heap_Alloc
    .extern data_020ea650
    .extern data_020ea9b0
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_ov020_021fe460
    .extern data_ov020_021fe504
    .extern data_ov020_021fe530
    .extern data_ov020_021fe538
    .extern func_02071ea4
    .extern func_02071ee0
    .extern func_02073e48
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern func_02091e28
    .extern func_02092798
    .extern func_020957bc
    .extern func_020957f0
    .extern func_02095820
    .extern func_ov020_021fce18
    .extern func_ov020_021fd038
    .extern func_ov020_021fd0a0
    .extern func_ov020_021fd320
    .extern func_ov020_021fd81c
    .extern func_ov020_021fdca4
    .extern func_ov020_021fdd88
    .extern gDebugFont
    .extern gGameWork
    .extern gHeapContext

.global func_ov020_021fd844
func_ov020_021fd844:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_02091e28
    ldr r1, L_021fdb5c
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl func_02071ea4
    add r0, r4, #0x60
    bl func_02071ea4
    add r0, r4, #0x70
    bl func_020957bc
    add r0, r4, #0x1b8
    bl func_02092798
    mov r0, #0x0
    str r0, [r4, #0x1e4]
    mov r0, #0x39
    str r0, [sp, #0x0]
    ldr r1, L_021fdb60
    add r0, r4, #0x60
    ldr r1, [r1, #0x0]
    mov r2, #0x38
    mov r3, #0x1
    bl func_02071ee0
    mov r0, #0x20
    str r0, [sp, #0x0]
    ldr r1, L_021fdb60
    add r0, r4, #0x54
    ldr r1, [r1, #0x0]
    mov r2, #0x1f
    mov r3, #0x1
    bl func_02071ee0
    ldr r0, L_021fdb64
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    add r1, r4, #0x60
    mov r2, #0x2
    str r0, [r4, #0x6c]
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0x70
    mov r2, #0x6
    mov r3, #0x1
    bl func_020957f0
    add r0, r4, #0x70
    mov r1, #0xe8
    mov r2, #0xaa
    bl func_02095820
    ldr r0, [r4, #0x6c]
    add r1, r4, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x11c]
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x11c]
    mov r2, #0x84
    mov r3, #0x1e
    bl func_02073e48
    mov r5, #0x0
    str r5, [r4, #0x120]
L_021fd950:
    ldr r1, L_021fdb68
    mov r0, #0x68
    mla r6, r5, r0, r1
    ldr r1, [r6, #0x60]
    cmp r1, #0x0
    beq L_021fda04
    ldr r0, L_021fdb6c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fda04
    ldrsh r1, [r6, #0x0]
    ldr r0, L_021fdb70
    cmp r1, r0
    bne L_021fd9ec
    ldr r8, [r4, #0x120]
    mov r7, #0x0
    ldr r2, L_021fdb68
    mov r0, #0x68
    b L_021fd9c0
L_021fd9a0:
    add r3, r4, r7, lsl #0x2
    ldr r1, [r3, #0x124]
    mul r6, r1, r0
    ldrsh r1, [r2, r6]
    cmp r1, #0x4d
    streq r5, [r3, #0x124]
    beq L_021fd9c8
    add r7, r7, #0x1
L_021fd9c0:
    cmp r7, r8
    blt L_021fd9a0
L_021fd9c8:
    ldr r0, [r4, #0x120]
    cmp r7, r0
    bne L_021fda04
    add r0, r4, r0, lsl #0x2
    str r5, [r0, #0x124]
    ldr r0, [r4, #0x120]
    add r0, r0, #0x1
    str r0, [r4, #0x120]
    b L_021fda04
L_021fd9ec:
    ldr r0, [r4, #0x120]
    add r0, r4, r0, lsl #0x2
    str r5, [r0, #0x124]
    ldr r0, [r4, #0x120]
    add r0, r0, #0x1
    str r0, [r4, #0x120]
L_021fda04:
    add r5, r5, #0x1
    cmp r5, #0x24
    blt L_021fd950
    mov r7, #0x18
    mov r6, #0x0
    ldr r0, L_021fdb74
    mov r8, r7
    b L_021fda6c
L_021fda24:
    add ip, r6, #0x1
    add r2, r4, r6, lsl #0x2
    b L_021fda5c
L_021fda30:
    add r5, r4, ip, lsl #0x2
    ldr r3, [r5, #0x124]
    ldr r1, [r2, #0x124]
    mla r9, r3, r8, r0
    mla lr, r1, r7, r0
    ldrsb lr, [lr, #0x8]
    ldrsb r9, [r9, #0x8]
    add ip, ip, #0x1
    cmp lr, r9
    strgt r3, [r2, #0x124]
    strgt r1, [r5, #0x124]
L_021fda5c:
    ldr r1, [r4, #0x120]
    cmp ip, r1
    blt L_021fda30
    add r6, r6, #0x1
L_021fda6c:
    ldr r1, [r4, #0x120]
    cmp r6, r1
    blt L_021fda24
    ldr r1, L_021fdb78
    ldr r3, L_021fdb7c
    mov r0, #0x4c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdaa4
    ldr r1, L_021fdb64
    ldr r2, [r4, #0x120]
    ldr r1, [r1, #0x0]
    bl func_ov020_021fce18
L_021fdaa4:
    mov r7, #0x0
    mov r8, #0x18
    str r0, [r4, #0x1dc]
    ldr r6, L_021fdb74
    mov r5, r7
    mov r9, r8
    b L_021fdae4
L_021fdac0:
    add r0, r4, r7, lsl #0x2
    ldr r2, [r0, #0x124]
    ldr r0, [r4, #0x1dc]
    mla r1, r2, r8, r6
    bl func_ov020_021fd038
    mul r1, r7, r9
    strh r5, [r0, #0x8]
    strh r1, [r0, #0xa]
    add r7, r7, #0x1
L_021fdae4:
    ldr r0, [r4, #0x120]
    cmp r7, r0
    blt L_021fdac0
    ldr r0, [r4, #0x1dc]
    bl func_ov020_021fd0a0
    ldr r1, L_021fdb80
    ldr r3, L_021fdb7c
    mov r0, #0x50
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdb20
    ldr r1, L_021fdb84
    ldr r1, [r1, #0x0]
    bl func_ov020_021fd320
L_021fdb20:
    str r0, [r4, #0x1e0]
    mov r0, r4
    bl func_ov020_021fdca4
    mov r0, r4
    bl func_ov020_021fdd88
    ldr r0, [r4, #0x20]
    ldr r1, L_021fdb88
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov020_021fd81c
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_021fdb5c: .word data_ov020_021fe504
L_021fdb60: .word data_020f4e18
L_021fdb64: .word gDebugFont
L_021fdb68: .word data_020ea9b0
L_021fdb6c: .word gGameWork
L_021fdb70: .word 0x25a
L_021fdb74: .word data_020ea650
L_021fdb78: .word data_ov020_021fe530
L_021fdb7c: .word gHeapContext
L_021fdb80: .word data_ov020_021fe538
L_021fdb84: .word data_020f4e14
L_021fdb88: .word data_ov020_021fe460
    .size func_ov020_021fd844, . - func_ov020_021fd844

