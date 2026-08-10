; Matching retail form; see src/game/game_phase_script_vm_control_flow_opcodes.c.
.text
.global GamePhaseScriptVm_Halt
GamePhaseScriptVm_Halt: ; 0x0201b2d4
    ldrb r1, [r0, #0x7d]
    orr r1, r1, #0x1
    strb r1, [r0, #0x7d]
    mov r0, #0x1
    bx lr
.size GamePhaseScriptVm_Halt, . - GamePhaseScriptVm_Halt
