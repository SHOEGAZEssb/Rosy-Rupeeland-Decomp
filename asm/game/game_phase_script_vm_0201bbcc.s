; Matching retail form; see src/game/game_phase_script_vm_comparison_opcodes.c.
.text
.global GamePhaseScriptVm_CompareNotEqualRegisters
GamePhaseScriptVm_CompareNotEqualRegisters: ; 0x0201bbcc
    ldr r1, [r0, #0x4]
    ldrb r2, [r1, #0x0]
    add r3, r1, #0x1
    mov r1, r2, asr #0x4
    and r1, r1, #0x7
    and r2, r2, #0x7
    str r3, [r0, #0x4]
    add r3, r0, r2, lsl #0x2
    add r1, r0, r1, lsl #0x2
    ldr r2, [r3, #0x2c]
    ldr r1, [r1, #0x2c]
    cmp r2, r1
    ldrb r2, [r0, #0x7d]
    movne r1, #0x1
    moveq r1, #0x0
    orrne r2, r2, #0x2
    biceq r2, r2, #0x2
    strb r2, [r0, #0x7d]
    str r1, [r3, #0x2c]
    mov r0, #0x0
    bx lr
.size GamePhaseScriptVm_CompareNotEqualRegisters, . - GamePhaseScriptVm_CompareNotEqualRegisters
