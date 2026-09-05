.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.
.extern data_020c9590
.extern func_020befec
.extern gFx32CosSinTable
.extern genrand_int32

.global func_020a65a4
func_020a65a4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r8, r0
    ldr r0, [r8, #0x0]
    cmp r0, #0x0
    beq .L_020a67ec
    ldr r3, .L_020a67f4
    add r2, sp, #0x0
    mov r1, #0x5
.L_020a65c8:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne .L_020a65c8
    bl genrand_int32
    ldr r1, .L_020a67f8
    mov r2, #0xa
    and r0, r0, r1
    mul r5, r0, r2
    bl genrand_int32
    ldr r1, .L_020a67f8
    mov r2, #0xc0
    and r0, r0, r1
    add r7, r0, r0, lsl #0x2
    sub r4, r2, #0x1
    mov r11, r5, asr #0x1f
    mov r6, r7, asr #0x1f
.L_020a660c:
    ldr r1, [r8, #0x10]
    ldr r0, .L_020a67fc
    ldr r2, [r8, #0xc]
    mla r0, r4, r0, r1
    ldr r1, .L_020a6800
    mov r0, r0, lsl #0x10
    mla r1, r4, r1, r2
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, .L_020a6804
    mov r0, r0, lsr #0x10
    ldrsh lr, [r1, r2]
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x2
    umull r10, r9, lr, r5
    ldr r0, .L_020a6804
    adds r10, r10, #0x800
    ldrsh r2, [r0, r1]
    mla r9, lr, r11, r9
    mov ip, lr, asr #0x1f
    mla r9, ip, r5, r9
    ldr r3, [r8, #0x20]
    mov r1, #0x180
    mla r1, r3, r1, r8
    add r3, r1, r4, lsl #0x1
    adc r9, r9, #0x0
    mov r10, r10, lsr #0xc
    orr r10, r10, r9, lsl #0x14
    mov r9, r10, asr #0xc
    strh r9, [r3, #0x24]
    umull r9, r3, r2, r7
    mla r3, r2, r6, r3
    mov r0, r2, asr #0x1f
    mla r3, r0, r7, r3
    mov r0, #0x800
    adds r2, r9, r0
    mov r0, #0x0
    ldr ip, [r8, #0x20]
    mov r10, #0x180
    mla r10, ip, r10, r8
    add r10, r10, r4, lsl #0x1
    adc r0, r3, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    ldrsh r0, [r10, #0x24]
    mov r1, #0x5
    add r0, r0, r2, asr #0xc
    strh r0, [r10, #0x24]
    ldr r0, [r8, #0x1c]
    add r0, r4, r0
    bl func_020befec
    add r0, sp, #0x0
    ldrsb r2, [r0, r1]
    ldr r1, [r8, #0x20]
    mov r0, #0xc0
    mla r0, r1, r0, r8
    add r0, r4, r0
    strb r2, [r0, #0x324]
    subs r4, r4, #0x1
    bpl .L_020a660c
    ldr r0, [r8, #0x14]
    mov r1, #0xe6
    mov r0, r0, asr #0x1
    bl func_020befec
    mov r0, #0x20
    sub r4, r0, #0x1
    sub r3, r1, #0x20
    mov r0, #0xc0
.L_020a6724:
    cmp r3, #0x0
    blt .L_020a6750
    cmp r3, #0xc0
    bge .L_020a6750
    ldr r1, [r8, #0x20]
    mla r2, r1, r0, r8
    add r2, r2, r3
    add r1, r2, #0x300
    ldrsb r1, [r1, #0x24]
    sub r1, r1, #0x3
    strb r1, [r2, #0x324]
.L_020a6750:
    add r3, r3, #0x1
    subs r4, r4, #0x1
    bpl .L_020a6724
    ldr r2, [r8, #0x18]
    cmp r2, #0xc0
    bge .L_020a6784
    ldr r1, [r8, #0x20]
    mov r0, #0xc0
    mla r0, r1, r0, r8
    add r0, r0, r2
    mov r1, #0xa
    strb r1, [r0, #0x324]
    add r2, r2, #0x1
.L_020a6784:
    cmp r2, #0xc0
    bge .L_020a67a4
    ldr r1, [r8, #0x20]
    mov r0, #0xc0
    mla r0, r1, r0, r8
    add r0, r0, r2
    mov r1, #0xe
    strb r1, [r0, #0x324]
.L_020a67a4:
    ldr r0, [r8, #0xc]
    mov r1, #0xfa
    sub r0, r0, #0x12c
    str r0, [r8, #0xc]
    ldr r0, [r8, #0x10]
    add r0, r0, #0x2bc
    str r0, [r8, #0x10]
    ldr r0, [r8, #0x14]
    add r0, r0, #0x1
    str r0, [r8, #0x14]
    ldr r0, [r8, #0x18]
    add r0, r0, #0x1
    str r0, [r8, #0x18]
    bl func_020befec
    str r1, [r8, #0x18]
    ldr r0, [r8, #0x1c]
    add r0, r0, #0x1
    str r0, [r8, #0x1c]
.L_020a67ec:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_020a67f4: .word data_020c9590
.L_020a67f8: .word 0xfff
.L_020a67fc: .word 0x1414
.L_020a6800: .word 0x5dc
.L_020a6804: .word gFx32CosSinTable
.size func_020a65a4, . - func_020a65a4
