; Matching retail form; see src/game/actor_derived_type1_animation_dispatch.c.
.text
.extern GameWork_TestFlag
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern ActorDerivedType1_ApplyResourceIndex
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern gGameWork

    .global ActorDerivedType1_UpdateAttachmentPresentation
    .type ActorDerivedType1_UpdateAttachmentPresentation, @function
ActorDerivedType1_UpdateAttachmentPresentation: ; 0x02036030
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrsh r1, [r4, #0xd6]
    cmp r1, #0xf
    beq .L_0203646c
    ldr r6, [r4, #0x274]
    mov r5, #0x100
    cmp r6, #0x0
    beq .L_0203613c
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldmib r6, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x7
    bne .L_020360b8
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    add r1, r1, #0x10
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    b .L_02036120
.L_020360b8:
    ldrsh r0, [r4, #0xd6]
    cmp r0, #0x1
    bne .L_020360dc
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02036100
.L_020360dc:
    cmp r0, #0x2
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    bne .L_020360fc
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02036100
.L_020360fc:
    bl GraphicsSpriteState_SetAnimationIndex
.L_02036100:
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_02036120:
    ldrb r0, [r4, #0x26b]
    cmp r0, #0x0
    movne r1, #0x300
    ldr r0, [r4, #0x54]
    moveq r1, #0x100
    strh r1, [r0, #0x36]
    b .L_0203646c
.L_0203613c:
    rsb r6, r5, #0xff
    mov r7, r6
    cmp r1, #0x11
    mov r8, #0x2
    mov r9, #0x1
    addls pc, pc, r1, lsl #0x2
    b .L_020363d4
.L_02036158: ; jump table
    b .L_020363d4 ; case 0
    b .L_020361a0 ; case 1
    b .L_020361a0 ; case 2
    b .L_020362a0 ; case 3
    b .L_020362ac ; case 4
    b .L_020361a0 ; case 5
    b .L_020361a0 ; case 6
    b .L_020362e4 ; case 7
    b .L_020362fc ; case 8
    b .L_02036240 ; case 9
    b .L_02036240 ; case 10
    b .L_02036270 ; case 11
    b .L_020362b8 ; case 12
    b .L_020363b4 ; case 13
    b .L_020363c0 ; case 14
    b .L_020363d4 ; case 15
    b .L_020363cc ; case 16
    b .L_020362fc ; case 17
.L_020361a0:
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_02036204
.L_020361b0: ; jump table
    b .L_02036204 ; case 0
    b .L_02036204 ; case 1
    b .L_020361e8 ; case 2
    b .L_020361f4 ; case 3
    b .L_020361cc ; case 4
    b .L_020361cc ; case 5
    b .L_020361dc ; case 6
.L_020361cc:
    ldrb r0, [r4, #0xd4]
    mov r6, r9
    add r7, r0, #0x6
    b .L_020363d4
.L_020361dc:
    ldrb r7, [r4, #0xd4]
    mov r6, #0x8
    b .L_020363d4
.L_020361e8:
    ldrb r7, [r4, #0xd4]
    mov r6, #0x6
    b .L_020363d4
.L_020361f4:
    ldrb r0, [r4, #0xd4]
    mov r6, #0x0
    add r7, r0, #0x14
    b .L_020363d4
.L_02036204:
    cmp r1, #0x1
    mov r6, #0x0
    bne .L_02036228
    ldrb r0, [r4, #0xd4]
    mov r8, r6
    mov r5, r6
    add r7, r0, #0x8
    mov r9, #0x3
    b .L_020363d4
.L_02036228:
    cmp r1, #0x2
    ldreqb r0, [r4, #0xd4]
    movne r5, #0x120
    addeq r7, r0, #0x8
    ldrneb r7, [r4, #0xd4]
    b .L_020363d4
.L_02036240:
    ldrsh r0, [r4, #0xda]
    mov r6, #0x7
    cmp r0, #0x3
    ldrb r0, [r4, #0xd4]
    bne .L_02036260
    mov r6, #0x0
    add r7, r0, #0x14
    b .L_020363d4
.L_02036260:
    mov r9, #0x3
    mov r8, #0x0
    add r7, r0, #0x28
    b .L_020363d4
.L_02036270:
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x3
    ldrb r0, [r4, #0xd4]
    bne .L_0203628c
    mov r6, #0x0
    add r7, r0, #0x14
    b .L_020363d4
.L_0203628c:
    mov r6, r8
    mov r9, #0x3
    add r7, r0, #0x14
    mov r8, #0x0
    b .L_020363d4
.L_020362a0:
    mov r6, r8
    mov r7, #0x4
    b .L_020363d4
.L_020362ac:
    mov r6, r8
    mov r7, #0x1c
    b .L_020363d4
.L_020362b8:
    ldr r0, .L_02036474
    add r1, r9, #0x25c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrb r0, [r4, #0xd4]
    movne r6, #0x0
    moveq r6, #0x5
    addne r7, r0, #0x8
    addeq r7, r0, #0x9
    b .L_020363d4
.L_020362e4:
    ldrb r0, [r4, #0xd4]
    mov r6, #0x7
    mov r9, #0x3
    add r7, r0, #0x10
    mov r8, #0x0
    b .L_020363d4
.L_020362fc:
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x1
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x50]
    bne .L_02036370
    cmp r0, #0x1
    beq .L_02036358
    cmp r0, #0x2
    beq .L_0203632c
    cmp r0, #0x3
    beq .L_02036344
    b .L_02036358
.L_0203632c:
    ldrb r0, [r4, #0xd4]
    mov r6, #0x7
    mov r9, #0x3
    add r7, r0, #0x18
    mov r8, #0x0
    b .L_020363d4
.L_02036344:
    mov r6, #0x7
    mov r7, #0x31
    mov r9, #0x3
    mov r8, #0x0
    b .L_020363d4
.L_02036358:
    ldrb r0, [r4, #0xd4]
    mov r6, #0x7
    mov r9, #0x3
    add r7, r0, #0x20
    mov r8, #0x0
    b .L_020363d4
.L_02036370:
    cmp r0, #0x1
    beq .L_020363a4
    cmp r0, #0x2
    beq .L_0203638c
    cmp r0, #0x3
    beq .L_02036398
    b .L_020363a4
.L_0203638c:
    ldrb r7, [r4, #0xd4]
    mov r6, #0x7
    b .L_020363d4
.L_02036398:
    mov r6, #0x7
    mov r7, #0x32
    b .L_020363d4
.L_020363a4:
    ldrb r0, [r4, #0xd4]
    mov r6, #0x7
    add r7, r0, #0x8
    b .L_020363d4
.L_020363b4:
    mov r6, #0x0
    mov r7, #0x11
    b .L_020363d4
.L_020363c0:
    mov r6, #0x6
    mov r7, #0x0
    b .L_020363d4
.L_020363cc:
    mov r6, #0x6
    mov r7, #0x2a
.L_020363d4:
    ldr r0, .L_02036474
    ldr r1, .L_02036478
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r10, [r4, #0x22c]
    cmpne r10, #0x0
    beq .L_02036418
    mov r0, r4
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r10, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldmib r10, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    b .L_0203642c
.L_02036418:
    cmp r6, #0x0
    blt .L_0203642c
    mov r0, r4
    mov r1, r6
    bl ActorDerivedType1_ApplyResourceIndex
.L_0203642c:
    cmp r7, #0x0
    blt .L_02036440
    ldr r0, [r4, #0x54]
    and r1, r7, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02036440:
    ldr r2, [r4, #0x54]
    mvn r0, r9
    ldrh r1, [r2, #0x24]
    orr r1, r1, r8
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r1, [r2, #0x24]
    and r0, r1, r0
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x54]
    strh r5, [r0, #0x36]
.L_0203646c:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_02036474: .word gGameWork
.L_02036478: .word 0x25d
    .size ActorDerivedType1_UpdateAttachmentPresentation, . - ActorDerivedType1_UpdateAttachmentPresentation

    .global ActorDerivedType1_ClassifyState

