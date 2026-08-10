.text
.extern func_020befec
.extern GraphicsSpriteState_SetAnimationIndex
.global func_ov042_022009a0
func_ov042_022009a0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xe8]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    subs r0, r0, #0x1
    str r0, [r5, #0xe8]
    beq .L_022009c8
    cmp r2, #0x0
    bgt .L_02200a0c
.L_022009c8:
    mov r0, #0x3
    sub r2, r0, #0x1
.L_022009d0:
    add r0, r5, r2, lsl #0x2
    ldr r1, [r0, #0x5c]
    subs r2, r2, #0x1
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl .L_022009d0
    mov r0, #0x18
    sub r2, r0, #0x1
.L_022009f4:
    ldr r1, [r5, #0xec]
    add r0, r5, r2, lsl #0x2
    str r1, [r0, #0xf0]
    subs r2, r2, #0x1
    bpl .L_022009f4
    ldmia sp!, {r3, r4, r5, pc}
.L_02200a0c:
    mov r0, #0x3
    sub r0, r0, #0x1
.L_02200a14:
    add lr, r5, r0, lsl #0x2
    ldr ip, [lr, #0x5c]
    subs r0, r0, #0x1
    ldrh r4, [ip, #0x42]
    bic r4, r4, #0x4
    strh r4, [ip, #0x42]
    ldr ip, [r1, #0x4]
    ldr r4, [lr, #0x5c]
    sub ip, ip, #0x20000
    str ip, [r4, #0x30]
    ldr ip, [r1, #0x8]
    ldr r4, [lr, #0x5c]
    str ip, [r4, #0x34]
    bpl .L_02200a14
    mov r1, r3
    mov r0, r2, lsl #0x6
    bl func_020befec
    mov r4, r0
    cmp r4, #0x0
    ldrle r1, [r5, #0x60]
    ldrleh r0, [r1, #0x42]
    orrle r0, r0, #0x4
    strleh r0, [r1, #0x42]
    ble .L_02200a88
    ldr r0, [r5, #0x60]
    rsb r1, r4, #0x41
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02200a88:
    mov r0, #0x18
    sub r2, r0, #0x1
.L_02200a90:
    add r1, r5, r2, lsl #0x2
    ldr r0, [r1, #0xec]
    sub r2, r2, #0x1
    str r0, [r1, #0xf0]
    cmp r2, #0x1
    bge .L_02200a90
    ldr r0, [r5, #0xf0]
    cmp r0, r4
    strgt r4, [r5, #0xf0]
    ldr r1, [r5, #0xec]
    ldr r0, [r5, #0x14c]
    cmp r1, r0
    subgt r0, r1, #0x1
    strgt r0, [r5, #0xec]
    ldr r1, [r5, #0xec]
    cmp r1, #0x0
    ldrle r1, [r5, #0x64]
    ldrleh r0, [r1, #0x42]
    orrle r0, r0, #0x4
    strleh r0, [r1, #0x42]
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x64]
    rsb r1, r1, #0x81
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov042_022009a0, . - func_ov042_022009a0
