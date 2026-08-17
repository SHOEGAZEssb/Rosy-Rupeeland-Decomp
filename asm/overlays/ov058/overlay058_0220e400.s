.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern GameWork_TestFlag
.extern data_020f4e18
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern func_02073e48
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern gGameWork

.global func_ov058_0220e400
func_ov058_0220e400:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xc
    bl AnimationResourceState_InitEmbedded
    str r6, [r4, #0x18]
    ldr r2, .L_0220e588
    str r5, [r4, #0x1c]
    mov r0, #0x0
    str r0, [r4, #0x30]
    str r2, [sp, #0x0]
    ldr r0, .L_0220e58c
    sub r2, r2, #0x2
    ldr r1, [r0, #0x0]
    mov r0, r4
    mov r3, #0x2240
    bl func_02071ee0
    ldr r1, .L_0220e590
    mov r2, #0x1000
    str r1, [sp, #0x0]
    ldr r1, .L_0220e58c
    add r0, r4, #0xc
    ldr r1, [r1, #0x0]
    add r3, r2, #0x1
    bl func_02071ee0
    ldr r0, [r4, #0x18]
    mov r1, r4
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x20]
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    mov r0, #0x20
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x20]
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0xe
    bl func_02073e48
    ldr r0, [r4, #0x1c]
    mov r1, r4
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x24]
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    mov r0, #0x20
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x24]
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0xe
    bl func_02073e48
    ldr r0, .L_0220e594
    mov r1, #0xcd
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x28]
    streq r0, [r4, #0x2c]
    beq .L_0220e57c
    ldr r0, [r4, #0x18]
    add r1, r4, #0xc
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x28]
    mov r3, #0x2
    str r3, [sp, #0x0]
    mov r0, #0x0
    stmib sp, {r0, r3}
    ldr r0, [r4, #0x28]
    mov r1, #0x11
    mov r2, #0x80
    bl func_02073e48
    ldr r0, [r4, #0x1c]
    add r1, r4, #0xc
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x2c]
    mov r3, #0x2
    str r3, [sp, #0x0]
    mov r0, #0x0
    stmib sp, {r0, r3}
    ldr r0, [r4, #0x2c]
    mov r1, #0x11
    mov r2, #0x80
    bl func_02073e48
.L_0220e57c:
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0220e588: .word 0x2241
.L_0220e58c: .word data_020f4e18
.L_0220e590: .word 0x1002
.L_0220e594: .word gGameWork
.size func_ov058_0220e400, . - func_ov058_0220e400
