; Matching retail form; see src/game/game_phase_script_vm_utility_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern ActorInteraction_SetDirectionAndMagnitude
.global GamePhaseActorScriptVm_SetInteractionDirectionAndMagnitude
GamePhaseActorScriptVm_SetInteractionDirectionAndMagnitude:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r0, r4, lsl #16
    mov r1, r5, lsl #16
    mov r0, r0, lsr #16
    mov r1, r1, lsr #16
    bl ActorInteraction_SetDirectionAndMagnitude
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
    .size GamePhaseActorScriptVm_SetInteractionDirectionAndMagnitude, . - GamePhaseActorScriptVm_SetInteractionDirectionAndMagnitude
