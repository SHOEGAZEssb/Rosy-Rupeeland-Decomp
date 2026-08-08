; Matching retail form; see src/game/tracked_resource_actor_factory.c.
.extern data_020eb850
.extern data_021052fc
.extern func_02007f0c
.extern func_02028388
.extern func_0202ecd0
.extern func_0203ae14
.text

    .global func_02050078
func_02050078: ; 0x02050078
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0xb0
    mov r4, #0x0
    mov r6, r2
    ldr r7, .L_02050220
    mov ip, r4
    mov r2, #0x32
.L_02050094:
    mul r5, ip, r2
    ldrsh r3, [r7, r5]
    add ip, ip, #0x1
    cmp r0, r3
    addeq r4, r7, r5
    cmp ip, #0x43
    blt .L_02050094
    ldrb r2, [r4, #0x8]
    mov ip, #0x8
    mov lr, #0x2
    cmp r2, #0x22
    orrne ip, ip, #0x10
    cmp r2, #0x1c
    ldrnesh r0, [r4, #0x0]
    cmpne r0, #0x37
    orrne ip, ip, #0x2000000
    bne .L_020500e0
    cmp r2, #0x26
    moveq lr, #0x1
.L_020500e0:
    ldrh r0, [r4, #0x4]
    mov r3, #0x0
    mov r5, #0xff
    str r0, [sp, #0x0]
    ldrh r7, [r4, #0x6]
    add r0, sp, #0x4c
    stmib sp, {r7, lr}
    str r3, [sp, #0xc]
    ldr r7, [r1, #0x4]
    mov r7, r7, asr #0xc
    str r7, [sp, #0x10]
    ldr r7, [r1, #0x8]
    mov r7, r7, asr #0xc
    str r7, [sp, #0x14]
    ldr lr, [r1, #0xc]
    ldrsb r7, [r4, #0x15]
    mov r1, #0x4
    add r7, r7, lr, asr #0xc
    str r7, [sp, #0x18]
    ldrsb lr, [r4, #0x13]
    str lr, [sp, #0x1c]
    ldrsb lr, [r4, #0x14]
    str lr, [sp, #0x20]
    str ip, [sp, #0x24]
    str r3, [sp, #0x28]
    str r3, [sp, #0x2c]
    str r3, [sp, #0x30]
    str r3, [sp, #0x34]
    str r5, [sp, #0x38]
    str r3, [sp, #0x3c]
    str r3, [sp, #0x40]
    str r3, [sp, #0x44]
    str r3, [sp, #0x48]
    ldrh r3, [r4, #0x2]
    bl func_0203ae14
    ldr r0, .L_02050224
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x24]
    ldr r0, [r0, #0x0]
    sub r0, r0, #0x1
    bl func_02028388
    ldr r0, [r0, #0x40]
    mov r1, #0x1
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    ldreq r0, [sp, #0x74]
    orreq r0, r0, #0x1
    streq r0, [sp, #0x74]
    ldr r0, .L_02050224
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r1, sp, #0x4c
    bl func_0202ecd0
    ldr r3, [r0, #0x0]
    mov r5, r0
    ldr r3, [r3, #0xc0]
    mov r1, r4
    mov r2, r6
    blx r3
    ldr r0, [r5, #0x10]
    orr r0, r0, #0x140000
    str r0, [r5, #0x10]
    ldrb r0, [r4, #0x9]
    cmp r0, #0x1
    ldreq r0, [r5, #0x10]
    orreq r0, r0, #0x10000
    streq r0, [r5, #0x10]
    beq .L_02050204
    cmp r0, #0x0
    ldreq r0, [r5, #0x10]
    orreq r0, r0, #0x20000
    streq r0, [r5, #0x10]
.L_02050204:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xcc]
    blx r1
    mov r0, r5
    add sp, sp, #0xb0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02050220: .word data_020eb850
.L_02050224: .word data_021052fc
.size func_02050078, . - func_02050078

