; Matching retail form; see src/game/game_phase_script_vm_brightness_opcodes.c.
.text
.extern gDisplayBrightnessPair
.extern DisplayBrightness_StartTransition
.extern DisplayBrightness_GetCurrent
.extern DisplayBrightnessPair_GetScreen
.global GamePhaseActorScriptVm_StartSubBrightnessToMinus8
GamePhaseActorScriptVm_StartSubBrightnessToMinus8:
    stmdb sp!, {r4, lr}
    ldr r0, L_02017410
    mov r1, #1
    bl DisplayBrightnessPair_GetScreen
    mov r4, r0
    bl DisplayBrightness_GetCurrent
    mov r1, r0
    mov r0, r4
    mvn r2, #7
    mov r3, #16
    bl DisplayBrightness_StartTransition
    mov r0, #0
    ldmia sp!, {r4, pc}
L_02017410: .word gDisplayBrightnessPair
    .size GamePhaseActorScriptVm_StartSubBrightnessToMinus8, . - GamePhaseActorScriptVm_StartSubBrightnessToMinus8
