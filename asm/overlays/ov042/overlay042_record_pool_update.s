.text
.extern func_ov042_021fcf80
.extern func_ov042_021fda0c
.extern func_ov042_021ff2f8
.extern func_ov042_02203658
.extern func_ov042_02205148
.extern func_ov042_021fda24
.extern func_ov071_02211a10
.extern func_ov071_02210440
    .global func_ov042_0220549c
func_ov042_0220549c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x5c
    mov r10, r0
    add r0, sp, #0x50
    bl func_ov042_021fcf80
    ldr r1, [r10, #0x0]
    add r0, sp, #0x50
    ldr r1, [r1, #0x8]
    add r1, r1, #0x94
    bl func_ov042_021fda0c
    mov r0, #0x40
    mov r4, #0xd2000
    sub r9, r0, #0x1
    add r0, r10, #0x44
    rsb r4, r4, #0x0
    add r5, r0, #0x400
    sub r0, r4, #0x3e000
    str r0, [sp, #0x4]
    add r0, r4, #0x1f4000
    str r0, [sp, #0x8]
    sub r0, r4, #0x3e000
    str r0, [sp, #0xc]
    add r0, r4, #0x1f4000
    add r6, r10, #0x144
    str r0, [sp, #0x10]
    mvn r11, #0x0
.L_02205504:
    add r7, r10, r9
    ldrsb r0, [r7, #0x4]
    cmp r0, r11
    ble .L_022057f8
    add r0, r10, r9, lsl #0x1
    add r1, r0, #0x700
    ldrsh r0, [r1, #0x44]
    add r0, r0, #0x1
    strh r0, [r1, #0x44]
    ldrsb r2, [r7, #0x4]
    cmp r2, #0x1
    beq .L_0220554c
    sub r0, r2, #0xb
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_02205698
.L_0220554c:
    mov r0, #0xc
    mul r8, r9, r0
    add r0, r6, r8
    add r1, r5, r8
    bl func_ov042_021ff2f8
    add r1, r10, r8
    ldr r0, [r1, #0x148]
    cmp r0, r4
    blt .L_02205594
    cmp r0, #0xd2000
    bgt .L_02205594
    ldr r1, [r1, #0x14c]
    ldr r0, [sp, #0x4]
    cmp r1, r0
    blt .L_02205594
    ldr r0, [sp, #0x8]
    cmp r1, r0
    ble .L_022055a4
.L_02205594:
    mov r0, r10
    mov r1, r9
    bl func_ov042_02205148
    b .L_022057f8
.L_022055a4:
    ldrsb r0, [r7, #0x4]
    cmp r0, #0xc
    bne .L_022055e4
    add r0, sp, #0x44
    add r1, r6, r8
    bl func_ov042_02203658
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x0]
    add r1, sp, #0x44
    ldr r0, [r0, #0x8]
    mov r2, #0x18000
    ldr r0, [r0, #0xe8]
    mov r3, #0x6
    bl func_ov071_02211a10
    b .L_02205614
.L_022055e4:
    add r0, sp, #0x38
    add r1, r6, r8
    bl func_ov042_02203658
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x0]
    add r1, sp, #0x38
    ldr r0, [r0, #0x8]
    mov r2, #0x14000
    ldr r0, [r0, #0xe8]
    mov r3, #0x1
    bl func_ov071_02211a10
.L_02205614:
    cmp r0, #0x0
    ble .L_02205644
    add r2, r10, r9, lsl #0x1
    ldrsh r1, [r2, #0x44]
    sub r0, r1, r0
    strh r0, [r2, #0x44]
    ldrsh r0, [r2, #0x44]
    cmp r0, #0x0
    bgt .L_02205644
    mov r0, r10
    mov r1, r9
    bl func_ov042_02205148
.L_02205644:
    add r0, sp, #0x2c
    add r1, r6, r8
    bl func_ov042_02203658
    ldr r0, [r10, #0x0]
    add r1, sp, #0x2c
    ldr r0, [r0, #0x8]
    mov r2, #0x18000
    mov r3, #0x0
    bl func_ov071_02210440
    cmp r0, #0x0
    ble .L_022057f8
    ldr r0, [r10, #0x0]
    add r2, r6, r8
    ldr r0, [r0, #0x14]
    mov r1, #0x1
    mov r3, r11
    bl func_ov042_021fda24
    mov r0, r10
    mov r1, r9
    bl func_ov042_02205148
    b .L_022057f8
.L_02205698:
    cmp r2, #0xa
    bne .L_022057ac
    mov r0, #0xc
    mul r7, r9, r0
    add r0, r6, r7
    add r1, r5, r7
    bl func_ov042_021ff2f8
    add r1, r10, r7
    ldr r0, [r1, #0x148]
    cmp r0, r4
    blt .L_022056e8
    cmp r0, #0xd2000
    bgt .L_022056e8
    ldr r1, [r1, #0x14c]
    ldr r0, [sp, #0xc]
    cmp r1, r0
    blt .L_022056e8
    ldr r0, [sp, #0x10]
    cmp r1, r0
    ble .L_022056f8
.L_022056e8:
    mov r0, r10
    mov r1, r9
    bl func_ov042_02205148
    b .L_022057f8
.L_022056f8:
    add r0, sp, #0x20
    add r1, r6, r7
    bl func_ov042_02203658
    ldr r0, [r10, #0x0]
    add r1, sp, #0x20
    ldr r0, [r0, #0x8]
    mov r2, #0x26000
    mov r3, #0x0
    bl func_ov071_02210440
    cmp r0, #0x0
    ble .L_02205748
    ldr r0, [r10, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x14]
    add r2, r6, r7
    mov r3, r11
    bl func_ov042_021fda24
    mov r0, r10
    mov r1, r9
    bl func_ov042_02205148
.L_02205748:
    add r1, r6, r7
    add r0, sp, #0x14
    bl func_ov042_02203658
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x0]
    add r1, sp, #0x14
    ldr r0, [r0, #0x8]
    mov r2, #0x26000
    ldr r0, [r0, #0xe8]
    mov r3, #0x2
    bl func_ov071_02211a10
    cmp r0, #0x0
    ble .L_022057f8
    add r2, r10, r9, lsl #0x1
    ldrsh r1, [r2, #0x44]
    sub r0, r1, r0
    strh r0, [r2, #0x44]
    ldrsh r0, [r2, #0x44]
    cmp r0, #0x0
    bgt .L_022057f8
    mov r0, r10
    mov r1, r9
    bl func_ov042_02205148
    b .L_022057f8
.L_022057ac:
    cmp r2, #0x64
    bne .L_022057f8
    ldrsh r0, [r1, #0x44]
    cmp r0, #0x14
    ble .L_022057d0
    mov r0, r10
    mov r1, r9
    bl func_ov042_02205148
    b .L_022057f8
.L_022057d0:
    tst r0, #0x3
    bne .L_022057f8
    mov r2, #0xc
    mla r2, r9, r2, r6
    mov r0, r0, asr #0x3
    and r3, r0, #0x3
    ldr r0, [r10, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x14]
    bl func_ov042_021fda24
.L_022057f8:
    subs r9, r9, #0x1
    bpl .L_02205504
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov042_0220549c, . - func_ov042_0220549c

