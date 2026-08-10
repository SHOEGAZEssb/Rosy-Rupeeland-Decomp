.text
/* Exact fallback; see overlay040_object_update.c for portable C. */
    .extern func_ov040_02202244
    .extern VecFx32Object_Assign
    .extern func_ov040_02202f1c

    .global func_ov040_02201060
func_ov040_02201060:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xb30]
    cmp r1, #0x1
    bne .L_022010d0
    ldr r1, [r4, #0xbc0]
    sub r1, r1, #0x1
    str r1, [r4, #0xbc0]
    cmp r1, #0x0
    ldmgtia sp!, {r4, pc}
    ldr r1, [r4, #0xbd4]
    cmp r1, #0x0
    bne .L_022010a0
    mov r1, #0x14
    bl func_ov040_02202244
    b .L_022010a8
.L_022010a0:
    mov r1, #0x15
    bl func_ov040_02202244
.L_022010a8:
    ldr r0, [r4, #0x48]
    mov r2, #0x9
    ldr r1, [r0, #0xc]
    mov r0, #0x64
    str r2, [r1, #0x7c]
    str r0, [r4, #0xbc0]
    ldr r0, [r4, #0xb30]
    add r0, r0, #0x1
    str r0, [r4, #0xb30]
    ldmia sp!, {r4, pc}
.L_022010d0:
    cmp r1, #0x2
    bne .L_02201150
    ldr r0, [r4, #0xbc0]
    sub r0, r0, #0x1
    str r0, [r4, #0xbc0]
    cmp r0, #0x0
    ldmgtia sp!, {r4, pc}
    add r0, r4, #0x354
    add r0, r0, #0x800
    add r1, r4, #0x680
    bl VecFx32Object_Assign
    ldr r2, [r4, #0xb58]
    ldr r1, [r4, #0xb5c]
    add r0, r4, #0x3d8
    mov r3, r1, asr #0xc
    add r0, r0, #0x800
    mov r2, r2, asr #0xc
    mov r1, #0x0
    bl func_ov040_02202f1c
    mov r2, #0xd
    mov r1, #0x0
.L_02201124:
    add r0, r4, r2
    add r2, r2, #0x1
    strb r1, [r0, #0x642]
    cmp r2, #0x15
    ble .L_02201124
    mov r0, #0x1e
    str r0, [r4, #0xbc0]
    ldr r0, [r4, #0xb30]
    add r0, r0, #0x1
    str r0, [r4, #0xb30]
    ldmia sp!, {r4, pc}
.L_02201150:
    cmp r1, #0x3
    bne .L_022011d0
    ldr r0, [r4, #0xbc0]
    sub r0, r0, #0x1
    str r0, [r4, #0xbc0]
    cmp r0, #0x0
    ldmgtia sp!, {r4, pc}
    add r0, r4, #0x354
    add r0, r0, #0x800
    add r1, r4, #0x670
    bl VecFx32Object_Assign
    ldr r2, [r4, #0xb58]
    ldr r1, [r4, #0xb5c]
    add r0, r4, #0x3d8
    mov r3, r1, asr #0xc
    add r0, r0, #0x800
    mov r2, r2, asr #0xc
    mov r1, #0x1
    bl func_ov040_02202f1c
    mov r2, #0x7
    mov r1, #0x0
.L_022011a4:
    add r0, r4, r2
    add r2, r2, #0x1
    strb r1, [r0, #0x642]
    cmp r2, #0xc
    ble .L_022011a4
    mov r0, #0x1e
    str r0, [r4, #0xbc0]
    ldr r0, [r4, #0xb30]
    add r0, r0, #0x1
    str r0, [r4, #0xb30]
    ldmia sp!, {r4, pc}
.L_022011d0:
    cmp r1, #0x4
    bne .L_02201250
    ldr r0, [r4, #0xbc0]
    sub r0, r0, #0x1
    str r0, [r4, #0xbc0]
    cmp r0, #0x0
    ldmgtia sp!, {r4, pc}
    add r0, r4, #0x354
    add r0, r0, #0x800
    add r1, r4, #0x670
    bl VecFx32Object_Assign
    ldr r2, [r4, #0xb58]
    ldr r1, [r4, #0xb5c]
    add r0, r4, #0x3d8
    mov r3, r1, asr #0xc
    add r0, r0, #0x800
    mov r2, r2, asr #0xc
    mov r1, #0x2
    bl func_ov040_02202f1c
    mov r2, #0x0
    mov r1, r2
.L_02201224:
    add r0, r4, r2
    add r2, r2, #0x1
    strb r1, [r0, #0x642]
    cmp r2, #0x1d
    blt .L_02201224
    mov r0, #0x258
    str r0, [r4, #0xbc0]
    ldr r0, [r4, #0xb30]
    add r0, r0, #0x1
    str r0, [r4, #0xb30]
    ldmia sp!, {r4, pc}
.L_02201250:
    cmp r1, #0x5
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0xbc0]
    sub r0, r0, #0x1
    str r0, [r4, #0xbc0]
    cmp r0, #0x0
    ldmgtia sp!, {r4, pc}
    ldr r0, [r4, #0x48]
    mov r1, #0x3
    str r1, [r0, #0x3c]
    ldr r0, [r4, #0xb30]
    add r0, r0, #0x1
    str r0, [r4, #0xb30]
    ldmia sp!, {r4, pc}
    .size func_ov040_02201060, .-func_ov040_02201060
