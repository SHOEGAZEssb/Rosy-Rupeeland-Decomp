; Matching retail form; see src/game/game_phase_script_vm_stack_storage_opcodes.c.
.text
.extern gGameWork
.global GamePhaseScriptVm_LoadRegisterFromGameWorkWord
GamePhaseScriptVm_LoadRegisterFromGameWorkWord: ; 0x0201c0e8
    ldr r2, [r0, #0x4]
    ldr r1, L_0201c128
    add ip, r2, #0x1
    str ip, [r0, #0x4]
    ldrb r3, [r2, #0x0]
    add r2, ip, #0x1
    str r2, [r0, #0x4]
    ldrb r2, [ip, #0x0]
    ldr r1, [r1, #0x0]
    and r3, r3, #0x7
    add r2, r1, r2, lsl #0x2
    add r1, r0, r3, lsl #0x2
    ldr r2, [r2, #0x7cc]
    mov r0, #0x0
    str r2, [r1, #0x2c]
    bx lr
L_0201c128: .word gGameWork
.size GamePhaseScriptVm_LoadRegisterFromGameWorkWord, . - GamePhaseScriptVm_LoadRegisterFromGameWorkWord
