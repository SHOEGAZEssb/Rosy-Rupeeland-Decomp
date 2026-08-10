; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.extern GamePhaseScriptVm_DestroyBase
.extern Heap_Free
.global GamePhaseActorScriptVm_DestroyAndFree
GamePhaseActorScriptVm_DestroyAndFree: ; 0x0201b1f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size GamePhaseActorScriptVm_DestroyAndFree, . - GamePhaseActorScriptVm_DestroyAndFree
