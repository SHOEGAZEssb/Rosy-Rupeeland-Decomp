.text
.extern func_020755bc
.extern func_ov044_0220c74c
.extern func_ov044_0220bba4
.extern func_ov044_0220c700
.extern func_ov044_0220be38
.extern func_02095940
.extern func_ov044_0220c8d0
.extern func_02095dd4
.extern data_020f4e14
.extern gDebugFont
.extern data_ov044_0220d2a8
.extern data_ov044_0220d2f0

    .global func_ov044_0220c97c
func_ov044_0220c97c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0220c99c
    cmp r0, #0x1
    beq .L_0220ca5c
    b .L_0220ca8c
.L_0220c99c:
    ldr r0, .L_0220ca94
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, .L_0220ca98
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    mov r1, #0x2a
    bl func_ov044_0220c74c
    ldr r0, [r4, #0x228]
    ldr r1, [r0, #0x40]
    cmp r1, #0x0
    beq .L_0220c9f0
    bl func_ov044_0220bba4
    mov r0, r4
    bl func_ov044_0220c700
    ldr r1, .L_0220ca9c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov044_0220be38
    b .L_0220ca48
.L_0220c9f0:
    add r0, r4, #0xd0
    bl func_02095940
    ldr ip, [r4, #0xcc]
    mov r0, r4
    ldrh r3, [ip, #0x24]
    mov r1, #0xc
    mov r2, #0x1
    orr r3, r3, #0x4
    strh r3, [ip, #0x24]
    ldr ip, [r4, #0x48]
    mov r3, #0x0
    bic ip, ip, #0x4
    str ip, [r4, #0x48]
    ldr ip, [r4, #0x4c]
    bic ip, ip, #0x4
    str ip, [r4, #0x4c]
    bl func_ov044_0220c8d0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
.L_0220ca48:
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
    b .L_0220ca8c
.L_0220ca5c:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x238]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt .L_0220ca8c
    ldr r1, .L_0220caa0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov044_0220be38
.L_0220ca8c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0220ca94: .word data_020f4e14
.L_0220ca98: .word gDebugFont
.L_0220ca9c: .word data_ov044_0220d2a8
.L_0220caa0: .word data_ov044_0220d2f0
.size func_ov044_0220c97c, . - func_ov044_0220c97c
