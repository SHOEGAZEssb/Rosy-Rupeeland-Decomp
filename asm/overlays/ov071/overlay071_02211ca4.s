.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern gFx32CosSinTable
.extern data_ov071_02212340
.extern func_020befec
.extern func_ov031_021fdc88
.extern func_ov042_021fdbc8
.extern func_ov071_02210184
.extern func_ov071_02211190
.extern func_ov071_022119f4

.global func_ov071_02211ca4
func_ov071_02211ca4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r4, #0xb4000
    mov r10, r0
    mov r1, #0x3c
    rsb r4, r4, #0x0
    ldr r5, .L_02211e90
    sub r8, r1, #0x1
    add r7, r10, #0x4
    add r6, r10, #0x2d4
    sub r11, r4, #0x5c000
.L_02211cd0:
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x964]
    cmp r0, #0x0
    blt .L_02211e80
    mov r0, #0xc
    mul r9, r8, r0
    add r0, r7, r9
    add r1, r6, r9
    bl func_ov071_02211190
    add r0, r10, r9
    ldr r1, [r0, #0xc]
    cmp r1, #0x64000
    bge .L_02211d24
    ldr r2, [r0, #0x2d8]
    ldr r1, [r5, #0x20]
    smull r9, r3, r2, r1
    adds r2, r9, #0x800
    adc r1, r3, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r0, #0x2d8]
.L_02211d24:
    ldr r1, [r0, #0x8]
    cmp r1, r4
    blt .L_02211d4c
    cmp r1, #0xb4000
    bgt .L_02211d4c
    ldr r0, [r0, #0xc]
    cmp r0, r11
    blt .L_02211d4c
    cmp r0, #0x104000
    ble .L_02211d5c
.L_02211d4c:
    mov r0, r10
    mov r1, r8
    bl func_ov071_022119f4
    b .L_02211e80
.L_02211d5c:
    add r0, r10, r8, lsl #0x2
    ldr r2, [r0, #0xa54]
    add r1, r10, r8, lsl #0x1
    add r2, r2, #0x1
    str r2, [r0, #0xa54]
    add r1, r1, #0x800
    ldrh r3, [r1, #0xec]
    ldr r2, [r5, #0x18]
    add r2, r3, r2
    strh r2, [r1, #0xec]
    ldrh r2, [r1, #0xec]
    strh r2, [r1, #0xec]
    ldr r0, [r0, #0xa54]
    ldr r1, [r5, #0x0]
    add r0, r8, r0
    bl func_020befec
    cmp r1, #0x0
    bne .L_02211e80
    add r0, sp, #0x0
    bl func_ov071_02210184
    add r2, r10, r8, lsl #0x1
    add r2, r2, #0x800
    mov r0, #0xc
    mla r1, r8, r0, r10
    ldrh r3, [r2, #0xec]
    ldr r9, [r1, #0x5a8]
    ldr r0, [r1, #0x8]
    mov r3, r3, asr #0x4
    mov ip, r3, lsl #0x2
    ldr r3, .L_02211e94
    ldrsh r3, [r3, ip]
    smull ip, r9, r3, r9
    adds r3, ip, #0x800
    adc r9, r9, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r9, lsl #0x14
    add r0, r0, r3
    str r0, [sp, #0x4]
    ldrh r3, [r2, #0xec]
    ldr r0, [r1, #0xc]
    ldr r2, [r1, #0x5ac]
    mov r1, r3, asr #0x4
    mov r3, r1, lsl #0x2
    ldr r1, .L_02211e94
    mov ip, #0x0
    ldrsh r1, [r1, r3]
    smull r3, r2, r1, r2
    adds r3, r3, #0x800
    mov r1, ip
    adc r1, r2, r1
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    str r0, [sp, #0x8]
    ldr r1, [r5, #0xc]
    ldr r0, [r10, #0x0]
    cmp r1, #0x2
    mov r2, r1, lsr #0x1f
    blt .L_02211e6c
    mov r9, r8, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1f
    rsb r3, r9, r8, lsl #0x1e
    add r1, r2, r1, ror #0x1f
    ldr r0, [r0, #0x14]
    add r2, sp, #0x0
    add r3, r9, r3, ror #0x1e
    bl func_ov031_021fdc88
    b .L_02211e80
.L_02211e6c:
    rsb r1, r2, r1, lsl #0x1f
    add r1, r2, r1, ror #0x1f
    ldr r0, [r0, #0x14]
    add r2, sp, #0x0
    bl func_ov042_021fdbc8
.L_02211e80:
    subs r8, r8, #0x1
    bpl .L_02211cd0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02211e90: .word data_ov071_02212340
.L_02211e94: .word gFx32CosSinTable
.size func_ov071_02211ca4, . - func_ov071_02211ca4
