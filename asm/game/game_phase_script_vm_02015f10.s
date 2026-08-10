; Matching retail form; see src/game/game_phase_script_vm_actor_activation_opcodes.c.
.text
.extern Actor_SetActive
.extern Actor_GetCollection
.global GamePhaseActorScriptVm_ActivateAllActors
GamePhaseActorScriptVm_ActivateAllActors:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0
    mov r4, #1
L_02015f20:
    ldr r0, [r6, #0x84]
    bl Actor_GetCollection
    ldr r0, [r0, r5, lsl #2]
    cmp r0, #0
    beq L_02015f3c
    mov r1, r4
    bl Actor_SetActive
L_02015f3c:
    add r5, r5, #1
    cmp r5, #0x80
    blt L_02015f20
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
    .size GamePhaseActorScriptVm_ActivateAllActors, . - GamePhaseActorScriptVm_ActivateAllActors
