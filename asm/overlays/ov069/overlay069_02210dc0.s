.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern gFx32CosSinTable
.extern func_020adc40
.extern func_020adc90
.extern func_020befec
.extern genrand_int32

.global func_ov069_02210dc0
func_ov069_02210dc0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r2, #0x27
    ldr r5, .L_02211000
    mov r10, r0
    mov r9, r1
    sub r6, r2, #0x1
    mov r11, #0x3c000
.L_02210ddc:
    bl genrand_int32
    and r0, r0, #0x3
    add r1, r0, #0x7
    add r0, r10, r6, lsl #0x2
    str r1, [r0, #0x7c0]
    mov r0, r6
    mov r1, #0xd
    bl func_020befec
    ldr r0, .L_02211004
    mul r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r4, r0, lsl #0x1
    mov r0, r6
    mov r1, #0xd
    bl func_020befec
    mov r1, #0x28
    mul r1, r0, r1
    add r0, r1, #0x64
    mov r1, r4, lsl #0x1
    ldrsh r1, [r5, r1]
    ldr r7, [r9, #0x4]
    add r3, r10, r6, lsl #0x4
    mla r1, r0, r1, r7
    str r1, [r3, #0xa94]
    mov r1, #0x0
    add r2, r5, r4, lsl #0x1
    str r1, [r3, #0xa98]
    ldrsh r1, [r2, #0x2]
    ldr r2, [r9, #0x8]
    mla r1, r0, r1, r2
    str r1, [r3, #0xa9c]
    bl genrand_int32
    ldr r1, .L_02211008
    mov r2, #0x3c000
    and r8, r0, r1
    umull r7, r4, r8, r2
    mov r2, #0x0
    mla r4, r8, r2, r4
    add r1, r10, r6, lsl #0x4
    mov r3, r8, asr #0x1f
    mov r2, #0x3c000
    mla r4, r3, r2, r4
    adds r3, r7, #0x800
    adc r2, r4, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    ldr r0, [r1, #0xa94]
    sub r2, r3, #0x1e000
    add r0, r0, r2
    str r0, [r1, #0xa94]
    bl genrand_int32
    ldr r1, .L_02211008
    mov r2, #0x0
    and r8, r0, r1
    umull r7, r4, r8, r11
    add r1, r10, r6, lsl #0x4
    mla r4, r8, r2, r4
    mov r3, r8, asr #0x1f
    mla r4, r3, r11, r4
    adds r3, r7, #0x800
    adc r2, r4, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    ldr r0, [r1, #0xa9c]
    sub r2, r3, #0x1e000
    add r3, r0, r2
    str r3, [r1, #0xa9c]
    ldr r0, [r9, #0x8]
    ldr r1, [r1, #0xa94]
    ldr r2, [r9, #0x4]
    sub r8, r0, r3
    sub r7, r2, r1
    mov r1, r8, asr #0x1f
    smull r3, r2, r7, r7
    mov r0, #0x800
    adds r3, r3, r0
    mov r0, #0x0
    adc r2, r2, r0
    mov r0, r3, lsr #0xc
    umull r4, r3, r8, r8
    mla r3, r8, r1, r3
    orr r0, r0, r2, lsl #0x14
    adds r2, r4, #0x800
    mla r3, r1, r8, r3
    mov r2, r2, lsr #0xc
    adc r1, r3, #0x0
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    mov r4, r0
    mov r0, r7
    mov r1, r4
    bl func_020adc90
    mov r1, r4
    mov r4, #0x3000
    umull ip, r4, r0, r4
    adds r7, ip, #0x800
    mov ip, #0x0
    mla r4, r0, ip, r4
    mov r3, r0, asr #0x1f
    mov r0, #0x3000
    mla r4, r3, r0, r4
    mov r0, ip
    mov r7, r7, lsr #0xc
    adc r0, r4, r0
    orr r7, r7, r0, lsl #0x14
    add r2, r10, r6, lsl #0x4
    mov r0, r8
    str r7, [r2, #0x8]
    bl func_020adc90
    mov r4, #0x3000
    umull r8, r4, r0, r4
    adds r7, r8, #0x800
    mov r8, #0x0
    add r1, r10, r6, lsl #0x2
    mla r4, r0, r8, r4
    mov r3, r0, asr #0x1f
    mov r0, #0x3000
    mla r4, r3, r0, r4
    mov r0, r8
    mov r7, r7, lsr #0xc
    adc r0, r4, r0
    orr r7, r7, r0, lsl #0x14
    add r2, r10, r6, lsl #0x4
    add r1, r1, #0x1000
    str r7, [r2, #0x10]
    mov r0, r8
    str r0, [r1, #0x30]
    bl genrand_int32
    add r1, r10, r6, lsl #0x1
    add r1, r1, #0x500
    strh r0, [r1, #0xa4]
    subs r6, r6, #0x1
    bpl .L_02210ddc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02211000: .word gFx32CosSinTable
.L_02211004: .word 0x13b1
.L_02211008: .word 0xfff
.size func_ov069_02210dc0, . - func_ov069_02210dc0
