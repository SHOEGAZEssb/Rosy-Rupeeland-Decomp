.text

/* Exact fallback for func_ov042_021fcfcc; see the documented portable C in
 * src/overlays/ov042/overlay042_base_lifecycle.c. */
.extern genrand_int32
.extern func_020befec

    .global func_ov042_021fcfcc
func_ov042_021fcfcc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x520]
    add r0, r0, #0x8
    str r0, [r4, #0x520]
    cmp r0, #0x40
    ble .L_021fd068
    ldr r1, [r4, #0x520]
    mov r0, #0x0
    sub r1, r1, #0x40
    str r1, [r4, #0x520]
    ldr r1, [r4, #0x524]
    add r3, r1, #0x1
    mov r2, r3, lsr #0x1f
    rsb r1, r2, r3, lsl #0x1e
    add r1, r2, r1, ror #0x1e
    str r1, [r4, #0x524]
    mov r1, #0x12
    sub ip, r1, #0x1
    mov r1, #0x48
.L_021fd01c:
    mla r5, r0, r1, r4
    mov lr, ip
.L_021fd024:
    add r3, r5, lr, lsl #0x2
    ldr r2, [r3, #0x50]
    subs lr, lr, #0x1
    str r2, [r3, #0x8]
    bpl .L_021fd024
    add r0, r0, #0x1
    cmp r0, #0x11
    blt .L_021fd01c
    mov r0, #0x12
    sub r5, r0, #0x1
.L_021fd04c:
    bl genrand_int32
    and r1, r0, #0x1f
    add r0, r4, r5, lsl #0x2
    rsb r1, r1, #0x0
    str r1, [r0, #0x4d0]
    subs r5, r5, #0x1
    bpl .L_021fd04c
.L_021fd068:
    ldr r0, [r4, #0x538]
    ldr r2, [r4, #0x52c]
    ldr r1, [r4, #0x528]
    cmp r0, #0x0
    sub r5, r2, r1
    blt .L_021fd0d8
    ldr r0, [r4, #0x530]
    mov r1, #0xa
    bl func_020befec
    ldr r2, [r4, #0x530]
    mov r1, #0x82
    sub r2, r2, r0
    mov r0, r5
    str r2, [r4, #0x530]
    bl func_020befec
    ldr r1, [r4, #0x530]
    add r1, r1, r0
    str r1, [r4, #0x530]
    ldr r0, [r4, #0x528]
    add r1, r0, r1
    str r1, [r4, #0x528]
    cmp r1, #0xa
    bge .L_021fd0f0
    mvn r0, #0x9
    cmp r1, r0
    movgt r0, #0x0
    strgt r0, [r4, #0x528]
    b .L_021fd0f0
.L_021fd0d8:
    ldr r0, [r4, #0x0]
    mvn r1, #0x63
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x98]
    bl func_020befec
    str r0, [r4, #0x528]
.L_021fd0f0:
    ldr r1, [r4, #0x538]
    cmp r1, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r0, .L_021fd154
    mov r2, r1, lsl #0x2
    cmp r0, r1, lsl #0x2
    movlt r2, r0
    ldr r1, [r4, #0x534]
    mov r0, #0x6000
    sub r1, r1, r2
    rsb r0, r0, #0x0
    str r1, [r4, #0x534]
    cmp r1, r0
    bge .L_021fd144
    ldr r1, [r4, #0x538]
    sub r1, r1, #0x1
    cmp r1, #0x1
    str r1, [r4, #0x538]
    moveq r0, r0, asr #0xf
    streq r0, [r4, #0x538]
    ldmia sp!, {r3, r4, r5, pc}
.L_021fd144:
    ldr r0, [r4, #0x538]
    add r0, r0, #0x1
    str r0, [r4, #0x538]
    ldmia sp!, {r3, r4, r5, pc}
.L_021fd154: .word 0x19a
    .size func_ov042_021fcfcc, . - func_ov042_021fcfcc
