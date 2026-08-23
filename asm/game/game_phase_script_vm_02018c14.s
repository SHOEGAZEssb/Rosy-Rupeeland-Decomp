; Matching retail form; see src/game/game_phase_script_vm_runtime_entity_control_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Actor_GetInteractionIcon
.extern ActorInteractionIcon_SetDirection
.global GamePhaseActorScriptVm_SetInteractionIconDirection
GamePhaseActorScriptVm_SetInteractionIconDirection:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    ldr r0, [r5, #0x84]
    bl Actor_GetInteractionIcon
    mov r1, r4
    bl ActorInteractionIcon_SetDirection
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size GamePhaseActorScriptVm_SetInteractionIconDirection, . - GamePhaseActorScriptVm_SetInteractionIconDirection
