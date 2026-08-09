.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern data_021052fc
.extern func_02005058
.extern func_020050c8
.extern func_0201e0ec
.extern func_020a257c
.extern func_ov069_0221123c

.global func_ov069_0221100c
func_ov069_0221100c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r10, r0
    cmp r1, #0x0
    mov r0, #0x5a
    bne .L_022111f0
    sub r9, r0, #0x1
    add r5, r10, #0xa90
    add r4, r10, #0x4
    mov r8, #0x0
    mov r6, #0x28
    mov r11, #0x46
    mvn r7, #0x0
.L_02211040:
    add r1, r10, r9, lsl #0x2
    ldr r0, [r1, #0x7c0]
    cmp r0, #0x0
    ble .L_022111e4
    add r0, r1, #0x1000
    ldr r2, [r0, #0x30]
    add r0, r1, #0x30
    cmp r2, #0x0
    add r2, r0, #0x1000
    blt .L_022111e4
    add r0, r10, r9, lsl #0x4
    ldr r3, [r0, #0xc]
    add r3, r3, #0x33
    add r3, r3, #0x300
    str r3, [r0, #0xc]
    ldr r0, [r2, #0x0]
    cmp r0, #0x0
    beq .L_02211098
    add r0, r0, #0x1
    str r0, [r2, #0x0]
    cmp r0, #0x1e
    strgt r8, [r1, #0x7c0]
.L_02211098:
    add r0, r10, r9, lsl #0x4
    ldr r3, [r0, #0xc]
    ldr r1, [r0, #0xa98]
    add r1, r1, r3
    cmp r1, #0x0
    ble .L_02211130
    mov r1, r3, asr #0x1
    rsb r1, r1, #0x0
    str r1, [r0, #0xc]
    add r1, r10, r9, lsl #0x2
    ldr r0, [r1, #0x7c0]
    cmp r0, #0x7
    ldrge r0, [r2, #0x0]
    addge r0, r0, #0x1
    strge r0, [r2, #0x0]
    bge .L_02211130
    str r7, [r2, #0x0]
    ldr r0, [r1, #0x7c0]
    cmp r0, #0x1
    bne .L_02211130
    ldr r0, .L_02211234
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    str r6, [sp, #0x0]
    stmib sp, {r6, r11}
    add r3, r10, r9, lsl #0x4
    ldr r2, [r3, #0xa94]
    ldr r3, [r3, #0xa9c]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    mov r1, #0x0
    sub r2, r2, #0x14
    sub r3, r3, #0x14
    bl func_020a257c
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x928]
.L_02211130:
    add r0, sp, #0xc
    add r1, r5, r9, lsl #0x4
    add r2, r4, r9, lsl #0x4
    bl func_ov069_0221123c
    ldr r0, [sp, #0x10]
    cmp r0, #0x144000
    blt .L_02211154
    cmp r0, #0x2bc000
    ble .L_02211164
.L_02211154:
    add r1, r10, r9, lsl #0x4
    ldr r0, [r1, #0x8]
    rsb r0, r0, #0x0
    str r0, [r1, #0x8]
.L_02211164:
    ldr r1, [sp, #0x18]
    cmp r1, #0x84000
    blt .L_0221117c
    ldr r0, .L_02211238
    cmp r1, r0
    ble .L_0221118c
.L_0221117c:
    add r1, r10, r9, lsl #0x4
    ldr r0, [r1, #0x10]
    rsb r0, r0, #0x0
    str r0, [r1, #0x10]
.L_0221118c:
    add lr, r10, r9, lsl #0x4
    ldr r2, [lr, #0xa94]
    ldr r1, [lr, #0x8]
    add r0, r10, r9, lsl #0x1
    add r1, r2, r1
    str r1, [lr, #0xa94]
    add r1, r0, #0x500
    ldr r3, [lr, #0xa98]
    ldr r0, [lr, #0xc]
    add r2, r10, r9, lsl #0x2
    add r0, r3, r0
    str r0, [lr, #0xa98]
    ldr ip, [lr, #0xa9c]
    ldr r3, [lr, #0x10]
    add r0, sp, #0xc
    add r3, ip, r3
    str r3, [lr, #0xa9c]
    ldrh r3, [r1, #0xa4]
    ldr r2, [r2, #0x658]
    add r2, r3, r2
    strh r2, [r1, #0xa4]
    bl func_02005058
.L_022111e4:
    subs r9, r9, #0x1
    bpl .L_02211040
    b .L_0221122c
.L_022111f0:
    sub r4, r0, #0x1
    add r6, r10, #0xa90
    add r5, r10, #0x4
.L_022111fc:
    add r1, r10, r4, lsl #0x2
    ldr r0, [r1, #0x7c0]
    cmp r0, #0x0
    addgt r0, r1, #0x1000
    ldrgt r0, [r0, #0x30]
    cmpgt r0, #0x0
    ble .L_02211224
    add r0, r6, r4, lsl #0x4
    add r1, r5, r4, lsl #0x4
    bl func_020050c8
.L_02211224:
    subs r4, r4, #0x1
    bpl .L_022111fc
.L_0221122c:
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02211234: .word data_021052fc
.L_02211238: .word 0x26e000
.size func_ov069_0221100c, . - func_ov069_0221100c
