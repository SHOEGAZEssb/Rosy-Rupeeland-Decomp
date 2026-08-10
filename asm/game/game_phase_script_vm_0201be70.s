; Matching retail form; see src/game/game_phase_script_vm_call_return_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.global GamePhaseScriptVm_Return
GamePhaseScriptVm_Return: ; 0x0201be70
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size GamePhaseScriptVm_Return, . - GamePhaseScriptVm_Return
