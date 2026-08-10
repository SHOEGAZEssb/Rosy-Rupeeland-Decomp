; Matching retail form; see src/game/game_phase_script_vm_phase_request_opcode.c.
.text
.extern data_021052fc
.extern GamePhaseRuntime_StageAreaRequest
.extern GamePhaseScriptVm_Pop

    .global GamePhaseActorScriptVm_StageAreaRequest
GamePhaseActorScriptVm_StageAreaRequest: ; 0x0201416c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    str r6, [sp, #0x0]
    mov r2, r4
    mov r3, r5
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, L_020141d0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_StageAreaRequest
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_020141d0: .word data_021052fc
    .size GamePhaseActorScriptVm_StageAreaRequest, . - GamePhaseActorScriptVm_StageAreaRequest

