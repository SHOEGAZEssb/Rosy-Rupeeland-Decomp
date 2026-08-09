.text
.extern genrand_int32
.extern func_020bf1f8
.extern func_020befec
.extern func_020adc40
.extern func_020adc90
.extern func_020a1794
.extern func_ov042_021fcf80
.extern func_ov042_021fda0c
.extern func_ov042_021ff2f8
.extern func_ov042_02203658
.extern func_ov042_0220368c
.extern func_ov042_021fda24
.extern func_ov042_021fdd48
.extern func_ov042_022051a8
.extern func_ov071_02210440
.extern data_ov042_0220b3e8
.extern data_ov042_0220b500
    .global func_ov042_02209cd8
func_ov042_02209cd8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc8
    mov r4, r0
    ldr r0, [r4, #0x80]
    mov r1, #0x1
    add r0, r0, #0x1
    str r0, [r4, #0x80]
    ldrb r0, [r4, #0x8a]
    cmp r0, #0x4
    cmpne r0, #0x6
    movne r1, #0x0
    cmp r1, #0x0
    moveq r5, #0x1
    ldr r0, [r4, #0x74]
    movne r5, #0x0
    cmp r0, #0xa
    bgt .L_02209d54
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_0220a6a8
.L_02209d28: ; jump table
    b .L_0220a6a8 ; case 0
    b .L_02209d60 ; case 1
    b .L_02209fec ; case 2
    b .L_0220a6a8 ; case 3
    b .L_0220a304 ; case 4
    b .L_0220a34c ; case 5
    b .L_0220a34c ; case 6
    b .L_0220a34c ; case 7
    b .L_0220a5a0 ; case 8
    b .L_0220a5cc ; case 9
    b .L_02209d60 ; case 10
.L_02209d54:
    cmp r0, #0x64
    beq .L_0220a5f4
    b .L_0220a6a8
.L_02209d60:
    cmp r0, #0xa
    bne .L_02209d7c
    ldr r1, [r4, #0x48]
    add r0, r4, #0x5c
    ldr r1, [r1, #0x8]
    add r1, r1, #0x94
    bl func_ov042_021fda0c
.L_02209d7c:
    add r0, sp, #0xbc
    bl func_ov042_021fcf80
    add r0, sp, #0x74
    add r1, r4, #0x5c
    add r2, r4, #0x50
    bl func_ov042_0220368c
    add r0, sp, #0xbc
    add r1, sp, #0x74
    bl func_ov042_021fda0c
    ldr r2, [sp, #0xc4]
    ldr r5, [sp, #0xc0]
    smull r1, r0, r2, r2
    smull r3, r2, r5, r5
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    add r5, r0, r0, lsl #0x1
    ldr r0, [sp, #0xc0]
    mov r1, r5
    bl func_020adc90
    str r0, [sp, #0xc0]
    ldr r0, [sp, #0xc4]
    mov r1, r5
    bl func_020adc90
    str r0, [sp, #0xc4]
    add r0, r4, #0x68
    add r1, sp, #0xbc
    bl func_ov042_021ff2f8
    ldr r0, [r4, #0x74]
    cmp r0, #0xa
    bne .L_02209e50
    ldrb r0, [r4, #0x8a]
    cmp r0, #0x7
    bne .L_02209e80
    ldr r0, [r4, #0x80]
    cmp r0, #0x2
    ble .L_02209e80
    mov r0, #0x2
    str r0, [r4, #0x74]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [sp, #0xc0]
    cmp r0, #0x0
    movlt r0, #0x1
    strlth r0, [r4, #0x88]
    b .L_02209e80
.L_02209e50:
    mov r0, r5
    mov r1, #0x3
    bl func_020befec
    cmp r0, #0x4000
    bge .L_02209e80
    ldrb r0, [r4, #0x8a]
    cmp r0, #0x4
    movlo r0, #0x2
    movhs r0, #0xa
    str r0, [r4, #0x74]
    mov r0, #0x0
    str r0, [r4, #0x80]
.L_02209e80:
    ldrb r0, [r4, #0x8a]
    mov r1, #0x0
    cmp r0, #0x4
    bhs .L_02209ef4
    ldr r6, [r4, #0x6c]
    ldr r0, .L_0220a708
    mov r2, r6, asr #0x1f
    umull r5, r3, r6, r0
    mla r3, r6, r1, r3
    mla r3, r2, r0, r3
    adds r5, r5, #0x800
    adc r0, r3, #0x0
    mov r2, r5, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    sub r0, r6, r2
    str r0, [r4, #0x6c]
    ldr r5, [r4, #0x70]
    mov r0, #0x148
    umull r3, r2, r5, r0
    mla r2, r5, r1, r2
    mov r1, r5, asr #0x1f
    mla r2, r1, r0, r2
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r5, r1
    str r0, [r4, #0x70]
    b .L_02209fb8
.L_02209ef4:
    ldr r0, [r4, #0x74]
    ldr r6, [r4, #0x6c]
    cmp r0, #0xa
    beq .L_02209f60
    mov r0, #0x214
    umull r5, r3, r6, r0
    mla r3, r6, r1, r3
    mov r2, r6, asr #0x1f
    mla r3, r2, r0, r3
    adds r5, r5, #0x800
    adc r2, r3, #0x0
    mov r3, r5, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    sub r2, r6, r3
    str r2, [r4, #0x6c]
    ldr r5, [r4, #0x70]
    umull r3, r2, r5, r0
    mla r2, r5, r1, r2
    mov r1, r5, asr #0x1f
    mla r2, r1, r0, r2
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r5, r1
    str r0, [r4, #0x70]
    b .L_02209fb8
.L_02209f60:
    ldr r0, .L_0220a70c
    mov r2, r6, asr #0x1f
    umull r5, r3, r6, r0
    mla r3, r6, r1, r3
    mla r3, r2, r0, r3
    adds r5, r5, #0x800
    adc r2, r3, #0x0
    mov r3, r5, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    sub r2, r6, r3
    str r2, [r4, #0x6c]
    ldr r5, [r4, #0x70]
    umull r3, r2, r5, r0
    mla r2, r5, r1, r2
    mov r1, r5, asr #0x1f
    mla r2, r1, r0, r2
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r5, r1
    str r0, [r4, #0x70]
.L_02209fb8:
    add r0, r4, #0x50
    add r1, r4, #0x68
    bl func_ov042_021ff2f8
    add r0, sp, #0x68
    add r1, r4, #0x50
    bl func_ov042_02203658
    ldr r0, [r4, #0x48]
    add r1, sp, #0x68
    ldr r0, [r0, #0x8]
    mov r2, #0x10000
    mov r3, #0x0
    bl func_ov071_02210440
    b .L_0220a6a8
.L_02209fec:
    ldr r0, [r4, #0x80]
    mov r5, #0x50
    tst r0, #0x1
    bne .L_0220a074
    add r0, sp, #0xb0
    bl func_ov042_021fcf80
    bl genrand_int32
    mov r1, #0x1a
    bl func_020bf1f8
    ldr r2, [r4, #0x54]
    sub r0, r1, #0xd
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0xb4]
    bl genrand_int32
    mov r1, #0x1a
    bl func_020bf1f8
    sub r0, r1, #0xd
    ldr r2, [r4, #0x58]
    add r1, sp, #0xb0
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0xb8]
    add r0, sp, #0x5c
    bl func_ov042_02203658
    ldr r0, [r4, #0x48]
    add r1, sp, #0x5c
    ldr r0, [r0, #0x8]
    mov r2, #0x20000
    mov r3, #0x0
    bl func_ov071_02210440
    ldr r0, [r4, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x14]
    add r2, sp, #0xb0
    bl func_ov042_021fdd48
.L_0220a074:
    ldrb r6, [r4, #0x8a]
    cmp r6, #0x4
    bhs .L_0220a120
    ldr r0, [r4, #0x80]
    and r0, r0, #0x1f
    cmp r0, #0x1
    bne .L_0220a2f0
    ldr r3, .L_0220a710
    add r2, sp, #0x0
    mov r1, #0x4
.L_0220a09c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_0220a09c
    add r0, sp, #0x0
    mov r1, r6, lsl #0x1
    ldrh r6, [r0, r1]
    ldr r0, [r4, #0x48]
    add r2, r4, #0x50
    ldr r3, [r0, #0xc]
    sub r0, r6, #0x7d0
    mov r1, r0, lsl #0x10
    ldr r0, [r3, #0xa0]
    mov r3, r1, lsr #0x10
    mov r1, #0x1
    bl func_ov042_022051a8
    ldr r0, [r4, #0x48]
    mov r3, r6
    ldr r0, [r0, #0xc]
    add r2, r4, #0x50
    ldr r0, [r0, #0xa0]
    mov r1, #0x1
    bl func_ov042_022051a8
    ldr r1, [r4, #0x48]
    add r0, r6, #0x7d0
    ldr r2, [r1, #0xc]
    mov r1, r0, lsl #0x10
    ldr r0, [r2, #0xa0]
    mov r3, r1, lsr #0x10
    add r2, r4, #0x50
    mov r1, #0x1
    bl func_ov042_022051a8
    b .L_0220a2f0
.L_0220a120:
    ldr r6, [r4, #0x80]
    mov r1, #0xd
    mov r0, r6
    bl func_020befec
    cmp r1, #0x0
    bne .L_0220a1d8
    mov r0, #0xb4
    mul r5, r6, r0
    ldrh r1, [r4, #0x88]
    cmp r1, #0x0
    ldr r1, [r4, #0x48]
    rsbne r5, r5, #0x0
    ldr r2, [r1, #0xc]
    add r0, r5, #0x4000
    mov r1, r0, lsl #0x10
    ldr r0, [r2, #0xa0]
    mov r3, r1, lsr #0x10
    add r2, r4, #0x50
    mov r1, #0x6
    bl func_ov042_022051a8
    ldr r1, [r4, #0x48]
    add r0, r5, #0x8000
    ldr r2, [r1, #0xc]
    mov r1, r0, lsl #0x10
    ldr r0, [r2, #0xa0]
    mov r3, r1, lsr #0x10
    add r2, r4, #0x50
    mov r1, #0x6
    bl func_ov042_022051a8
    ldr r1, [r4, #0x48]
    add r0, r5, #0xc000
    ldr r2, [r1, #0xc]
    mov r1, r0, lsl #0x10
    ldr r0, [r2, #0xa0]
    mov r3, r1, lsr #0x10
    add r2, r4, #0x50
    mov r1, #0x6
    bl func_ov042_022051a8
    mov r0, r5, lsl #0x10
    mov r3, r0, lsr #0x10
    ldr r0, [r4, #0x48]
    mov r1, #0x6
    ldr r0, [r0, #0xc]
    add r2, r4, #0x50
    ldr r0, [r0, #0xa0]
    bl func_ov042_022051a8
.L_0220a1d8:
    ldr r1, [r4, #0x48]
    add r0, r4, #0x5c
    ldr r1, [r1, #0x8]
    mov r5, #0xc8
    add r1, r1, #0x94
    bl func_ov042_021fda0c
    add r0, sp, #0xa4
    bl func_ov042_021fcf80
    add r0, sp, #0x50
    add r1, r4, #0x5c
    add r2, r4, #0x50
    bl func_ov042_0220368c
    add r0, sp, #0xa4
    add r1, sp, #0x50
    bl func_ov042_021fda0c
    ldr r2, [sp, #0xac]
    ldr r6, [sp, #0xa8]
    smull r1, r0, r2, r2
    smull r3, r2, r6, r6
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r1, #0x6
    mul r6, r0, r1
    ldr r0, [sp, #0xa8]
    mov r1, r6
    bl func_020adc90
    str r0, [sp, #0xa8]
    ldr r0, [sp, #0xac]
    mov r1, r6
    bl func_020adc90
    str r0, [sp, #0xac]
    add r0, r4, #0x68
    add r1, sp, #0xa4
    bl func_ov042_021ff2f8
    ldr r2, [r4, #0x6c]
    ldr r3, .L_0220a714
    mov ip, #0x0
    umull r8, lr, r2, r3
    adds r8, r8, #0x800
    mla lr, r2, ip, lr
    mov r7, r2, asr #0x1f
    mla lr, r7, r3, lr
    mov r8, r8, lsr #0xc
    adc r3, lr, #0x0
    orr r8, r8, r3, lsl #0x14
    sub r2, r2, r8
    str r2, [r4, #0x6c]
    ldr r7, [r4, #0x70]
    ldr r6, .L_0220a718
    mov r2, r7, asr #0x1f
    umull lr, r3, r7, r6
    mla r3, r7, ip, r3
    mla r3, r2, r6, r3
    adds r6, lr, #0x800
    adc r2, r3, #0x0
    mov r3, r6, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    sub r2, r7, r3
    add r0, r4, #0x50
    add r1, r4, #0x68
    str r2, [r4, #0x70]
    bl func_ov042_021ff2f8
.L_0220a2f0:
    ldr r0, [r4, #0x80]
    cmp r0, r5
    movgt r0, #0x65
    strgt r0, [r4, #0x74]
    b .L_0220a6a8
.L_0220a304:
    ldr r0, [r4, #0x80]
    ldr r1, [r4, #0x4c]
    mov r0, r0, lsl #0x2
    rsb r0, r0, #0x100
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    ldr r0, [r4, #0x80]
    cmp r0, #0x3c
    ble .L_0220a6a8
    ldr r2, [r4, #0x4c]
    mov r0, #0x65
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    str r0, [r4, #0x74]
    b .L_0220a6a8
.L_0220a34c:
    add r0, sp, #0x98
    bl func_ov042_021fcf80
    ldr r0, [r4, #0x74]
    mov r6, #0x64000
    cmp r5, #0x0
    rsbeq r6, r6, #0x0
    cmp r0, #0x5
    bne .L_0220a3d0
    ldr ip, .L_0220a71c
    mov r3, #0x64000
    add r0, sp, #0x38
    add r1, sp, #0x44
    add r2, r4, #0x50
    str ip, [sp, #0x44]
    str r6, [sp, #0x48]
    str r3, [sp, #0x4c]
    bl func_ov042_0220368c
    add r0, sp, #0x98
    add r1, sp, #0x38
    bl func_ov042_021fda0c
    cmp r5, #0x0
    bne .L_0220a3b0
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    blt .L_0220a3c4
.L_0220a3b0:
    cmp r5, #0x1
    bne .L_0220a3d0
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    ble .L_0220a3d0
.L_0220a3c4:
    ldr r0, [r4, #0x74]
    add r0, r0, #0x1
    str r0, [r4, #0x74]
.L_0220a3d0:
    ldr r0, [r4, #0x74]
    cmp r0, #0x6
    bne .L_0220a44c
    ldr ip, .L_0220a71c
    mov r3, #0x46000
    rsb r3, r3, #0x0
    add r0, sp, #0x20
    add r1, sp, #0x2c
    add r2, r4, #0x50
    str ip, [sp, #0x2c]
    str r6, [sp, #0x30]
    str r3, [sp, #0x34]
    bl func_ov042_0220368c
    add r0, sp, #0x98
    add r1, sp, #0x20
    bl func_ov042_021fda0c
    cmp r5, #0x0
    bne .L_0220a42c
    mov r0, #0x5a000
    ldr r1, [r4, #0x54]
    rsb r0, r0, #0x0
    cmp r1, r0
    blt .L_0220a440
.L_0220a42c:
    cmp r5, #0x1
    bne .L_0220a44c
    ldr r0, [r4, #0x54]
    cmp r0, #0x5a000
    ble .L_0220a44c
.L_0220a440:
    ldr r0, [r4, #0x74]
    add r0, r0, #0x1
    str r0, [r4, #0x74]
.L_0220a44c:
    ldr r0, [r4, #0x74]
    cmp r0, #0x7
    bne .L_0220a4c4
    ldr r5, .L_0220a71c
    mov r3, #0x64000
    add r0, sp, #0x8
    add r1, sp, #0x14
    add r2, r4, #0x50
    str r5, [sp, #0x14]
    str r6, [sp, #0x18]
    str r3, [sp, #0x1c]
    bl func_ov042_0220368c
    add r0, sp, #0x98
    add r1, sp, #0x8
    bl func_ov042_021fda0c
    ldr r0, [r4, #0x58]
    cmp r0, #0x46000
    ble .L_0220a4c4
    ldr r0, [r4, #0x74]
    add r0, r0, #0x1
    str r0, [r4, #0x74]
    ldrb r0, [r4, #0x8a]
    cmp r0, #0x6
    bne .L_0220a4c4
    mov r0, #0xbe000
    rsb r0, r0, #0x0
    str r0, [r4, #0x54]
    ldr r0, [r4, #0x74]
    add r0, r0, #0x1
    str r0, [r4, #0x74]
.L_0220a4c4:
    ldr r2, [sp, #0xa0]
    ldr r5, [sp, #0x9c]
    smull r1, r0, r2, r2
    smull r3, r2, r5, r5
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r1, #0x6
    mul r5, r0, r1
    ldr r0, [sp, #0x9c]
    mov r1, r5
    bl func_020adc90
    str r0, [sp, #0x9c]
    ldr r0, [sp, #0xa0]
    mov r1, r5
    bl func_020adc90
    str r0, [sp, #0xa0]
    add r1, sp, #0x98
    add r0, r4, #0x68
    bl func_ov042_021ff2f8
    ldr r6, [r4, #0x6c]
    mov r2, #0x7b
    umull r0, r1, r6, r2
    mov r3, #0x0
    adds r0, r0, #0x800
    mov r5, r0, lsr #0xc
    mla r1, r6, r3, r1
    mov r0, r6, asr #0x1f
    mla r1, r0, r2, r1
    adc r0, r1, #0x0
    orr r5, r5, r0, lsl #0x14
    sub r0, r6, r5
    str r0, [r4, #0x6c]
    ldr lr, [r4, #0x70]
    add r0, r4, #0x50
    umull ip, r6, lr, r2
    mla r6, lr, r3, r6
    mov r5, lr, asr #0x1f
    adds r3, ip, #0x800
    mla r6, r5, r2, r6
    adc r2, r6, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    sub r2, lr, r3
    add r1, r4, #0x68
    str r2, [r4, #0x70]
    bl func_ov042_021ff2f8
    b .L_0220a6a8
.L_0220a5a0:
    mov r0, #0x78000
    cmp r5, #0x0
    rsbeq r0, r0, #0x0
    str r0, [r4, #0x54]
    ldr r0, [r4, #0x58]
    add r0, r0, #0x4000
    str r0, [r4, #0x58]
    cmp r0, #0x12c000
    movgt r0, #0x65
    strgt r0, [r4, #0x74]
    b .L_0220a6a8
.L_0220a5cc:
    ldr r1, [r4, #0x54]
    mov r0, #0x64000
    add r1, r1, #0x6000
    str r1, [r4, #0x54]
    str r0, [r4, #0x58]
    ldr r0, [r4, #0x54]
    cmp r0, #0xfa000
    movgt r0, #0x65
    strgt r0, [r4, #0x74]
    b .L_0220a6a8
.L_0220a5f4:
    ldrsb r0, [r4, #0x8b]
    cmp r0, #0x0
    ble .L_0220a618
    sub r0, r0, #0x1
    strb r0, [r4, #0x8b]
    ldrsb r0, [r4, #0x8b]
    cmp r0, #0x0
    moveq r0, #0x65
    streq r0, [r4, #0x74]
.L_0220a618:
    ldrsb r0, [r4, #0x8b]
    ldr r1, [r4, #0x4c]
    tst r0, #0x2
    ldreqh r0, [r1, #0x42]
    orreq r0, r0, #0x4
    ldrneh r0, [r1, #0x42]
    bicne r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldrsb r0, [r4, #0x8b]
    tst r0, #0x3
    bne .L_0220a6a8
    add r0, sp, #0x8c
    bl func_ov042_021fcf80
    add r0, sp, #0x8c
    add r1, r4, #0x50
    bl func_ov042_021fda0c
    bl genrand_int32
    and r0, r0, #0x1f
    ldr r1, [sp, #0x90]
    sub r0, r0, #0x10
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x90]
    bl genrand_int32
    and r0, r0, #0x3f
    ldr r1, [sp, #0x94]
    sub r0, r0, #0x20
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x94]
    ldrsb r3, [r4, #0x8b]
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    mov r3, r3, asr #0x3
    ldr r0, [r0, #0x14]
    add r2, sp, #0x8c
    and r3, r3, #0x3
    bl func_ov042_021fda24
.L_0220a6a8:
    add r0, sp, #0x80
    bl func_ov042_021fcf80
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    add r0, sp, #0x80
    bne .L_0220a6e0
    ldr r1, [r4, #0x48]
    ldr r1, [r1, #0xc]
    add r1, r1, #0x160
    bl func_ov042_021fda0c
    add r0, sp, #0x80
    add r1, r4, #0x50
    bl func_ov042_021ff2f8
    b .L_0220a6e8
.L_0220a6e0:
    add r1, r4, #0x50
    bl func_ov042_021fda0c
.L_0220a6e8:
    ldr r2, [r4, #0x4c]
    ldr r0, [r4, #0x48]
    add r1, sp, #0x80
    add r2, r2, #0x2c
    mov r3, #0x0
    bl func_020a1794
    add sp, sp, #0xc8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0220a708: .word 0x19a
.L_0220a70c: .word 0x5ec
.L_0220a710: .word data_ov042_0220b3e8
.L_0220a714: .word 0x852
.L_0220a718: .word 0x68f
.L_0220a71c: .word data_ov042_0220b500
.size func_ov042_02209cd8, . - func_ov042_02209cd8

