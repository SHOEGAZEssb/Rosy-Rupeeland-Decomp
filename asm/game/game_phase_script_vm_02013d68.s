; Matching retail form; see src/game/game_phase_script_vm_actor_local_state_opcodes.c.
.text
.extern GamePhaseScriptVm_SetResult

    .global GamePhaseActorScriptVm_GetActorField4e
GamePhaseActorScriptVm_GetActorField4e: ; 0x02013d68
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x84]
    ldrh r1, [r1, #0x4e]
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size GamePhaseActorScriptVm_GetActorField4e, . - GamePhaseActorScriptVm_GetActorField4e

