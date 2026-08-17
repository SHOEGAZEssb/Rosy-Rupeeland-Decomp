.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_controller.c for documented portable C. */
.extern func_02070958
.extern func_02074dc8
.extern func_020be8c0
.extern func_020beae4
.extern func_020beb18
.extern func_020beb6c

    .global Overlay032Controller_UpdateScale
Overlay032Controller_UpdateScale:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    subs r0, r0, #0x1
    str r0, [r4, #0x20]
    bne L_022016fc
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_022016b8
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_022016c4
L_022016b8:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_022016c4:
    bl func_020beae4
    mov r1, r0, asr #0xc
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x4]
    mov r2, r1
    ldr r0, [r0, #0x4]
    mov r3, r1
    bl func_02070958
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl func_02074dc8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_022016fc:
    ldr r1, [r4, #0x18]
    ldr r0, [r4, #0x1c]
    add r1, r1, r0
    str r1, [r4, #0x18]
    ldr r0, [r4, #0x4]
    mov r1, r1, asr #0xc
    ldr r0, [r0, #0x4]
    mov r2, r1
    mov r3, r1
    bl func_02070958
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl func_02074dc8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size Overlay032Controller_UpdateScale, .-Overlay032Controller_UpdateScale

