; Matching retail form; see src/game/game_phase_script_vm_register_transfer_opcodes.c.
.text
.global GamePhaseScriptVm_StoreRegisterToContext
GamePhaseScriptVm_StoreRegisterToContext: ; 0x0201b38c
    ldr r1, [r0, #0x4]
    add ip, r1, #0x1
    str ip, [r0, #0x4]
    ldrb r2, [r1, #0x0]
    add r1, ip, #0x1
    mov r2, r2, asr #0x4
    and r2, r2, #0x7
    str r1, [r0, #0x4]
    add r3, r0, r2, lsl #0x2
    ldr r2, [r0, #0x80]
    ldrsb r1, [ip, #0x0]
    ldr r3, [r3, #0x2c]
    mov r0, #0x0
    str r3, [r2, r1, lsl #0x2]
    bx lr
.size GamePhaseScriptVm_StoreRegisterToContext, . - GamePhaseScriptVm_StoreRegisterToContext
