.text

/* Exact fallback; see src/overlays/ov032/overlay032_unlock_effect.c for documented portable C. */
.extern func_020bf1f8
.extern func_ov032_022014c0
.extern genrand_int32

    .global func_ov032_02200284
func_ov032_02200284:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    mov r6, #0x0
    add r5, r10, #0x334
L_02200298:
    mov r0, #0x30
    mul r7, r6, r0
    add r8, r10, r7
    ldr r0, [r8, #0x35c]
    cmp r0, #0x0
    bne L_02200348
    ldr r0, [r8, #0x334]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_022003d0
    ldr r1, [r10, #0xebc]
    ldr r0, [r10, #0xeb4]
    sub r4, r1, r0
    bl genrand_int32
    mov r1, r4
    bl func_020bf1f8
    mov r9, r1
    ldr r1, [r10, #0xec0]
    ldr r0, [r10, #0xeb8]
    ldr r4, [r10, #0xeb4]
    sub r11, r1, r0
    bl genrand_int32
    mov r1, r11
    bl func_020bf1f8
    add r3, r4, r9
    ldr r4, [r10, #0xeb8]
    mov r2, #0x0
    add r1, r4, r1
    str r1, [sp, #0x0]
    mov r1, #0x3
    str r1, [sp, #0x4]
    mov r1, r2
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    add r0, r5, r7
    str r1, [sp, #0x10]
    bl func_ov032_022014c0
    ldr r1, [r8, #0x334]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    b L_022003d0
L_02200348:
    subs r0, r0, #0x1
    str r0, [r8, #0x35c]
    bne L_022003d0
    ldr r1, [r10, #0xebc]
    ldr r0, [r10, #0xeb4]
    sub r4, r1, r0
    bl genrand_int32
    mov r1, r4
    bl func_020bf1f8
    mov r9, r1
    ldr r1, [r10, #0xec0]
    ldr r0, [r10, #0xeb8]
    ldr r4, [r10, #0xeb4]
    sub r11, r1, r0
    bl genrand_int32
    mov r1, r11
    bl func_020bf1f8
    add r3, r4, r9
    ldr r4, [r10, #0xeb8]
    mov r2, #0x0
    add r1, r4, r1
    str r1, [sp, #0x0]
    mov r1, #0x3
    str r1, [sp, #0x4]
    mov r1, r2
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    add r0, r5, r7
    str r1, [sp, #0x10]
    bl func_ov032_022014c0
    ldr r1, [r8, #0x334]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
L_022003d0:
    add r6, r6, #0x1
    cmp r6, #0x28
    blt L_02200298
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov032_02200284, .-func_ov032_02200284

