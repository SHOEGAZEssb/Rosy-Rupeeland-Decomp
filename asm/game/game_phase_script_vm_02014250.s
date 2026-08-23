; Matching retail form; see src/game/game_phase_script_vm_display_opcodes.c.
.text
.extern DisplayBrightness_IsMainTransitionComplete
.extern DisplayBrightness_IsSubTransitionComplete
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition

    .global GamePhaseActorScriptVm_IsBrightnessTransitionPending
GamePhaseActorScriptVm_IsBrightnessTransitionPending: ; 0x02014250
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x1
    beq L_02014270
    cmp r0, #0x2
    beq L_02014284
    b L_02014298
L_02014270:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    b L_020142bc
L_02014284:
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    b L_020142bc
L_02014298:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_020142b0
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    bne L_020142b8
L_020142b0:
    mov r1, #0x1
    b L_020142bc
L_020142b8:
    mov r1, #0x0
L_020142bc:
    mov r0, r4
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_IsBrightnessTransitionPending, . - GamePhaseActorScriptVm_IsBrightnessTransitionPending

