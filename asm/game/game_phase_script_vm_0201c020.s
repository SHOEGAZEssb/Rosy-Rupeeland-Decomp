; Matching retail form; see src/game/game_phase_script_vm_stack_storage_opcodes.c.
.text
.extern gGameWork
.extern GamePhaseScriptVm_Push
.global GamePhaseScriptVm_PushGameWorkHalfword
GamePhaseScriptVm_PushGameWorkHalfword: ; 0x0201c020
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x4]
    ldr r1, L_0201c050
    add r2, r3, #0x1
    str r2, [r0, #0x4]
    ldrb r2, [r3, #0x0]
    ldr r1, [r1, #0x0]
    add r1, r1, r2, lsl #0x1
    ldrsh r1, [r1, #0x4c]
    bl GamePhaseScriptVm_Push
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0201c050: .word gGameWork
.size GamePhaseScriptVm_PushGameWorkHalfword, . - GamePhaseScriptVm_PushGameWorkHalfword
