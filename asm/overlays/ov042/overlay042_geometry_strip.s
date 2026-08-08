.text

/* Exact fallback for func_ov042_021fd578; see the documented portable C in
 * src/overlays/ov042/overlay042_geometry_fifo.c. */
.extern func_ov042_021fd548
.extern func_ov042_021fd624

    .global func_ov042_021fd578
func_ov042_021fd578:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, .L_021fd61c
    mov r4, #0x2
    mov r6, r2
    str r4, [r0, #0x0]
    mov r7, r1
    ldmia r6, {r0, r1}
    mov r5, r3
    bl func_ov042_021fd624
    ldmia r7, {r0, r1, r2}
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov042_021fd548
    mov r4, #0x1
    mov r8, #0xc
    b .L_021fd604
.L_021fd5c8:
    add r1, r6, r4, lsl #0x3
    ldmia r1, {r0, r1}
    bl func_ov042_021fd624
    mul r0, r4, r8
    add r2, r7, r0
    ldmib r2, {r1, r2}
    ldr r0, [r7, r0]
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov042_021fd548
    add r4, r4, #0x1
.L_021fd604:
    cmp r4, r5
    blt .L_021fd5c8
    ldr r0, .L_021fd620
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021fd61c: .word 0x4000500
.L_021fd620: .word 0x4000504
    .size func_ov042_021fd578, . - func_ov042_021fd578
