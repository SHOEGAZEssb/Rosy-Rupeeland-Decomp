.text

/* Exact fallback; see src/overlays/ov026/overlay026_end_sequence.c. */
.extern data_ov026_022042b4
.extern func_020948d4
.extern func_02094bbc
.extern func_02094cf0
.extern func_02094d28
.extern func_02095224
.extern func_02095308
.extern func_ov026_021fe8fc
.extern func_ov026_022009dc
.extern func_ov026_02203580


    .global func_ov026_02203cc0
func_ov026_02203cc0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x58
    ldr r5, L_02203e50
    add lr, sp, #0x10
    mov r4, r0
    mov ip, #0x4
L_02203cd8:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne L_02203cd8
    ldmia r5, {r0, r1}
    stmia lr, {r0, r1}
    ldr r0, [r4, #0x79c]
    cmp r0, #0x0
    beq L_02203d08
    cmp r0, #0x1
    beq L_02203dcc
    b L_02203e3c
L_02203d08:
    add r0, r4, #0x304
    bl func_02095308
    add r0, r4, #0x1c0
    bl func_ov026_02203580
    ldr r0, [r4, #0x2e8]
    mov r2, #0x1800
    sub r3, r2, #0x3800
    ldr r5, [r0, #0x20]
    mov r1, #0x0
    bl func_02094bbc
    mov r1, #0x0
    ldr r0, [r4, #0x2ec]
    mov r2, r5
    mov r3, r1
    bl func_02094bbc
    ldr r0, [r4, #0x160]
    add r1, sp, #0x10
    mov r2, #0x0
    bl func_02094cf0
    ldr r1, L_02203e54
    mvn r0, #0xcc
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x16c]
    ldr r1, L_02203e58
    mov r2, #0x10
    mov r3, #0x400
    bl func_ov026_021fe8fc
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    mov r2, #0x5000
    mov r3, #0x8000
    bl func_02094bbc
    ldr r0, [r4, #0x17c]
    mov r1, #0x6000
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
L_02203dcc:
    ldr r0, [r4, #0x160]
    mov r1, #0x1
    mov r2, #0x1800
    mov r3, #0x5800
    bl func_02094d28
    ldr r2, [r4, #0x2e8]
    mov r1, r0
    add r0, r2, #0x1c
    bl func_020948d4
    ldr r0, [r4, #0x2e8]
    ldr r2, [r4, #0x2ec]
    ldr r1, [r0, #0x20]
    add r0, r2, #0x1c
    bl func_020948d4
    ldr r0, [r4, #0x2e8]
    ldr r2, [r4, #0x16c]
    ldr r1, [r0, #0x20]
    add r0, r2, #0x1c
    add r1, r1, #0x800
    bl func_020948d4
    ldr r0, [r4, #0x160]
    bl func_02095224
    cmp r0, #0x0
    beq L_02203e3c
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_02203e48
L_02203e3c:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_02203e48:
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, pc}
L_02203e50: .word data_ov026_022042b4
L_02203e54: .word 0x666
L_02203e58: .word 0x2108
.size func_ov026_02203cc0, .-func_ov026_02203cc0

