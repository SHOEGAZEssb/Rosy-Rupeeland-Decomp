; Matching retail form; see src/game/game_phase_script_vm_register_transfer_opcodes.c.
.text
.extern GamePhaseScriptVm_ReadS16Le
.extern GamePhaseScriptVm_Push
.global GamePhaseScriptVm_PushImmediateS16
GamePhaseScriptVm_PushImmediateS16: ; 0x0201b3f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl GamePhaseScriptVm_ReadS16Le
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_Push
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x2
    str r1, [r4, #0x4]
    ldmia sp!, {r4, pc}
.size GamePhaseScriptVm_PushImmediateS16, . - GamePhaseScriptVm_PushImmediateS16
