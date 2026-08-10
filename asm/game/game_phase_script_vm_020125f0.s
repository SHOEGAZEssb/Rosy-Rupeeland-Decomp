; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text
.extern Heap_Free

    .global GamePhaseScriptVm_DestroyAndFree
GamePhaseScriptVm_DestroyAndFree: ; 0x020125f0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size GamePhaseScriptVm_DestroyAndFree, . - GamePhaseScriptVm_DestroyAndFree

