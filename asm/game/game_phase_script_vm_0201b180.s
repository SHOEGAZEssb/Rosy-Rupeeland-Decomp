; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.extern GamePhaseScriptVm_Assign
.extern GamePhaseActorScriptVm_CopyState
.global GamePhaseActorScriptVm_Assign
GamePhaseActorScriptVm_Assign: ; 0x0201b180
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    cmp r5, r4
    ldmeqia sp!, {r3, r4, r5, pc}
    bl GamePhaseScriptVm_Assign
    mov r0, r5
    mov r1, r4
    bl GamePhaseActorScriptVm_CopyState
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.size GamePhaseActorScriptVm_Assign, . - GamePhaseActorScriptVm_Assign
