.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern ActorExtendedType2_UpdateFrame
.extern Sound_PlayOwnedEffect
.extern Sound_StopEffect
.extern Sound_SetEffectPitch
.extern Sound_IsEffectPlaying
.extern gSoundContext

.global func_ov076_0221416c
func_ov076_0221416c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl ActorExtendedType2_UpdateFrame
    ldr r0, .L_0221423c
    mov r1, #0x1c4
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_IsEffectPlaying
    ldrsh r1, [r4, #0xd6]
    sub r1, r1, #0x5
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r1, #0x1
    bhi .L_02214218
    cmp r0, #0x0
    bne .L_022141e0
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_0221423c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1c4
    mov r2, #0x8
    bl Sound_PlayOwnedEffect
.L_022141e0:
    ldrsh r0, [r4, #0xd6]
    cmp r0, #0x5
    moveq r3, #0xa0
    beq .L_02214200
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    movne r3, #0x180
    moveq r3, #0x140
.L_02214200:
    ldr r0, .L_0221423c
    mov r1, #0x1c4
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_SetEffectPitch
    b .L_02214234
.L_02214218:
    cmp r0, #0x0
    beq .L_02214234
    ldr r0, .L_0221423c
    mov r1, #0x1c4
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_StopEffect
.L_02214234:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_0221423c: .word gSoundContext
.size func_ov076_0221416c, . - func_ov076_0221416c
