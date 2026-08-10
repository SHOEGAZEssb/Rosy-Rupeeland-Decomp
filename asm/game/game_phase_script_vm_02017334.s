; Matching retail form; see src/game/game_phase_script_vm_brightness_opcodes.c.
.text
.extern data_020f4dc8
.extern DisplayBrightness_StartTransition
.extern DisplayBrightness_GetCurrent
.extern DisplayBrightnessPair_GetScreen
.global GamePhaseActorScriptVm_StartMainBrightnessToZero
GamePhaseActorScriptVm_StartMainBrightnessToZero:
    stmdb sp!, {r4, lr}
    ldr r0, L_02017368
    mov r1, #0
    bl DisplayBrightnessPair_GetScreen
    mov r4, r0
    bl DisplayBrightness_GetCurrent
    mov r1, r0
    mov r0, r4
    mov r2, #0
    mov r3, #16
    bl DisplayBrightness_StartTransition
    mov r0, #0
    ldmia sp!, {r4, pc}
L_02017368: .word data_020f4dc8
    .size GamePhaseActorScriptVm_StartMainBrightnessToZero, . - GamePhaseActorScriptVm_StartMainBrightnessToZero
