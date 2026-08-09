.text
.extern func_020a1ec0
.extern data_ov042_0220acf8
.extern data_ov042_0220ad18
.global func_ov042_02201ea0
func_ov042_02201ea0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x40
    ldr r6, .L_02201f28
    mov r7, r1
    mov lr, r0
    add r4, sp, #0x20
    ldmia r6!, {r0, r1, r2, r3}
    mov ip, r4
    stmia r4!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1, r2, r3}
    ldr r6, .L_02201f2c
    stmia r4, {r0, r1, r2, r3}
    add r5, sp, #0x0
    mov r4, r5
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    tst r7, #0x2
    ldr r0, [lr, #0x1c8]
    movne ip, r4
    tst r0, #0x1
    beq .L_02201f20
    mov r0, r0, asr #0x1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    ldr r1, [ip, r0, lsl #0x2]
    ldr r0, [lr, #0x48]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_020a1ec0
.L_02201f20:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02201f28: .word data_ov042_0220acf8
.L_02201f2c: .word data_ov042_0220ad18
.size func_ov042_02201ea0, . - func_ov042_02201ea0
