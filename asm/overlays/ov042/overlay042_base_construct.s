.text

/* Exact fallback for func_ov042_021fce1c; see the documented portable C in
 * src/overlays/ov042/overlay042_base_lifecycle.c. */
.extern __construct_array
.extern data_ov042_0220ac58
.extern func_020bf1f8
.extern func_ov042_021fce00
.extern func_ov042_021fcf80
.extern func_ov042_021fcf9c
.extern genrand_int32

    .global func_ov042_021fce1c
func_ov042_021fce1c: ; 0x021fce1c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r10, r0
    add r0, r10, #0x13c
    ldr r4, .L_021fcf70
    mov r5, r1
    ldr r3, .L_021fcf74
    add r0, r0, #0x400
    mov r1, #0x20
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    mov r0, #0x12
    str r5, [r10, #0x0]
    mov r1, #0x0
    sub r5, r0, #0x1
    str r1, [r10, #0x4]
    mov r4, r5
    mov r7, #0x48
.L_021fce68:
    mul r0, r5, r7
    mov r6, r4
    add r8, r0, r10
.L_021fce74:
    bl genrand_int32
    and r1, r0, #0x1f
    add r0, r8, r6, lsl #0x2
    rsb r1, r1, #0x0
    str r1, [r0, #0x8]
    subs r6, r6, #0x1
    bpl .L_021fce74
    subs r5, r5, #0x1
    bpl .L_021fce68
    add r0, r10, #0x118
    mov r2, #0x0
    add r1, sp, #0xc
    add r0, r0, #0x400
    str r2, [sp, #0xc]
    str r2, [sp, #0x10]
    str r2, [sp, #0x14]
    bl func_ov042_021fce00
    mov r0, #0x0
    str r0, [r10, #0x524]
    str r0, [r10, #0x530]
    str r0, [r10, #0x528]
    str r0, [r10, #0x534]
    ldr r3, .L_021fcf78
    add r2, sp, #0x4
    str r0, [r10, #0x538]
    mov r1, #0x4
.L_021fcedc:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_021fcedc
    mov r0, #0x20
    ldr r7, .L_021fcf7c
    sub r8, r0, #0x1
    mov r11, #0x1f4
    add r6, sp, #0x4
    mov r4, #0xc
    mov r5, #0x3c
.L_021fcf08:
    mla r9, r8, r4, r10
    bl genrand_int32
    mov r1, r11
    bl func_020bf1f8
    mul r2, r8, r8
    mul r0, r2, r5
    sub r1, r1, #0xfa
    mov r1, r1, lsl #0xc
    mov r2, r8, lsr #0x1f
    str r1, [r9, #0x540]
    rsb r1, r2, r8, lsl #0x1e
    add r2, r2, r1, ror #0x1e
    add r1, r10, r8, lsl #0x1
    add r3, r10, r8, lsl #0x2
    str r7, [r9, #0x544]
    add r0, r0, #0x2000
    str r0, [r3, #0x6bc]
    mov r0, r2, lsl #0x1
    ldrh r2, [r6, r0]
    add r0, r1, #0x700
    subs r8, r8, #0x1
    strh r2, [r0, #0x3c]
    bpl .L_021fcf08
    mov r0, r10
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021fcf70: .word func_ov042_021fcf9c
.L_021fcf74: .word func_ov042_021fcf80
.L_021fcf78: .word data_ov042_0220ac58
.L_021fcf7c: .word 0xffdda000
    .size func_ov042_021fce1c, . - func_ov042_021fce1c

