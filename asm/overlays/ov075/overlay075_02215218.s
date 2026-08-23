.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern ActorExtendedType2_ResetVerticalMotionCallbacks
.extern Sound_PlayOwnedEffect
.extern func_ov075_022152ac
.extern gSoundContext

.global func_ov075_02215218
func_ov075_02215218:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl ActorExtendedType2_ResetVerticalMotionCallbacks
    mov r0, r4
    bl func_ov075_022152ac
    cmp r0, #0x0
    addne r0, r4, #0x200
    movne r1, #0x12c
    strneh r1, [r0, #0x5a]
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02215278
    ldr r1, [r0, #0x29c]
    tst r1, #0x1
    beq .L_02215278
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10c]
    blx r1
    ldr r0, [r4, #0x298]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1d8]
    blx r1
    b .L_022152a0
.L_02215278:
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_022152a8
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1e8
    mov r2, #0x2
    bl Sound_PlayOwnedEffect
.L_022152a0:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_022152a8: .word gSoundContext
.size func_ov075_02215218, . - func_ov075_02215218
