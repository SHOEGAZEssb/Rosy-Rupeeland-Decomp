.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_StartTransition
.extern gDisplayBrightnessPair

.global func_020a63d0
func_020a63d0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    ldr r0, .L_020a6400
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0xa
    bl DisplayBrightness_StartTransition
    str r4, [r5, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.L_020a6400: .word gDisplayBrightnessPair
.size func_020a63d0, . - func_020a63d0
