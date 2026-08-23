; Matching retail form; see src/game/actor_target_selection_state.c.
.text
.extern data_021052fc
.extern gActorTargetSelectionMetadata
.extern gActorTargetSelectionCandidates
.extern gActorTargetSelectionPriorities
.extern VecFx32Object_Destroy
.extern VecFx32Object_GetMagnitude
.extern VecFx32_Subtract
.extern GamePhaseRuntime_GetActorCollection

    .global ActorTargetSelection_Populate
    .type ActorTargetSelection_Populate, @function
ActorTargetSelection_Populate: ; 0x02034ecc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    ldr r11, .L_02035040
    mov r8, #0x0
    ldr r0, [r11, #0x0]
    ldr r4, .L_02035044
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea4]
    mov r10, r8
    strh r8, [r4, #0x2]
    mov r6, #0x10000000
    b .L_02034ffc
.L_02034efc:
    ldr r0, [r11, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    ldr r9, [r0, r10, lsl #0x2]
    cmp r9, #0x0
    beq .L_02034ff8
    ldrb r0, [r9, #0x4d]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02034ff8
    ldr r0, [r9, #0x260]
    tst r0, #0x2
    beq .L_02034f54
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02034f58
.L_02034f54:
    mov r0, #0x0
.L_02034f58:
    cmp r0, #0x0
    beq .L_02034ff8
    ldr r0, [r9, #0x10]
    tst r0, #0x1000000
    bne .L_02034ff8
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c8]
    blx r1
    mov r2, r0
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl VecFx32_Subtract
    mov r0, #0x0
    str r0, [sp, #0xc]
    add r0, sp, #0x0
    bl VecFx32Object_GetMagnitude
    mov r7, r0
    mov r0, r9
    ldr r1, [r0, #0x0]
    cmp r7, r6
    ldr r1, [r1, #0x1c4]
    movlt r6, r7
    blx r1
    cmp r7, r0
    bge .L_02034fe0
    ldr r0, .L_02035048
    str r9, [r0, r8, lsl #0x2]
    ldr r0, .L_0203504c
    str r7, [r0, r8, lsl #0x2]
    ldrsh r0, [r4, #0x2]
    add r8, r8, #0x1
    add r0, r0, #0x1
    strh r0, [r4, #0x2]
.L_02034fe0:
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1b8]
    blx r1
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02034ff8:
    add r10, r10, #0x1
.L_02034ffc:
    ldr r0, [r11, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r10, r0
    cmplt r8, #0xa
    blt .L_02034efc
    mov r1, #0x0
    ldr r0, .L_02035048
    b .L_02035030
.L_02035028:
    str r1, [r0, r8, lsl #0x2]
    add r8, r8, #0x1
.L_02035030:
    cmp r8, #0xa
    blt .L_02035028
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02035040: .word data_021052fc
.L_02035044: .word gActorTargetSelectionMetadata
.L_02035048: .word gActorTargetSelectionCandidates
.L_0203504c: .word gActorTargetSelectionPriorities
    .size ActorTargetSelection_Populate, . - ActorTargetSelection_Populate

    .global Actor_GetTargetSelectionPosition
