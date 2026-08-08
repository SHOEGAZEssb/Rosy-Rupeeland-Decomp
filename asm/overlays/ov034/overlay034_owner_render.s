.text

/* Exact fallback; see src/overlays/ov034/overlay034_owner_render.c for documented portable C. */

    .extern func_ov034_021fd90c
    .extern func_ov034_021fd938
    .extern func_ov034_021fd030
    .extern func_ov034_021fcf90
    .extern func_ov034_021fcfd8
    .extern func_01ff88c4

    .global func_ov034_021fd6f4
func_ov034_021fd6f4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r5, [r4, #0x70]
    cmp r5, #0x0
    ble L_021fd8e4
    ldr lr, L_021fd8ec
    mov r0, #0x0
    str r0, [lr, #0x0]
    ldr ip, [r4, #0x30]
    ldr r3, [r4, #0x20]
    ldr r2, [r4, #0x10]
    mov r1, #0x1f
    str r2, [lr, #0x2c]
    str r3, [lr, #0x2c]
    str ip, [lr, #0x2c]
    str r5, [lr, #0x28]
    str r5, [lr, #0x28]
    str r5, [lr, #0x28]
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x20
    str r0, [sp, #0x4]
    bl func_ov034_021fd90c
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xac]
    mov r1, #0x1
    str r0, [sp, #0xc]
    ldr r0, [r4, #0xb4]
    ldr r2, [r4, #0xb8]
    ldr r3, [r4, #0xbc]
    bl func_ov034_021fd938
    ldr r0, [r4, #0xb4]
    ldr r1, [r4, #0xb0]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x4
    mov r1, r1, lsr r0
    ldr r0, L_021fd8f0
    mov r5, #0x0
    str r1, [r0, #0x0]
L_021fd7ac:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0xa0]
    bl func_ov034_021fd030
    add r5, r5, #0x1
    cmp r5, #0x3
    blt L_021fd7ac
    ldr r1, [r4, #0xc4]
    cmp r1, #0x0
    ble L_021fd838
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x22
    str r0, [sp, #0x4]
    bl func_ov034_021fd90c
    ldr ip, L_021fd8f4
    mov r0, #0x1
    ldr r3, L_021fd8f8
    str r0, [ip, #0x0]
    rsb r0, r0, #0x8000
    str r0, [ip, #-0x80]
    sub r1, ip, #0x74
    str r3, [r1, #0x0]
    mov r0, #0x10
    str r0, [r1, #0x0]
    sub r0, r3, #0x3c00000
    sub r2, ip, #0x6c
    str r0, [r2, #0x0]
    rsb r1, r3, #0x10000
    ldr r0, L_021fd8fc
    str r1, [r2, #0x0]
    str r0, [r2, #0x0]
    mov r0, #0x0
    str r0, [ip, #0x4]
L_021fd838:
    ldr r0, L_021fd900
    mov r1, #0x400
    str r1, [r0, #0x0]
    str r1, [r0, #0x0]
    str r1, [r0, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r1, #0x0
    mov r0, #0x1
    mov r2, #0x3
    mov r3, #0x21
    str r1, [sp, #0x4]
    bl func_ov034_021fd90c
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov034_021fd938
    ldr r1, [r4, #0xc0]
    mov r0, #0x3e0
    mov r1, r1, lsl #0x15
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov034_021fcf90
    ldr r0, L_021fd904
    mov r1, #0x3e0
    str r1, [r0, #0x0]
    ldr r4, [r4, #0x9c]
    mov r1, #0x0
    mov r0, r4
    bl func_ov034_021fcfd8
    ldr r2, [r4, #0x24]
    mov r1, r0
    ldr r2, [r2, #0x0]
    mov r0, #0x3
    bl func_01ff88c4
    ldr r0, L_021fd908
    mov r1, #0x1
    str r1, [r0, #0x0]
L_021fd8e4:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
L_021fd8ec: .word 0x4000444
L_021fd8f0: .word 0x40004ac
L_021fd8f4: .word 0x4000500
L_021fd8f8: .word 0x1e0f940
L_021fd8fc: .word 0x1e006c0
L_021fd900: .word 0x400046c
L_021fd904: .word 0x40004c4
L_021fd908: .word 0x4000448
.size func_ov034_021fd6f4, .-func_ov034_021fd6f4
