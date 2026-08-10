; Matching retail form; see src/game/game_phase_script_vm_bitwise_opcodes.c.
.text
.extern GamePhaseScriptVm_ReadU32Le
.extern GamePhaseScriptVm_UpdateZeroFlag
.global GamePhaseScriptVm_OrImmediate
GamePhaseScriptVm_OrImmediate: ; 0x0201b820
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    add r0, r1, #0x1
    str r0, [r4, #0x4]
    ldrb r5, [r1, #0x0]
    bl GamePhaseScriptVm_ReadU32Le
    ldr r1, [r4, #0x4]
    add r3, r4, #0x2c
    add r1, r1, #0x4
    str r1, [r4, #0x4]
    ldr r2, [r3, r5, lsl #0x2]
    mov r1, r5
    orr r2, r2, r0
    mov r0, r4
    str r2, [r3, r5, lsl #0x2]
    bl GamePhaseScriptVm_UpdateZeroFlag
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size GamePhaseScriptVm_OrImmediate, . - GamePhaseScriptVm_OrImmediate
