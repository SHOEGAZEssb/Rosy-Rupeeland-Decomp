.text

/* Exact fallback; see src/overlays/ov032/overlay032_selection_motion.c for documented portable C. */
.extern func_020be8c0
.extern func_020beae4
.extern func_020beb18
.extern func_020beb6c
.extern func_ov032_02201390

    .global func_ov032_021fe92c
func_ov032_021fe92c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    ldr r0, [r4, #0xc28]
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_021fe958
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_021fe964
L_021fe958:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_021fe964:
    bl func_020beae4
    ldr r1, [r4, #0xc30]
    mov r8, #0x0
    smull r2, r0, r1, r0
    adds r1, r2, #0x800
    ldr r3, [r4, #0xc34]
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r2, r3, r1
    ldr r0, L_021fe9e0
    ldr r1, L_021fe9e4
    str r2, [r4, #0xc34]
    and r0, r0, r2, asr #0xc
    str r0, [r1, #0x0]
    add r0, r4, #0x44
    mov r7, #0x1
    add r6, r0, #0xc00
    mov r5, r8
    mov r4, #0x6c
L_021fe9b4:
    mla r0, r8, r4, r6
    bl func_ov032_02201390
    cmp r0, #0x0
    add r8, r8, #0x1
    moveq r7, r5
    cmp r8, #0x5
    blt L_021fe9b4
    cmp r7, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fe9e0: .word 0x1ff
L_021fe9e4: .word 0x400001c
.size func_ov032_021fe92c, .-func_ov032_021fe92c

