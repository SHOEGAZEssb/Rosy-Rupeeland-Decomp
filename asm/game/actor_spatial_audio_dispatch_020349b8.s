; Matching retail form; see src/game/actor_spatial_audio_dispatch.c.
.text
.extern data_021052fc
.extern func_02009d78
.extern func_020593ac
.extern func_020adae4
.extern func_020be328
.extern gSoundContext

    .global func_020349b8
    .type func_020349b8, @function
func_020349b8: ; 0x020349b8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0x10]
    mov r5, r1
    tst r0, #0x4
    ldreq r0, [r6, #0x58]
    mov r4, r2
    cmpeq r0, #0x0
    beq .L_02034a50
    ldr r0, .L_02034a58
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    ldr r1, [r0, #0x4]
    ldr r2, [r6, #0x1c]
    mvn r0, #0x5f
    sub r1, r2, r1
    sub r1, r1, #0x80000
    mov r6, r1, asr #0xc
    cmp r0, r1, asr #0xc
    movgt r6, r0
    bgt .L_02034a20
    cmp r6, #0x60
    movgt r6, #0x60
.L_02034a20:
    mov r0, r6
    bl func_020be328
    mov r1, #0x3
    bl func_020adae4
    str r6, [sp, #0x0]
    ldr r1, .L_02034a5c
    str r4, [sp, #0x4]
    rsb r3, r0, #0x60
    ldr r0, [r1, #0x0]
    mov r1, r5, asr #0x7
    and r2, r5, #0x7f
    bl func_020593ac
.L_02034a50:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_02034a58: .word data_021052fc
.L_02034a5c: .word gSoundContext
    .size func_020349b8, . - func_020349b8

    .global func_02034a60

