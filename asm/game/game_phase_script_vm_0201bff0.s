; Matching retail form; see src/game/game_phase_script_vm_stack_storage_opcodes.c.
.text
.extern GamePhaseScriptVm_ReadU32Le
.extern GamePhaseScriptVm_Push
.global GamePhaseScriptVm_PushImmediateU32
GamePhaseScriptVm_PushImmediateU32: ; 0x0201bff0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl GamePhaseScriptVm_ReadU32Le
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_Push
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x4
    str r1, [r4, #0x4]
    ldmia sp!, {r4, pc}
.size GamePhaseScriptVm_PushImmediateU32, . - GamePhaseScriptVm_PushImmediateU32
