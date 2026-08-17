.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern data_ov092_0221b1e0
.extern data_ov092_0221b1f0
.extern data_ov092_0221b200
.extern data_ov092_0221b210
.extern data_ov092_0221b220
.extern data_ov092_0221b238
.extern data_ov092_0221b356
.extern data_ov092_0221b3de
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern Actor_SetActive
.extern TrackedResourceActor_SpawnFromKey
.extern Sound_PlayDirectSequence
.extern func_02059344
.extern func_0205940c
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov092_022177e0
.extern func_ov092_02217810
.extern func_ov092_02217914
.extern func_ov092_02217930
.extern func_ov092_02218380
.extern func_ov092_02218394
.extern func_ov092_022183b8
.extern func_ov092_02218528
.extern func_ov092_022185a4
.extern func_ov092_022185c4
.extern func_ov092_0221893c
.extern func_ov092_02219238
.extern func_ov092_022192b0
.extern func_ov092_022192c8
.extern func_ov092_02219e54
.extern func_ov092_0221a6d4
.extern gGameWork
.extern gSoundContext

.global func_ov092_022196d0
func_ov092_022196d0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x34
    mov r6, r0
    ldr r4, [r6, #0x264]
    ldr r5, [r4, #0x54]
    bl func_ov092_02219238
    ldrb r0, [r6, #0x1ed]
    cmp r0, #0x33
    bgt .L_02219750
    bge .L_02219c94
    cmp r0, #0xd
    bgt .L_02219744
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_02219e08
.L_0221970c:
    b .L_02219770
    b .L_022197c4
    b .L_022198a4
    b .L_02219920
    b .L_022199a8
    b .L_02219e08
    b .L_02219e08
    b .L_02219e08
    b .L_02219e08
    b .L_02219e08
    b .L_02219a38
    b .L_02219ab0
    b .L_02219af8
    b .L_02219bc4
.L_02219744:
    cmp r0, #0x32
    beq .L_02219c3c
    b .L_02219e08
.L_02219750:
    cmp r0, #0x5a
    bgt .L_02219768
    bge .L_02219d7c
    cmp r0, #0x3c
    beq .L_02219d24
    b .L_02219e08
.L_02219768:
    cmp r0, #0x63
    b .L_02219e08
.L_02219770:
    ldr r0, .L_02219e20
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_0205940c
    mov r0, r6
    bl func_ov092_022185c4
    mov r0, r6
    bl func_ov092_022185a4
    mov r0, r6
    bl func_ov092_0221893c
    mov r0, r6
    bl func_ov092_022192b0
    mov r0, r6
    bl func_ov092_022192c8
    mov r0, #0x1
    strb r0, [r6, #0x1ed]
    add r0, r6, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    b .L_02219e08
.L_022197c4:
    mov r0, r6
    bl func_ov092_022185c4
    mov r0, r6
    bl func_ov092_022185a4
    mov r0, r6
    bl func_ov092_0221893c
    mov r0, r6
    bl func_ov092_02219238
    mov r0, r6
    bl func_ov092_022192b0
    mov r0, r6
    bl func_ov092_022192c8
    add r0, r6, #0x100
    ldrh r0, [r0, #0xee]
    cmp r0, #0x78
    bls .L_02219e08
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x86]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02219e08
    mov r0, r6
    bl func_ov092_0221a6d4
    cmp r0, #0x0
    beq .L_02219e08
    mov r0, r6
    bl func_ov092_022183b8
    cmp r0, #0x0
    beq .L_02219e08
    ldr r1, [r4, #0x14]
    add r0, r4, #0x18
    orr r1, r1, #0x2
    str r1, [r4, #0x14]
    mov r1, #0x180000
    mov r2, #0xc4000
    mov r3, #0x10000
    bl func_ov092_02217930
    ldr r1, [r4, #0x14]
    mov r0, r5
    orr r1, r1, #0x80
    str r1, [r4, #0x14]
    ldrh r2, [r5, #0x24]
    mov r1, #0x0
    bic r2, r2, #0x12
    strh r2, [r5, #0x24]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x3
    strb r0, [r5, #0x3a]
    mov r0, #0x2
    strb r0, [r6, #0x1ed]
    add r0, r6, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    b .L_02219e08
.L_022198a4:
    add r0, r6, #0x100
    ldrh r0, [r0, #0xee]
    cmp r0, #0x78
    blo .L_02219e08
    add r0, r6, #0x200
    ldrsb r0, [r0, #0xa0]
    mov r3, #0x0
    mov r2, #0x3
    cmp r0, #0x0
    bne .L_022198e0
    ldr r1, .L_02219e24
    add r0, r6, #0x268
    str r3, [sp, #0x0]
    bl func_ov092_022177e0
    b .L_022198f0
.L_022198e0:
    ldr r1, .L_02219e28
    add r0, r6, #0x268
    str r3, [sp, #0x0]
    bl func_ov092_022177e0
.L_022198f0:
    ldr r0, [r4, #0x14]
    mov r1, #0x200
    bic r0, r0, #0x2
    bic r0, r0, #0x80
    str r0, [r4, #0x14]
    ldrh r2, [r5, #0x24]
    mov r0, #0x3
    orr r2, r2, #0x2
    strh r2, [r5, #0x24]
    strh r1, [r5, #0x36]
    strb r0, [r6, #0x1ed]
    b .L_02219e08
.L_02219920:
    add r0, r6, #0x268
    add r1, r4, #0x18
    bl func_ov092_02217810
    ldr r1, [r4, #0x1c]
    add r0, r6, #0x268
    str r1, [r4, #0x2c]
    ldr r1, [r4, #0x20]
    str r1, [r4, #0x30]
    ldrb r7, [r5, #0x38]
    bl func_ov092_02217914
    cmp r7, r0
    beq .L_02219968
    add r0, r6, #0x268
    bl func_ov092_02217914
    mov r1, r0
    mov r0, r5
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02219968:
    ldrb r0, [r6, #0x273]
    cmp r0, #0x0
    beq .L_02219e08
    mov r0, #0x4
    strb r0, [r6, #0x1ed]
    add r0, r6, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    strh r1, [r5, #0x36]
    ldr r2, [r4, #0x1c]
    ldr r1, .L_02219e2c
    mov r0, r6
    mov r2, r2, asr #0xc
    mov r3, #0x50
    bl func_ov092_02218528
    b .L_02219e08
.L_022199a8:
    add r0, r6, #0x100
    ldrh r0, [r0, #0xee]
    cmp r0, #0x40
    blo .L_02219e08
    add r0, r6, #0x200
    ldrsb r0, [r0, #0xa0]
    mov r3, #0x0
    mov r2, #0x11
    cmp r0, #0x0
    bne .L_022199e4
    ldr r1, .L_02219e30
    add r0, r6, #0x268
    str r3, [sp, #0x0]
    bl func_ov092_022177e0
    b .L_022199f4
.L_022199e4:
    ldr r1, .L_02219e34
    add r0, r6, #0x268
    str r3, [sp, #0x0]
    bl func_ov092_022177e0
.L_022199f4:
    ldr r0, [r4, #0x14]
    mov r2, #0x100
    bic r0, r0, #0x2
    bic r0, r0, #0x80
    str r0, [r4, #0x14]
    ldrh r3, [r5, #0x24]
    mov r1, #0xa
    ldr r0, .L_02219e20
    orr r3, r3, #0x2
    strh r3, [r5, #0x24]
    strh r2, [r5, #0x36]
    strb r1, [r6, #0x1ed]
    ldr r0, [r0, #0x0]
    mov r1, #0x99
    mov r2, #0x7f
    bl Sound_PlayDirectSequence
    b .L_02219e08
.L_02219a38:
    add r0, r6, #0x268
    add r1, r4, #0x18
    bl func_ov092_02217810
    ldr r1, [r4, #0x1c]
    add r0, r6, #0x268
    str r1, [r4, #0x2c]
    ldr r1, [r4, #0x20]
    str r1, [r4, #0x30]
    ldrb r4, [r5, #0x38]
    bl func_ov092_02217914
    cmp r4, r0
    beq .L_02219a80
    add r0, r6, #0x268
    bl func_ov092_02217914
    mov r1, r0
    mov r0, r5
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02219a80:
    ldr r0, .L_02219e20
    mov r1, #0x99
    ldr r0, [r0, #0x0]
    bl func_02059344
    cmp r0, #0x0
    bne .L_02219e08
    mov r0, #0xb
    strb r0, [r6, #0x1ed]
    add r0, r6, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    b .L_02219e08
.L_02219ab0:
    add r0, r6, #0x100
    ldrh r0, [r0, #0xee]
    cmp r0, #0x3c
    bls .L_02219e08
    mov r1, #0xc
    ldr r0, .L_02219e20
    strb r1, [r6, #0x1ed]
    ldr r0, [r0, #0x0]
    mov r1, #0x96
    mov r2, #0x7f
    bl Sound_PlayDirectSequence
    mov r0, r5
    mov r1, #0x2
    bl GraphicsSpriteState_SetAnimationIndex
    ldrh r0, [r5, #0x24]
    bic r0, r0, #0x3
    strh r0, [r5, #0x24]
    b .L_02219e08
.L_02219af8:
    ldrh r0, [r5, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02219e08
    mov r1, #0xd
    strb r1, [r6, #0x1ed]
    mov r0, r5
    mov r1, #0x3
    bl GraphicsSpriteState_SetAnimationIndex
    ldrh r2, [r5, #0x24]
    add r0, sp, #0x24
    add r1, r4, #0x18
    bic r2, r2, #0x1
    strh r2, [r5, #0x24]
    ldrh r2, [r5, #0x24]
    orr r2, r2, #0x2
    strh r2, [r5, #0x24]
    bl VecFx32Object_InitCopy
    ldr r2, [sp, #0x30]
    ldr r0, [sp, #0x2c]
    add r3, r2, #0x10000
    add r2, r0, #0x8000
    str r2, [sp, #0x2c]
    mov r1, #0x0
    str r3, [sp, #0x30]
    add r0, sp, #0x4
    mov r3, r1
    mov r2, #0x10000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x14
    add r1, sp, #0x24
    add r2, sp, #0x4
    bl func_ov092_02219e54
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    mov r0, #0xd
    add r1, sp, #0x24
    add r2, sp, #0x14
    bl TrackedResourceActor_SpawnFromKey
    mov r1, #0x1
    bl Actor_SetActive
    mov r1, #0x0
    add r0, r6, #0x100
    strh r1, [r0, #0xee]
    add r0, sp, #0x14
    str r1, [r4, #0x10c]
    bl VecFx32Object_Destroy
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    b .L_02219e08
.L_02219bc4:
    add r0, r6, #0x100
    ldrh r0, [r0, #0xee]
    cmp r0, #0xf0
    movhi r0, #0x3c
    strhib r0, [r6, #0x1ed]
    bhi .L_02219e08
    ldr r0, [r4, #0x10c]
    cmp r0, #0x0
    beq .L_02219e08
    mov r1, #0x32
    mov r0, r5
    strb r1, [r6, #0x1ed]
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    ldrh r2, [r5, #0x24]
    ldr r1, .L_02219e38
    mov r0, r6
    bic r2, r2, #0x3
    strh r2, [r5, #0x24]
    ldr r2, [r4, #0x1c]
    mov r3, #0x50
    mov r2, r2, asr #0xc
    bl func_ov092_02218528
    ldr r2, [r4, #0x1c]
    ldr r1, .L_02219e3c
    mov r0, r6
    mov r2, r2, asr #0xc
    mov r3, #0x64
    bl func_ov092_02218528
    b .L_02219e08
.L_02219c3c:
    ldrh r0, [r5, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02219e08
    ldr r0, .L_02219e40
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl func_ov092_02218380
    ldr r1, .L_02219e40
    add r3, r0, #0x64
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x2
    bl func_ov092_02218394
    mov r0, #0x33
    strb r0, [r6, #0x1ed]
    add r0, r6, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    b .L_02219e08
.L_02219c94:
    add r0, r6, #0x100
    ldrh r0, [r0, #0xee]
    cmp r0, #0xf0
    bls .L_02219e08
    ldrh r1, [r5, #0x24]
    add r0, r6, #0x200
    mov r3, #0x0
    orr r1, r1, #0x2
    strh r1, [r5, #0x24]
    ldrsb r0, [r0, #0xa0]
    mov r2, #0x2
    cmp r0, #0x0
    bne .L_02219cdc
    ldr r1, .L_02219e44
    add r0, r6, #0x268
    str r3, [sp, #0x0]
    bl func_ov092_022177e0
    b .L_02219cec
.L_02219cdc:
    ldr r1, .L_02219e48
    add r0, r6, #0x268
    str r3, [sp, #0x0]
    bl func_ov092_022177e0
.L_02219cec:
    ldr r0, .L_02219e20
    mov r1, #0x95
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl Sound_PlayDirectSequence
    mov r1, #0x5a
    mov r2, #0x3
    ldr r0, .L_02219e40
    strb r1, [r6, #0x1ed]
    ldr r0, [r0, #0x0]
    mov r3, r2
    mov r1, #0x0
    bl func_ov092_02218394
    b .L_02219e08
.L_02219d24:
    add r0, r6, #0x100
    ldrh r0, [r0, #0xee]
    cmp r0, #0xf0
    bls .L_02219e08
    add r0, r6, #0x200
    ldrsb r0, [r0, #0xa0]
    mov r3, #0x0
    mov r2, #0x2
    cmp r0, #0x0
    bne .L_02219d60
    ldr r1, .L_02219e4c
    add r0, r6, #0x268
    str r3, [sp, #0x0]
    bl func_ov092_022177e0
    b .L_02219d70
.L_02219d60:
    ldr r1, .L_02219e50
    add r0, r6, #0x268
    str r3, [sp, #0x0]
    bl func_ov092_022177e0
.L_02219d70:
    mov r0, #0x5a
    strb r0, [r6, #0x1ed]
    b .L_02219e08
.L_02219d7c:
    add r0, r6, #0x268
    add r1, r4, #0x18
    bl func_ov092_02217810
    ldr r1, [r4, #0x1c]
    add r0, r6, #0x268
    str r1, [r4, #0x2c]
    ldr r1, [r4, #0x20]
    str r1, [r4, #0x30]
    ldrb r7, [r5, #0x38]
    bl func_ov092_02217914
    cmp r7, r0
    beq .L_02219dc4
    add r0, r6, #0x268
    bl func_ov092_02217914
    mov r1, r0
    mov r0, r5
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02219dc4:
    ldrb r0, [r6, #0x273]
    cmp r0, #0x0
    beq .L_02219e08
    mov r0, #0x63
    strb r0, [r6, #0x1ed]
    ldr r0, [r4, #0x14]
    mov r1, #0x0
    orr r0, r0, #0x2
    str r0, [r4, #0x14]
    ldrh r2, [r5, #0x24]
    ldr r0, .L_02219e40
    mov r3, r1
    orr r2, r2, #0x10
    strh r2, [r5, #0x24]
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl func_ov092_02218394
.L_02219e08:
    ldrb r0, [r6, #0x1ed]
    cmp r0, #0x63
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02219e20: .word gSoundContext
.L_02219e24: .word data_ov092_0221b220
.L_02219e28: .word data_ov092_0221b238
.L_02219e2c: .word 0xb98b
.L_02219e30: .word data_ov092_0221b356
.L_02219e34: .word data_ov092_0221b3de
.L_02219e38: .word 0xb98c
.L_02219e3c: .word 0xb983
.L_02219e40: .word gGameWork
.L_02219e44: .word data_ov092_0221b200
.L_02219e48: .word data_ov092_0221b1f0
.L_02219e4c: .word data_ov092_0221b210
.L_02219e50: .word data_ov092_0221b1e0
.size func_ov092_022196d0, . - func_ov092_022196d0
