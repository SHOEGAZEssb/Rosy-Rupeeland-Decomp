; Matching retail form; see src/game/game_phase_script_vm_branch_misc_opcodes.c.
.text
.global GamePhaseScriptVm_LoadImmediateU32Alternate
GamePhaseScriptVm_LoadImmediateU32Alternate: ; 0x0201b9a8
    stmdb sp!, {r3}
    sub sp, sp, #0x4
    ldr r2, [r0, #0x4]
    add r1, sp, #0x0
    ldrb ip, [r2, #0x0]
    add r3, r2, #0x1
    add r2, r3, #0x1
    str r2, [r0, #0x4]
    ldrsb r3, [r3, #0x0]
    add r2, r0, ip, lsl #0x2
    strb r3, [r1, #0x0]
    ldr ip, [r0, #0x4]
    add r3, ip, #0x1
    str r3, [r0, #0x4]
    ldrsb r3, [ip, #0x0]
    strb r3, [r1, #0x1]
    ldr ip, [r0, #0x4]
    add r3, ip, #0x1
    str r3, [r0, #0x4]
    ldrsb r3, [ip, #0x0]
    strb r3, [r1, #0x2]
    ldr ip, [r0, #0x4]
    add r3, ip, #0x1
    str r3, [r0, #0x4]
    ldrsb r3, [ip, #0x0]
    mov r0, #0x0
    strb r3, [r1, #0x3]
    ldr r1, [sp, #0x0]
    str r1, [r2, #0x2c]
    add sp, sp, #0x4
    ldmia sp!, {r3}
    bx lr
.size GamePhaseScriptVm_LoadImmediateU32Alternate, . - GamePhaseScriptVm_LoadImmediateU32Alternate
