; Matching retail form; see src/game/game_phase_script_vm_control_flow_opcodes.c.
.text
.extern GamePhaseScriptVm_ReadU32Le
.global GamePhaseScriptVm_Jump
GamePhaseScriptVm_Jump: ; 0x0201b304
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl GamePhaseScriptVm_ReadU32Le
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size GamePhaseScriptVm_Jump, . - GamePhaseScriptVm_Jump
