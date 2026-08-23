; Matching retail form; see src/game/game_phase_script_vm_branch_misc_opcodes.c.
.text
.extern GamePhaseScriptVm_UpdateConditionForZeroRegisterValue
.global GamePhaseScriptVm_NotRegister
GamePhaseScriptVm_NotRegister: ; 0x0201b8fc
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x4]
    ldrb r1, [r2], #0x1
    str r2, [r0, #0x4]
    and r1, r1, #0x7
    add r3, r0, r1, lsl #0x2
    ldr r2, [r3, #0x2c]
    mvn r2, r2
    str r2, [r3, #0x2c]
    bl GamePhaseScriptVm_UpdateConditionForZeroRegisterValue
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size GamePhaseScriptVm_NotRegister, . - GamePhaseScriptVm_NotRegister
