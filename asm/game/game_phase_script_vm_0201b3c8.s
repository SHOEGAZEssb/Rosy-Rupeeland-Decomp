; Matching retail form; see src/game/game_phase_script_vm_register_transfer_opcodes.c.
.text
.extern GamePhaseScriptVm_Push
.global GamePhaseScriptVm_PushRegister
GamePhaseScriptVm_PushRegister: ; 0x0201b3c8
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x4]
    ldrb r2, [r1], #0x1
    str r1, [r0, #0x4]
    mov r2, r2, asr #0x4
    and r2, r2, #0x7
    add r1, r0, r2, lsl #0x2
    ldr r1, [r1, #0x2c]
    bl GamePhaseScriptVm_Push
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size GamePhaseScriptVm_PushRegister, . - GamePhaseScriptVm_PushRegister
