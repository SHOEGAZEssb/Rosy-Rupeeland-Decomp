.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern ActorExtendedType2_UpdateFrame
.extern Sound_StopEffect
.extern Sound_IsEffectPlaying
.extern gSoundContext

.global func_ov095_02217aac
func_ov095_02217aac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    tst r0, #0x100
    beq .L_02217af0
    ldr r0, .L_02217b1c
    ldr r1, .L_02217b20
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_IsEffectPlaying
    cmp r0, #0x0
    beq .L_02217af0
    ldr r0, .L_02217b1c
    ldr r1, .L_02217b20
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_StopEffect
.L_02217af0:
    mov r0, r4
    bl ActorExtendedType2_UpdateFrame
    ldrb r0, [r4, #0x24c]
    cmp r0, #0x8
    mvneq r0, #0x47
    mvnne r0, #0x59
    strh r0, [r4, #0x6a]
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x100000
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.L_02217b1c: .word gSoundContext
.L_02217b20: .word 0x1ee
.size func_ov095_02217aac, . - func_ov095_02217aac
