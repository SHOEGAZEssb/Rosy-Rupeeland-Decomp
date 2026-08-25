.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern gFx32CosSinTable
.extern data_ov071_02212280
.extern data_ov071_02212340
.extern Graphics3dPresentation_BindImmediateTexture
.extern func_020befec
.extern func_ov071_02212090
.extern func_ov071_022120a4

.global func_ov071_02211e98
func_ov071_02211e98:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x94
    mov ip, #0x10000
    add r11, sp, #0x5c
    mov r9, #0x0
    add r8, sp, #0x64
    mov r7, #0x20000
    str ip, [sp, #0x54]
    str ip, [sp, #0x58]
    str r9, [r11, #0x0]
    str r9, [r11, #0x4]
    stmia r8, {r7, ip}
    add r4, sp, #0x6c
    add r3, sp, #0x74
    mov r2, #0x30000
    str ip, [r4, #0x0]
    str r9, [r4, #0x4]
    stmia r3, {r2, ip}
    add r1, sp, #0x7c
    ldr r6, .L_02212084
    stmia r1, {r7, r9}
    add r5, sp, #0x20
    mov r10, r0
    mov r4, #0x3
.L_02211ef8:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_02211ef8
    ldr r1, [r6, #0x0]
    mov r0, #0x3c
    mvn r7, #0x6
    str r1, [r5, #0x0]
    ldr r8, .L_02212088
    sub r9, r0, #0x1
    mov r4, r7, lsr #0x11
    mov r6, #0x7
    add r5, sp, #0x54
    add r11, sp, #0x20
.L_02211f30:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x964]
    cmp r0, #0x0
    blt .L_02212074
    ldr r0, .L_0221208c
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    mov r0, #0xc
    bne .L_02211f74
    mla r1, r9, r0, r10
    ldr r0, [r1, #0x8]
    mov r0, r0, asr #0xc
    str r0, [sp, #0x18]
    ldr r0, [r1, #0xc]
    mov r0, r0, asr #0xc
    str r0, [sp, #0x1c]
    b .L_02211ff0
.L_02211f74:
    mla ip, r9, r0, r10
    add r0, r10, r9, lsl #0x1
    add r0, r0, #0x800
    ldrh r2, [r0, #0xec]
    ldr r1, [ip, #0x5a8]
    ldr r3, [ip, #0x8]
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh lr, [r8, r2]
    smull r2, r1, lr, r1
    adds lr, r2, #0x800
    adc r1, r1, #0x0
    mov r2, lr, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, r3, r2
    mov r1, r1, asr #0xc
    str r1, [sp, #0x18]
    ldrh r2, [r0, #0xec]
    ldr r1, [ip, #0x5ac]
    ldr r0, [ip, #0xc]
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh r2, [r8, r2]
    smull ip, r3, r2, r1
    adds r2, ip, #0x800
    adc r1, r3, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    mov r0, r0, asr #0xc
    str r0, [sp, #0x1c]
.L_02211ff0:
    add r0, sp, #0x84
    add r1, sp, #0x10
    str r7, [sp, #0x10]
    str r7, [sp, #0x14]
    bl func_ov071_02212090
    str r6, [sp, #0x8]
    str r6, [sp, #0xc]
    add r0, sp, #0x8c
    add r1, sp, #0x8
    bl func_ov071_02212090
    ldr r0, [r10, #0x0]
    mov r2, r9, lsr #0x1f
    rsb r1, r2, r9, lsl #0x1e
    add r1, r2, r1, ror #0x1e
    ldr r0, [r0, #0x20]
    add r1, r1, #0x2f
    mov r2, #0x0
    bl Graphics3dPresentation_BindImmediateTexture
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0xa54]
    mov r1, #0xd
    mov r0, r0, asr #0x1
    bl func_020befec
    ldr r1, [r11, r1, lsl #0x2]
    add r2, r10, r9, lsl #0x1
    add r1, r5, r1, lsl #0x3
    stmia sp, {r1, r4}
    add r2, r2, #0x800
    ldrh r2, [r2, #0x74]
    mov r0, r10
    add r1, sp, #0x18
    add r3, sp, #0x84
    bl func_ov071_022120a4
.L_02212074:
    subs r9, r9, #0x1
    bpl .L_02211f30
    add sp, sp, #0x94
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02212084: .word data_ov071_02212280
.L_02212088: .word gFx32CosSinTable
.L_0221208c: .word data_ov071_02212340
.size func_ov071_02211e98, . - func_ov071_02211e98
