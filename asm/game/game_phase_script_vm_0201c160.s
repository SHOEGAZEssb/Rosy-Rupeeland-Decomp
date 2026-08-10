; Matching retail form; see src/game/game_phase_script_vm_stack_storage_opcodes.c.
.text
.extern GamePhaseScriptVm_Push
.global GamePhaseScriptVm_PushZero
GamePhaseScriptVm_PushZero: ; 0x0201c160
    stmdb sp!, {r3, lr}
    mov r1, #0x0
    bl GamePhaseScriptVm_Push
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size GamePhaseScriptVm_PushZero, . - GamePhaseScriptVm_PushZero
