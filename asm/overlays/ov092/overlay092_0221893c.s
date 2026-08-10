.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov092_0221b308
.extern data_ov092_0221c834
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern GamePhaseRuntime_GetActorCollection
.extern func_0201fafc
.extern ActorCollection_GetSpriteOwner
.extern Actor_RebuildPrimaryAttachment
.extern func_02059278
.extern func_0205929c
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020befec
.extern func_020bf1f8
.extern func_ov092_02217810
.extern func_ov092_02217834
.extern func_ov092_02218380
.extern func_ov092_02218394
.extern func_ov092_02218528
.extern func_ov092_022191f4
.extern func_ov092_0221a118
.extern gGameWork
.extern gHeapContext
.extern gSoundContext
.extern gSystemState
.extern genrand_int32

.global func_ov092_0221893c
func_ov092_0221893c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xf4
    mov r4, r0
    add r5, r4, #0x200
    ldrsh r0, [r5, #0x86]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_022191c4
.L_0221895c:
    b .L_0221897c
    b .L_022189b4
    b .L_02218a34
    b .L_02218b80
    b .L_02218e88
    b .L_02218ec4
    b .L_02218f34
    b .L_022190e4
.L_0221897c:
    mov r3, #0x0
.L_02218980:
    add r0, r4, r3, lsl #0x2
    ldr r2, [r0, #0x22c]
    add r3, r3, #0x1
    ldr r1, [r2, #0x54]
    cmp r3, #0x5
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r2, #0x14]
    orr r0, r0, #0x2
    str r0, [r2, #0x14]
    blt .L_02218980
    b .L_022191c4
.L_022189b4:
    mov r6, #0x0
    mov r5, r6
.L_022189bc:
    add r0, r4, r6, lsl #0x2
    ldr r7, [r0, #0x22c]
    mov r1, r5
    ldr r0, [r7, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r7, #0x54]
    add r6, r6, #0x1
    ldrh r0, [r1, #0x24]
    cmp r6, #0x5
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r7, #0x14]
    orr r0, r0, #0x2
    str r0, [r7, #0x14]
    blt .L_022189bc
    mov r0, r4
    bl func_ov092_0221a118
    ldr r0, .L_022191cc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    mov r3, #0x1
    bl func_ov092_02218394
    add r0, r4, #0x200
    mov r1, #0x2
    strh r1, [r0, #0x86]
.L_02218a34:
    add r0, sp, #0xe4
    mov r1, #0x180000
    mov r2, #0xd0000
    mov r3, #0x10000
    bl VecFx32Object_InitComponents
    add r0, sp, #0xd4
    mov r1, #0x180000
    mov r2, #0x120000
    mov r3, #0x10000
    bl VecFx32Object_InitComponents
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x88]
    mov r1, #0x3c
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r8, r0
    add r0, sp, #0xc4
    bl VecFx32Object_Init
    mov r9, #0x0
    add r7, r4, #0x1f0
    add r11, sp, #0xc4
    mov r6, #0x10000
    mov r5, #0xc
.L_02218a90:
    mla r0, r9, r5, r7
    mov r1, r11
    bl func_ov092_02217810
    add r0, sp, #0x94
    add r1, sp, #0xe4
    mov r2, r11
    add r3, sp, #0xd4
    str r6, [sp, #0xd0]
    bl func_ov092_022191f4
    add r0, r4, r9, lsl #0x2
    ldr r10, [r0, #0x22c]
    add r0, sp, #0x24
    add r1, sp, #0x94
    mov r2, r8
    bl VecFx32Bezier_Evaluate3D
    add r0, r10, #0x18
    add r1, sp, #0x24
    bl VecFx32Object_Assign
    mov r1, r0
    add r0, r10, #0x28
    bl VecFx32Object_Assign
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    add r0, sp, #0x94
    bl VecFx32Triple_Destroy
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_02218a90
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x88]
    add r1, r1, #0x1
    strh r1, [r0, #0x88]
    ldrsh r1, [r0, #0x88]
    cmp r1, #0x3c
    blt .L_02218b64
    mov r1, #0x3
    strh r1, [r0, #0x86]
    mov r2, #0x0
    strh r2, [r0, #0x88]
.L_02218b2c:
    add r0, r4, r2, lsl #0x2
    ldr r1, [r0, #0x22c]
    add r2, r2, #0x1
    ldr r0, [r1, #0x14]
    cmp r2, #0x5
    bic r0, r0, #0x2
    str r0, [r1, #0x14]
    blt .L_02218b2c
    ldr r0, .L_022191cc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    mov r3, #0x2
    bl func_ov092_02218394
.L_02218b64:
    add r0, sp, #0xc4
    bl VecFx32Object_Destroy
    add r0, sp, #0xd4
    bl VecFx32Object_Destroy
    add r0, sp, #0xe4
    bl VecFx32Object_Destroy
    b .L_022191c4
.L_02218b80:
    mov r7, #0x0
    ldr r11, .L_022191cc
    mov r10, r7
    add r6, r4, #0x1f0
.L_02218b90:
    add r0, r4, r10, lsl #0x2
    ldr r8, [r0, #0x22c]
    ldr r9, [r8, #0x54]
    ldr r0, [r8, #0x10c]
    ldrb r1, [r9, #0x38]
    cmp r0, #0x0
    beq .L_02218cdc
    cmp r1, #0x0
    add r7, r7, #0x1
    bne .L_02218c2c
    mov r0, r9
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    ldrh r0, [r9, #0x24]
    bic r0, r0, #0x3
    strh r0, [r9, #0x24]
    ldrh r1, [r5, #0x98]
    cmp r1, #0x0
    beq .L_02218bf0
    ldr r2, [r8, #0x1c]
    mov r0, r4
    mov r3, #0x50
    mov r2, r2, asr #0xc
    bl func_ov092_02218528
.L_02218bf0:
    ldrh r1, [r5, #0x9a]
    cmp r1, #0x0
    beq .L_02218c10
    ldr r2, [r8, #0x1c]
    mov r0, r4
    mov r3, #0x60
    mov r2, r2, asr #0xc
    bl func_ov092_02218528
.L_02218c10:
    ldr r2, [r8, #0x1c]
    ldr r1, .L_022191d0
    mov r0, r4
    mov r3, #0x64
    mov r2, r2, asr #0xc
    bl func_ov092_02218528
    b .L_02218d00
.L_02218c2c:
    cmp r1, #0x1
    bne .L_02218c8c
    ldrh r0, [r9, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02218d00
    mov r0, r9
    mov r1, #0x2
    bl GraphicsSpriteState_SetAnimationIndex
    ldrh r0, [r9, #0x24]
    mov r1, #0x0
    mov r2, #0x2
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r9, #0x24]
    ldr r0, [r11, #0x0]
    bl func_ov092_02218380
    add r3, r0, #0x5
    ldr r0, [r11, #0x0]
    mov r1, #0x0
    mov r2, #0x2
    bl func_ov092_02218394
    b .L_02218d00
.L_02218c8c:
    ldr r0, [r8, #0x104]
    cmp r0, #0x0
    beq .L_02218d00
    ldrh r1, [r5, #0x98]
    cmp r1, #0x0
    beq .L_02218cb8
    ldr r2, [r8, #0x1c]
    mov r0, r4
    mov r3, #0x50
    mov r2, r2, asr #0xc
    bl func_ov092_02218528
.L_02218cb8:
    ldrh r1, [r5, #0x9a]
    cmp r1, #0x0
    beq .L_02218d00
    ldr r2, [r8, #0x1c]
    mov r0, r4
    mov r3, #0x60
    mov r2, r2, asr #0xc
    bl func_ov092_02218528
    b .L_02218d00
.L_02218cdc:
    cmp r1, #0x3
    bne .L_02218d00
    mov r0, r9
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldrh r0, [r9, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r9, #0x24]
.L_02218d00:
    mov r0, #0x0
    str r0, [r8, #0x104]
    mov r0, #0xc
    mla r0, r10, r0, r6
    add r1, r8, #0x18
    bl func_ov092_02217810
    ldr r0, [r8, #0x1c]
    add r10, r10, #0x1
    str r0, [r8, #0x2c]
    ldr r0, [r8, #0x20]
    cmp r10, #0x5
    str r0, [r8, #0x30]
    blt .L_02218b90
    cmp r7, #0x5
    beq .L_02218d5c
    add r0, r4, #0x200
    ldrsb r0, [r0, #0xa1]
    cmp r0, #0x0
    beq .L_022191c4
    ldr r0, .L_022191d4
    ldrh r0, [r0, #0x4]
    tst r0, #0x100
    beq .L_022191c4
.L_02218d5c:
    ldr r0, .L_022191cc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl func_ov092_02218380
    ldr r1, .L_022191cc
    add r3, r0, #0x1e
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x2
    bl func_ov092_02218394
    ldr r0, .L_022191d8
    mov r9, #0x0
    add r5, r4, #0x200
    add r8, r0, #0x1
    sub r6, r0, #0x1
    mvn r7, #0x0
.L_02218da0:
    add r0, r4, r9, lsl #0x2
    ldr r10, [r0, #0x22c]
    mov r1, #0x3
    ldr r0, [r10, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r10, #0x54]
    mov r1, #0x95
    ldrh r0, [r3, #0x24]
    mov r2, #0x7f
    orr r0, r0, #0x2
    strh r0, [r3, #0x24]
    ldr r3, [r10, #0x54]
    ldrh r0, [r3, #0x24]
    bic r0, r0, #0x1
    strh r0, [r3, #0x24]
    mov r0, #0x4
    strh r0, [r5, #0x86]
    ldr r0, .L_022191dc
    ldr r0, [r0, #0x0]
    bl func_02059278
    mov r0, #0x0
    strh r0, [r5, #0x88]
    mov r0, #0x78
    str r0, [r4, #0x240]
    ldr r1, .L_022191e0
    ldr r3, .L_022191e4
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r11, r0
    beq .L_02218e60
    ldr r0, .L_022191e8
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    ldr r2, .L_022191d8
    add r1, r10, #0x18
    stmia sp, {r2, r8}
    mov r2, #0x0
    str r2, [sp, #0x8]
    mov r2, #0x800
    str r2, [sp, #0xc]
    mov r2, r0
    mov r0, r11
    mov r3, r6
    str r7, [sp, #0x10]
    bl func_0201fafc
.L_02218e60:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_02218da0
    ldr r0, .L_022191cc
    mov r2, #0x3
    ldr r0, [r0, #0x0]
    mov r3, r2
    mov r1, #0x0
    bl func_ov092_02218394
    b .L_022191c4
.L_02218e88:
    ldr r0, [r4, #0x240]
    sub r0, r0, #0x1
    str r0, [r4, #0x240]
    cmp r0, #0x0
    bgt .L_022191c4
    ldr r0, .L_022191dc
    mov r1, #0x95
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    mov r0, r5
    mov r1, #0x5
    strh r1, [r0, #0x86]
    mov r1, #0x0
    strh r1, [r0, #0x88]
.L_02218ec4:
    mov r2, #0x0
.L_02218ec8:
    add r0, r4, r2, lsl #0x2
    ldr r1, [r0, #0x22c]
    add r2, r2, #0x1
    ldr r0, [r1, #0x14]
    cmp r2, #0x5
    orr r0, r0, #0x2
    str r0, [r1, #0x14]
    blt .L_02218ec8
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x84]
    ldr r0, .L_022191ec
    cmp r1, r0
    bge .L_02218f10
    ldr r0, .L_022191dc
    mov r1, #0x98
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
.L_02218f10:
    add r0, r4, #0x200
    mov r2, #0x6
    ldr r1, .L_022191cc
    strh r2, [r0, #0x86]
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x3
    mov r3, #0x4
    bl func_ov092_02218394
.L_02218f34:
    add r0, sp, #0x84
    bl VecFx32Object_Init
    add r0, sp, #0x74
    mov r1, #0x180000
    mov r2, #0x120000
    mov r3, #0x10000
    bl VecFx32Object_InitComponents
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x88]
    mov r1, #0x3c
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r8, r0
    add r0, sp, #0x64
    mov r1, #0x180000
    mov r2, #0xd0000
    mov r3, #0x10000
    bl VecFx32Object_InitComponents
    mov r9, #0x0
    add r7, r4, #0x1f0
    add r11, sp, #0x84
    mov r6, #0x10000
    mov r5, #0xc
.L_02218f90:
    mla r0, r9, r5, r7
    mov r1, r11
    bl func_ov092_02217834
    add r0, sp, #0x34
    mov r1, r11
    add r2, sp, #0x64
    add r3, sp, #0x74
    str r6, [sp, #0x90]
    bl func_ov092_022191f4
    add r0, r4, r9, lsl #0x2
    ldr r10, [r0, #0x22c]
    add r0, sp, #0x14
    add r1, sp, #0x34
    mov r2, r8
    bl VecFx32Bezier_Evaluate3D
    add r0, r10, #0x18
    add r1, sp, #0x14
    bl VecFx32Object_Assign
    mov r1, r0
    add r0, r10, #0x28
    bl VecFx32Object_Assign
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    add r0, sp, #0x34
    bl VecFx32Triple_Destroy
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_02218f90
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x88]
    add r1, r1, #0x1
    strh r1, [r0, #0x88]
    ldrsh r1, [r0, #0x88]
    cmp r1, #0x3c
    blt .L_022190c8
    mov r1, #0x7
    mov r9, #0x0
    strh r1, [r0, #0x86]
    ldr r8, .L_022191f0
    strh r9, [r0, #0x88]
    mov r11, #0xd
    mov r7, #0x2
    mov r6, r9
    mov r5, #0x6
.L_02219040:
    add r0, r4, r9, lsl #0x2
    ldr r10, [r0, #0x22c]
    ldr r1, [r10, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    bl genrand_int32
    mov r1, r11
    bl func_020bf1f8
    mul r0, r1, r5
    str r7, [sp, #0x0]
    add r3, r8, r0
    ldrh r1, [r8, r0]
    ldrh r2, [r3, #0x2]
    ldrh r3, [r3, #0x4]
    mov r0, r10
    bl Actor_RebuildPrimaryAttachment
    ldr r0, [r10, #0x54]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r10, #0x54]
    add r9, r9, #0x1
    ldrh r0, [r1, #0x24]
    cmp r9, #0x5
    orr r0, r0, #0x12
    strh r0, [r1, #0x24]
    str r6, [r10, #0x10c]
    blt .L_02219040
    ldr r0, .L_022191cc
    mov r1, r6
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    mov r3, #0x5
    bl func_ov092_02218394
.L_022190c8:
    add r0, sp, #0x64
    bl VecFx32Object_Destroy
    add r0, sp, #0x74
    bl VecFx32Object_Destroy
    add r0, sp, #0x84
    bl VecFx32Object_Destroy
    b .L_022191c4
.L_022190e4:
    ldrsh r0, [r5, #0x88]
    add r0, r0, #0x1
    strh r0, [r5, #0x88]
    ldrsh r0, [r5, #0x88]
    cmp r0, #0x1e
    ble .L_022191c4
    mov r2, #0x0
    strh r2, [r5, #0x86]
    ldr r0, .L_022191dc
    strh r2, [r5, #0x88]
    ldr r0, [r0, #0x0]
    mov r1, #0x98
    bl func_0205929c
    mov r0, r5
    ldrsb r1, [r0, #0xa0]
    cmp r1, #0x0
    ldrsh r1, [r0, #0x8a]
    add r1, r1, #0x1
    bne .L_0221917c
    strh r1, [r0, #0x8a]
    ldrsh r1, [r0, #0x8a]
    cmp r1, #0x3
    blt .L_022191c4
    mov r1, #0x0
    strh r1, [r0, #0x8a]
    ldrb r2, [r4, #0x1ec]
    cmp r2, #0x2
    bne .L_022191c4
    mov r2, #0x5
    strb r2, [r4, #0x1ec]
    strh r1, [r0, #0x84]
    ldr r0, .L_022191cc
    strb r1, [r4, #0x1ed]
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    mov r3, #0x1
    bl func_ov092_02218394
    b .L_022191c4
.L_0221917c:
    strh r1, [r0, #0x8a]
    ldrsh r1, [r0, #0x8a]
    cmp r1, #0x7
    blt .L_022191c4
    mov r1, #0x0
    strh r1, [r0, #0x8a]
    ldrb r2, [r4, #0x1ec]
    cmp r2, #0x2
    bne .L_022191c4
    mov r2, #0x5
    strb r2, [r4, #0x1ec]
    strh r1, [r0, #0x84]
    ldr r0, .L_022191cc
    strb r1, [r4, #0x1ed]
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    mov r3, #0x1
    bl func_ov092_02218394
.L_022191c4:
    add sp, sp, #0xf4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022191cc: .word gGameWork
.L_022191d0: .word 0xb983
.L_022191d4: .word gSystemState
.L_022191d8: .word 0x1632
.L_022191dc: .word gSoundContext
.L_022191e0: .word data_ov092_0221c834
.L_022191e4: .word gHeapContext
.L_022191e8: .word data_021052fc
.L_022191ec: .word 0x1553
.L_022191f0: .word data_ov092_0221b308
.size func_ov092_0221893c, . - func_ov092_0221893c
