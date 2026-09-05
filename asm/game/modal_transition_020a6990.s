.text
; Matching fallback for the portable implementation in src/game/modal_transition.c.
.extern SoundContext_PlayDefaultStream
.extern Sound_Play
.extern gFx32CosSinTable
.extern gSoundContext

.global func_020a6990
func_020a6990:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r5, r1
    cmp r0, #0x0
    blt .L_020a6a98
    bne .L_020a69c8
    cmp r2, #0x0
    beq .L_020a69c8
    ldr r0, .L_020a6aa0
    mov r1, r2, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    bl SoundContext_PlayDefaultStream
.L_020a69c8:
    cmp r5, #0x0
    beq .L_020a69f8
    ldr r0, [r4, #0x20]
    cmp r0, #0xa
    bne .L_020a69f8
    ldr r1, .L_020a6aa0
    mov r0, r5, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_Play
.L_020a69f8:
    ldr r0, [r4, #0x20]
    cmp r0, #0x5a
    addlt r0, r0, #0x1
    strlt r0, [r4, #0x20]
    blt .L_020a6a90
    ldr r0, [r4, #0x14]
    add r0, r0, #0x3d
    str r0, [r4, #0x14]
    cmp r0, #0x1000
    ble .L_020a6a38
    ldr r0, [r4, #0x20]
    cmp r0, #0xa0
    addlt r0, r0, #0x1
    strlt r0, [r4, #0x20]
    movlt r0, #0x1000
    strlt r0, [r4, #0x14]
.L_020a6a38:
    ldr r0, [r4, #0x14]
    ldr r1, .L_020a6aa4
    cmp r0, #0x2000
    mvngt r0, #0x0
    strgt r0, [r4, #0x20]
    ldr r3, [r4, #0x14]
    mov r0, r3, lsl #0x12
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r2, [r1, r0]
    mov r0, #0x800
    str r3, [r4, #0x18]
    mov r1, r2, asr #0x1f
    mov r1, r1, lsl #0x13
    adds r3, r0, r2, lsl #0x13
    orr r1, r1, r2, lsr #0xd
    adc r0, r1, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r1, #0x20000
    str r0, [r4, #0x8]
.L_020a6a90:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_020a6a98:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_020a6aa0: .word gSoundContext
.L_020a6aa4: .word gFx32CosSinTable
.size func_020a6990, . - func_020a6990
