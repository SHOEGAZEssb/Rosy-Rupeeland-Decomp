.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern data_ov069_022125ac
.extern func_020adc90
.extern genrand_int32

.global func_ov069_02210a44
func_ov069_02210a44:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    ldr r4, .L_02210db0
    mov r9, r1
    mov r1, #0x28
    mla r1, r9, r1, r4
    mov r10, r0
    mov r0, r2, lsl #0xc
    str r1, [sp, #0x0]
    mov r1, #0x14
    str r0, [sp, #0x8]
    mov r0, r3, lsl #0xc
    sub r6, r1, #0x1
    str r0, [sp, #0x4]
.L_02210a7c:
    mov r0, #0x5a
    sub r8, r0, #0x1
.L_02210a84:
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x7c0]
    cmp r0, #0x0
    bne .L_02210d98
    ldr r0, [sp, #0x8]
    add r5, r10, r8, lsl #0x4
    str r0, [r5, #0xa94]
    mov r0, #0x0
    str r0, [r5, #0xa98]
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    str r0, [r5, #0xa9c]
    sub r0, r1, #0x1
    str r0, [sp, #0xc]
    ldr r0, .L_02210db4
    mov r4, #0x10000
    add r0, r0, #0x1000
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x40]
    rsb r4, r4, #0x0
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x44]
    str r0, [sp, #0x14]
.L_02210ae0:
    cmp r9, #0x2
    cmpne r9, #0x5
    beq .L_02210af4
    cmp r9, #0x8
    blt .L_02210b98
.L_02210af4:
    bl genrand_int32
    ldr r1, .L_02210db4
    and r7, r0, r1
    mov r0, #0x17c000
    umull r3, r2, r7, r0
    mov r0, #0x0
    mla r2, r7, r0, r2
    mov r1, r7, asr #0x1f
    mov r0, #0x17c000
    mla r2, r1, r0, r2
    mov r0, #0x800
    adds r1, r3, r0
    mov r0, #0x0
    adc r0, r2, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r1, #0x42000
    add r11, r0, #0x100000
    bl genrand_int32
    ldr r1, .L_02210db4
    and r7, r0, r1
    mov r0, #0x17c000
    umull r3, r2, r7, r0
    mov r0, #0x0
    mla r2, r7, r0, r2
    mov r1, r7, asr #0x1f
    mov r0, #0x17c000
    mla r2, r1, r0, r2
    mov r0, #0x800
    adds r1, r3, r0
    mov r0, #0x0
    adc r0, r2, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r7, r1, #0xbe000
    bl genrand_int32
    ldr r1, [sp, #0x18]
    and r0, r0, r1
    sub r0, r0, #0x5000
    str r0, [r5, #0xc]
    b .L_02210c44
.L_02210b98:
    bl genrand_int32
    ldr r1, .L_02210db4
    mov r11, #0x0
    and r7, r0, r1
    ldr r1, [r5, #0xa94]
    mov r0, r7, asr #0x1f
    sub r3, r1, #0x46000
    mov r1, #0x8c000
    umull r2, r1, r7, r1
    mla r1, r7, r11, r1
    mov r7, #0x8c000
    mla r1, r0, r7, r1
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, r11
    adc r0, r1, r0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r11, r3, r1
    bl genrand_int32
    ldr r1, .L_02210db4
    mov ip, #0x0
    and r7, r0, r1
    ldr r1, [r5, #0xa9c]
    mov r0, r7, asr #0x1f
    sub r3, r1, #0x32000
    mov r1, #0x64000
    umull r2, r1, r7, r1
    mla r1, r7, ip, r1
    mov r7, #0x64000
    mla r1, r0, r7, r1
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, ip
    adc r0, r1, r0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r7, r3, r1
    bl genrand_int32
    ldr r1, .L_02210db4
    and r0, r0, r1
    sub r0, r0, #0x4000
    str r0, [r5, #0xc]
.L_02210c44:
    ldr r0, [sp, #0x10]
    sub r1, r11, r0
    ldr r0, [sp, #0x14]
    cmp r1, r4
    sub r0, r7, r0
    ble .L_02210c84
    cmp r1, #0x10000
    bge .L_02210c84
    cmp r0, r4
    ble .L_02210c84
    cmp r0, #0x10000
    bge .L_02210c84
    ldr r0, [sp, #0xc]
    subs r0, r0, #0x1
    str r0, [sp, #0xc]
    bpl .L_02210ae0
.L_02210c84:
    add r2, r10, r8, lsl #0x4
    ldr r0, [r2, #0xa94]
    ldr r1, .L_02210db8
    sub r0, r0, r11
    str r0, [r2, #0x8]
    ldr r0, [r2, #0xa9c]
    sub r0, r0, r7
    str r0, [r2, #0x10]
    ldr r0, [r2, #0xc]
    bl func_020adc90
    mov r1, r0, asr #0x1f
    mov r2, r1, lsl #0xd
    mov r1, #0x800
    adds r3, r1, r0, lsl #0xd
    orr r2, r2, r0, lsr #0x13
    add r0, r10, r8, lsl #0x4
    adc r1, r2, #0x0
    mov r4, r3, lsr #0xc
    orr r4, r4, r1, lsl #0x14
    ldr r0, [r0, #0x8]
    mov r1, r4
    bl func_020adc90
    mov r1, r4
    add r2, r10, r8, lsl #0x4
    str r0, [r2, #0x8]
    ldr r0, [r2, #0x10]
    bl func_020adc90
    add r1, r10, r8, lsl #0x4
    str r0, [r1, #0x10]
    mov r1, #0x0
    add r0, r10, r8, lsl #0x1
    add r0, r0, #0x500
    strh r1, [r0, #0xa4]
    bl genrand_int32
    cmp r9, #0x0
    ldr r1, .L_02210dbc
    add r2, r10, r8, lsl #0x2
    and r0, r0, r1
    sub r0, r0, #0x100
    str r0, [r2, #0x658]
    blt .L_02210d30
    cmp r9, #0x2
    ble .L_02210d40
.L_02210d30:
    cmp r9, #0x6
    blt .L_02210d68
    cmp r9, #0xa
    bgt .L_02210d68
.L_02210d40:
    cmp r6, #0xa
    ldrlt r0, [sp, #0x0]
    ldrlt r1, [r0, r6, lsl #0x2]
    blt .L_02210d5c
    bl genrand_int32
    and r0, r0, #0x3
    add r1, r0, #0x7
.L_02210d5c:
    add r0, r10, r8, lsl #0x2
    str r1, [r0, #0x7c0]
    b .L_02210d7c
.L_02210d68:
    bl genrand_int32
    and r0, r0, #0x3
    add r1, r0, #0x7
    add r0, r10, r8, lsl #0x2
    str r1, [r0, #0x7c0]
.L_02210d7c:
    add r1, r10, r8, lsl #0x2
    add r0, r1, #0x1000
    mov r2, #0x0
    str r2, [r0, #0x30]
    mov r0, #0xff
    str r0, [r1, #0x928]
    b .L_02210da0
.L_02210d98:
    subs r8, r8, #0x1
    bpl .L_02210a84
.L_02210da0:
    subs r6, r6, #0x1
    bpl .L_02210a7c
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02210db0: .word data_ov069_022125ac
.L_02210db4: .word 0xfff
.L_02210db8: .word 0x333
.L_02210dbc: .word 0x1ff
.size func_ov069_02210a44, . - func_ov069_02210a44
