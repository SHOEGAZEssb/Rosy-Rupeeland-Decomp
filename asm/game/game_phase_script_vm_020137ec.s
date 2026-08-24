; Matching retail form; see src/game/game_phase_script_vm_actor_target_opcodes.c.
.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Stepper_Reset
.extern VecFx32Object_SetComponents
.extern Actor_SetVelocity
.extern ActorDerivedType1_ResetSpecialModeFlags

    .global GamePhaseActorScriptVm_CancelMovement
GamePhaseActorScriptVm_CancelMovement: ; 0x020137ec
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r4, [r0, #0x84]
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl VecFx32Object_SetComponents
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq L_02013854
    mov r0, r4
    bl ActorDerivedType1_ResetSpecialModeFlags
L_02013854:
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x0
    mov r0, r4
    bl Actor_SetVelocity
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r1, [r4, #0x10]
    add r0, r4, #0x198
    bic r1, r1, #0x40
    str r1, [r4, #0x10]
    bl VecFx32Stepper_Reset
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_CancelMovement, . - GamePhaseActorScriptVm_CancelMovement
