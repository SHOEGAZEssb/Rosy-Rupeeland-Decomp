.text

/* Exact fallback; see src/overlays/ov026/overlay026_end_sequence.c. */
.extern data_ov026_0220416c
.extern func_020948d4
.extern func_020948e4
.extern func_02094bbc
.extern func_02094cf0
.extern func_02094d28
.extern func_02095224
.extern func_02095308
.extern func_ov026_021fe8fc
.extern func_ov026_022009dc
.extern func_ov026_02203168
.extern func_ov026_02203178


    .global func_ov026_02202f4c
func_ov026_02202f4c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    ldr r5, L_02203144
    add lr, sp, #0x10
    mov r4, r0
    mov ip, #0x4
L_02202f64:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne L_02202f64
    ldr r0, [r4, #0x79c]
    cmp r0, #0x0
    beq L_02202f8c
    cmp r0, #0x1
    beq L_022030d0
    b L_02203130
L_02202f8c:
    add r0, r4, #0x304
    bl func_02095308
    ldr r1, L_02203148
    add r0, r4, #0x1c0
    add r2, r1, #0xb50
    mov r3, #0x0
    bl func_ov026_02203168
    ldr r0, [r4, #0x2e8]
    ldr r3, L_0220314c
    mvn r1, #0x384
    mov r2, #0x0
    bl func_02094bbc
    ldr r0, [r4, #0x2ec]
    ldr r2, L_02203150
    mvn r1, #0x384
    mov r3, #0x0
    bl func_02094bbc
    ldr r0, [r4, #0x160]
    add r1, sp, #0x10
    mov r2, #0x0
    bl func_02094cf0
    ldr r5, [r4, #0x164]
    mov r1, #0x1800
    add r0, r5, #0x1c
    bl func_020948d4
    add r0, r5, #0x6c
    mov r1, #0x4000
    bl func_020948d4
    mov r0, #0x10000
    str r0, [r5, #0xb8]
    ldr r1, L_02203154
    ldr r2, L_02203158
    mov r0, #0x800
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    rsb r0, r1, #0x800
    str r2, [sp, #0x8]
    str r0, [sp, #0xc]
    add r3, r2, #0x52
    ldr r1, L_0220315c
    ldr r0, [r4, #0x16c]
    mov r2, #0x18
    bl func_ov026_021fe8fc
    ldr r5, [r4, #0x168]
    mov r1, #0x1800
    add r0, r5, #0x1c
    bl func_020948d4
    add r0, r5, #0x6c
    mov r1, #0x4000
    bl func_020948d4
    mov r0, #0x6000
    str r0, [r5, #0xb4]
    ldr r0, [r4, #0x17c]
    ldr r1, L_02203160
    ldr r3, L_02203164
    mov r2, #0x20000
    bl func_02094bbc
    ldr r0, [r4, #0x17c]
    mov r1, #0x10000
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r0, [r4, #0x17c]
    mov r1, #0x4000
    add r0, r0, #0x3c
    bl func_020948d4
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    str r1, [r0, #0xa0]
    ldr r0, [r4, #0x17c]
    mov r1, #0x1
    add r0, r0, #0xc
    mov r2, #0x2000
    bl func_020948e4
    ldr r1, [r4, #0x17c]
    mov r0, #0xb4
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_022030d0:
    ldr r0, [r4, #0x160]
    mov r1, #0x1
    mov r2, #0x1000
    mov r3, #0x0
    bl func_02094d28
    mov r2, r0
    mov r1, #0x0
    ldr r0, [r4, #0x74]
    mov r3, r1
    bl func_ov026_02203178
    ldr r2, [r4, #0x160]
    mov r1, #0x0
    ldr r0, [r4, #0x16c]
    ldr r2, [r2, #0x20]
    mov r3, r1
    bl func_02094bbc
    ldr r0, [r4, #0x160]
    bl func_02095224
    cmp r0, #0x0
    beq L_02203130
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_0220313c
L_02203130:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_0220313c:
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
L_02203144: .word data_ov026_0220416c
L_02203148: .word 0x424
L_0220314c: .word 0xffffec52
L_02203150: .word 0x1bd7
L_02203154: .word 0x99a
L_02203158: .word 0x333
L_0220315c: .word 0x2108
L_02203160: .word 0x43d7
L_02203164: .word 0x118f6
.size func_ov026_02202f4c, .-func_ov026_02202f4c

