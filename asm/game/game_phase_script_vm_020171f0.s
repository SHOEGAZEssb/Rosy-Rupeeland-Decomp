; Matching retail form; see src/game/game_phase_script_vm_tiered_effect_opcode.c.
.text
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern GamePhaseScriptVm_Pop
.extern PresentationBackedActor_Spawn
.global GamePhaseActorScriptVm_SpawnTieredEffect
GamePhaseActorScriptVm_SpawnTieredEffect:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x3c
    mov r5, r0
    add r0, sp, #0x2c
    bl VecFx32Object_Init
    add r0, sp, #0x1c
    bl VecFx32Object_Init
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #4
    mov r0, r5
    str r1, [sp, #0x28]
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #4
    mov r0, r5
    str r1, [sp, #0x24]
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #4
    mov r0, r5
    str r1, [sp, #0x20]
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #12
    mov r0, r5
    str r1, [sp, #0x38]
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #12
    mov r0, r5
    str r1, [sp, #0x34]
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #12
    mov r0, r5
    str r1, [sp, #0x30]
    bl GamePhaseScriptVm_Pop
    cmp r0, #200
    movge r3, #6
    bge L_020172c8
    cmp r0, #100
    movge r3, #5
    bge L_020172c8
    cmp r0, #50
    movge r3, #4
    bge L_020172c8
    cmp r0, #20
    movge r3, #3
    bge L_020172c8
    cmp r0, #10
    movge r3, #2
    bge L_020172c8
    cmp r0, #5
    movge r3, #1
    movlt r3, #0
L_020172c8:
    ldr r2, L_02017330
    add r1, sp, #0x1c
    stmia sp, {r1, r2}
    add r1, r2, #1
    str r1, [sp, #8]
    add r1, r2, #2
    str r1, [sp, #0xc]
    mov r1, r4, lsl #16
    str r3, [sp, #0x10]
    mov r2, #7
    mov r0, r0, lsl #16
    str r2, [sp, #0x14]
    mov r4, #0
    mov r2, r0, asr #16
    add r3, sp, #0x2c
    mov r1, r1, asr #16
    mov r0, #10
    str r4, [sp, #0x18]
    bl PresentationBackedActor_Spawn
    add r0, sp, #0x1c
    bl VecFx32Object_Destroy
    add r0, sp, #0x2c
    bl VecFx32Object_Destroy
    mov r0, r4
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, pc}
L_02017330: .word 0x0000300d
    .size GamePhaseActorScriptVm_SpawnTieredEffect, . - GamePhaseActorScriptVm_SpawnTieredEffect
