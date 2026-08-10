; Matching retail form; see src/game/game_phase_script_vm_branch_misc_opcodes.c.
.text
.extern GamePhaseScriptVm_ReadU32Le
.global GamePhaseScriptVm_JumpIfConditionSet
GamePhaseScriptVm_JumpIfConditionSet: ; 0x0201b92c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x7d]
    tst r0, #0x2
    ldr r0, [r4, #0x4]
    addeq r0, r0, #0x4
    beq L_0201b94c
    bl GamePhaseScriptVm_ReadU32Le
L_0201b94c:
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size GamePhaseScriptVm_JumpIfConditionSet, . - GamePhaseScriptVm_JumpIfConditionSet
