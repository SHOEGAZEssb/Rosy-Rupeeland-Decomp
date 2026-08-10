; Matching retail form; see src/game/presentation_backed_actor_interaction.c.
.extern Heap_Alloc
.extern Sound_Play
.extern data_020e251c
.extern data_021052fc
.extern gGameWork
.extern gHeapContext
.extern gLupyContext
.extern gSoundContext
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_AddCurrency
.extern func_0201ded4
.extern func_0201e0ec
.extern func_02022cb0
.extern ActorCollection_QueueActorForRemoval
.extern Actor_GetCollection
.extern ActorDerivedType1_TrySetStateVector
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020a25c8
.text

    .global func_0204df40
func_0204df40: ; 0x0204df40
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldrh r0, [r6, #0x4e]
    mov r5, r1
    cmp r0, #0xd
    moveq r0, #0x0
    beq .L_0204e28c
    add r0, r6, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    ldrb r1, [r6, #0x1ef]
    ldr r0, [r6, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r6, #0x54]
    mov r0, #0x1
    strb r0, [r1, #0x3a]
    ldr r3, [r6, #0x54]
    mov r1, #0x10000
    ldrh r2, [r3, #0x24]
    rsb r1, r1, #0x0
    mov r4, r1, asr #0x10
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r6, #0x5c]
    and r1, r2, r1
    orr r1, r1, #0xff00
    str r1, [r6, #0x5c]
    ldrh r1, [r6, #0x4e]
    sub r1, r1, #0xa
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_0204e25c
.L_0204dfc4: ; jump table
    b .L_0204dfec ; case 0
    b .L_0204e200 ; case 1
    b .L_0204e230 ; case 2
    b .L_0204e25c ; case 3
    b .L_0204e25c ; case 4
    b .L_0204e25c ; case 5
    b .L_0204e25c ; case 6
    b .L_0204e25c ; case 7
    b .L_0204e160 ; case 8
    b .L_0204dfec ; case 9
.L_0204dfec:
    ldrb r1, [r5, #0x4d]
    cmp r1, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0204e044
    ldr r0, .L_0204e294
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_0204e044
    ldr r0, .L_0204e294
    add r1, r6, #0x18
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    mov r3, #0x2
    bl ActorDerivedType1_TrySetStateVector
.L_0204e044:
    add r0, r6, #0x100
    ldr r2, .L_0204e298
    ldrsh r1, [r0, #0xf2]
    ldr r0, [r2, #0x0]
    mov r2, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, .L_0204e29c
    ldr r3, .L_0204e2a0
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0204e0b8
    ldr r0, .L_0204e294
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, #0x2000
    str r1, [sp, #0x0]
    sub r2, r1, #0x20c0
    mov r1, r0
    str r2, [sp, #0x4]
    add r0, r6, #0x100
    ldrsh r3, [r0, #0xf2]
    mov r0, r4
    mov r2, r6
    bl func_02022cb0
    mov r4, r0
.L_0204e0b8:
    ldr r0, .L_0204e294
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldrh r0, [r6, #0x4e]
    cmp r0, #0x13
    bne .L_0204e12c
    ldr r0, .L_0204e294
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x28
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0xf
    str r1, [sp, #0x8]
    ldr r1, [r6, #0x24]
    ldr r3, [r6, #0x1c]
    ldr r2, [r6, #0x20]
    mov r1, r1, asr #0xc
    mov r3, r3, asr #0xc
    rsb r1, r1, r2, asr #0xc
    sub r2, r3, #0x14
    sub r3, r1, #0x14
    mov r1, #0x0
    bl func_020a25c8
.L_0204e12c:
    ldr r2, [r6, #0x54]
    mov r0, r6
    ldrh r1, [r2, #0x24]
    mov r4, #0xf
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl Actor_GetCollection
    mov r1, r6
    bl ActorCollection_QueueActorForRemoval
    add r0, r6, #0x100
    mov r1, #0x3
    strh r1, [r0, #0xec]
    b .L_0204e25c
.L_0204e160:
    ldr r1, .L_0204e2a4
    add r0, r6, #0x100
    ldr r3, [r1, #0x0]
    ldrsh r2, [r0, #0xf2]
    ldrsh r1, [r3, #0xf6]
    ldr r0, .L_0204e294
    add r1, r2, r1
    strh r1, [r3, #0xf6]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x20
    str r1, [sp, #0x0]
    mov r1, #0x18
    str r1, [sp, #0x4]
    mov r1, #0x46
    str r1, [sp, #0x8]
    ldr r1, [r6, #0x24]
    ldr r3, [r6, #0x1c]
    ldr r2, [r6, #0x20]
    mov r1, r1, asr #0xc
    rsb r1, r1, r2, asr #0xc
    mov r2, r3, asr #0xc
    sub r3, r1, #0x14
    mov r1, #0x0
    bl func_020a25c8
    ldr r2, [r6, #0x54]
    mov r0, r6
    ldrh r1, [r2, #0x24]
    mov r4, #0xf
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl Actor_GetCollection
    mov r1, r6
    bl ActorCollection_QueueActorForRemoval
    add r0, r6, #0x100
    mov r1, #0x3
    strh r1, [r0, #0xec]
    b .L_0204e25c
.L_0204e200:
    add r0, r6, #0x100
    ldrsh r1, [r0, #0xf2]
    ldr r0, .L_0204e298
    mov r2, #0x0
    ldr r0, [r0, #0x0]
    add r1, r1, r1, lsl #0x1
    mov r4, #0x11
    bl GamePhaseCurrencyHud_AddCurrency
    add r0, r6, #0x100
    mov r1, #0x2
    strh r1, [r0, #0xec]
    b .L_0204e25c
.L_0204e230:
    add r0, r6, #0x100
    ldrsh r1, [r0, #0xf2]
    ldr r0, .L_0204e298
    mov r2, #0x0
    ldr r0, [r0, #0x0]
    add r1, r1, r1, lsl #0x1
    mov r4, #0x12
    bl GamePhaseCurrencyHud_AddCurrency
    add r0, r6, #0x100
    mov r1, #0x2
    strh r1, [r0, #0xec]
.L_0204e25c:
    mvn r0, #0x0
    cmp r4, r0
    beq .L_0204e284
    ldr r1, .L_0204e2a8
    mov r0, r4, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_Play
.L_0204e284:
    add r0, r6, #0x100
    ldrsh r0, [r0, #0xf2]
.L_0204e28c:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0204e294: .word data_021052fc
.L_0204e298: .word gLupyContext
.L_0204e29c: .word data_020e251c
.L_0204e2a0: .word gHeapContext
.L_0204e2a4: .word gGameWork
.L_0204e2a8: .word gSoundContext
.size func_0204df40, . - func_0204df40
