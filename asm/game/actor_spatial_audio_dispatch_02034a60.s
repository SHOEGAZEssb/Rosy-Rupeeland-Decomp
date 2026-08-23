; Matching retail form; see src/game/actor_spatial_audio_dispatch.c.
.text
.extern data_021052fc
.extern ActorMotionAreaFollower_GetPosition
.extern Sound_PlayEffectWithParameters
.extern func_020adae4
.extern func_020adc40
.extern SignedAbsoluteValueVariant
.extern gSoundContext

    .global func_02034a60
    .type func_02034a60, @function
func_02034a60: ; 0x02034a60
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r3, .L_02034b34
    mov r7, r0
    ldr r0, [r3, #0x0]
    mov r6, r1
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    mov r5, r2
    bl ActorMotionAreaFollower_GetPosition
    ldr r1, [r0, #0x4]
    ldr r2, [r7, #0x1c]
    mvn r0, #0xfe
    sub r1, r2, r1
    sub r1, r1, #0x80000
    mov r4, r1, asr #0xc
    cmp r0, r1, asr #0xc
    cmple r4, #0xff
    bgt .L_02034b2c
    ldr r0, .L_02034b34
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r1, [r0, #0x8]
    ldr r2, [r7, #0x20]
    mvn r0, #0xfe
    sub r1, r2, r1
    sub r1, r1, #0x74000
    cmp r0, r1, asr #0xc
    mov r1, r1, asr #0xc
    cmple r1, #0xff
    bgt .L_02034b2c
    mul r0, r1, r1
    mla r0, r4, r4, r0
    mov r0, r0, lsl #0xc
    bl func_020adc40
    mov r0, r0, asr #0xc
    bl SignedAbsoluteValueVariant
    mov r1, #0x3
    bl func_020adae4
    add r1, r4, r4, lsr #0x1f
    mov r1, r1, asr #0x1
    str r1, [sp, #0x0]
    ldr r1, .L_02034b38
    str r5, [sp, #0x4]
    rsb r3, r0, #0x60
    ldr r0, [r1, #0x0]
    mov r1, r6, asr #0x7
    and r2, r6, #0x7f
    bl Sound_PlayEffectWithParameters
.L_02034b2c:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02034b34: .word data_021052fc
.L_02034b38: .word gSoundContext
    .size func_02034a60, . - func_02034a60

    .global Actor_SetInteractionBounds
