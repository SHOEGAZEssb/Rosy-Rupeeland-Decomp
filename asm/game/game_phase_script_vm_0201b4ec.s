; Matching retail form; see src/game/game_phase_script_vm_add_subtract_opcodes.c.
.text
.extern GamePhaseScriptVm_UpdateZeroFlag
.global GamePhaseScriptVm_SubtractRegisters
GamePhaseScriptVm_SubtractRegisters: ; 0x0201b4ec
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x4]
    add ip, r0, #0x2c
    add r1, r2, #0x1
    str r1, [r0, #0x4]
    ldrb r3, [r2, #0x0]
    mov r1, r3, asr #0x4
    and r2, r1, #0x7
    and r1, r3, #0x7
    add r2, r0, r2, lsl #0x2
    ldr r3, [ip, r1, lsl #0x2]
    ldr r2, [r2, #0x2c]
    sub r2, r3, r2
    str r2, [ip, r1, lsl #0x2]
    bl GamePhaseScriptVm_UpdateZeroFlag
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size GamePhaseScriptVm_SubtractRegisters, . - GamePhaseScriptVm_SubtractRegisters
