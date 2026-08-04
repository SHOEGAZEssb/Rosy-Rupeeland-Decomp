; Matching retail form; see src/game/game_phase_visual_effect_controls.c.
.text
.extern func_020afd0c
.global func_02010110
func_02010110:
    stmdb sp!, {r3, lr}
    mov r3, r0
    ldr r0, [r3, #0x94]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1f
    ldr r0, L_02010150
    moveq r1, #0x0
    streqh r1, [r0, #0x0]
    ldmeqia sp!, {r3, pc}
    ldrh r2, [r3, #0x1e]
    mov r1, #0x2
    str r2, [sp, #0x0]
    ldrh r3, [r3, #0x1c]
    mov r2, #0x3d
    bl func_020afd0c
    ldmia sp!, {r3, pc}
L_02010150: .word 0x4000050
    .size func_02010110, . - func_02010110

