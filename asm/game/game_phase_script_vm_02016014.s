; Matching retail form; see src/game/game_phase_script_vm_actor_orientation_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern gSystemState
.global GamePhaseActorScriptVm_SetSystemStateHalfword5c
GamePhaseActorScriptVm_SetSystemStateHalfword5c:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    ldr r1, L_0201602c
    strh r0, [r1, #0x5c]
    mov r0, #0
    ldmia sp!, {r3, pc}
L_0201602c: .word gSystemState
    .size GamePhaseActorScriptVm_SetSystemStateHalfword5c, . - GamePhaseActorScriptVm_SetSystemStateHalfword5c
