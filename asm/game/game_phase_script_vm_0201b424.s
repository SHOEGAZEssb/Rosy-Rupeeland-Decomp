; Matching retail form; see src/game/game_phase_script_vm_register_transfer_opcodes.c.
.text
.extern GamePhaseScriptVm_ReadU32Le
.global GamePhaseScriptVm_LoadImmediateU32
GamePhaseScriptVm_LoadImmediateU32: ; 0x0201b424
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    add r0, r1, #0x1
    str r0, [r5, #0x4]
    ldrb r4, [r1, #0x0]
    bl GamePhaseScriptVm_ReadU32Le
    ldr r2, [r5, #0x4]
    add r1, r5, r4, lsl #0x2
    add r2, r2, #0x4
    str r2, [r5, #0x4]
    str r0, [r1, #0x2c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size GamePhaseScriptVm_LoadImmediateU32, . - GamePhaseScriptVm_LoadImmediateU32
