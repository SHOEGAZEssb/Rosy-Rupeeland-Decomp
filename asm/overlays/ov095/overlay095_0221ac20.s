.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern ActorExtendedType2_PrepareRelease
.extern Sound_StopEffect
.extern Sound_IsEffectPlaying
.extern gSoundContext

.global func_ov095_0221ac20
func_ov095_0221ac20:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221ac64
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0221ac68
    mov r2, #0x7
    bl Sound_IsEffectPlaying
    cmp r0, #0x0
    beq .L_0221ac58
    ldr r0, .L_0221ac64
    ldr r1, .L_0221ac68
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl Sound_StopEffect
.L_0221ac58:
    mov r0, r4
    bl ActorExtendedType2_PrepareRelease
    ldmia sp!, {r4, pc}
.L_0221ac64: .word gSoundContext
.L_0221ac68: .word 0x1ee
.size func_ov095_0221ac20, . - func_ov095_0221ac20
