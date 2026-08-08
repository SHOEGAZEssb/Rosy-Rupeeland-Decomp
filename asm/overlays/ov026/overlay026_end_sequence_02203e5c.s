.text

/* Exact fallback; see src/overlays/ov026/overlay026_end_sequence.c. */
.extern data_ov026_022043e4
.extern func_020948d4
.extern func_02094bbc
.extern func_02094cf0
.extern func_02095224
.extern func_02095308
.extern func_020b0300
.extern func_020b0374
.extern func_ov026_022009dc
.extern func_ov026_02203580


    .global func_ov026_02203e5c
func_ov026_02203e5c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0xd0
    ldr r5, L_02203fe8
    add lr, sp, #0x4
    mov r4, r0
    mov ip, #0xc
L_02203e74:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne L_02203e74
    ldmia r5, {r0, r1, r2}
    stmia lr, {r0, r1, r2}
    ldr r0, [r4, #0x79c]
    cmp r0, #0x0
    beq L_02203ea4
    cmp r0, #0x1
    beq L_02203fb4
    b L_02203fd4
L_02203ea4:
    add r0, r4, #0x304
    bl func_02095308
    mov r0, #0x0
    mov ip, #0x80
    mov r1, r0
    mov r2, #0x2
    mov r3, #0x6000
    str ip, [r4, #0x36c]
    bl func_020b0374
    mov r0, #0x0
    ldr r2, L_02203fec
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    add r0, r4, #0x1c0
    bl func_ov026_02203580
    ldr r0, [r4, #0x2e8]
    mov r1, #0x0
    mov r2, #0x8000
    mov r3, #0x10000
    bl func_02094bbc
    mov r1, #0x0
    ldr r0, [r4, #0x2ec]
    mov r2, r1
    mov r3, r1
    bl func_02094bbc
    ldr r0, [r4, #0x160]
    mov r1, #0x800
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r0, [r4, #0x160]
    mov r1, #0x0
    add r0, r0, #0x1c
    bl func_020948d4
    ldr r0, [r4, #0x160]
    add r1, sp, #0x4
    mov r2, #0x0
    bl func_02094cf0
    ldr r2, [r4, #0x158]
    ldr r0, L_02203ff0
    mov r1, #0x0
    str r0, [r2, #0x38]
    str r0, [r2, #0x34]
    ldr r3, [r4, #0x158]
    ldr r2, L_02203ff4
    str r1, [r3, #0x20]
    str r2, [r3, #0x24]
    sub r0, r0, #0x5000
    str r0, [r3, #0x28]
    mov r2, #0x1000
    ldr r0, [r4, #0x17c]
    sub r3, r2, #0x9000
    bl func_02094bbc
    ldr r0, [r4, #0x17c]
    mov r1, #0xc000
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    add r0, r0, #0x3c
    bl func_020948d4
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    str r1, [r0, #0xa0]
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_02203fb4:
    ldr r0, [r4, #0x160]
    bl func_02095224
    cmp r0, #0x0
    beq L_02203fd4
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_02203fe0
L_02203fd4:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_02203fe0:
    add sp, sp, #0xd0
    ldmia sp!, {r3, r4, r5, pc}
L_02203fe8: .word data_ov026_022043e4
L_02203fec: .word 0x7fff
L_02203ff0: .word 0x599a
L_02203ff4: .word 0x5385
.size func_ov026_02203e5c, .-func_ov026_02203e5c

