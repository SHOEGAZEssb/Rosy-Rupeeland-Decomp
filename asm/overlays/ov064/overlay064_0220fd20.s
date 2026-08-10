.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern GameWork_ClearFlag
.extern Heap_Alloc
.extern Heap_Free
.extern Scene_Init
.extern Scene_SetFlags03
.extern data_020cdc1c
.extern data_020ed530
.extern data_020f4e14
.extern data_021052fc
.extern data_02105300
.extern data_ov064_02211dd4
.extern data_ov064_02211e40
.extern data_ov064_02211e98
.extern data_ov064_02211ec4
.extern data_ov064_02211ecc
.extern AnimationResource_Init
.extern GraphicsSpriteState_Create
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseTouchPrompt_SetEnabled
.extern GamePhaseCurrencyHud_SetVisible
.extern func_0201ded4
.extern func_0201e14c
.extern func_02025300
.extern ActorCollection_UnregisterAndDestroyAllActors
.extern func_0202d3cc
.extern func_0202d68c
.extern ActorCollection_GetSpriteOwner
.extern Actor_ReplaceAttachmentSlotResource
.extern Type7Actor_EnterSpecialPresentationState
.extern func_02058de0
.extern func_0205974c
.extern func_0206c978
.extern func_02072b68
.extern func_02073fc4
.extern func_020742cc
.extern func_0207a19c
.extern func_020ae1fc
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gLupyContext
.extern gSoundContext

.global func_ov064_0220fd20
func_ov064_0220fd20:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    mov r7, r1
    mov r5, r2
    bl Scene_Init
    ldr r1, .L_022105f4
    mov r0, #0x0
    str r1, [r4, #0x0]
    strh r0, [r4, #0x74]
    strb r7, [r4, #0x77]
    strh r0, [r4, #0x7c]
    strh r0, [r4, #0x7e]
    str r5, [r4, #0x80]
    ldr r1, .L_022105f8
    str r0, [r4, #0x84]
    ldr r1, [r1, #0x0]
    ldr r2, .L_022105fc
    add r1, r1, #0x2000
    ldr r5, [r1, #0xea4]
    ldr r1, .L_02210600
    ldr r6, [r5, #0x54]
    ldr r3, [r5, #0x1c]
    ldrsh r8, [r6, #0x2c]
    ldrsh r9, [r6, #0x2e]
    mov r3, r3, asr #0x10
    strh r3, [r4, #0x78]
    ldr r3, [r5, #0x20]
    mov r3, r3, asr #0x10
    strh r3, [r4, #0x7a]
    str r0, [r4, #0x3c]
    str r0, [r4, #0x40]
    str r0, [r4, #0x34]
    str r0, [r4, #0x38]
    str r0, [r4, #0x28]
    str r0, [r4, #0x2c]
    ldr r0, [r2, #0x0]
    bl GameWork_ClearFlag
    cmp r7, #0x3
    addls pc, pc, r7, lsl #0x2
    b .L_022105a8
.L_0220fdc4:
    b .L_0220fdd4
    b .L_0220ff14
    b .L_0221006c
    b .L_0221016c
.L_0220fdd4:
    ldr r1, .L_02210604
    ldr r3, .L_02210608
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fe00
    ldr r1, .L_0221060c
    sub r2, r1, #0x91
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_0220fe00:
    ldr r1, .L_022105f8
    str r0, [r4, #0x24]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    ldrh r3, [r6, #0x28]
    mov r2, #0x4
    mov r1, #0x2
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldrb r3, [r6, #0x3a]
    ldr r1, [r4, #0x24]
    mov r2, #0x0
    bl GraphicsSpriteState_Create
    ldr r1, .L_02210610
    str r0, [r4, #0x30]
    ldr r2, [r1, #0x0]
    ldr r1, [r1, #0x4]
    ldr r0, .L_022105f8
    str r2, [r4, #0x6c]
    str r1, [r4, #0x70]
    ldr r0, [r0, #0x0]
    ldrsh r1, [r4, #0x78]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldrsh r2, [r4, #0x7a]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x2c]
    blx r3
    str r0, [sp, #0x10]
    str r0, [sp, #0x18]
    mov r0, r0, lsl #0x16
    mov r3, r0, lsr #0x1b
    mov r2, #0x0
    sub r1, r3, #0x11
    cmp r1, #0x3
    bhi .L_0220feac
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0xb
    movne r2, r0
.L_0220feac:
    cmp r2, #0x0
    subne r9, r9, #0x18
    cmp r3, #0x6
    cmpne r3, #0x14
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    ldr r0, .L_022105f8
    strb r1, [r4, #0x76]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x0]
    bl func_0207a19c
    ldrsb r1, [r4, #0x76]
    ldr r2, .L_02210614
    mov r1, r1, lsl #0x1
    add r0, r2, r0, lsl #0x2
    ldrh r0, [r1, r0]
    str r0, [r4, #0x80]
    ldr r0, [r4, #0x30]
    strh r8, [r0, #0x2c]
    strh r9, [r0, #0x2e]
    b .L_022105c4
.L_0220ff14:
    ldr r1, .L_02210604
    ldr r3, .L_02210608
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220ff40
    mov r2, #0x1200
    ldr r1, .L_02210618
    add r3, r2, #0x1
    bl AnimationResource_Init
.L_0220ff40:
    ldr r1, .L_022105f8
    str r0, [r4, #0x24]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    ldrh r3, [r6, #0x28]
    mov r2, #0x0
    mov r1, #0x2
    sub r3, r3, #0x2
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldrb r3, [r6, #0x3a]
    ldr r1, [r4, #0x24]
    mov r2, #0x10
    bl GraphicsSpriteState_Create
    ldr r1, .L_02210610
    str r0, [r4, #0x30]
    ldr r2, [r1, #0x18]
    ldr r1, [r1, #0x1c]
    mov r0, #0x0
    str r2, [r4, #0x6c]
    str r1, [r4, #0x70]
    strb r0, [r4, #0x76]
    ldr r1, [r4, #0x30]
    ldr r0, .L_0221061c
    strh r8, [r1, #0x2c]
    strh r9, [r1, #0x2e]
    ldr r0, [r0, #0x0]
    mov r1, #0x52
    bl func_0205974c
    ldr r6, [r5, #0x26c]
    cmp r6, #0x0
    beq .L_022105c4
    beq .L_0220ffe0
    mov r0, r6
    bl func_0206c978
    mov r0, r6
    bl Heap_Free
.L_0220ffe0:
    ldr r0, .L_022105fc
    ldr r1, .L_02210620
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r6, #0x0
    ldr r1, .L_02210624
    ldr r3, .L_02210608
    mov r0, #0x38
    mov r2, #0x4
    str r6, [r5, #0x26c]
    bl Heap_Alloc
    movs r6, r0
    beq .L_02210050
    ldr r0, .L_022105f8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    mov r1, #0x1
    mov r2, r0
    mov r0, r6
    str r1, [sp, #0x0]
    mov r6, #0x0
    add r1, r5, #0x18
    mov r3, #0x1e
    str r6, [sp, #0x4]
    bl func_02025300
    mov r6, r0
.L_02210050:
    ldr r0, .L_022105f8
    mov r1, r6
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b .L_022105c4
.L_0221006c:
    ldr r1, .L_02210604
    ldr r3, .L_02210608
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210098
    ldr r1, .L_02210628
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_02210098:
    ldr r1, .L_022105f8
    str r0, [r4, #0x24]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    ldrh r3, [r6, #0x28]
    mov r1, #0x4
    mov r2, #0x2
    str r3, [sp, #0x0]
    stmib sp, {r1, r2}
    ldrb r3, [r6, #0x3a]
    ldr r1, [r4, #0x24]
    bl GraphicsSpriteState_Create
    str r0, [r4, #0x30]
    ldr r1, .L_02210610
    ldr r0, .L_022105f8
    ldr r2, [r1, #0x8]
    ldr r1, [r1, #0xc]
    str r2, [r4, #0x6c]
    str r1, [r4, #0x70]
    ldr r0, [r0, #0x0]
    ldrsh r1, [r4, #0x78]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldrsh r2, [r4, #0x7a]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x2c]
    blx r3
    str r0, [sp, #0xc]
    str r0, [sp, #0x14]
    mov r0, r0, lsl #0x16
    mov r0, r0, lsr #0x1b
    sub r1, r0, #0x11
    cmp r1, #0x3
    mov r2, #0x0
    bhi .L_0221013c
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0xb
    movne r2, r0
.L_0221013c:
    mov r0, #0x0
    strb r0, [r4, #0x76]
    ldr r1, [r4, #0x30]
    cmp r2, #0x0
    subne r9, r9, #0x12
    strh r8, [r1, #0x2c]
    strh r9, [r1, #0x2e]
    ldr r0, .L_0221061c
    mov r1, #0x53
    ldr r0, [r0, #0x0]
    bl func_0205974c
    b .L_022105c4
.L_0221016c:
    ldr r0, .L_022105f8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e14c
    ldr r0, .L_0221061c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02058de0
    ldr r0, .L_022105f8
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_UnregisterAndDestroyAllActors
    ldr r0, .L_0221062c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    ldr r1, [r5, #0x26c]
    cmp r1, #0x0
    ldrne r0, [r1, #0x20]
    orrne r0, r0, #0x40000
    strne r0, [r1, #0x20]
    ldr r0, .L_022105f8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    ldrne r1, [r0, #0x234]
    cmpne r1, #0x0
    ldrne r0, [r1, #0x20]
    orrne r0, r0, #0x40000
    strne r0, [r1, #0x20]
    ldr r0, .L_022105f8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl func_0202d3cc
    ldr r0, .L_022105f8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, #0x0
    bl func_0202d68c
    ldr r0, .L_022105f8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1f
    add r0, r0, #0x3000
    ldr r0, [r0, #0xe8]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xc]
    blx r3
    ldr r0, .L_02210630
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x8]
    bl GamePhaseTouchPrompt_SetEnabled
    ldr r0, .L_02210634
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r4, #0x3c]
    ldr r0, .L_02210638
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r4, #0x40]
    ldr r1, .L_02210604
    ldr r3, .L_02210608
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022102a4
    ldr r1, .L_0221063c
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_022102a4:
    mov r2, #0x0
    str r0, [r4, #0x24]
    str r2, [sp, #0x0]
    mov r0, #0x12
    stmib sp, {r0, r2}
    ldr r0, [r4, #0x3c]
    ldr r1, [r4, #0x24]
    mov r3, r2
    bl GraphicsSpriteState_Create
    str r0, [r4, #0x30]
    mov r1, #0x0
    mov r2, #0x1
    str r1, [sp, #0x0]
    mov r0, #0x12
    stmib sp, {r0, r1}
    ldr r0, [r4, #0x3c]
    ldr r1, [r4, #0x24]
    mov r3, r2
    bl GraphicsSpriteState_Create
    str r0, [r4, #0x34]
    ldr r1, [r6, #0x14]
    ldr r0, [r1, #0x10]
    cmp r0, #0x1000
    bne .L_02210354
    ldrb r0, [r6, #0x38]
    cmp r0, #0xf
    bgt .L_02210354
    ldr r1, .L_02210640
    mov r0, r5
    str r1, [sp, #0x0]
    sub r2, r1, #0x1
    sub r3, r1, #0x6a
    mov r1, #0x0
    bl Actor_ReplaceAttachmentSlotResource
    ldr r3, [r5, #0x208]
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x3c]
    ldmib r3, {r1, r2, r3}
    bl func_02073fc4
    mov r1, #0x1
    str r0, [r4, #0x38]
    bl func_02072b68
    b .L_02210378
.L_02210354:
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x3c]
    ldr r2, [r6, #0x18]
    ldr r3, [r6, #0x1c]
    bl func_02073fc4
    str r0, [r4, #0x38]
    ldrb r1, [r6, #0x38]
    bl func_02072b68
.L_02210378:
    ldr r0, [r4, #0x38]
    mov r1, #0x0
    strb r1, [r0, #0x3a]
    ldr r6, [r4, #0x38]
    ldr r1, .L_02210604
    ldrh r2, [r6, #0x24]
    ldr r3, .L_02210608
    mov r0, #0x10
    orr r5, r2, #0x2
    mov r2, #0x4
    strh r5, [r6, #0x24]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022103c0
    ldr r1, .L_02210644
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_022103c0:
    mov r2, #0x0
    str r0, [r4, #0x28]
    str r2, [sp, #0x0]
    mov r0, #0x2
    stmib sp, {r0, r2}
    ldr r0, [r4, #0x40]
    ldr r1, [r4, #0x28]
    mov r3, r2
    bl GraphicsSpriteState_Create
    mov r6, r0
    str r0, [r4, #0x68]
    mov r0, #0x100
    strh r0, [r6, #0x2c]
    mov r5, #0x20
    ldr r1, .L_02210604
    ldr r3, .L_02210608
    mov r0, #0x10
    mov r2, #0x4
    strh r5, [r6, #0x2e]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210428
    ldr r1, .L_02210648
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_02210428:
    str r0, [r4, #0x2c]
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r3, #0x10
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    ldr r0, [r4, #0x40]
    ldr r1, [r4, #0x2c]
    bl GraphicsSpriteState_Create
    str r0, [r4, #0x44]
    mov r1, #0x80
    strh r1, [r0, #0x2c]
    mov r1, #0x60
    strh r1, [r0, #0x2e]
    ldr r3, .L_0221064c
    add r2, sp, #0x1c
    mov r1, #0x8
.L_0221046c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_0221046c
    mov r10, #0x0
    mov r7, r10
    mov r6, #0x12
    add r11, sp, #0x1c
    mov r5, #0x60
.L_02210490:
    str r7, [sp, #0x0]
    stmib sp, {r6, r7}
    mov r0, r10, lsl #0x1
    ldrsh r2, [r11, r0]
    ldr r0, [r4, #0x40]
    ldr r1, [r4, #0x28]
    mov r3, r7
    bl GraphicsSpriteState_Create
    add r2, r4, r10, lsl #0x2
    mov r1, r10, lsl #0x4
    add r10, r10, #0x1
    str r0, [r2, #0x48]
    add r1, r1, #0x50
    strh r1, [r0, #0x2c]
    strh r5, [r0, #0x2e]
    cmp r10, #0x8
    blt .L_02210490
    ldr r0, .L_02210610
    mov r3, #0x5000000
    ldr r2, [r0, #0x20]
    ldr r0, [r0, #0x24]
    mov r1, #0x0
    str r2, [r4, #0x6c]
    str r0, [r4, #0x70]
    strb r1, [r4, #0x76]
    sub r0, r8, #0x80
    strh r0, [r4, #0x7c]
    sub r0, r9, #0x60
    strh r0, [r4, #0x7e]
    ldrsh r6, [r4, #0x7e]
    ldrsh r0, [r4, #0x7c]
    ldr r2, [r4, #0x3c]
    mov r8, #0x1
    str r0, [r2, #0x18]
    str r6, [r2, #0x1c]
    ldr r0, [r4, #0x3c]
    mov r7, #0x80
    str r8, [r0, #0x20]
    ldr r2, [r4, #0x40]
    ldr r0, .L_02210650
    str r1, [r2, #0x18]
    str r1, [r2, #0x1c]
    ldr r6, [r4, #0x40]
    add r2, r3, #0x400
    str r8, [r6, #0x20]
    ldr r6, [r4, #0x30]
    strh r7, [r6, #0x2c]
    strh r5, [r6, #0x2e]
    ldr r6, [r4, #0x34]
    strh r7, [r6, #0x2c]
    strh r5, [r6, #0x2e]
    ldr r6, [r4, #0x38]
    strh r7, [r6, #0x2c]
    strh r5, [r6, #0x2e]
    strh r1, [r3, #0x0]
    strh r1, [r2, #0x0]
    bl func_020ae1fc
    mvn r1, #0xf
    cmp r0, r1
    bne .L_022105c4
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x6
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b .L_022105c4
.L_022105a8:
    ldr r0, .L_02210654
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r0, [r0, #0x4]
    str r2, [r4, #0x6c]
    str r0, [r4, #0x70]
    strb r1, [r4, #0x76]
.L_022105c4:
    ldr r0, .L_022105f8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_022105e0
    bl Type7Actor_EnterSpecialPresentationState
.L_022105e0:
    mov r0, r4
    bl Scene_SetFlags03
    mov r0, r4
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022105f4: .word data_ov064_02211e98
.L_022105f8: .word data_021052fc
.L_022105fc: .word gGameWork
.L_02210600: .word 0x3f5
.L_02210604: .word data_ov064_02211ec4
.L_02210608: .word gHeapContext
.L_0221060c: .word 0x1092
.L_02210610: .word data_ov064_02211e40
.L_02210614: .word data_020ed530
.L_02210618: .word 0x11ff
.L_0221061c: .word gSoundContext
.L_02210620: .word 0x3ee
.L_02210624: .word data_ov064_02211ecc
.L_02210628: .word 0x1096
.L_0221062c: .word gLupyContext
.L_02210630: .word data_02105300
.L_02210634: .word data_020f4e14
.L_02210638: .word gDebugFont
.L_0221063c: .word 0x104c
.L_02210640: .word 0x106b
.L_02210644: .word 0x3303
.L_02210648: .word 0x3306
.L_0221064c: .word data_ov064_02211dd4
.L_02210650: .word 0x400006c
.L_02210654: .word data_020cdc1c
.size func_ov064_0220fd20, . - func_ov064_0220fd20
