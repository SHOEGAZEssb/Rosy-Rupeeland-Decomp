; Matching retail form; see src/game/actor_interaction_eligibility.c.
.text
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern RectS32_Set
.extern Actor_BuildCollisionRect
.extern Actor_GetCollection
.extern Actor_BuildWorldInteractionBounds
.extern func_02056f34

    .global Actor_IsInteractionEligible
    .type Actor_IsInteractionEligible, @function
Actor_IsInteractionEligible: ; 0x02034060
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    mov r4, r0
    ldrsh r1, [r4, #0x70]
    ldrsh r0, [r4, #0x74]
    cmp r1, r0
    moveq r2, #0x1
    ldrsh r1, [r4, #0x72]
    ldrsh r0, [r4, #0x76]
    movne r2, #0x0
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    orrs r0, r2, r0
    bne .L_02034120
    mov r0, r4
    bl Actor_GetCollection
    add r0, r0, #0x2000
    ldr r5, [r0, #0xe7c]
    cmp r5, #0x0
    beq .L_02034120
    add r0, sp, #0x38
    mov r1, r4
    add r2, r4, #0x18
    bl Actor_BuildWorldInteractionBounds
    add r0, sp, #0x8
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    add r0, sp, #0x28
    add r2, sp, #0x8
    mov r1, r5
    bl Actor_BuildCollisionRect
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    mov r1, #0x0
    add r0, sp, #0x18
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x0]
    bl RectS32_Set
    add r0, sp, #0x18
    add r1, sp, #0x38
    add r2, sp, #0x28
    add r3, sp, #0x4
    bl func_02056f34
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02034140
.L_02034120:
    ldr r0, [r4, #0x184]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02034140
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
.L_02034140:
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
    .size Actor_IsInteractionEligible, . - Actor_IsInteractionEligible

    .global Actor_PollInteractionIconState
