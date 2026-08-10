.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern Sound_Play
.extern data_020f4dc8
.extern DisplayBrightness_StartTransition
.extern DisplayBrightnessPair_GetScreen
.extern gSoundContext

.global func_ov052_0220e178
func_ov052_0220e178:
    stmdb sp!, {r3, lr}
    ldr r1, .L_0220e1b8
    mov r2, #0x4
    strh r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x3a
    bl Sound_Play
    ldr r0, .L_0220e1bc
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x4
    bl DisplayBrightness_StartTransition
    ldmia sp!, {r3, pc}
.L_0220e1b8: .word gSoundContext
.L_0220e1bc: .word data_020f4dc8
.size func_ov052_0220e178, . - func_ov052_0220e178
