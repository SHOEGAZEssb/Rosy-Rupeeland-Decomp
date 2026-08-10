; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.extern GamePhaseScriptVm_InitWithScript
.extern GamePhaseActorScriptVm_ResetState
.extern data_020d5b20
.global GamePhaseActorScriptVm_InitWithScript
GamePhaseActorScriptVm_InitWithScript: ; 0x0201b124
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r1, r2
    mov r2, r3
    mov r5, r0
    bl GamePhaseScriptVm_InitWithScript
    ldr r1, L_0201b158
    mov r0, r5
    str r1, [r5, #0x0]
    bl GamePhaseActorScriptVm_ResetState
    mov r0, r5
    str r4, [r5, #0x84]
    ldmia sp!, {r3, r4, r5, pc}
L_0201b158: .word data_020d5b20
.size GamePhaseActorScriptVm_InitWithScript, . - GamePhaseActorScriptVm_InitWithScript
