.text
.extern genrand_int32
.extern gFx32CosSinTable
.global func_ov042_021fda24
func_ov042_021fda24:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r4, #0x10
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r11, r3
    sub r4, r4, #0x1
.L_021fda40:
    ldr r0, [r10, #0xf24]
    cmp r0, #0x0
    blt .L_021fdbb4
    add r0, r10, r0, lsl #0x2
    cmp r9, #0x2
    str r9, [r0, #0xb3c]
    ldreq r0, [r10, #0xf24]
    moveq r1, #0x7
    addeq r0, r10, r0, lsl #0x2
    streq r1, [r0, #0xb3c]
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r1, #0x3
    mov r5, r0, lsr #0x10
    sub r7, r1, #0x1
    mov r6, #0x8
.L_021fda80:
    bl genrand_int32
    ldr r1, .L_021fdbc0
    subs r7, r7, #0x1
    and r0, r0, r1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x2
    ldr r0, .L_021fdbc4
    ldrsh r0, [r0, r1]
    add r6, r6, r0, asr #0x2
    bpl .L_021fda80
    mov r0, r5, asr #0x4
    mov r0, r0, lsl #0x1
    ldr r2, .L_021fdbc4
    mov r3, r0, lsl #0x1
    add r0, r2, r0, lsl #0x1
    cmp r6, #0x800
    ldrsh r1, [r0, #0x2]
    movgt r6, #0x800
    ldrsh r3, [r2, r3]
    smull r7, r0, r1, r6
    adds r1, r7, #0x800
    smull r7, r6, r3, r6
    adc r0, r0, #0x0
    adds r3, r7, #0x800
    adc r6, r6, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r6, lsl #0x14
    ldr r6, [r10, #0xf24]
    mov r1, r1, lsr #0xc
    add r6, r10, r6, lsl #0x1
    add r6, r6, #0x900
    strh r5, [r6, #0xac]
    orr r1, r1, r0, lsl #0x14
    mov r2, #0x6
    cmp r9, #0x0
    ldr r5, [r8, #0x4]
    movne r2, #0xa
    ldr r6, [r10, #0xf24]
    mov r7, #0xc
    mla ip, r1, r2, r5
    mla r5, r6, r7, r10
    str ip, [r5, #0x50]
    ldr r6, [r8, #0x8]
    mov r0, #0x5
    ldr r5, [r10, #0xf24]
    mla r6, r3, r2, r6
    mla r2, r5, r7, r10
    str r6, [r2, #0x54]
    movne r0, #0xe
    ldr r2, [r10, #0xf24]
    mul r5, r1, r0
    mla r1, r2, r7, r10
    str r5, [r1, #0x500]
    ldr r1, [r10, #0xf24]
    mul r2, r3, r0
    mla r0, r1, r7, r10
    str r2, [r0, #0x504]
    ldr r0, [r10, #0xf24]
    mov r1, #0x0
    mla r2, r0, r7, r10
    ldr r0, [r2, #0x504]
    sub r0, r0, #0x2000
    str r0, [r2, #0x504]
    ldr r0, [r10, #0xf24]
    add r0, r10, r0, lsl #0x1
    add r0, r0, #0xa00
    strh r1, [r0, #0x74]
    ldr r0, [r10, #0xf24]
    add r0, r10, r0, lsl #0x1
    add r0, r0, #0xc00
    strh r11, [r0, #0xcc]
    ldr r0, [r10, #0xf24]
    add r0, r10, r0, lsl #0x2
    ldr r0, [r0, #0xd94]
    str r0, [r10, #0xf24]
.L_021fdbb4:
    subs r4, r4, #0x1
    bpl .L_021fda40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021fdbc0: .word 0x3fff
.L_021fdbc4: .word gFx32CosSinTable
.size func_ov042_021fda24, . - func_ov042_021fda24
