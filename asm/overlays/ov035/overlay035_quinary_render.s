.text

/* Exact fallback; see src/overlays/ov035/overlay035_quinary_render.c for documented portable C. */

    .extern func_02077b44
    .extern func_020773e4
    .extern func_ov035_021fd60c
    .extern func_ov035_021fd128
    .extern func_ov035_021fd7b0
    .extern func_ov035_021fd30c
    .extern func_ov035_021fcfa0

    .global func_ov035_022014d0
func_ov035_022014d0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0xc
    bl func_02077b44
    ldr r0, [r5, #0xf8]
    add r1, r5, #0x64
    bl func_020773e4
    ldr r0, [r5, #0x170]
    bl func_ov035_021fd60c
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r0, #0x8000
    str r0, [sp, #0x4]
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x10
    bl func_ov035_021fd128
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_ov035_021fd7b0
    ldr r4, [r5, #0x11c]
    b L_02201554
L_02201548:
    mov r0, r4
    bl func_ov035_021fd30c
    ldr r4, [r4, #0x8]
L_02201554:
    cmp r4, #0x0
    bne L_02201548
    ldr r4, [r5, #0x12c]
    b L_02201574
L_02201564:
    mov r0, r4
    add r1, r5, #0x64
    bl func_ov035_021fcfa0
    ldr r4, [r4, #0x8]
L_02201574:
    cmp r4, #0x0
    bne L_02201564
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov035_022014d0, .-func_ov035_022014d0

