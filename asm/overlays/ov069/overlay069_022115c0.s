.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern Sound_Play
.extern data_021052fc
.extern data_ov069_0221255c
.extern data_ov069_02212590
.extern func_0201e0ec
.extern func_020a2310
.extern func_020a2448
.extern func_020a25c8
.extern func_020adc40
.extern gSoundContext

.global func_ov069_022115c0
func_ov069_022115c0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x24
    ldr r5, .L_02211768
    add r4, sp, #0xc
    mov r10, r0
    mov r9, r1
    mov r7, r4
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1}
    mov r2, #0x5a
    stmia r4, {r0, r1}
    mov r11, #0x0
    sub r8, r2, #0x1
    mov r5, r11
    mov r4, #0x800
    mvn r6, #0x0
.L_02211604:
    add r1, r10, r8, lsl #0x2
    ldr r0, [r1, #0x7c0]
    cmp r0, #0x0
    beq .L_02211754
    add r0, r1, #0x1000
    ldr r0, [r0, #0x30]
    cmp r0, r6
    bgt .L_02211754
    add r3, r10, r8, lsl #0x4
    ldr r0, [r9, #0x8]
    ldr r1, [r3, #0xa9c]
    sub r0, r0, #0xa000
    ldr ip, [r3, #0xa94]
    sub r2, r1, r0
    ldr r3, [r9, #0x4]
    smull r1, r0, r2, r2
    sub r2, ip, r3
    smull r3, ip, r2, r2
    adds r3, r3, #0x800
    adc r2, ip, r11
    adds r1, r1, r4
    mov r3, r3, lsr #0xc
    adc r0, r0, r5
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    add r2, r10, r8, lsl #0x2
    ldr r1, [r2, #0x7c0]
    add r3, r7, r1, lsl #0x2
    ldr r3, [r3, #-0x4]
    cmp r0, r3
    bge .L_02211754
    ldr r4, [r10, #0x0]
    ldr r0, .L_0221176c
    ldr r3, [r4, #0x90]
    ldr r1, [r0, r1, lsl #0x2]
    mov r0, #0x0
    add r1, r3, r1
    str r1, [r4, #0x90]
    str r0, [r2, #0x7c0]
    ldr r0, [r2, #0x928]
    cmp r0, #0xff
    beq .L_022116d8
    ldr r0, .L_02211770
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    add r1, r10, r8, lsl #0x2
    ldr r1, [r1, #0x928]
    bl func_020a2310
.L_022116d8:
    ldr r0, .L_02211770
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x1c
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x4
    str r1, [sp, #0x8]
    add r1, r10, r8, lsl #0x4
    ldr r2, [r1, #0xa94]
    ldr r1, [r1, #0xa9c]
    mov r2, r2, asr #0xc
    mov r1, r1, asr #0xc
    mov r4, r0
    sub r2, r2, #0xe
    sub r3, r1, #0x13
    mov r1, #0x0
    bl func_020a25c8
    mov r1, r0
    mov r0, r4
    mvn r2, #0x13
    bl func_020a2448
    ldr r0, .L_02211774
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    bl Sound_Play
    mov r0, #0x1
    b .L_02211760
.L_02211754:
    subs r8, r8, #0x1
    bpl .L_02211604
    mov r0, #0x0
.L_02211760:
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02211768: .word data_ov069_0221255c
.L_0221176c: .word data_ov069_02212590
.L_02211770: .word data_021052fc
.L_02211774: .word gSoundContext
.size func_ov069_022115c0, . - func_ov069_022115c0
