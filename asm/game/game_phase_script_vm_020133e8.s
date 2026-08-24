; Matching retail form; see src/game/game_phase_script_vm_movement_status_opcodes.c.
.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_SetComponents
.extern Actor_SetVelocity

    .global GamePhaseActorScriptVm_WaitForMovementCompletion
GamePhaseActorScriptVm_WaitForMovementCompletion: ; 0x020133e8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r1, [r4, #0x84]
    ldr r0, [r1, #0x10]
    tst r0, #0x40
    ldrne r1, [r4, #0x4]
    movne r0, #0x1
    subne r1, r1, #0x2
    strne r1, [r4, #0x4]
    bne L_02013498
    ldrb r0, [r1, #0xe6]
    cmp r0, #0x1
    ldreq r1, [r1, #0x54]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x2
    streqh r0, [r1, #0x24]
    mov r1, #0x0
    ldr r5, [r4, #0x84]
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x38
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x98
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    ldr r0, [r4, #0x84]
    add r1, sp, #0x0
    bl Actor_SetVelocity
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, #0x0
L_02013498:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseActorScriptVm_WaitForMovementCompletion, . - GamePhaseActorScriptVm_WaitForMovementCompletion
