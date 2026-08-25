; Matching retail form; see src/game/game_phase_script_vm_dual_effect_opcode.c.
.text
.extern OS_Halt
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern GamePhaseScriptVm_Pop
.extern Position_AdjustForTerrainHeight
.extern TriggerPresentationActor_Spawn
.global GamePhaseActorScriptVm_SpawnDualVariantEffect
GamePhaseActorScriptVm_SpawnDualVariantEffect:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r4, r0
    add r0, sp, #0x10
    bl VecFx32Object_Init
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r5, r0, lsl #12
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #12
    mov r0, r4
    str r1, [sp, #0x18]
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #12
    mov r0, r4
    str r1, [sp, #0x14]
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    add r0, sp, #0x10
    bl Position_AdjustForTerrainHeight
    cmp r4, #0
    beq L_020175a8
    cmp r4, #1
    beq L_020175e0
    b L_02017618
L_020175a8:
    ldr r3, L_02017630
    mov r0, r5, lsl #16
    str r3, [sp]
    add r1, r3, #1
    str r1, [sp, #4]
    mov r12, #16
    str r12, [sp, #8]
    mov r1, r0, asr #16
    add r2, sp, #0x10
    sub r3, r3, #1
    mov r0, #14
    str r12, [sp, #0xc]
    bl TriggerPresentationActor_Spawn
    b L_0201761c
L_020175e0:
    ldr r3, L_02017634
    mov r0, r5, lsl #16
    str r3, [sp]
    add r1, r3, #1
    str r1, [sp, #4]
    mov r12, #16
    str r12, [sp, #8]
    mov r1, r0, asr #16
    add r2, sp, #0x10
    sub r3, r3, #1
    mov r0, #15
    str r12, [sp, #0xc]
    bl TriggerPresentationActor_Spawn
    b L_0201761c
L_02017618:
    bl OS_Halt
L_0201761c:
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r0, #0
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
L_02017630: .word 0x00001694
L_02017634: .word 0x0000169b
    .size GamePhaseActorScriptVm_SpawnDualVariantEffect, . - GamePhaseActorScriptVm_SpawnDualVariantEffect
