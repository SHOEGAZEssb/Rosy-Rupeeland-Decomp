; Matching retail form; see src/game/game_phase_script_vm_actor_runtime_display_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Actor_SetInteractionIconOffset
.global GamePhaseActorScriptVm_SetInteractionIconOffset
GamePhaseActorScriptVm_SetInteractionIconOffset:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, [r5, #0x84]
    mov r2, r4
    bl Actor_SetInteractionIconOffset
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size GamePhaseActorScriptVm_SetInteractionIconOffset, . - GamePhaseActorScriptVm_SetInteractionIconOffset
