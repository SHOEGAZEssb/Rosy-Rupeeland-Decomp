; Matching retail form; see src/game/game_phase_script_vm_external_storage_opcodes.c.
.text
.global GamePhaseScriptVm_StoreRegisterToExternalStorage
GamePhaseScriptVm_StoreRegisterToExternalStorage: ; 0x0201bf04
    ldr r1, [r0, #0x4]
    add r3, r1, #0x1
    str r3, [r0, #0x4]
    ldrb r2, [r1, #0x0]
    add r1, r3, #0x1
    str r1, [r0, #0x4]
    and r2, r2, #0x7
    add r2, r0, r2, lsl #0x2
    ldrb r1, [r3, #0x0]
    ldr r2, [r2, #0x2c]
    add r0, r0, r1, lsl #0x2
    str r2, [r0, #0xc]
    mov r0, #0x0
    bx lr
.size GamePhaseScriptVm_StoreRegisterToExternalStorage, . - GamePhaseScriptVm_StoreRegisterToExternalStorage
