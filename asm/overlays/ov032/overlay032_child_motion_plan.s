.text

/* Exact fallback; see src/overlays/ov032/overlay032_child_setup.c for documented portable C. */
.extern func_020adc90
.extern func_020be8c0
.extern func_020beae4
.extern func_020beb18
.extern func_020beb6c

    .global func_ov032_02201188
func_ov032_02201188:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    str r1, [r4, #0x60]
    mov r0, #0x28
    str r0, [r4, #0x64]
    mov r5, #0x0
    str r5, [r4, #0x5c]
    ldr ip, [r4, #0x48]
    mov r0, #0x1000
    str ip, [r4, #0x68]
    str r0, [r4, #0x58]
    cmp r1, #0x0
    bge L_022012a4
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    streq r5, [r4, #0x64]
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r1, #0x3
    bne L_02201244
    mov r0, #0x18
    mla r3, r2, r0, r3
    ldr ip, [r4, #0x0]
    sub r1, r1, #0x1
    mov r0, #0x6c
    mla r0, r1, r0, ip
    ldr r1, [r3, #0x20]
    ldr r0, [r0, #0xc8c]
    add r1, r1, r0
    str r1, [r4, #0x68]
    ldr r0, [r4, #0x48]
    sub r0, r0, r1
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_02201224
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02201230
L_02201224:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02201230:
    bl func_020beae4
    mov r1, #0x28000
    bl func_020adc90
    str r0, [r4, #0x58]
    ldmia sp!, {r3, r4, r5, pc}
L_02201244:
    ldr r2, [r4, #0x0]
    sub r1, r1, #0x1
    mov r0, #0x6c
    mla r0, r1, r0, r2
    ldr r1, [r0, #0xc8c]
    str r1, [r4, #0x68]
    ldr r0, [r4, #0x48]
    sub r0, r0, r1
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_02201284
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02201290
L_02201284:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02201290:
    bl func_020beae4
    mov r1, #0x28000
    bl func_020adc90
    str r0, [r4, #0x58]
    ldmia sp!, {r3, r4, r5, pc}
L_022012a4:
    ldr lr, [r4, #0x4]
    cmp lr, #0x4
    streq r5, [r4, #0x64]
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp lr, #0x1
    bne L_02201330
    ldr ip, [r4, #0x0]
    sub r1, r2, #0x2
    mov r0, #0x18
    mla r2, r1, r0, r3
    add r1, lr, #0x1
    mov r0, #0x6c
    mla r0, r1, r0, ip
    ldr r1, [r2, #0x20]
    ldr r0, [r0, #0xc8c]
    add r1, r1, r0
    str r1, [r4, #0x68]
    ldr r0, [r4, #0x48]
    sub r0, r1, r0
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_02201310
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_0220131c
L_02201310:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_0220131c:
    bl func_020beae4
    mov r1, #0x28000
    bl func_020adc90
    str r0, [r4, #0x58]
    ldmia sp!, {r3, r4, r5, pc}
L_02201330:
    ldr r2, [r4, #0x0]
    add r1, lr, #0x1
    mov r0, #0x6c
    mla r0, r1, r0, r2
    ldr r1, [r0, #0xc8c]
    str r1, [r4, #0x68]
    ldr r0, [r4, #0x48]
    sub r0, r1, r0
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_02201370
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_0220137c
L_02201370:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_0220137c:
    bl func_020beae4
    mov r1, #0x28000
    bl func_020adc90
    str r0, [r4, #0x58]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov032_02201188, .-func_ov032_02201188

