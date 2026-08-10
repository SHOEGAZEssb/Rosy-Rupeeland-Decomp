    .text
/* Exact fallback; see src/overlays/ov017/overlay017_main_state.c. */
    .extern GameWork_ClearFlag
    .extern GameWork_SetFlag
    .extern GameWork_TestFlag
    .extern data_021e9ac0
    .extern data_021e9e1c
    .extern data_ov017_02201420
    .extern data_ov017_02201538
    .extern data_ov017_02201560
    .extern data_ov017_022016e0
    .extern func_02062874
    .extern func_020628c8
    .extern func_0206514c
    .extern func_0206fcec
    .extern GraphicsSpriteGroup_ReplaceStateResourcesFromSource
    .extern func_02092260
    .extern func_020922f0
    .extern func_02094cf0
    .extern func_020954c0
    .extern func_020954e0
    .extern func_02095860
    .extern func_02095928
    .extern func_02095dd4
    .extern func_020befec
    .extern func_ov017_021fea8c
    .extern func_ov017_021ffcc8
    .extern func_ov017_021ffd74
    .extern func_ov017_021ffdb4
    .extern func_ov017_02200188
    .extern func_ov017_022008ac
    .extern func_ov017_02200bf8
    .extern gGameWork
    .global func_ov017_02200cc0
func_ov017_02200cc0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x15
    bgt L_02200d10
    bge L_02201170
    cmp r1, #0xa
    bgt L_02200d04
    bge L_02201098
    cmp r1, #0x1
    bgt L_02201308
    cmp r1, #0x0
    blt L_02201308
    beq L_02200d34
    cmp r1, #0x1
    beq L_02200dcc
    b L_02201308
L_02200d04:
    cmp r1, #0x14
    beq L_022010e4
    b L_02201308
L_02200d10:
    cmp r1, #0x23
    bgt L_02200d28
    bge L_022011f4
    cmp r1, #0x1e
    beq L_022011a8
    b L_02201308
L_02200d28:
    cmp r1, #0x28
    beq L_02201240
    b L_02201308
L_02200d34:
    ldr r1, [r4, #0x8]
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    cmp r1, #0x10
    ble L_02201308
    ldr r1, L_02201320
    ldr r1, [r1, #0x80]
    cmp r1, #0x0
    bne L_02200d94
    mov r1, #0x4100
    bl func_02092260
    ldr r0, [r4, #0x3bc]
    cmp r0, #0x0
    beq L_02200d7c
    ldr r0, [r4, #0x260]
    mov r1, #0x1
    bl func_020954c0
    b L_02200d9c
L_02200d7c:
    ldr r1, [r4, #0x260]
    ldr r0, [r4, #0x58]
    ldr r1, [r1, #0x9c]
    add r2, r4, #0x74
    bl GraphicsSpriteGroup_ReplaceStateResourcesFromSource
    b L_02200d9c
L_02200d94:
    ldr r1, L_02201324
    bl func_02092260
L_02200d9c:
    ldr r0, [r4, #0x260]
    bl func_020954e0
    ldr r0, [r4, #0x260]
    ldr r1, L_02201328
    mov r2, #0x0
    bl func_02094cf0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201308
L_02200dcc:
    ldr r0, [r4, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq L_02201308
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x8
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x3bc]
    cmp r0, #0x0
    beq L_02200eb4
    ldr r0, L_02201320
    ldr r0, [r0, #0x80]
    cmp r0, #0x0
    bne L_02200eb4
    mov r2, #0x1
    mov r0, r4
    mov r1, #0x7
    str r2, [r4, #0x3b8]
    bl func_020922f0
    ldr r0, L_0220132c
    ldr r1, L_02201330
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_02200e6c
    ldr r0, L_0220132c
    ldr r1, L_02201330
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_02201334
    bl func_0206fcec
    mov r0, r4
    mov r1, #0x9
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov017_021ffcc8
    mov r0, #0xa
    b L_02200e88
L_02200e6c:
    ldr r0, L_02201334
    bl func_0206fcec
    add r0, r4, #0x12c
    bl func_02095928
    add r0, r4, #0x80
    bl func_02095928
    mov r0, #0x28
L_02200e88:
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    ldr r1, [r4, #0x258]
    ldr r0, L_02201334
    ldr r1, [r1, #0x0]
    ldrh r2, [r0, #0x20]
    mov r0, r4
    add r1, r1, #0x4
    bl func_ov017_021ffdb4
    b L_02201308
L_02200eb4:
    mov r0, r4
    mov r1, #0x8
    bl func_020922f0
    ldr r2, [r4, #0x3c0]
    ldr r0, [r4, #0x3c4]
    mov r1, #0x5
    mul r0, r2, r0
    add r0, r0, #0x4
    bl func_020befec
    ldr r1, L_02201338
    mov r6, r0
    ldr r5, [r1, #0x0]
    mov r1, #0xec
    add r0, r5, #0x1c
    bl func_0206514c
    ldr r2, [r5, #0x20]
    mov r1, #0x24
    mla r5, r0, r1, r2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov017_021ffdb4
    mov r0, r4
    mov r1, #0xec
    bl func_ov017_02200bf8
    cmp r0, #0x0
    beq L_02200f50
    mov r0, r5
    bl func_020628c8
    mov r3, r0
    mov r0, r4
    mov r1, #0x25
    mov r2, #0x0
    bl func_ov017_021ffcc8
    mov r0, #0x23
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_02200f50:
    ldrh r1, [r5, #0x4]
    mov r0, r5
    add r1, r6, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_02062874
    ldr r0, [r4, #0x3bc]
    cmp r0, #0x0
    bne L_02200fc4
    ldr r0, L_0220132c
    mov r1, #0x3ac
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_02200fc4
    ldr r0, L_0220132c
    mov r1, #0x3ac
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    mov r1, #0xa
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov017_021ffcc8
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_02200fc4:
    ldr r0, L_02201320
    ldr r0, [r0, #0x80]
    cmp r0, #0x0
    beq L_02201024
    ldr r0, L_0220132c
    ldr r1, L_0220133c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_02201024
    ldr r0, L_0220132c
    ldr r1, L_0220133c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    mov r1, #0xb
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov017_021ffcc8
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_02201024:
    ldr r0, L_0220132c
    ldr r1, L_02201340
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_02201074
    ldr r0, L_0220132c
    ldr r1, L_02201340
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    mov r1, #0x21
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov017_021ffcc8
    mov r0, #0x1e
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_02201074:
    add r0, r4, #0x12c
    bl func_02095928
    add r0, r4, #0x80
    bl func_02095928
    mov r0, #0x28
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_02201098:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x400]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02201308
    mov r0, r4
    bl func_ov017_021ffd74
    add r0, r4, #0x12c
    bl func_02095928
    add r0, r4, #0x80
    bl func_02095928
    mov r0, #0x28
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_022010e4:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x400]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02201308
    mov r0, r4
    bl func_ov017_021ffd74
    ldr r0, L_0220132c
    ldr r1, L_02201340
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_0220114c
    ldr r0, L_0220132c
    ldr r1, L_02201340
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201308
L_0220114c:
    add r0, r4, #0x12c
    bl func_02095928
    add r0, r4, #0x80
    bl func_02095928
    mov r0, #0x28
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_02201170:
    ldr r1, [r4, #0x8]
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    cmp r1, #0x14
    ble L_02201308
    mov r1, #0x21
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov017_021ffcc8
    mov r0, #0x1e
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_022011a8:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x400]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02201308
    mov r0, r4
    bl func_ov017_021ffd74
    add r0, r4, #0x12c
    bl func_02095928
    add r0, r4, #0x80
    bl func_02095928
    mov r0, #0x28
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_022011f4:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x400]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02201308
    mov r0, r4
    bl func_ov017_021ffd74
    add r0, r4, #0x12c
    bl func_02095928
    add r0, r4, #0x80
    bl func_02095928
    mov r0, #0x28
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201308
L_02201240:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02201308
    add r0, r4, #0x80
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_0220128c
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    ldr r1, L_02201344
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov017_021fea8c
    b L_02201308
L_0220128c:
    add r0, r4, #0x12c
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_02201308
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    ldr r0, L_0220132c
    ldr r1, L_02201348
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, [r4, #0x3b8]
    cmp r0, #0x0
    ldreq r0, L_0220132c
    moveq r1, #0xec
    ldreq r0, [r0, #0x0]
    beq L_022012f0
    ldr r1, [r4, #0x258]
    ldr r0, L_0220132c
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    ldrh r1, [r1, #0x4]
L_022012f0:
    add r0, r0, #0x100
    strh r1, [r0, #0xca]
    ldr r1, L_0220134c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov017_021fea8c
L_02201308:
    mov r0, r4
    bl func_ov017_02200188
    mov r0, r4
    bl func_ov017_022008ac
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02201320: .word data_ov017_022016e0
L_02201324: .word 0x4103
L_02201328: .word data_ov017_02201420
L_0220132c: .word gGameWork
L_02201330: .word 0x3ab
L_02201334: .word data_021e9e1c
L_02201338: .word data_021e9ac0
L_0220133c: .word 0x3ad
L_02201340: .word 0x3ce
L_02201344: .word data_ov017_02201538
L_02201348: .word 0x3a6
L_0220134c: .word data_ov017_02201560
    .size func_ov017_02200cc0, . - func_ov017_02200cc0
