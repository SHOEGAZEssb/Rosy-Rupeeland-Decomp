.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern Sound_Play
.extern func_02072b68
.extern gSoundContext

.global func_ov071_022113fc
func_ov071_022113fc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0xd8]
    mov r4, #0x0
    sub r0, r0, r1
    str r0, [r6, #0xd8]
    ldr r0, [r6, #0xd0]
    mov r5, r2
    cmp r0, #0x0
    moveq r0, #0x10
    streq r0, [r6, #0xd0]
    mov r0, #0x0
    str r0, [r6, #0xd4]
    ldr r0, [r6, #0x90]
    moveq r4, #0x1
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0xc
    beq .L_02211450
    mov r1, #0xc
    bl func_02072b68
.L_02211450:
    cmp r5, #0x0
    beq .L_02211500
    ldr r2, [r5, #0x4]
    ldr r1, [r6, #0x98]
    ldr r0, .L_02211508
    sub r2, r2, r1
    umull ip, r3, r2, r0
    mov r1, #0x0
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    adds ip, ip, #0x800
    mla r3, r2, r0, r3
    ldr lr, [r5, #0x8]
    ldr r2, [r6, #0x9c]
    adc r5, r3, #0x0
    sub lr, lr, r2
    umull r3, r2, lr, r0
    mov ip, ip, lsr #0xc
    adds r3, r3, #0x800
    mla r2, lr, r1, r2
    mov r1, lr, asr #0x1f
    mla r2, r1, r0, r2
    ldr r0, [r6, #0xa4]
    orr ip, ip, r5, lsl #0x14
    sub r0, r0, ip
    str r0, [r6, #0xa4]
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    ldr r2, [r6, #0xa8]
    orr r1, r1, r0, lsl #0x14
    sub r0, r2, r1
    str r0, [r6, #0xa8]
    mov r1, #0x1
    ldr r0, .L_0221150c
    str r1, [r6, #0xcc]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02211510
    mov r2, #0x7
    bl Sound_Play
    ldr r0, .L_0221150c
    ldr r1, .L_02211510
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_Play
.L_02211500:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_02211508: .word 0x333
.L_0221150c: .word gSoundContext
.L_02211510: .word 0x16a
.size func_ov071_022113fc, . - func_ov071_022113fc
