; Matching retail form; see src/game/game_phase_script_vm_actor_vector_command_opcode.c.
.text
.extern func_0200500c
.extern func_02005058
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_DispatchActorScaledVectorCommand
GamePhaseActorScriptVm_DispatchActorScaledVectorCommand:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r5, r0, lsl #4
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r6, r0, lsl #4
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #4
    mov r2, r6
    mov r3, r5
    add r0, sp, #0
    bl func_0200500c
    ldr r0, [r7, #0x84]
    mov r2, r4
    ldr r3, [r0]
    add r1, sp, #0
    ldr r3, [r3, #0xb8]
    blx r3
    add r0, sp, #0
    bl func_02005058
    mov r0, #0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size GamePhaseActorScriptVm_DispatchActorScaledVectorCommand, . - GamePhaseActorScriptVm_DispatchActorScaledVectorCommand
