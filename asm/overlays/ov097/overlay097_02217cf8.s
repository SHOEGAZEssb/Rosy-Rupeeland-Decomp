.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern ActorExtendedType2_PrepareRelease
.extern Sound_StopEffect
.extern Sound_IsEffectPlaying
.extern gSoundContext

.global func_ov097_02217cf8
func_ov097_02217cf8:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02217d3c
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_02217d40
    mov r2, #0x9
    bl Sound_IsEffectPlaying
    cmp r0, #0x0
    beq .L_02217d30
    ldr r0, .L_02217d3c
    ldr r1, .L_02217d40
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl Sound_StopEffect
.L_02217d30:
    mov r0, r4
    bl ActorExtendedType2_PrepareRelease
    ldmia sp!, {r4, pc}
.L_02217d3c: .word gSoundContext
.L_02217d40: .word 0x1ed
.size func_ov097_02217cf8, . - func_ov097_02217cf8
