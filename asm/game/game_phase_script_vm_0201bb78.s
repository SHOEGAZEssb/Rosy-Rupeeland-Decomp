; Matching retail form; see src/game/game_phase_script_vm_comparison_opcodes.c.
.text
.global GamePhaseScriptVm_CompareLessRegisters
GamePhaseScriptVm_CompareLessRegisters: ; 0x0201bb78
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
    movlt r1, #0x1
    movge r1, #0x0
    orrlt r2, r2, #0x2
    bicge r2, r2, #0x2
    strb r2, [r0, #0x7d]
    str r1, [r3, #0x2c]
    mov r0, #0x0
    bx lr
.size GamePhaseScriptVm_CompareLessRegisters, . - GamePhaseScriptVm_CompareLessRegisters
