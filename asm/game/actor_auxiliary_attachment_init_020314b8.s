; Matching retail form; see src/game/actor_auxiliary_attachment_init.c.
.text
.extern data_020f4e18
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_02071e60
.extern func_02071e70
.extern func_02071e80
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState

    .global func_020314b8
    .type func_020314b8, @function
func_020314b8: ; 0x020314b8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x2000000
    moveq r0, #0x0
    streq r0, [r4, #0xa8]
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, .L_02031554
    ldr r1, .L_02031558
    ldr r0, [r0, #0x0]
    bl func_02071e60
    ldr r1, .L_02031554
    mov r7, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0203155c
    bl func_02071e70
    ldr r1, .L_02031554
    mov r6, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_02031560
    bl func_02071e80
    mov r5, r0
    mov r0, r4
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov ip, #0x2
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str ip, [sp, #0x0]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0xa8]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0xa8]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0xa
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02031554: .word data_020f4e18
.L_02031558: .word 0x1386
.L_0203155c: .word 0x1001
.L_02031560: .word 0x1387
    .size func_020314b8, . - func_020314b8
