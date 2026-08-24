.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern Heap_Alloc
.extern data_020c9670
.extern gGamePhaseRuntime
.extern data_ov077_02216fc8
.extern data_ov077_02217058
.extern data_ov077_022174d8
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotionJitter_EnsureMinimum
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern AuxiliaryTimedSpritePresentation_Init
.extern Actor_TurnTowardVector
.extern Actor_TurnTowardTargetPosition
.extern Actor_PlayHorizontalSpatialSound
.extern ActorExtendedType2_IncrementSavedProgressCounter
.extern PresentationBackedActor_SpawnAmountVariant
.extern func_020538a4
.extern Graphics3dPresentation_CreatePreset11To13SpriteEffectAt
.extern func_020ada8c
.extern func_020befec
.extern func_020bf1f8
.extern func_ov077_02214cd4
.extern func_ov077_02214ce4
.extern func_ov077_02214e00
.extern func_ov077_02214fc0
.extern func_ov090_0221c44c
.extern gHeapContext
.extern genrand_int32

.global func_ov077_02215494
func_ov077_02215494:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x68
    mov r5, r0
    add r0, r5, #0x200
    mov r2, #0x5a
    strh r2, [r0, #0xee]
    ldr r0, [r5, #0x308]
    mov r4, r1
    mov r1, r0, lsl #0x10
    movs r0, r1, asr #0x10
    beq .L_022154e4
    ldr r0, [r5, #0x10]
    tst r0, #0x4
    beq .L_022154e4
    mov r0, r1, lsr #0x10
    orr r1, r0, #0x4f0000
    mov r0, #0x10000
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r0, [r5, #0x308]
.L_022154e4:
    ldr r0, [r5, #0x308]
    mov r0, r0, asr #0x10
    cmp r0, #0x0
    ble .L_02215538
    mov r1, #0x14
    bl func_020ada8c
    cmp r0, #0x0
    bne .L_0221551c
    mov r0, r5
    mov r1, #0x8
    bl func_ov077_02214fc0
    add r0, r5, #0x200
    mov r1, #0x8
    strh r1, [r0, #0xec]
.L_0221551c:
    ldr r2, [r5, #0x308]
    mov r0, r2, asr #0x10
    sub r1, r0, #0x1
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r5, #0x308]
.L_02215538:
    mov r0, r5
    bl func_020538a4
    movs r1, r0
    beq .L_02215550
    mov r0, r5
    bl func_ov077_02214e00
.L_02215550:
    ldr r0, .L_02215ee8
    mov r6, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r7, [r0, #0xea4]
    ldr r0, [r7, #0xd0]
    tst r0, #0x100
    addeq r0, r5, #0x200
    ldreqsh r1, [r0, #0xea]
    cmpeq r1, #0x0
    bne .L_022156cc
    ldrh r1, [r0, #0xf2]
    mov r2, r1, lsl #0x1e
    movs r2, r2, lsr #0x1f
    beq .L_022156cc
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_022156cc
    ldrh r0, [r0, #0xe8]
    cmp r0, #0x0
    movne r6, #0x1
    bne .L_022156cc
    ldrsh r2, [r5, #0xd8]
    ldr r1, [r5, #0x20]
    ldr r3, [r5, #0x234]
    ldrsh r9, [r4, #0x8]
    sub r3, r1, r3
    cmp r2, #0xd
    addeq r2, r9, r9, lsr #0x1f
    mov r3, r3, asr #0xc
    moveq r9, r2, asr #0x1
    mul r2, r3, r3
    ldr r0, [r5, #0x1c]
    ldr r8, [r5, #0x230]
    sub r8, r0, r8
    mov r8, r8, asr #0xc
    mla r3, r8, r8, r2
    mul r2, r9, r9
    cmp r3, r2
    bge .L_022156cc
    ldr lr, [r5, #0x278]
    cmp lr, #0x0
    beq .L_0221569c
    ldr r0, [r7, #0x1c]
    ldr r1, [r7, #0x20]
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x4
    mov r2, r0, asr #0x10
    mov r3, r1, asr #0x10
    ldr ip, [lr, #0x8]
    mov r0, #0x0
    mov r11, #0x1
    b .L_02215684
.L_02215624:
    ldr r1, [lr, #0x4]
    add r1, r1, r0, lsl #0x3
    ldrsh r8, [r1, #0x6]
    ldrsh r9, [r1, #0x2]
    ldrsh r10, [r1, #0x0]
    cmp r3, r8
    movlt r8, r11
    movge r8, #0x0
    cmp r3, r9
    movge r9, #0x1
    movlt r9, #0x0
    cmp r2, r10
    movge r10, #0x1
    ldrsh r1, [r1, #0x4]
    movlt r10, #0x0
    cmp r2, r1
    movlt r1, #0x1
    movge r1, #0x0
    and r1, r10, r1
    and r1, r9, r1
    tst r8, r1
    movne r0, #0x1
    bne .L_02215690
    add r0, r0, #0x1
.L_02215684:
    cmp r0, ip
    blt .L_02215624
    mov r0, #0x0
.L_02215690:
    cmp r0, #0x0
    movne r6, #0x1
    b .L_022156cc
.L_0221569c:
    ldr r2, [r7, #0x20]
    ldr r3, [r7, #0x1c]
    sub r1, r1, r2
    mov r2, r1, asr #0xc
    mul r1, r2, r2
    sub r0, r0, r3
    mov r0, r0, asr #0xc
    mla r1, r0, r0, r1
    ldrsh r2, [r4, #0xa]
    smulbb r0, r2, r2
    cmp r1, r0
    movlt r6, #0x1
.L_022156cc:
    cmp r6, #0x0
    beq .L_02215728
    ldr r1, .L_02215eec
    mov r0, r5
    ldr r3, [r1, #0x0]
    ldr r2, [r1, #0x4]
    add r1, r7, #0x18
    str r3, [r5, #0x218]
    str r2, [r5, #0x21c]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd0]
    blx r2
    mov r1, #0x2
    mov r0, r5
    strh r1, [r5, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x144]
    blx r1
    mov r2, r0
    mov r0, r5
    add r1, r7, #0x18
    bl Actor_TurnTowardTargetPosition
    b .L_022158a8
.L_02215728:
    ldr r0, [r5, #0x308]
    mov r0, r0, asr #0x10
    cmp r0, #0x0
    ble .L_02215810
    ldr r1, .L_02215eec
    add r0, sp, #0x58
    ldr r3, [r1, #0x40]
    ldr r2, [r1, #0x44]
    add r1, r5, #0x22c
    str r3, [r5, #0x218]
    str r2, [r5, #0x21c]
    bl VecFx32Object_InitCopy
    ldr r1, [r5, #0x308]
    mov r0, #0x64
    mov r1, r1, asr #0x10
    sub r1, r1, #0x28
    mul r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r2, r0, lsl #0x1
    ldr r1, .L_02215ef0
    mov r0, r3, lsl #0x1
    ldrsh r0, [r1, r0]
    ldrsh r2, [r1, r2]
    ldr r1, [sp, #0x5c]
    ldr r3, [sp, #0x60]
    add r1, r1, r0, lsl #0x5
    add r2, r3, r2, lsl #0x5
    str r1, [sp, #0x5c]
    mov r0, r5
    str r2, [sp, #0x60]
    ldr r2, [r0, #0x0]
    add r1, sp, #0x58
    ldr r2, [r2, #0xd0]
    blx r2
    ldr r0, [r5, #0x3c]
    mov r1, #0x2
    mov r0, r0, lsl #0x2
    str r0, [r5, #0x3c]
    ldr r2, [r5, #0x40]
    mov r0, r5
    mov r2, r2, lsl #0x2
    str r2, [r5, #0x40]
    strh r1, [r5, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x140]
    blx r1
    mov r3, r0
    ldr r1, [r5, #0x3c]
    ldr r2, [r5, #0x40]
    mov r0, r5
    bl Actor_TurnTowardVector
    add r0, sp, #0x58
    bl VecFx32Object_Destroy
    b .L_022158a8
.L_02215810:
    ldr r1, .L_02215eec
    add r0, sp, #0x48
    ldr r3, [r1, #0x38]
    ldr r2, [r1, #0x3c]
    add r1, r5, #0x22c
    str r3, [r5, #0x218]
    str r2, [r5, #0x21c]
    bl VecFx32Object_InitCopy
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, sp, #0x48
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, r5, #0x200
    ldrsh r0, [r0, #0xea]
    cmp r0, #0x0
    movle r0, #0x2
    strleh r0, [r5, #0xd6]
    ble .L_0221587c
    mov r0, #0x5
    strh r0, [r5, #0xd6]
    ldr r0, [r5, #0x3c]
    add r0, r0, r0, lsl #0x1
    str r0, [r5, #0x3c]
    ldr r0, [r5, #0x40]
    add r0, r0, r0, lsl #0x1
    str r0, [r5, #0x40]
.L_0221587c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x140]
    blx r1
    mov r3, r0
    ldr r1, [r5, #0x3c]
    ldr r2, [r5, #0x40]
    mov r0, r5
    bl Actor_TurnTowardVector
    add r0, sp, #0x48
    bl VecFx32Object_Destroy
.L_022158a8:
    ldr r0, [r5, #0x298]
    bl func_ov090_0221c44c
    add r3, r0, #0x1
    mov r0, #0x18
    mul r9, r3, r0
    add r2, r5, #0x200
    ldrsh r1, [r2, #0xec]
    sub r8, r9, #0x30
    cmp r1, #0x0
    subgt r0, r1, #0x1
    strgth r0, [r2, #0xec]
    bgt .L_02215ea4
    ldrsh r1, [r2, #0xea]
    cmp r1, #0x0
    ble .L_02215be4
    cmp r1, #0x1
    bne .L_0221590c
    strh r9, [r2, #0xe6]
    sub r0, r0, #0x1a
    strb r0, [r5, #0x2e5]
    mov r0, #0x2
    strh r0, [r2, #0xea]
    mov r0, #0x0
    strh r0, [r2, #0x5a]
    b .L_02215ea4
.L_0221590c:
    cmp r1, #0x2
    bne .L_02215ea4
    ldrsh r0, [r2, #0x5a]
    mov r1, #0xa
    add r0, r0, #0x1
    strh r0, [r2, #0x5a]
    ldrsh r0, [r2, #0x5a]
    bl func_020befec
    cmp r1, #0x0
    bne .L_02215944
    ldr r1, .L_02215ef4
    mov r0, r5
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
.L_02215944:
    add r0, r5, #0x200
    ldrsh r0, [r0, #0xe6]
    cmp r0, #0x40
    bgt .L_02215ea4
    ldrh r0, [r5, #0x4e]
    cmp r0, #0x84
    ldreq r1, .L_02215ef8
    beq .L_02215970
    cmp r0, #0x85
    ldreq r1, .L_02215efc
    ldrne r1, .L_02215f00
.L_02215970:
    mov r0, r5
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
    ldr r1, .L_02215f04
    mov r0, r5
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
    ldrsh r0, [r5, #0xda]
    cmp r0, #0x2
    blt .L_02215b30
    add r0, r5, #0x200
    mov r2, #0xc0
    strh r2, [r0, #0xec]
    ldr r1, .L_02215eec
    mov r0, r5
    ldr r2, [r1, #0x10]
    ldr r1, [r1, #0x14]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    bl ActorExtendedType2_IncrementSavedProgressCounter
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x38
    bl func_ov077_02214cd4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    bl func_ov077_02214cd4
    mov r1, #0x0
    add r0, r5, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov077_02214cd4
    ldrb r2, [r5, #0x2e4]
    add r0, sp, #0x38
    add r1, r5, #0x18
    bic r2, r2, #0x70
    strb r2, [r5, #0x2e4]
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0x44]
    mov r0, r5
    add r1, r1, #0x8000
    str r1, [sp, #0x44]
    ldr r1, .L_02215f08
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
    ldr r1, .L_02215f0c
    mov r0, r5
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
    add r4, r5, #0x200
    ldrsh r0, [r4, #0xf0]
    cmp r0, #0x0
    ble .L_02215acc
    ldr r7, .L_02215f10
    mov r10, #0x0
    mov r8, #0x6000
    add r11, sp, #0x28
.L_02215a60:
    bl genrand_int32
    mov r9, r0
    mov r1, r8
    bl func_020bf1f8
    mov r0, r9, lsr #0x4
    mov r9, r1
    mov r1, r7
    bl func_020bf1f8
    mov r0, r1
    rsb r2, r0, #0x4000
    rsb r1, r9, #0x3000
    mov r0, r11
    mov r3, #0x3000
    bl VecFx32Object_InitComponents
    ldrsh r1, [r4, #0xf0]
    mov r0, #0x168
    add r2, sp, #0x38
    mov r3, r11
    bl PresentationBackedActor_SpawnAmountVariant
    ldr r1, [r0, #0x14]
    bic r1, r1, #0x200
    str r1, [r0, #0x14]
    mov r0, r11
    bl VecFx32Object_Destroy
    add r10, r10, #0x1
    cmp r10, #0xa
    blt .L_02215a60
.L_02215acc:
    ldr r0, .L_02215ee8
    ldr r4, [r5, #0x29c]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    ldr r1, [r4, #0x24]
    ldr r2, [r4, #0x20]
    mov r1, r1, asr #0xc
    ldr r3, [r4, #0x1c]
    rsb r1, r1, r2, asr #0xc
    mov r2, r3, asr #0xc
    add r3, r1, #0x18
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset11To13SpriteEffectAt
    ldr r0, .L_02215ee8
    mov r1, #0x2d
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
    add r0, sp, #0x38
    bl VecFx32Object_Destroy
    b .L_02215bc8
.L_02215b30:
    ldr r1, .L_02215f14
    ldr r3, .L_02215f18
    add r4, r5, #0x200
    mov r7, #0x80
    mov r0, #0x14
    mov r2, #0x4
    strh r7, [r4, #0xec]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02215b9c
    ldr r3, .L_02215f1c
    mvn r2, #0x7
    str r3, [sp, #0x0]
    add r1, r3, #0x5
    str r1, [sp, #0x4]
    ldrsh r4, [r5, #0xda]
    mov r1, #0x1
    add r3, r3, #0x4
    str r4, [sp, #0x8]
    str r2, [sp, #0xc]
    str r1, [sp, #0x10]
    str r1, [sp, #0x14]
    ldr r1, [r5, #0x54]
    ldr r4, [r5, #0x29c]
    ldr r2, [r1, #0x0]
    add r1, r4, #0x18
    bl AuxiliaryTimedSpritePresentation_Init
.L_02215b9c:
    ldr r0, .L_02215ee8
    mov r1, #0xf
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
    ldr r1, .L_02215f04
    mov r0, r5
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
.L_02215bc8:
    ldrsh r2, [r5, #0xda]
    add r0, r5, #0x200
    mov r1, #0x0
    add r2, r2, #0x1
    strh r2, [r5, #0xda]
    strh r1, [r0, #0xea]
    b .L_02215ea4
.L_02215be4:
    ldrh r0, [r2, #0xf2]
    mov r0, r0, lsl #0x1d
    movs r3, r0, lsr #0x1f
    moveq r0, #0x0
    streqh r0, [r2, #0xe8]
    beq .L_02215ea4
    ldrsh r1, [r2, #0xcc]
    ldrsh r0, [r2, #0xce]
    cmp r1, r0
    bge .L_02215db0
    ldrsh r0, [r2, #0xa2]
    cmp r0, #0x3d
    bge .L_02215d34
    add r0, sp, #0x18
    add r1, r7, #0x18
    bl VecFx32Object_InitCopy
    add r0, r5, #0x200
    ldrsh r2, [r0, #0xa2]
    mov r1, #0x1e
    add r2, r2, #0x1
    strh r2, [r0, #0xa2]
    ldrsh r0, [r0, #0xa2]
    bl func_020befec
    cmp r1, #0x0
    bne .L_02215d00
    bl genrand_int32
    add r1, r5, #0x200
    ldrsb r1, [r1, #0xe4]
    mov r7, r0
    mov r0, r1, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    mov r0, r7
    beq .L_02215cac
    mov r1, #0x60
    bl func_020bf1f8
    ldr r2, [sp, #0x1c]
    sub r1, r1, #0x30
    add r2, r2, r1, lsl #0xc
    mov r0, r7, lsr #0x8
    mov r1, #0x60
    str r2, [sp, #0x1c]
    bl func_020bf1f8
    ldr r2, [sp, #0x20]
    sub r0, r1, #0x30
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x20]
    b .L_02215cdc
.L_02215cac:
    mov r1, #0x30
    bl func_020bf1f8
    mov r0, r7, lsr #0x8
    and r0, r0, #0x1f
    ldr r2, [sp, #0x1c]
    sub r1, r1, #0x18
    add r2, r2, r1, lsl #0xc
    ldr r1, [sp, #0x20]
    sub r0, r0, #0x10
    add r0, r1, r0, lsl #0xc
    str r2, [sp, #0x1c]
    str r0, [sp, #0x20]
.L_02215cdc:
    add r1, sp, #0x18
    mov r0, r5
    mov r2, r4
    bl func_ov077_02214ce4
    mov r0, #0x2000
    str r0, [r5, #0x44]
    mov r0, #0x1000
    str r0, [r5, #0x94]
    b .L_02215d28
.L_02215d00:
    mov r0, r8, asr #0x2
    add r0, r8, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    rsb r0, r0, #0x1e
    cmp r1, r0
    addeq r0, r5, #0x200
    moveq r1, #0x0
    streqh r1, [r0, #0xe6]
    moveq r0, #0x8
    streqb r0, [r5, #0x2e5]
.L_02215d28:
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    b .L_02215d74
.L_02215d34:
    add r0, r1, #0x1
    strh r0, [r2, #0xcc]
    ldrsh r1, [r2, #0xcc]
    ldrsh r0, [r2, #0xce]
    cmp r1, r0
    blt .L_02215d74
    ldrsb r0, [r2, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    addne r0, r5, #0x200
    ldrneh r1, [r0, #0xf2]
    bicne r1, r1, #0x4
    strneh r1, [r0, #0xf2]
.L_02215d74:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r5, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, r5, #0x200
    ldrsh r0, [r0, #0xa2]
    mov r1, #0x1e
    bl func_020befec
    cmp r1, #0x14
    movlt r0, #0xd
    strlth r0, [r5, #0xd6]
    movge r0, #0x2
    strgeh r0, [r5, #0xd6]
    b .L_02215ea4
.L_02215db0:
    ldrsh r1, [r2, #0xc8]
    ldrsh r0, [r2, #0xca]
    cmp r1, r0
    bge .L_02215dd8
    mov r0, #0x0
    strh r0, [r2, #0xe8]
    ldrsh r0, [r2, #0xc8]
    add r0, r0, #0x1
    strh r0, [r2, #0xc8]
    b .L_02215ea4
.L_02215dd8:
    cmp r3, #0x0
    beq .L_02215ea4
    ldrsb r0, [r2, #0xe5]
    mov r3, #0x0
    cmp r0, #0x0
    bgt .L_02215e28
    ldr r0, .L_02215eec
    ldr r2, [r5, #0x218]
    ldr r0, [r0, #0x90]
    mov r9, #0x1
    cmp r2, r0
    ldr r0, .L_02215f20
    bne .L_02215e20
    ldr r1, [r5, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r9, #0x0
.L_02215e20:
    cmp r9, #0x0
    moveq r3, #0x1
.L_02215e28:
    cmp r3, #0x0
    beq .L_02215e4c
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xe6]
    mov r1, #0x8
    strb r1, [r5, #0x2e5]
    mov r1, #0x1
    strh r1, [r0, #0xe8]
.L_02215e4c:
    add r3, r5, #0x200
    ldrsh r0, [r3, #0xe6]
    cmp r0, r8
    movlt r0, #0x1000
    strlt r0, [r5, #0x44]
    blt .L_02215ea4
    mov r8, #0x0
    strh r8, [r3, #0xc8]
    strh r8, [r3, #0xcc]
    mov r0, r5
    mov r2, r4
    add r1, r7, #0x18
    strh r8, [r3, #0xa2]
    bl func_ov077_02214ce4
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    add r0, r5, #0x200
    mov r1, #0x2
    strh r1, [r0, #0xe8]
    ldr r0, [r5, #0x44]
    add r0, r0, #0x2800
    str r0, [r5, #0x44]
.L_02215ea4:
    ldrb r1, [r5, #0x2e4]
    and r0, r6, #0xff
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x80
    orr r0, r1, r0, lsr #0x18
    strb r0, [r5, #0x2e4]
    ldrsh r0, [r5, #0xd6]
    cmp r0, #0x2
    bne .L_02215edc
    add r0, r5, #0x200
    ldrsb r0, [r0, #0xe5]
    cmp r0, #0x0
    movne r0, #0x3
    strneh r0, [r5, #0xd6]
.L_02215edc:
    mov r0, #0x0
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02215ee8: .word gGamePhaseRuntime
.L_02215eec: .word data_ov077_02216fc8
.L_02215ef0: .word data_020c9670
.L_02215ef4: .word 0x9f84
.L_02215ef8: .word 0x9f8a
.L_02215efc: .word 0x9f8c
.L_02215f00: .word 0x9f88
.L_02215f04: .word 0x4281
.L_02215f08: .word 0x9f85
.L_02215f0c: .word 0x9f83
.L_02215f10: .word 0x1770
.L_02215f14: .word data_ov077_022174d8
.L_02215f18: .word gHeapContext
.L_02215f1c: .word 0x12a7
.L_02215f20: .word data_ov077_02217058
.size func_ov077_02215494, . - func_ov077_02215494
