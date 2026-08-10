.text
.extern func_02071ea4
.extern func_02092798
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02071ee0
.extern func_02003e20
.extern func_020c09cc
.extern Heap_Alloc
.extern func_02094154
.extern func_02094574
.extern func_ov044_0220ba18
.extern func_02092814
.extern data_020f4e18
.extern data_ov044_0220d330
.extern gHeapContext
.extern func_020683c8
.extern func_020683f4
.extern data_ov044_0220d338

    .global func_ov044_0220b740
func_ov044_0220b740:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r0
    add r0, r5, #0x8
    mov r4, r1
    mov r6, r2
    bl func_02071ea4
    add r0, r5, #0x14
    bl func_02092798
    str r4, [r5, #0x0]
    mov r0, r4
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r5, #0x4]
    mov r1, #0x30
    str r1, [r0, #0x18]
    mov r1, #0x20
    str r1, [r0, #0x1c]
    mov r0, #0x62
    str r0, [sp, #0x0]
    ldr r1, .L_0220b8c8
    add r0, r5, #0x8
    ldr r1, [r1, #0x0]
    mov r2, #0x60
    mov r3, #0x61
    bl func_02071ee0
    str r6, [r5, #0x3c]
    mov ip, #0x0
    str ip, [r5, #0x40]
    ldr r6, [r5, #0x3c]
    mov r2, #0x4
    cmp r6, #0x0
    beq .L_0220b84c
    mov r0, r6, lsl #0x5
    ldr r1, .L_0220b8cc
    ldr r3, .L_0220b8d0
    add r0, r0, #0x8
    bl func_02003e20
    cmp r0, #0x0
    beq .L_0220b7fc
    ldr r1, .L_0220b8d4
    ldr ip, .L_0220b8d8
    str r1, [sp, #0x0]
    mov r1, r6
    mov r2, #0x20
    mov r3, #0x8
    str ip, [sp, #0x4]
    bl func_020c09cc
.L_0220b7fc:
    ldr r1, .L_0220b8dc
    str r0, [r5, #0x38]
    ldr r3, .L_0220b8d0
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220b844
    mov r1, #0xd6
    str r1, [sp, #0x0]
    mov r1, #0x1c
    str r1, [sp, #0x4]
    mov r1, #0xc
    str r1, [sp, #0x8]
    ldr r2, [r5, #0x3c]
    mov r1, r4
    mov r3, #0x5
    bl func_02094154
.L_0220b844:
    str r0, [r5, #0x44]
    b .L_0220b894
.L_0220b84c:
    ldr r1, .L_0220b8dc
    ldr r3, .L_0220b8d0
    mov r0, #0x80
    str ip, [r5, #0x38]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220b890
    mov r1, #0xd6
    mov r2, #0x1
    str r1, [sp, #0x0]
    mov ip, #0x1c
    mov r1, r4
    mov r3, r2
    str ip, [sp, #0x4]
    mov r4, #0x8
    str r4, [sp, #0x8]
    bl func_02094154
.L_0220b890:
    str r0, [r5, #0x44]
.L_0220b894:
    ldr r0, [r5, #0x44]
    bl func_02094574
    mov r0, r5
    bl func_ov044_0220ba18
    add r0, r5, #0x14
    mov r1, #0x7000
    bl func_02092814
    ldr r1, .L_0220b8e0
    add r0, r5, #0x14
    bl func_02092814
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0220b8c8: .word data_020f4e18
.L_0220b8cc: .word data_ov044_0220d330
.L_0220b8d0: .word gHeapContext
.L_0220b8d4: .word func_020683c8
.L_0220b8d8: .word func_020683f4
.L_0220b8dc: .word data_ov044_0220d338
.L_0220b8e0: .word 0x7005
.size func_ov044_0220b740, . - func_ov044_0220b740

