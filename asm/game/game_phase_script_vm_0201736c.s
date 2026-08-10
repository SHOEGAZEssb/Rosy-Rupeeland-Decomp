; Matching retail form; see src/game/game_phase_script_vm_brightness_opcodes.c.
.text
.extern data_020f4dc8
.extern DisplayBrightness_StartTransition
.extern DisplayBrightness_GetCurrent
.extern DisplayBrightnessPair_GetScreen
.global GamePhaseActorScriptVm_StartMainBrightnessToMinus8
GamePhaseActorScriptVm_StartMainBrightnessToMinus8:
    stmdb sp!, {r4, lr}
    ldr r0, L_020173a0
    mov r1, #0
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
L_020173a0: .word data_020f4dc8
    .size GamePhaseActorScriptVm_StartMainBrightnessToMinus8, . - GamePhaseActorScriptVm_StartMainBrightnessToMinus8
