.text
/* Exact fallback; see overlay039_script_render.c for portable C. */
    .extern func_ov039_022014f8
    .extern func_02005058
    .extern data_020c9670
    .global func_ov039_02202f34
func_ov039_02202f34:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0x1000
    ldr r0, [r0, #0xcd8]
    mov r4, r1
    cmp r0, #0x3
    bne L_02203054
    add r0, sp, #0x0
    add r1, r5, #0x2c
    add r2, r5, #0xac
    bl func_ov039_022014f8
    add r0, r5, #0x1000
    ldr r0, [r0, #0xccc]
    ldr r2, [r5, #0x48]
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    ldr r2, [r2, #0x8]
    add r0, r1, #0x1
    ldr r5, [r2, #0x48]
    mov r3, r1, lsl #0x1
    ldr r2, L_02203060
    mov r1, r0, lsl #0x1
    ldr r9, [r5, #0x30]
    ldr r6, [sp, #0x4]
    ldr r8, [r5, #0x34]
    ldr r5, [sp, #0x8]
    ldrsh lr, [r2, r1]
    sub r6, r9, r6
    ldrsh r0, [r2, r3]
    sub r5, r8, r5
    smull r8, r3, lr, r6
    adds r8, r8, #0x800
    mov ip, r8, lsr #0xc
    adc r3, r3, #0x0
    smull r2, r1, r0, r5
    adds r2, r2, #0x800
    smull r8, r10, r0, r6
    adc r1, r1, #0x0
    adds r0, r8, #0x800
    mov r2, r2, lsr #0xc
    smull r9, r8, lr, r5
    adc r10, r10, #0x0
    mov r0, r0, lsr #0xc
    adds r9, r9, #0x800
    orr ip, ip, r3, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    mov r7, #0x800
    adc r3, r8, #0x0
    mov r8, r9, lsr #0xc
    sub r2, ip, r2
    sub r1, r7, #0x10800
    orr r0, r0, r10, lsl #0x14
    orr r8, r8, r3, lsl #0x14
    cmp r2, r1
    add r0, r0, r8
    ble L_0220304c
    cmp r2, #0x10000
    bge L_0220304c
    cmp r0, #0xb000
    ble L_0220304c
    str r6, [r4, #0x4]
    add r0, sp, #0x0
    str r5, [r4, #0x8]
    bl func_02005058
    mov r0, #0x1
    b L_02203058
L_0220304c:
    add r0, sp, #0x0
    bl func_02005058
L_02203054:
    mov r0, #0x0
L_02203058:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_02203060: .word data_020c9670
    .size func_ov039_02202f34, .-func_ov039_02202f34

