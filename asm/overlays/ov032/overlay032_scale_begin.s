.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_controller.c for documented portable C. */
.extern func_020708c4
.extern func_02070934
.extern func_02070958
.extern func_020adc90
.extern func_020be8c0
.extern func_020beae4
.extern func_020beb18
.extern func_020beb6c

    .global func_ov032_0220150c
func_ov032_0220150c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    mov r5, r1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r2, #0x0
    bne L_022015ac
    mov r0, #0x0
    str r0, [r4, #0x20]
    cmp r5, #0x0
    mov r0, r5, lsl #0xc
    ble L_02201560
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_0220156c
L_02201560:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_0220156c:
    bl func_020beae4
    str r0, [r4, #0x18]
    ldr r1, [r4, #0x4]
    mov r5, r0, asr #0xc
    ldr r0, [r1, #0x4]
    bl func_02070934
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_020708c4
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r0, [r0, #0x4]
    mov r2, r5
    mov r3, r5
    bl func_02070958
    ldmia sp!, {r4, r5, r6, pc}
L_022015ac:
    str r2, [r4, #0x20]
    str r5, [r4, #0x24]
    cmp r2, #0x0
    mov r0, r2, lsl #0xc
    ble L_022015d4
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_022015e0
L_022015d4:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_022015e0:
    mov r6, r0
    cmp r5, #0x0
    mov r0, r5, lsl #0xc
    ble L_02201604
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02201610
L_02201604:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02201610:
    bl func_020beae4
    mov r5, r0
    mov r0, r6
    bl func_020beae4
    ldr r2, [r4, #0x18]
    mov r1, r0
    sub r0, r5, r2
    bl func_020adc90
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x4]
    ldr r1, [r4, #0x18]
    ldr r0, [r0, #0x4]
    mov r5, r1, asr #0xc
    bl func_02070934
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_020708c4
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r0, [r0, #0x4]
    mov r2, r5
    mov r3, r5
    bl func_02070958
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov032_0220150c, .-func_ov032_0220150c

