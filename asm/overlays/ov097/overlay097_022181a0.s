.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern Heap_Alloc
.extern OS_Halt
.extern data_020c9670
.extern data_021052fc
.extern data_ov097_0221a4c8
.extern data_ov097_0221aa1c
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorMotionJitter_EnsureMinimum
.extern AuxiliaryTimedSpritePresentation_Init
.extern Actor_GetCachedTerrainHeight
.extern func_02034a60
.extern ActorExtendedType2_GetDescriptorValue2A
.extern ActorExtendedType2_GetDescriptorValue2C
.extern ActorExtendedType2_GetDescriptorValue25
.extern func_0204cfa4
.extern TrackedResourceActor_SpawnFromKey
.extern Sound_PlayOwnedEffect
.extern func_020adc90
.extern func_020befec
.extern func_ov078_02213a74
.extern func_ov097_02217ac4
.extern func_ov097_022188f8
.extern gHeapContext
.extern gSoundContext
.extern genrand_int32

.global func_ov097_022181a0
func_ov097_022181a0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    mov r6, r0
    ldr r3, [r6, #0x260]
    mov r2, #0x1b
    orr r3, r3, #0x23
    bic r3, r3, #0xa
    str r3, [r6, #0x260]
    strh r2, [r6, #0xd6]
    mov r2, #0x3
    strb r2, [r6, #0x24c]
    add r2, r6, #0x200
    ldrsh r2, [r2, #0x98]
    mov r4, r1
    cmp r2, #0x0
    bne .L_02218350
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    mov r0, r6
    bne .L_022182d0
    mov r1, r4
    add r2, r6, #0x200
    mov r3, #0x0
    strh r3, [r2, #0xa2]
    bl func_ov078_02213a74
    mov r0, r6
    ldr r2, [r0, #0x0]
    ldr r1, [r6, #0x228]
    ldr r2, [r2, #0xd0]
    add r1, r1, #0x18
    blx r2
    mov r0, r6
    bl ActorExtendedType2_GetDescriptorValue2A
    ldr r1, [r6, #0x3c]
    mul r2, r1, r0
    mov r0, r6
    str r2, [r6, #0x2b0]
    bl ActorExtendedType2_GetDescriptorValue2A
    ldr r2, [r6, #0x40]
    mov r1, #0x0
    mul r0, r2, r0
    str r0, [r6, #0x2b4]
    strh r1, [r6, #0xda]
    add r0, r6, #0x200
    ldrsh r0, [r0, #0xc2]
    cmp r0, #0x4
    movne r0, #0x3000
    strne r0, [r6, #0x44]
    bne .L_022182c0
    mov r0, #0x3800
    str r0, [r6, #0x44]
    ldr r3, [r6, #0x2b0]
    ldr r0, .L_022188c8
    mov r2, r3, asr #0x1f
    umull r5, r4, r3, r0
    mla r4, r3, r1, r4
    adds r3, r5, #0x800
    mla r4, r2, r0, r4
    adc r2, r4, r1
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r6, #0x2b0]
    ldr r2, [r6, #0x2b4]
    umull r4, r3, r2, r0
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    mla r3, r2, r0, r3
    adds r4, r4, #0x800
    adc r0, r3, r1
    mov r1, r4, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r6, #0x2b4]
.L_022182c0:
    ldr r0, [r6, #0x14]
    orr r0, r0, #0x2000000
    str r0, [r6, #0x14]
    b .L_02218344
.L_022182d0:
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x1
    bne .L_02218340
    add r0, r6, #0x200
    mov r1, #0x1
    strh r1, [r0, #0xa2]
    mov r0, #0x2
    add r1, r6, #0x18
    strh r0, [r6, #0xda]
    mov r2, r1
    mov r0, #0x21
    bl TrackedResourceActor_SpawnFromKey
    ldr r0, [r6, #0xc8]
    add r2, r6, #0x200
    add r0, r0, #0x3e80
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x10
    add r0, r1, r0, ror #0x10
    strh r0, [r2, #0xb8]
    bl genrand_int32
    tst r0, #0x1
    movne r0, #0x1
    mvneq r0, #0x0
    add r0, r0, r0, lsl #0x1
    mov r1, r0, lsl #0x8
    add r0, r6, #0x200
    strh r1, [r0, #0xba]
    b .L_02218344
.L_02218340:
    bl OS_Halt
.L_02218344:
    add r0, r6, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x9c]
.L_02218350:
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x98]
    add r1, r1, #0x1
    strh r1, [r0, #0x98]
    ldrsh r1, [r0, #0xa2]
    cmp r1, #0x0
    beq .L_02218378
    cmp r1, #0x1
    beq .L_02218624
    b .L_022188c0
.L_02218378:
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    bgt .L_02218608
    mov r0, r6
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r6, #0x24]
    cmp r1, r0
    bgt .L_02218608
    ldrsh r0, [r6, #0xda]
    cmp r0, #0x1
    beq .L_02218534
    ldr r1, .L_022188cc
    mov r3, #0x1
    mov r0, r6
    mov r2, #0x0
    strh r3, [r6, #0xda]
    bl func_02034a60
    add r0, sp, #0x58
    add r1, r6, #0x18
    bl VecFx32Object_InitCopy
    ldr r1, .L_022188d0
    ldr r3, .L_022188d4
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218428
    ldr r3, .L_022188d8
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x80
    str r1, [sp, #0xc]
    mov r1, #0x2
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r6, #0x54]
    add r1, sp, #0x58
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl AuxiliaryTimedSpritePresentation_Init
.L_02218428:
    ldrb r0, [r6, #0xd4]
    ldr r4, .L_022188dc
    ldr r2, [sp, #0x60]
    mov r0, r0, lsl #0xd
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r0, r0, lsl #0x1
    ldrsh r5, [r4, r0]
    mov ip, r3, lsl #0x1
    mov r0, #0xc
    mla r3, r5, r0, r2
    ldrsh r4, [r4, ip]
    mov r0, #0x12
    ldr r2, [sp, #0x5c]
    smulbb r0, r4, r0
    sub r0, r2, r0
    add r1, sp, #0x58
    str r0, [sp, #0x5c]
    mov r2, r1
    str r3, [sp, #0x60]
    mov r0, #0x22
    bl TrackedResourceActor_SpawnFromKey
    ldr r1, [r6, #0x1c]
    mvn r0, #0x2f
    mla r0, r4, r0, r1
    str r0, [sp, #0x5c]
    ldr r1, [r6, #0x20]
    mov r0, #0x14
    mla r1, r5, r0, r1
    sub r4, r1, #0x8000
    ldr r1, .L_022188d0
    ldr r3, .L_022188d4
    mov r2, #0x4
    str r4, [sp, #0x60]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218500
    ldr r3, .L_022188e0
    mov r2, #0x0
    str r3, [sp, #0x0]
    add r1, r3, #0x1
    stmib sp, {r1, r2}
    sub r1, r2, #0x4
    str r1, [sp, #0xc]
    sub r1, r2, #0x1
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r6, #0x54]
    add r1, sp, #0x58
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl AuxiliaryTimedSpritePresentation_Init
.L_02218500:
    ldr r0, [r6, #0x10]
    tst r0, #0x4
    beq .L_02218528
    ldr r0, .L_022188e4
    mov r1, #0xf
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
.L_02218528:
    add r0, sp, #0x58
    bl VecFx32Object_Destroy
    b .L_022188c0
.L_02218534:
    add r0, r6, #0x200
    ldrsh r1, [r0, #0xc2]
    cmp r1, #0x4
    bge .L_022185ac
    ldrh r1, [r0, #0x9c]
    add r1, r1, #0x1
    strh r1, [r0, #0x9c]
    ldrh r1, [r0, #0x9c]
    cmp r1, #0x3c
    bls .L_022188c0
    mov r2, #0x0
    strh r2, [r0, #0x98]
    strh r2, [r0, #0x9c]
    ldrsh r1, [r0, #0xc2]
    mov r3, r6
    add r1, r1, #0x1
    strh r1, [r0, #0xc2]
    ldrsh r0, [r0, #0xc2]
    mov r1, #0x100
    cmp r0, #0x4
    subeq r0, r2, #0x80
    subne r0, r2, #0x100
    str r0, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, .L_022188e8
    mov r1, #0x61
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_PlayOwnedEffect
    b .L_022188c0
.L_022185ac:
    ldrh r0, [r0, #0x9c]
    cmp r0, #0x14
    ldrhi r0, [r6, #0x260]
    orrhi r0, r0, #0x8
    strhi r0, [r6, #0x260]
    add r0, r6, #0x200
    ldrh r1, [r0, #0x9c]
    add r1, r1, #0x1
    strh r1, [r0, #0x9c]
    ldrh r1, [r0, #0x9c]
    cmp r1, #0x1e
    bls .L_022188c0
    ldr r2, [r6, #0x260]
    ldr r1, .L_022188ec
    orr r2, r2, #0x8
    str r2, [r6, #0x260]
    ldr r3, [r1, #0x28]
    ldr r2, [r1, #0x2c]
    mov r1, #0x0
    str r3, [r6, #0x2a4]
    str r2, [r6, #0x2a8]
    strh r1, [r0, #0x98]
    b .L_022188c0
.L_02218608:
    mov r0, #0x0
    strh r0, [r6, #0xda]
    ldr r0, [r6, #0x2b0]
    str r0, [r6, #0x3c]
    ldr r0, [r6, #0x2b4]
    str r0, [r6, #0x40]
    b .L_022188c0
.L_02218624:
    ldrsh r1, [r0, #0x98]
    cmp r1, #0xf0
    ble .L_02218650
    ldr r1, .L_022188ec
    mov r2, #0x0
    ldr r3, [r1, #0x18]
    ldr r1, [r1, #0x1c]
    str r3, [r6, #0x2a4]
    str r1, [r6, #0x2a8]
    strh r2, [r0, #0x98]
    b .L_022188c0
.L_02218650:
    cmp r1, #0x3c
    blt .L_02218660
    cmp r1, #0x5a
    ble .L_02218670
.L_02218660:
    cmp r1, #0x96
    blt .L_022186d8
    cmp r1, #0xb4
    bgt .L_022186d8
.L_02218670:
    ldr r0, .L_022188e4
    ldr r2, [r6, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r1, [r6, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r3, [r0, #0x1c]
    ldr r0, [r0, #0x20]
    sub r4, r3, r2
    sub r5, r0, r1
    mov r0, r4
    mov r1, r5
    bl func_0204cfa4
    ldr r1, .L_022188f0
    cmp r0, r1
    ble .L_02218740
    add r7, r0, r0, lsl #0x1
    mov r0, r4
    mov r1, r7
    bl func_020adc90
    mov r4, r0
    mov r0, r5
    mov r1, r7
    bl func_020adc90
    mov r5, r0
    b .L_02218740
.L_022186d8:
    add r0, r6, #0x200
    ldrh r2, [r0, #0xb8]
    ldr r1, .L_022188dc
    mov r0, r6
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x1
    add r2, r2, #0x1
    mov r2, r2, lsl #0x1
    ldrsh r4, [r1, r2]
    bl ActorExtendedType2_GetDescriptorValue2C
    mul r0, r4, r0
    mov r1, #0xc
    bl func_020befec
    add r1, r6, #0x200
    ldrh r2, [r1, #0xb8]
    ldr r1, .L_022188dc
    mov r4, r0
    mov r0, r2, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r5, [r1, r0]
    mov r0, r6
    bl ActorExtendedType2_GetDescriptorValue2C
    mul r0, r5, r0
    mov r1, #0xc
    bl func_020befec
    mov r5, r0
.L_02218740:
    ldr r1, [r6, #0x8c]
    add r0, sp, #0x48
    add r1, r1, r4
    str r1, [r6, #0x8c]
    ldr r1, [r6, #0x90]
    add r1, r1, r5
    str r1, [r6, #0x90]
    ldr r1, [r6, #0x228]
    add r1, r1, #0x18
    bl VecFx32Object_InitCopy
    ldr r0, [r6, #0x278]
    cmp r0, #0x0
    beq .L_0221880c
    ldr r4, [r0, #0x4]
    add r0, sp, #0x38
    ldrsh r2, [r4, #0x2]
    ldrsh r3, [r4, #0x6]
    ldrsh r1, [r4, #0x0]
    ldrsh r5, [r4, #0x4]
    sub r3, r3, r2
    mov r4, r3, lsl #0x10
    sub r3, r5, r1
    mov r3, r3, lsl #0x10
    mov r4, r4, asr #0x10
    mov r3, r3, asr #0x10
    add r4, r4, r4, lsr #0x1f
    add r3, r3, r3, lsr #0x1f
    add r1, r1, r3, asr #0x1
    add r2, r2, r4, asr #0x1
    add r2, r2, #0x20
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x28
    add r1, sp, #0x48
    add r2, sp, #0x38
    bl func_ov097_02217ac4
    add r0, sp, #0x18
    add r1, sp, #0x28
    mov r2, #0x2000
    bl func_ov097_022188f8
    add r0, sp, #0x48
    add r1, sp, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    add r0, sp, #0x28
    bl VecFx32Object_Destroy
    add r0, sp, #0x38
    bl VecFx32Object_Destroy
.L_0221880c:
    mov r0, r6
    ldr r2, [r0, #0x0]
    add r1, sp, #0x48
    ldr r2, [r2, #0xd0]
    blx r2
    mov r0, #0x1b
    strh r0, [r6, #0xd6]
    ldr r2, [r6, #0x3c]
    ldr r0, .L_022188f4
    mov r1, #0x0
    umull r4, r3, r2, r0
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    mla r3, r2, r0, r3
    adds r4, r4, #0x800
    adc r2, r3, #0x0
    mov r3, r4, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r6, #0x3c]
    ldr r3, [r6, #0x40]
    add r2, r6, #0x200
    umull r5, r4, r3, r0
    mla r4, r3, r1, r4
    mov r1, r3, asr #0x1f
    mla r4, r1, r0, r4
    adds r5, r5, #0x800
    adc r0, r4, #0x0
    mov r1, r5, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r6, #0x40]
    ldrsh r3, [r2, #0xba]
    ldrh r0, [r2, #0xb8]
    mov r1, #0xf
    add r0, r3, r0
    strh r0, [r2, #0xb8]
    ldrsh r0, [r2, #0x98]
    bl func_020befec
    cmp r1, #0x0
    bne .L_022188b8
    add r1, r6, #0x18
    mov r2, r1
    mov r0, #0x21
    bl TrackedResourceActor_SpawnFromKey
.L_022188b8:
    add r0, sp, #0x48
    bl VecFx32Object_Destroy
.L_022188c0:
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_022188c8: .word 0x1333
.L_022188cc: .word 0xf68c
.L_022188d0: .word data_ov097_0221aa1c
.L_022188d4: .word gHeapContext
.L_022188d8: .word 0x162f
.L_022188dc: .word data_020c9670
.L_022188e0: .word 0x166b
.L_022188e4: .word data_021052fc
.L_022188e8: .word gSoundContext
.L_022188ec: .word data_ov097_0221a4c8
.L_022188f0: .word 0x555
.L_022188f4: .word 0xccd
.size func_ov097_022181a0, . - func_ov097_022181a0
