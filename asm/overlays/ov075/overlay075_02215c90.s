.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern ActorExtendedType2_ResetVerticalMotionCallbacks
.extern func_020593dc
.extern func_ov075_022152ac
.extern gSoundContext

.global func_ov075_02215c90
func_ov075_02215c90:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r1, [r4, #0x260]
    orr r1, r1, #0x2
    str r1, [r4, #0x260]
    bl ActorExtendedType2_ResetVerticalMotionCallbacks
    mov r0, r4
    bl func_ov075_022152ac
    cmp r0, #0x0
    addne r0, r4, #0x200
    movne r1, #0x12c
    strneh r1, [r0, #0x5a]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    str r1, [sp, #0x4]
    ldr r0, .L_02215cf4
    mov r3, r4
    ldr r0, [r0, #0x0]
    mov r1, #0x1e8
    mov r2, #0x2
    bl func_020593dc
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_02215cf4: .word gSoundContext
.size func_ov075_02215c90, . - func_ov075_02215c90
