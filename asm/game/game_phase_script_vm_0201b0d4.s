; Matching retail form; see src/game/game_phase_script_vm_final_runtime_opcodes.c.
.text
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern GridEffectActorRegistry_CountDepartingOrFinishedActors
.global GamePhaseActorScriptVm_GetDepartingOrFinishedGridEffectActorCount
GamePhaseActorScriptVm_GetDepartingOrFinishedGridEffectActorCount: ; 0x0201b0d4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GridEffectActorRegistry_CountDepartingOrFinishedActors
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size GamePhaseActorScriptVm_GetDepartingOrFinishedGridEffectActorCount, . - GamePhaseActorScriptVm_GetDepartingOrFinishedGridEffectActorCount
