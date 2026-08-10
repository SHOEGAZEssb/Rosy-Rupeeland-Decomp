; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.extern GamePhaseScriptVm_DestroyBase
.global GamePhaseActorScriptVm_Destroy
GamePhaseActorScriptVm_Destroy: ; 0x0201b1e0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
.size GamePhaseActorScriptVm_Destroy, . - GamePhaseActorScriptVm_Destroy
