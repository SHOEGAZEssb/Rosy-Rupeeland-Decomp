; Matching retail form; see src/game/game_phase_script_vm_byte_read_helpers.c.
.text
.global GamePhaseScriptVm_ReadU32Le
GamePhaseScriptVm_ReadU32Le: ; 0x0201b278
    stmdb sp!, {r3}
    sub sp, sp, #0x4
    ldrsb r1, [r0, #0x0]
    add r2, sp, #0x0
    strb r1, [r2, #0x0]
    ldrsb r1, [r0, #0x1]
    strb r1, [r2, #0x1]
    ldrsb r1, [r0, #0x2]
    strb r1, [r2, #0x2]
    ldrsb r0, [r0, #0x3]
    strb r0, [r2, #0x3]
    ldr r0, [sp, #0x0]
    add sp, sp, #0x4
    ldmia sp!, {r3}
    bx lr
.size GamePhaseScriptVm_ReadU32Le, . - GamePhaseScriptVm_ReadU32Le
