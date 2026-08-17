; Matching retail form; see src/game/launched_sprite_pair_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern data_020d68e4
.extern data_020f4e18
.extern data_021052fc
.extern data_021f3d68
.extern DisplayController_GetVerticalOffset
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern TimedSpritePresentation_InitBase
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern Actor_GetCollectionBySlot
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern RuntimeRecordTable_FindByKey
.extern gGameWork

    .global func_02024b04
    .type func_02024b04, @function
func_02024b04: ; 0x02024b04
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r6, r0
    mov r7, r1
    mov r5, r2
    mov r4, r3
    bl TimedSpritePresentation_InitBase
    ldr r1, .L_02024d20
    add r0, r6, #0xc
    str r1, [r6, #0x0]
    add r1, r5, #0x18
    str r7, [r6, #0x8]
    bl VecFx32Object_InitCopy
    add r0, r6, #0x1c
    bl VecFx32Object_Init
    add r0, r6, #0x3c
    bl AnimationResourceState_InitEmbedded
    mov r0, r5
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    str r0, [r6, #0x48]
    ldr r0, .L_02024d24
    mov r1, r4
    bl RuntimeRecordTable_FindByKey
    ldr r3, .L_02024d28
    mov r4, r0
    ldr r1, .L_02024d2c
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r6, #0x3c
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, [r6, #0x48]
    add r1, r6, #0x3c
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r6, #0x50]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r6, #0x50]
    ldr r0, .L_02024d30
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r1, [r0, #0x0]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    beq .L_02024be8
    sub r0, r1, #0x2
    cmp r0, #0x2
    bhi .L_02024c18
.L_02024be8:
    mov r0, r5
    mov r1, #0x2
    bl Actor_GetCollectionBySlot
    bl ActorCollection_GetSpriteOwner
    str r0, [r6, #0x4c]
    add r1, r6, #0x3c
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r6, #0x54]
    ldrb r1, [r4, #0xd]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02024c24
.L_02024c18:
    mov r0, #0x0
    str r0, [r6, #0x4c]
    str r0, [r6, #0x54]
.L_02024c24:
    ldr r2, [r6, #0x10]
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x2c]
    add r1, r2, r1, lsl #0xc
    str r1, [r6, #0x10]
    ldr r1, [r6, #0x18]
    add r5, r1, r0, lsl #0xc
    str r5, [r6, #0x18]
    ldr r4, [r6, #0x8]
    ldr r1, [r6, #0x10]
    ldmib r4, {r0, r2}
    sub r1, r1, r0
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    ldr r3, [r6, #0x14]
    ldr r1, [r4, #0xc]
    mov r0, r0, lsl #0x4
    sub r2, r3, r2
    sub r1, r5, r1
    sub r2, r2, r1
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    mov r1, r1, lsl #0x4
    ldr r2, [r6, #0x50]
    mov r4, r0, asr #0x10
    strh r4, [r2, #0x2c]
    mov r5, r1, asr #0x10
    strh r5, [r2, #0x2e]
    ldr r0, [r6, #0x4c]
    cmp r0, #0x0
    beq .L_02024cb8
    bl DisplayController_GetVerticalOffset
    ldr r1, [r6, #0x54]
    add r2, r5, #0xc0
    strh r4, [r1, #0x2c]
    add r0, r2, r0
    strh r0, [r1, #0x2e]
.L_02024cb8:
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    mov r3, r1
    str r1, [r6, #0x2c]
    bl VecFx32Object_InitComponents
    add r1, sp, #0x4
    add r0, r6, #0x1c
    bl VecFx32Object_Assign
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    mov r1, #0x0
    str r1, [r6, #0x30]
    str r1, [r6, #0x34]
    str r1, [r6, #0x38]
    ldr r0, .L_02024d34
    ldr r1, .L_02024d38
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_02024d34
    mov r1, #0x3e0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r6
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02024d20: .word data_020d68e4
.L_02024d24: .word data_021f3d68
.L_02024d28: .word 0x300c
.L_02024d2c: .word data_020f4e18
.L_02024d30: .word data_021052fc
.L_02024d34: .word gGameWork
.L_02024d38: .word 0x385
    .size func_02024b04, . - func_02024b04
