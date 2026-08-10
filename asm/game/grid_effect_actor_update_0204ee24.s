; Matching retail form; see src/game/grid_effect_actor_update.c.
.extern SceneManager_GetCurrent
.extern data_020f4e14
.extern data_021052fc
.extern data_02105790
.extern gSceneManager
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern GraphicsSpriteState_SetScreenPositionCulled
.extern ActorCollection_QueueActorForRemoval
.extern Actor_GetCollection
.extern Actor_QueryTerrainHeight
.extern Type7Actor_GetStateCode
.extern func_0204f478
.extern func_0204f4d4
.extern func_020628c8
.extern GraphicsSpriteRenderer_SetFontResource
.extern GraphicsSpriteRenderer_DrawText
.extern GraphicsSpriteRenderer_MeasureText
.extern func_020ada8c
.extern func_020adcac
.text

    .global func_0204ee24
func_0204ee24: ; 0x0204ee24
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x14
    mov r5, r0
    add r2, r5, #0x100
    ldrh r3, [r2, #0xf0]
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x12
    cmp r0, #0x2000
    bhs .L_0204ee68
    add r0, r0, #0x1
    mov r1, r0, lsl #0x10
    ldr r0, .L_0204f460
    mov r1, r1, lsr #0x10
    and r3, r3, r0
    mov r0, r1, lsl #0x12
    orr r0, r3, r0, lsr #0x10
    strh r0, [r2, #0xf0]
.L_0204ee68:
    mov r2, #0x0
    add r0, r5, #0x28
    add r1, r5, #0x18
    strb r2, [r5, #0x21b]
    bl VecFx32Object_Assign
    add r0, r5, #0x100
    ldrh r0, [r0, #0xf0]
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_0204f3a8
.L_0204ee98: ; jump table
    b .L_0204eea8 ; case 0
    b .L_0204ef4c ; case 1
    b .L_0204f138 ; case 2
    b .L_0204f394 ; case 3
.L_0204eea8:
    ldr r2, [r5, #0x54]
    mov r0, r5
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xb0]
    blx r1
    ldr r2, [r5, #0x44]
    add r1, r5, #0x38
    sub r0, r2, r0
    str r0, [r5, #0x44]
    add r0, r5, #0x18
    bl VecFx32Object_Add
    ldr r1, [r5, #0x1dc]
    ldr r0, [r5, #0x24]
    cmp r0, r1
    bge .L_0204ef20
    str r1, [r5, #0x24]
    add r0, r5, #0x100
    ldrh r2, [r0, #0xf0]
    mov r1, #0x0
    bic r2, r2, #0x3
    orr r2, r2, #0x1
    strh r2, [r0, #0xf0]
    strh r1, [r0, #0xf2]
    str r1, [r5, #0x44]
    str r1, [r5, #0x40]
    str r1, [r5, #0x3c]
    b .L_0204f3a8
.L_0204ef20:
    ldrb r0, [r5, #0x4b]
    tst r0, #0x3
    ldrne r0, [r5, #0x3c]
    rsbne r0, r0, #0x0
    strne r0, [r5, #0x3c]
    ldrb r0, [r5, #0x4b]
    tst r0, #0xc
    ldrne r0, [r5, #0x40]
    rsbne r0, r0, #0x0
    strne r0, [r5, #0x40]
    b .L_0204f3a8
.L_0204ef4c:
    ldr r0, .L_0204f464
    ldr r2, [r5, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r1, [r5, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r4, r2, asr #0x10
    ldr r3, [r0, #0x0]
    mov r6, r1, asr #0x10
    ldr r3, [r3, #0x2c]
    mov r1, r4
    mov r2, r6
    blx r3
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1c
    str r0, [sp, #0xc]
    str r0, [sp, #0x10]
    cmp r1, #0x1
    bne .L_0204eff8
    mov r0, r5
    mov r1, r4
    mov r2, r6
    bl Actor_QueryTerrainHeight
    ldr r1, [r5, #0x24]
    mov r0, r0, lsl #0x4
    cmp r0, r1, asr #0xc
    blt .L_0204f064
    mov r0, r5
    bl Actor_GetCollection
    mov r1, r5
    bl ActorCollection_QueueActorForRemoval
    add r0, r5, #0x100
    ldrh r2, [r0, #0xf0]
    ldr r1, .L_0204f464
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r0, #0xf0]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3000
    ldr r1, [r0, #0xb8]
    orr r1, r1, #0x10
    str r1, [r0, #0xb8]
    b .L_0204f064
.L_0204eff8:
    mov r0, r0, lsl #0x16
    mov r0, r0, lsr #0x1b
    cmp r0, #0xe
    bne .L_0204f064
    mov r0, r5
    mov r1, r4
    mov r2, r6
    bl Actor_QueryTerrainHeight
    ldr r1, [r5, #0x24]
    mov r0, r0, lsl #0x4
    cmp r0, r1, asr #0xc
    blt .L_0204f064
    mov r0, r5
    bl Actor_GetCollection
    mov r1, r5
    bl ActorCollection_QueueActorForRemoval
    ldr r0, .L_0204f464
    add r1, r5, #0x100
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r2, [r0, #0xb8]
    orr r2, r2, #0x10
    str r2, [r0, #0xb8]
    ldrh r0, [r1, #0xf0]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1, #0xf0]
.L_0204f064:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x18]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_0204f3a8
    ldr r0, .L_0204f468
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    bne .L_0204f124
    add r1, r5, #0x100
    ldrsh r2, [r1, #0xf2]
    add r0, r5, #0x200
    add r2, r2, #0x1
    strh r2, [r1, #0xf2]
    ldrsh r0, [r0, #0x18]
    ldrsh r1, [r1, #0xf2]
    cmp r1, r0
    bge .L_0204f0e4
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    ble .L_0204f3a8
    tst r1, #0x4
    ldr r1, [r5, #0x54]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    b .L_0204f3a8
.L_0204f0e4:
    mov r0, r5
    bl Actor_GetCollection
    mov r1, r5
    bl ActorCollection_QueueActorForRemoval
    ldr r0, .L_0204f464
    add r1, r5, #0x100
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r2, [r0, #0xb8]
    orr r2, r2, #0x10
    str r2, [r0, #0xb8]
    ldrh r0, [r1, #0xf0]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1, #0xf0]
    b .L_0204f3a8
.L_0204f124:
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    b .L_0204f3a8
.L_0204f138:
    ldr r0, [r5, #0x14]
    mov r4, #0x0
    orr r0, r0, #0x80
    str r0, [r5, #0x14]
    ldr r1, [r5, #0x54]
    add r0, r5, #0x200
    strb r4, [r1, #0x3a]
    ldrsb r0, [r0, #0x1a]
    ldr r1, .L_0204f46c
    cmp r0, #0x6
    ldr r0, .L_0204f470
    ldr r1, [r1, #0x8]
    ldr r0, [r0, #0x0]
    movge r4, #0x1
    bl GraphicsSpriteRenderer_SetFontResource
    add r0, r5, #0x1f4
    bl func_020628c8
    ldr r2, .L_0204f470
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, #0x8
    mov r3, #0x0
    bl GraphicsSpriteRenderer_MeasureText
    mov r0, r0, lsl #0xc
    cmp r4, #0x0
    rsb r4, r0, #0xe8000
    add r0, r5, #0x200
    ldrsb r0, [r0, #0x1a]
    mvn r1, #0x0
    moveq r4, #0x12000
    cmp r0, r1
    moveq r1, #0x0
    beq .L_0204f1cc
    mov r1, #0x6
    bl func_020ada8c
    mov r1, #0x18000
    mul r1, r0, r1
.L_0204f1cc:
    add r0, r5, #0x100
    ldrsh r2, [r0, #0xf2]
    add r2, r2, #0x1
    strh r2, [r0, #0xf2]
    ldrsh r0, [r0, #0xf2]
    cmp r0, #0x78
    bge .L_0204f328
    ldr r3, [r5, #0x1c]
    mov r2, #0xc00
    umull r7, ip, r3, r2
    mov r0, #0x0
    mla ip, r3, r0, ip
    mov r6, r3, asr #0x1f
    mla ip, r6, r2, ip
    mov r3, r4, asr #0x1f
    mov r3, r3, lsl #0xa
    adds lr, r7, #0x800
    ldr r6, .L_0204f474
    adc r10, ip, #0x0
    mov r8, #0x800
    mov ip, lr, lsr #0xc
    add r9, r1, #0x10000
    rsb r7, r6, #0x1000
    umull r2, r1, r9, r7
    adds r8, r8, r4, lsl #0xa
    orr r3, r3, r4, lsr #0x16
    adc r3, r3, #0x0
    mov r4, r8, lsr #0xc
    mla r1, r9, r0, r1
    orr ip, ip, r10, lsl #0x14
    orr r4, r4, r3, lsl #0x14
    add r3, ip, r4
    str r3, [r5, #0x1c]
    mov r3, r9, asr #0x1f
    ldr r4, [r5, #0x20]
    mla r1, r3, r7, r1
    umull r7, r3, r4, r6
    mla r3, r4, r0, r3
    mov r0, r4, asr #0x1f
    mla r3, r0, r6, r3
    adds r4, r7, #0x800
    adc r0, r3, #0x0
    mov r3, r4, lsr #0xc
    adds r2, r2, #0x800
    orr r3, r3, r0, lsl #0x14
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r1, r3, r1
    str r1, [r5, #0x20]
    ldr r0, [r5, #0x1c]
    mov r6, r1, asr #0xc
    mov r4, r0, asr #0xc
    cmp r4, #0x8
    ble .L_0204f30c
    cmp r4, #0xe6
    bge .L_0204f30c
    cmp r6, #0xc
    ble .L_0204f30c
    cmp r6, #0xb4
    bge .L_0204f30c
    ldr r0, .L_0204f470
    ldr r1, .L_0204f46c
    ldr r0, [r0, #0x0]
    ldr r1, [r1, #0x8]
    bl GraphicsSpriteRenderer_SetFontResource
    add r0, r5, #0x1f4
    bl func_020628c8
    mov r1, #0xd
    str r1, [sp, #0x0]
    mov r1, #0x8
    str r1, [sp, #0x4]
    mov r1, #0x0
    ldr r2, .L_0204f470
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, r4
    mov r3, r6
    bl GraphicsSpriteRenderer_DrawText
.L_0204f30c:
    ldr r0, .L_0204f464
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r1, [r0, #0xb8]
    orr r1, r1, #0x10
    str r1, [r0, #0xb8]
    b .L_0204f374
.L_0204f328:
    ldr r2, [r5, #0x54]
    mov r0, r5
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl Actor_GetCollection
    mov r1, r5
    bl ActorCollection_QueueActorForRemoval
    ldr r0, .L_0204f464
    add r1, r5, #0x100
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r2, [r0, #0xb8]
    orr r2, r2, #0x10
    str r2, [r0, #0xb8]
    ldrh r0, [r1, #0xf0]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1, #0xf0]
.L_0204f374:
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x20]
    ldr r0, [r5, #0x54]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    mov r3, #0x4
    bl GraphicsSpriteState_SetScreenPositionCulled
    b .L_0204f3a8
.L_0204f394:
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_0204f3a8:
    mov r0, r5
    bl func_0204f478
    cmp r0, #0x0
    beq .L_0204f458
    ldr r0, .L_0204f464
    adds r1, r5, #0x18
    ldr r0, [r0, #0x0]
    addne r1, r1, #0x4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    add r0, r0, #0x18
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, #0x18000
    bge .L_0204f404
    ldr r1, .L_0204f464
    mov r0, r5
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    bl func_0204f4d4
    b .L_0204f458
.L_0204f404:
    ldr r0, .L_0204f464
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea8]
    cmp r4, #0x0
    beq .L_0204f458
    mov r0, r4
    bl Type7Actor_GetStateCode
    cmp r0, #0x0
    bne .L_0204f458
    adds r1, r5, #0x18
    add r0, r4, #0x18
    addne r1, r1, #0x4
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, #0x18000
    bge .L_0204f458
    mov r0, r5
    mov r1, r4
    bl func_0204f4d4
.L_0204f458:
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0204f460: .word 0xffff0003
.L_0204f464: .word data_021052fc
.L_0204f468: .word gSceneManager
.L_0204f46c: .word data_02105790
.L_0204f470: .word data_020f4e14
.L_0204f474: .word 0xd9a
.size func_0204ee24, . - func_0204ee24
