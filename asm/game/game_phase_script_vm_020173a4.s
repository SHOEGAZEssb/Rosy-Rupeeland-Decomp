; Matching retail form; see src/game/game_phase_script_vm_brightness_opcodes.c.
.text
.extern data_020f4dc8
.extern DisplayBrightness_StartTransition
.extern DisplayBrightness_GetCurrent
.extern DisplayBrightnessPair_GetScreen
.global func_020173a4
func_020173a4:
    stmdb sp!, {r4, lr}
    ldr r0, L_020173d8
    mov r1, #1
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
L_020173d8: .word data_020f4dc8
    .size func_020173a4, . - func_020173a4
