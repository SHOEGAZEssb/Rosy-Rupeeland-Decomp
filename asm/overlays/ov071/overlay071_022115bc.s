.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern gFx32CosSinTable
.extern data_ov071_02212340
.extern data_ov071_022123e0
.extern func_020ae024
.extern func_020befec
.extern func_020bf1f8
.extern func_ov071_02210184
.extern func_ov071_02210354
.extern func_ov071_02211158
.extern func_ov071_02211178
.extern func_ov071_022119bc
.extern genrand_int32

.global func_ov071_022115bc
func_ov071_022115bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    ldr r1, .L_022119b0
    mov r10, r0
    ldr r0, [r1, #0x10]
    mov r5, #0x1
    sub r0, r0, #0x2
    cmp r0, #0x1
    ldrls r5, [r1, #0x14]
    ldr r1, [r10, #0x0]
    add r0, sp, #0x14
    bl func_ov071_02211158
    ldr r0, [r10, #0x0]
    add r1, sp, #0x14
    ldr r0, [r0, #0x8]
    add r0, r0, #0xdc
    bl func_ov071_02211178
    add r0, r10, #0x4
    str r0, [sp, #0x4]
    ldr r11, .L_022119b0
    ldr r4, .L_022119b4
    b .L_022119a0
.L_02211614:
    ldr r0, [r10, #0xc34]
    cmp r0, #0x0
    blt .L_022119a0
    add r0, sp, #0x20
    bl func_ov071_02210184
    ldr r0, [r10, #0x0]
    add r1, sp, #0x20
    ldr r0, [r0, #0x8]
    bl func_ov071_02210354
    ldr r2, [r10, #0x0]
    add r0, sp, #0x8
    ldr r2, [r2, #0x8]
    add r1, sp, #0x20
    add r2, r2, #0x94
    bl func_ov071_022119bc
    add r0, sp, #0x20
    add r1, sp, #0x8
    bl func_ov071_02211178
    ldr r0, [r11, #0x10]
    ldr r9, [sp, #0x24]
    ldr r8, [sp, #0x28]
    cmp r0, #0x0
    bne .L_0221168c
    ldr r7, [r11, #0x4]
    bl genrand_int32
    mov r1, r7
    bl func_020bf1f8
    add r0, r7, r7, lsr #0x1f
    sub r7, r1, r0, asr #0x1
    b .L_0221171c
.L_0221168c:
    cmp r0, #0x1
    bne .L_022116c4
    ldr r1, [r4, #0x8]
    ldr r0, [r11, #0x4]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, .L_022119b8
    mov r0, r0, asr #0x1
    ldrsh r1, [r1, r2]
    mul r1, r0, r1
    mov r7, r1, asr #0xc
    b .L_0221171c
.L_022116c4:
    ldr r7, [r11, #0x4]
    ldr r1, [r11, #0x14]
    mul r0, r7, r5
    sub r1, r1, #0x1
    mul r1, r7, r1
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r6, r0
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0x8]
    cmp r0, #0x1
    subeq r6, r6, #0x800
    mov r1, r1, lsl #0x10
    mul r0, r6, r7
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, .L_022119b8
    mov r0, r0, asr #0xc
    ldrsh r1, [r1, r2]
    mul r1, r0, r1
    mov r7, r1, asr #0xc
.L_0221171c:
    mov r0, r9
    mov r1, r8
    bl func_020ae024
    mov r1, r0, asr #0x4
    mov r3, r1, lsl #0x1
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r10, #0xc34]
    ldr r1, .L_022119b8
    mov r2, r3, lsl #0x1
    ldrsh r8, [r1, r2]
    add r1, r1, r3, lsl #0x1
    ldrsh r9, [r1, #0x2]
    add r0, r10, r0, lsl #0x1
    add r1, r0, #0x800
    ldr r0, [sp, #0x0]
    strh r0, [r1, #0x74]
    ldr r0, [r10, #0xc34]
    ldr r1, [r4, #0x8]
    add r0, r10, r0, lsl #0x1
    add r0, r0, #0x800
    strh r1, [r0, #0xec]
    ldr r3, [r10, #0xc34]
    ldr r0, [sp, #0x4]
    mov r1, #0xc
    mla r0, r3, r1, r0
    ldr r2, [r10, #0x0]
    ldr r1, [r2, #0x8]
    add r1, r1, #0x94
    bl func_ov071_02211178
    ldr r1, [r11, #0x10]
    cmp r1, #0x0
    bne .L_022117d8
    ldr r2, [r10, #0xc34]
    mov r0, #0xc
    mla r3, r2, r0, r10
    mul r1, r9, r7
    ldr r0, [r3, #0x8]
    sub r0, r0, r1
    str r0, [r3, #0x8]
    ldr r1, [r10, #0xc34]
    mov r0, #0xc
    mla r2, r1, r0, r10
    ldr r0, [r2, #0xc]
    mla r0, r8, r7, r0
    str r0, [r2, #0xc]
    b .L_022118d0
.L_022117d8:
    sub r0, r1, #0x1
    cmp r0, #0x1
    bhi .L_02211850
    ldr r2, [r10, #0xc34]
    mov r0, #0xc
    mla r0, r2, r0, r10
    mul r1, r9, r7
    ldr r3, [r0, #0x8]
    rsb r2, r9, #0x0
    sub r1, r3, r1
    str r1, [r0, #0x8]
    ldr r1, [r10, #0xc34]
    mov r0, #0xc
    mla r3, r1, r0, r10
    ldr r0, [r3, #0xc]
    mla r0, r8, r7, r0
    str r0, [r3, #0xc]
    ldr r0, [r4, #0x0]
    ldr r1, [r10, #0xc34]
    mul r3, r2, r0
    mov r0, #0xc
    mla r0, r1, r0, r10
    str r3, [r0, #0x5a8]
    ldr r0, [r4, #0x0]
    ldr r1, [r10, #0xc34]
    mul r2, r8, r0
    mov r0, #0xc
    mla r0, r1, r0, r10
    str r2, [r0, #0x5ac]
    b .L_022118d0
.L_02211850:
    cmp r1, #0x3
    bne .L_022118d0
    ldr r2, [r10, #0xc34]
    mov r0, #0xc
    mla r3, r2, r0, r10
    mul r1, r9, r7
    ldr r0, [r3, #0x8]
    sub r0, r0, r1
    str r0, [r3, #0x8]
    ldr r1, [r10, #0xc34]
    mov r0, #0xc
    mla r2, r1, r0, r10
    ldr r0, [r2, #0xc]
    mla r0, r8, r7, r0
    str r0, [r2, #0xc]
    ldr r0, [r4, #0x0]
    ldr r1, [r10, #0xc34]
    mul r0, r9, r0
    mul r0, r6, r0
    mov r0, r0, asr #0xc
    rsb r2, r0, #0x0
    mov r0, #0xc
    mla r0, r1, r0, r10
    str r2, [r0, #0x5a8]
    ldr r0, [r4, #0x0]
    ldr r1, [r10, #0xc34]
    mul r0, r8, r0
    mul r0, r6, r0
    mov r2, r0, asr #0xc
    mov r0, #0xc
    mla r0, r1, r0, r10
    str r2, [r0, #0x5ac]
.L_022118d0:
    ldr r2, [r10, #0xc34]
    mov r0, #0xc
    mla r0, r2, r0, r10
    ldr r7, [r0, #0x8]
    mov r2, #0xc
    mla r2, r8, r2, r7
    str r2, [r0, #0x8]
    rsb r3, r9, #0x0
    mov r0, r3, lsl #0x2
    ldr r3, [r10, #0xc34]
    mov r2, #0xc
    mla r2, r3, r2, r10
    ldr r7, [r2, #0xc]
    mov r3, #0xc
    mla r3, r9, r3, r7
    str r3, [r2, #0xc]
    ldr r2, [r11, #0x8]
    ldr r3, [r10, #0xc34]
    mul r7, r8, r2
    mov r2, #0xc
    mla r2, r3, r2, r10
    str r7, [r2, #0x2d8]
    ldr r2, [r11, #0x8]
    ldr r3, [r10, #0xc34]
    mul r7, r9, r2
    mov r2, #0xc
    mla r2, r3, r2, r10
    str r7, [r2, #0x2dc]
    ldr r2, [r10, #0xc34]
    rsb r1, r8, #0x0
    add r3, r10, r2, lsl #0x2
    mov r2, #0x0
    str r2, [r3, #0x964]
    ldr r2, [r10, #0xc34]
    mov r1, r1, lsl #0x2
    add r3, r10, r2, lsl #0x2
    mov r2, #0x0
    str r2, [r3, #0xa54]
    ldr r2, [r10, #0xc34]
    add r2, r10, r2, lsl #0x2
    ldr r2, [r2, #0xb44]
    str r2, [r10, #0xc34]
    ldr r2, [r10, #0x0]
    ldr r2, [r2, #0x8]
    str r1, [r2, #0xb0]
    ldr r1, [r10, #0x0]
    ldr r1, [r1, #0x8]
    str r0, [r1, #0xb4]
    ldr r0, [r10, #0x0]
    ldr r1, [r0, #0x8]
    ldr r0, [sp, #0x0]
    strh r0, [r1, #0xb8]
.L_022119a0:
    subs r5, r5, #0x1
    bpl .L_02211614
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022119b0: .word data_ov071_02212340
.L_022119b4: .word data_ov071_022123e0
.L_022119b8: .word gFx32CosSinTable
.size func_ov071_022115bc, . - func_ov071_022115bc
