; Matching retail form; see src/game/game_phase_script_vm_call_return_opcodes.c.
.text
.extern GamePhaseScriptVm_Push
.extern GamePhaseScriptVm_ReadU32Le
.global func_0201be48
func_0201be48: ; 0x0201be48
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    add r1, r1, #0x4
    bl GamePhaseScriptVm_Push
    ldr r0, [r4, #0x4]
    bl GamePhaseScriptVm_ReadU32Le
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_0201be48, . - func_0201be48
