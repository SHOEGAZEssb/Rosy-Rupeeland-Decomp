; Matching retail form; see src/game/tracked_resource_actor_effects.c.
.extern Heap_Alloc
.extern gTrackedResourceActorSpriteEffectAllocationTag
.extern data_021052fc
.extern gHeapContext
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern AuxiliaryTimedSpritePresentation_Init
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern Actor_PlayRadialSpatialSound
.extern Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
.extern Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
.extern Graphics3dPresentation_CreatePreset20To21ScaledPointSpriteEffectAt
.extern Graphics3dPresentation_CreatePreset28To29PointSpriteEffectAt
.text

    .global TrackedResourceActor_EmitRecordEffects
TrackedResourceActor_EmitRecordEffects: ; 0x02050260
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    ldr r1, .L_02050554
    mov r6, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    ldr r1, [r6, #0x1fc]
    ldrsb r5, [r1, #0x12]
    cmp r5, #0x1e
    addls pc, pc, r5, lsl #0x2
    b .L_020504b0
.L_02050294: ; jump table
    b .L_02050310 ; case 0
    b .L_02050338 ; case 1
    b .L_02050364 ; case 2
    b .L_02050388 ; case 3
    b .L_020504b0 ; case 4
    b .L_020503ac ; case 5
    b .L_020503d8 ; case 6
    b .L_020504b0 ; case 7
    b .L_020504b0 ; case 8
    b .L_020504b0 ; case 9
    b .L_02050404 ; case 10
    b .L_02050404 ; case 11
    b .L_02050404 ; case 12
    b .L_02050404 ; case 13
    b .L_02050404 ; case 14
    b .L_02050404 ; case 15
    b .L_020504b0 ; case 16
    b .L_020504b0 ; case 17
    b .L_020504b0 ; case 18
    b .L_020504b0 ; case 19
    b .L_02050430 ; case 20
    b .L_02050430 ; case 21
    b .L_02050430 ; case 22
    b .L_02050430 ; case 23
    b .L_02050430 ; case 24
    b .L_0205045c ; case 25
    b .L_020504b0 ; case 26
    b .L_020504b0 ; case 27
    b .L_020504b0 ; case 28
    b .L_020504b0 ; case 29
    b .L_02050488 ; case 30
.L_02050310:
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r2, [r6, #0x24]
    ldr r5, [r6, #0x1c]
    ldr r4, [r6, #0x20]
    mov r3, r2, asr #0xc
    mov r2, r5, asr #0xc
    rsb r3, r3, r4, asr #0xc
    bl Graphics3dPresentation_CreatePreset20To21ScaledPointSpriteEffectAt
    b .L_020504b0
.L_02050338:
    mov r1, #0x5
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x24]
    ldr r2, [r6, #0x1c]
    ldr r3, [r6, #0x20]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x1
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    b .L_020504b0
.L_02050364:
    ldr r1, [r6, #0x24]
    ldr r2, [r6, #0x1c]
    ldr r3, [r6, #0x20]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x0
    bl Graphics3dPresentation_CreatePreset28To29PointSpriteEffectAt
    b .L_020504b0
.L_02050388:
    ldr r1, [r6, #0x24]
    ldr r2, [r6, #0x1c]
    ldr r3, [r6, #0x20]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x1
    bl Graphics3dPresentation_CreatePreset28To29PointSpriteEffectAt
    b .L_020504b0
.L_020503ac:
    mov r1, #0x5
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x24]
    ldr r2, [r6, #0x1c]
    ldr r3, [r6, #0x20]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    b .L_020504b0
.L_020503d8:
    mov r1, #0x5
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x24]
    ldr r2, [r6, #0x1c]
    ldr r3, [r6, #0x20]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x3
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    b .L_020504b0
.L_02050404:
    mov r1, #0x4
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x24]
    ldr r2, [r6, #0x1c]
    ldr r4, [r6, #0x20]
    mov r3, r1, asr #0xc
    sub r1, r5, #0xa
    mov r2, r2, asr #0xc
    rsb r3, r3, r4, asr #0xc
    bl Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
    b .L_020504b0
.L_02050430:
    sub r1, r5, #0xd
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x24]
    ldr r2, [r6, #0x1c]
    ldr r3, [r6, #0x20]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x1
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    b .L_020504b0
.L_0205045c:
    mov r1, #0xf
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x24]
    ldr r2, [r6, #0x1c]
    ldr r3, [r6, #0x20]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x1
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    b .L_020504b0
.L_02050488:
    mov r1, #0xc
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x24]
    ldr r2, [r6, #0x1c]
    ldr r3, [r6, #0x20]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x0
    bl Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
.L_020504b0:
    ldr r0, [r6, #0x1fc]
    ldrh r0, [r0, #0x16]
    cmp r0, #0x0
    beq .L_02050530
    ldr r1, .L_02050558
    ldr r3, .L_0205055c
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_02050530
    ldr r5, [r6, #0x1fc]
    mov r0, r6
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldrh r1, [r5, #0x18]
    mov ip, #0x0
    sub r3, ip, #0x4
    str r1, [sp, #0x0]
    ldrh lr, [r5, #0x1a]
    sub r1, ip, #0x1
    mov r2, r0
    str lr, [sp, #0x4]
    str ip, [sp, #0x8]
    str r3, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r0, #0x1
    str r0, [sp, #0x14]
    ldrh r3, [r5, #0x16]
    mov r0, r4
    add r1, r6, #0x18
    bl AuxiliaryTimedSpritePresentation_Init
.L_02050530:
    ldr r0, [r6, #0x1fc]
    ldrh r1, [r0, #0x1c]
    cmp r1, #0x0
    beq .L_0205054c
    mov r0, r6
    mov r2, #0x0
    bl Actor_PlayRadialSpatialSound
.L_0205054c:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_02050554: .word data_021052fc
.L_02050558: .word gTrackedResourceActorSpriteEffectAllocationTag
.L_0205055c: .word gHeapContext
.size TrackedResourceActor_EmitRecordEffects, . - TrackedResourceActor_EmitRecordEffects

