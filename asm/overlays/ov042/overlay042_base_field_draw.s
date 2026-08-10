.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern func_0209d640
.extern func_020b0880
.extern func_020b0808
.extern func_020bf1f8
.extern genrand_int32
.extern func_ov042_021fd578
.extern data_020cd470
.extern data_020c9670
    .global func_ov042_021fd158
func_ov042_021fd158:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x338
    mov r10, r0
    ldr r2, [r10, #0x4]
    mov r4, r1
    add r2, r2, #0x1
    str r2, [r10, #0x4]
    ldr r2, [r10, #0x538]
    mvn r0, #0x0
    cmp r2, r0
    mov r1, #0x0
    bne .L_021fd310
    add r0, sp, #0x30
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    ldr r0, [r10, #0x0]
    add r3, sp, #0x30
    ldr r0, [r0, #0x20]
    mov r2, r4
    mov r1, #0x0
    bl func_0209d640
    ldr r1, .L_021fd528
    ldrsh r0, [r1, #0x70]
    ldrsh r1, [r1, #0x72]
    bl func_020b0880
    ldr r0, .L_021fd52c
    mov r2, #0x0
    mov r1, #0x20
    mov r4, #0x190
    str r2, [r0, #0x0]
    sub r7, r0, #0x64
    sub r6, r0, #0x38
    sub r11, r0, #0x28
    sub r0, r0, #0x1c
    str r0, [sp, #0xc]
    ldr r0, .L_021fd52c
    sub r9, r1, #0x1
    sub r5, r0, #0x14
    sub r0, r0, #0x60
    str r0, [sp, #0x10]
    rsb r4, r4, #0x0
.L_021fd200:
    mov r0, #0xc
    mla r8, r9, r0, r10
    add r0, r10, r9, lsl #0x2
    ldr r1, [r8, #0x544]
    ldr r0, [r0, #0x6bc]
    add r1, r1, r0
    ldr r0, .L_021fd530
    str r1, [r8, #0x544]
    cmp r1, r0
    ble .L_021fd258
    bl genrand_int32
    mov r1, #0x1f4
    bl func_020bf1f8
    sub r0, r1, #0xfa
    mov r0, r0, lsl #0xc
    str r0, [r8, #0x540]
    bl genrand_int32
    mov r1, #0x64
    bl func_020bf1f8
    sub r0, r4, r1
    mov r0, r0, lsl #0xc
    str r0, [r8, #0x544]
.L_021fd258:
    mov r0, #0x0
    str r0, [r7, #0x0]
    mov r0, #0xc
    mla r0, r9, r0, r10
    ldr r1, [r0, #0x544]
    ldr r0, [r0, #0x540]
    mov r1, r1, asr #0xc
    mov r0, r0, asr #0xc
    str r0, [r6, #0x0]
    str r1, [r6, #0x0]
    mov r0, #0xed
    str r0, [r6, #0x0]
    ldr r0, .L_021fd52c
    mov r1, #0x2
    str r1, [r0, #0x58]
    add r0, r10, r9, lsl #0x1
    add r0, r0, #0x700
    ldrh r0, [r0, #0x3c]
    add r2, r10, r9, lsl #0x2
    mov r1, #0x0
    str r0, [r11, #0x0]
    ldr r0, [sp, #0xc]
    subs r9, r9, #0x1
    str r1, [r0, #0x0]
    str r1, [r0, #0x0]
    ldr r0, [r2, #0x6bc]
    mov r0, r0, asr #0xc
    mov r0, r0, lsl #0x2
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    str r0, [r5, #0x0]
    mov r0, #0x1
    str r0, [r5, #0x0]
    ldr r0, .L_021fd52c
    str r1, [r0, #0x5c]
    ldr r0, [sp, #0x10]
    mov r1, #0x1
    str r1, [r0, #0x0]
    bpl .L_021fd200
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
    b .L_021fd520
.L_021fd310:
    ldr r2, [r10, #0x534]
    add r0, sp, #0x20
    mov r3, r1
    sub r2, r2, #0x2000
    bl VecFx32Object_InitComponents
    ldr r0, [r10, #0x0]
    add r3, sp, #0x20
    ldr r0, [r0, #0x20]
    mov r2, r4
    mov r1, #0x0
    bl func_0209d640
    ldr r1, [r10, #0x520]
    ldr r0, [r10, #0x528]
    rsb r4, r1, #0x0
    mov r1, r0, lsl #0x10
    mov r0, #0x12c
    mul r2, r4, r0
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x4
    mov r5, r0, lsl #0x1
    add r1, r5, #0x1
    mov r0, r2, asr #0x5
    add r2, r2, r0, lsr #0x1a
    mov r0, r5, lsl #0x1
    ldr r3, .L_021fd534
    mov r1, r1, lsl #0x1
    ldrsh r0, [r3, r0]
    ldrsh r1, [r3, r1]
    mov r6, r2, asr #0x6
    mov r5, #0x7
    bl func_020b0808
    ldr r1, .L_021fd538
    mov r7, #0x0
    ldr r0, .L_021fd53c
    str r7, [r1, #0x0]
    str r0, [r1, #0x3c]
.L_021fd3a0:
    cmp r5, #0x0
    subgt r5, r5, #0x1
    rsb r0, r5, #0x12
    mov r11, #0x0
    str r0, [sp, #0x1c]
    mov ip, r5
    cmp r5, r0
    bge .L_021fd4e4
    add r1, r6, #0x12c
    mov r0, r6, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r0, r1, lsr #0x10
    mov r8, r2, asr #0x4
    mov r2, r0, asr #0x4
    mov r0, #0x48
    mla r0, r7, r0, r10
    mov r1, r7, lsl #0x6
    ldr r9, .L_021fd534
    mov r8, r8, lsl #0x2
    add r3, r4, r7, lsl #0x6
    str r0, [sp, #0x8]
    add r0, r3, #0xc0
    str r0, [sp, #0x4]
    mov r0, r2, lsl #0x2
    ldrsh r8, [r9, r8]
    add r1, r1, #0x100
    ldrsh r3, [r9, r0]
    add r0, r4, r1
    ldr r2, .L_021fd540
    str r0, [sp, #0x0]
    smulbb r0, r8, r2
    str r0, [sp, #0x14]
    smulbb r0, r3, r2
    str r0, [sp, #0x18]
    b .L_021fd4d8
.L_021fd430:
    sub r1, ip, #0x8
    mov r0, #0xa0
    mul r9, r1, r0
    mov r8, r11, lsl #0x1
    mov r0, #0xc
    mul r1, r8, r0
    add r0, sp, #0x170
    str r9, [r0, r1]
    add r3, r0, r1
    ldr r0, [sp, #0x8]
    mov r1, ip, lsl #0x10
    add lr, r0, ip, lsl #0x2
    ldr r2, [lr, #0x8]
    ldr r0, [sp, #0x14]
    add r11, r11, #0x1
    add r0, r2, r0, asr #0xc
    str r0, [r3, #0x4]
    ldr r0, [sp, #0x4]
    add ip, ip, #0x1
    str r0, [r3, #0x8]
    str r9, [r3, #0xc]
    add r0, sp, #0x40
    ldr r2, [lr, #0x50]
    ldr r9, [sp, #0x18]
    add r0, r0, r8, lsl #0x3
    add r2, r2, r9, asr #0xc
    str r2, [r3, #0x10]
    ldr r2, [sp, #0x0]
    str r2, [r3, #0x14]
    ldr r3, [r10, #0x524]
    add r2, sp, #0x40
    str r1, [r2, r8, lsl #0x3]
    add r2, r3, r7
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x1e
    add r3, r3, r2, ror #0x1e
    mov r2, r3, lsl #0x10
    str r2, [r0, #0x4]
    str r1, [r0, #0x8]
    add r1, r3, #0x1
    mov r1, r1, lsl #0x10
    str r1, [r0, #0xc]
.L_021fd4d8:
    ldr r0, [sp, #0x1c]
    cmp ip, r0
    blt .L_021fd430
.L_021fd4e4:
    mov r3, r11, lsl #0x1
    add r1, sp, #0x170
    add r2, sp, #0x40
    mov r0, r10
    sub r3, r3, #0x2
    bl func_ov042_021fd578
    add r7, r7, #0x1
    cmp r7, #0x11
    add r6, r6, #0x12c
    blt .L_021fd3a0
    ldr r1, .L_021fd544
    mov r2, #0x1
    add r0, sp, #0x20
    str r2, [r1, #0x0]
    bl VecFx32Object_Destroy
.L_021fd520:
    add sp, sp, #0x338
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021fd528: .word data_020cd470
.L_021fd52c: .word 0x40004a8
.L_021fd530: .word 0x172000
.L_021fd534: .word data_020c9670
.L_021fd538: .word 0x4000444
.L_021fd53c: .word 0x7fff
.L_021fd540: .word 0xfffff768
.L_021fd544: .word 0x4000448
.size func_ov042_021fd158, . - func_ov042_021fd158

