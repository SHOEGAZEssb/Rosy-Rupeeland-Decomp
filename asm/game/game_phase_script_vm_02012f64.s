; Matching retail form; see src/game/game_phase_script_vm_actor_state_opcodes.c.
.text
.extern OS_Halt
.extern data_021052fc
.extern GamePhaseScriptVm_Pop
.extern Actor_GetCollection

    .global GamePhaseActorScriptVm_DispatchCollectionModeCommand
GamePhaseActorScriptVm_DispatchCollectionModeCommand: ; 0x02012f64
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r8, r0
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    ldr r0, [r8, #0x84]
    bl Actor_GetCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x1
    bne L_02012fe8
    ldr r0, L_02013010
    str r7, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, r5, lsl #0x10
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r1, r6
    ldr r5, [r0, #0x0]
    mov r3, r4
    ldr r5, [r5, #0x30]
    mov r2, r2, lsr #0x10
    blx r5
    b L_02013004
L_02012fe8:
    ldr r0, [r8, #0x84]
    bl Actor_GetCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x2
    bne L_02013004
    bl OS_Halt
L_02013004:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
L_02013010: .word data_021052fc
    .size GamePhaseActorScriptVm_DispatchCollectionModeCommand, . - GamePhaseActorScriptVm_DispatchCollectionModeCommand

