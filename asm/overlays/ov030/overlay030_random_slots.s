.text

/* Exact fallback; see src/overlays/ov030/overlay030_random_slots.c. */
.extern func_ov030_021fcf04
.extern genrand_int32

    .global func_ov030_021fce00
func_ov030_021fce00:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x20
    mov r6, #0x0
    mov r4, r0
    str r6, [r4, #0x0]
    str r6, [r4, #0x4]
    mov r5, r6
    add r8, sp, #0x4
    mov r7, r6
L_021fce24:
    add r0, r4, r6, lsl #0x2
    strh r5, [r0, #0x8]
    bl genrand_int32
    mov r2, r6, lsl #0x2
    add r1, r8, r6, lsl #0x2
    strh r0, [r8, r2]
    add r6, r6, #0x1
    strh r7, [r1, #0x2]
    cmp r6, #0x7
    blt L_021fce24
    mov r2, #0x1
    add r1, sp, #0x4
L_021fce54:
    add r0, r1, r7, lsl #0x2
    add r7, r7, #0x1
    strh r2, [r0, #0x2]
    cmp r7, #0x3
    blt L_021fce54
    mov r7, #0x0
    add r9, sp, #0x0
    add r6, sp, #0x4
L_021fce74:
    add r8, r7, #0x1
    mov r5, r7, lsl #0x2
    b L_021fcec0
L_021fce80:
    mov r0, r8, lsl #0x2
    ldrh r1, [r6, r5]
    ldrh r0, [r6, r0]
    cmp r1, r0
    bls L_021fcebc
    mov r0, r9
    add r1, r6, r5
    bl func_ov030_021fcf04
    add r10, r6, r8, lsl #0x2
    mov r1, r10
    add r0, r6, r5
    bl func_ov030_021fcf04
    mov r0, r10
    mov r1, r9
    bl func_ov030_021fcf04
L_021fcebc:
    add r8, r8, #0x1
L_021fcec0:
    cmp r8, #0x7
    blt L_021fce80
    add r7, r7, #0x1
    cmp r7, #0x6
    blt L_021fce74
    mov r3, #0x0
    add r2, sp, #0x4
L_021fcedc:
    add r0, r2, r3, lsl #0x2
    ldrh r1, [r0, #0x2]
    add r0, r4, r3, lsl #0x2
    add r3, r3, #0x1
    strh r1, [r0, #0xa]
    cmp r3, #0x7
    blt L_021fcedc
    mov r0, r4
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.size func_ov030_021fce00, .-func_ov030_021fce00
