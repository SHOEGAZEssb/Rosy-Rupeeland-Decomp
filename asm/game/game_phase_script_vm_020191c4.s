; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern func_020befec
.global GamePhaseActorScriptVm_IsPointWithinEllipse
GamePhaseActorScriptVm_IsPointWithinEllipse:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r9, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    sub r1, r0, r7
    sub r0, r6, r9
    mov r6, r0, lsl #0xc
    movs r2, r1, lsl #0xc
    mov r7, #0x0
    cmpeq r6, #0x0
    moveq r7, #0x1
    beq L_02019274
    smull r1, r0, r2, r2
    adds r3, r1, #0x800
    mul r1, r5, r5
    adc r2, r0, #0x0
    mov r0, r3, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    bl func_020befec
    smull r1, r2, r6, r6
    adds r3, r1, #0x800
    mov r5, r0
    mul r1, r4, r4
    adc r2, r2, #0x0
    mov r0, r3, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    bl func_020befec
    add r0, r5, r0
    cmp r0, #0x1000
    movlt r7, #0x1
L_02019274:
    mov r0, r8
    mov r1, r7
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size GamePhaseActorScriptVm_IsPointWithinEllipse, . - GamePhaseActorScriptVm_IsPointWithinEllipse
