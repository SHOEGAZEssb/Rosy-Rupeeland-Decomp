    .text
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_ov016_02201394
    .extern func_02071ea4
    .extern func_02071ee0
    .extern func_02073e48
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern func_020957bc
    .extern func_020957f0
    .extern func_02095820
    .extern func_02095940
    .extern func_ov016_021fe0d8

/* Exact fallbacks for actor-group construction; see src/overlays/ov016/overlay016_actor_group.c. */
    .global func_ov016_021fe118

func_ov016_021fe118:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r5, r1
    bl func_02071ea4
    add r0, r4, #0xc
    bl func_02071ea4
    add r0, r4, #0x20
    bl func_020957bc
    add r0, r4, #0xd0
    bl func_ov016_021fe0d8
    add r0, r5, #0x1
    add r0, r0, r0, lsl #0x2
    str r0, [r4, #0xe0]
    ldr r0, L_021fe240
    mov r1, #0x0
    ldr r2, [r0, r5, lsl #0x2]
    ldr r0, L_021fe244
    str r2, [r4, #0xe4]
    str r1, [r4, #0xcc]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x18]
    mov r0, #0xf
    str r0, [sp, #0x0]
    mov r0, r4
    ldr r1, L_021fe248
    mov r2, #0xd
    ldr r1, [r1, #0x0]
    mov r3, #0xe
    bl func_02071ee0
    mov r0, #0x1b
    str r0, [sp, #0x0]
    add r0, r4, #0xc
    ldr r1, L_021fe248
    mov r2, #0x19
    ldr r1, [r1, #0x0]
    mov r3, #0x1a
    bl func_02071ee0
    ldr r0, [r4, #0x18]
    mov r1, r4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0x20
    mov r2, #0x1
    mov r3, r2
    bl func_020957f0
    add r0, r4, #0x20
    mov r1, #0x80
    mov r2, #0xaa
    bl func_02095820
    add r0, r4, #0x20
    bl func_02095940
    ldr r0, [r4, #0x18]
    add r1, r4, #0xc
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x1c]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x1c]
    ldr r1, [r4, #0xe4]
    mov r2, #0x26
    mov r3, #0xaa
    bl func_02073e48
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021fe240: .word data_ov016_02201394
L_021fe244: .word data_020f4e14
L_021fe248: .word data_020f4e18

    .size func_ov016_021fe118, . - func_ov016_021fe118
