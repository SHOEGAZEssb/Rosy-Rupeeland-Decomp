; Matching retail form; see src/game/game_phase_visual_effect_position.c.
.text
.extern gGamePhaseRuntime
.extern gActorInteractionSmoothedDisplacement
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern VecFx32_Subtract
.extern VecFx32Stepper_InitTransition
.extern VecFx32Stepper_Assign
.extern VecFx32Stepper_Destroy
.extern VecFx32Stepper_Update
.extern VecFx32Stepper_GetCurrent
.extern GamePhaseRuntime_GetActorCollection

    .global GamePhaseVisualEffect_UpdatePosition
GamePhaseVisualEffect_UpdatePosition: ; 0x0200fe0c
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x94
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_02010084
    ldr r0, [r5, #0x94]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq L_02010084
    mov r1, #0x0
    add r0, sp, #0x84
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    ldr r0, L_0201008c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldrb r0, [r0, #0xcc]
    tst r0, #0x4
    beq L_0200fe9c
    mov r1, #0x0
    add r0, sp, #0x74
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x74
    add r0, r5, #0x40
    bl VecFx32Object_Assign
    add r0, sp, #0x74
    bl VecFx32Object_Destroy
    b L_0200ffb4
L_0200fe9c:
    add r0, r5, #0x30
    add r1, r5, #0x50
    bl VecFx32Object_Add
    ldr r0, L_0201008c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    mov r3, #0x0
    ldr r0, [r0, #0xd0]
    tst r0, #0x10
    beq L_0200ff08
    ldr r1, L_02010090
    add r0, sp, #0x64
    ldr r2, [r1, #0x4]
    ldr r1, [r1, #0x0]
    rsb r2, r2, #0x0
    mov r1, r1, lsl #0x5
    mov r2, r2, lsl #0x5
    bl VecFx32Object_InitComponents
    add r0, sp, #0x84
    add r1, sp, #0x64
    bl VecFx32Object_Assign
    add r0, sp, #0x64
    bl VecFx32Object_Destroy
    b L_0200ff3c
L_0200ff08:
    ldr r1, L_02010090
    add r0, sp, #0x54
    ldr r2, [r1, #0x4]
    ldr r1, [r1, #0x0]
    rsb r2, r2, #0x0
    mov r1, r1, lsl #0x3
    mov r2, r2, lsl #0x3
    bl VecFx32Object_InitComponents
    add r0, sp, #0x84
    add r1, sp, #0x54
    bl VecFx32Object_Assign
    add r0, sp, #0x54
    bl VecFx32Object_Destroy
L_0200ff3c:
    ldr r1, [sp, #0x88]
    ldr r0, [r5, #0x44]
    cmp r1, r0
    ldreq r1, [sp, #0x8c]
    ldreq r0, [r5, #0x48]
    cmpeq r1, r0
    ldreq r1, [sp, #0x90]
    ldreq r0, [r5, #0x4c]
    cmpeq r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_0200ff98
    add r0, sp, #0x20
    add r1, sp, #0x84
    add r2, r5, #0x40
    mov r3, #0x78
    bl VecFx32Stepper_InitTransition
    add r1, sp, #0x20
    add r0, r5, #0x60
    bl VecFx32Stepper_Assign
    add r0, sp, #0x20
    bl VecFx32Stepper_Destroy
L_0200ff98:
    add r0, r5, #0x60
    bl VecFx32Stepper_Update
    add r0, r5, #0x60
    bl VecFx32Stepper_GetCurrent
    mov r1, r0
    add r0, r5, #0x40
    bl VecFx32Object_Assign
L_0200ffb4:
    add r0, sp, #0x10
    mov r1, r4
    add r2, r5, #0x20
    bl VecFx32_Subtract
    add r0, sp, #0x84
    add r1, sp, #0x10
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    ldr r0, [sp, #0x88]
    ldr r2, [sp, #0x8c]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0xe
    add r0, r1, r0, ror #0xe
    mov r1, r2, lsr #0x1f
    str r0, [sp, #0x88]
    rsb r0, r1, r2, lsl #0xe
    add r2, r1, r0, ror #0xe
    mov r1, r4
    add r0, r5, #0x20
    str r2, [sp, #0x8c]
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    add r1, sp, #0x84
    add r2, r5, #0x40
    bl VecFx32_Subtract
    add r0, sp, #0x84
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r0, [r5, #0x94]
    mov r0, r0, lsl #0x1d
    movs r0, r0, asr #0x1f
    beq L_02010070
    ldr r0, [sp, #0x88]
    ldr r1, [sp, #0x8c]
    ldr r2, [sp, #0x90]
    add r0, r0, r0, lsr #0x1f
    add r1, r1, r1, lsr #0x1f
    add r2, r2, r2, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r1, r1, asr #0x1
    mov r0, r2, asr #0x1
    str r3, [sp, #0x88]
    str r1, [sp, #0x8c]
    str r0, [sp, #0x90]
L_02010070:
    add r1, sp, #0x84
    add r0, r5, #0x30
    bl VecFx32Object_Add
    add r0, sp, #0x84
    bl VecFx32Object_Destroy
L_02010084:
    add sp, sp, #0x94
    ldmia sp!, {r4, r5, pc}
L_0201008c: .word gGamePhaseRuntime
L_02010090: .word gActorInteractionSmoothedDisplacement
    .size GamePhaseVisualEffect_UpdatePosition, . - GamePhaseVisualEffect_UpdatePosition

