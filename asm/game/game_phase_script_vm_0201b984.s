; Matching retail form; see src/game/game_phase_script_vm_branch_misc_opcodes.c.
.text
.global GamePhaseScriptVm_InvokeByteMethod
GamePhaseScriptVm_InvokeByteMethod: ; 0x0201b984
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x4]
    add r1, r3, #0x1
    str r1, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldrb r1, [r3, #0x0]
    ldr r2, [r2, #0x8]
    blx r2
    ldmia sp!, {r3, pc}
.size GamePhaseScriptVm_InvokeByteMethod, . - GamePhaseScriptVm_InvokeByteMethod
