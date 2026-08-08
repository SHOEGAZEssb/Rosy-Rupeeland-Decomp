.text

/* Exact fallback; see src/overlays/ov026/overlay026_effect_runtime.c. */
.extern func_ov026_021fd900
.extern func_ov026_021fd964
.extern func_ov026_021fdd28
.extern func_ov026_021fe284
.extern func_ov026_021fe56c


    .global func_ov026_021ff51c
func_ov026_021ff51c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x12c]
    tst r0, #0x400
    bne L_021ff664
    ldr ip, L_021ff66c
    mov r4, #0x0
    str r4, [ip, #0x0]
    ldr r3, [r5, #0x30]
    ldr r2, [r5, #0x20]
    ldr r1, [r5, #0x10]
    mov r0, #0x1000
    str r1, [ip, #0x2c]
    str r2, [ip, #0x2c]
    str r3, [ip, #0x2c]
    ldr r1, [r5, #0x70]
    str r1, [ip, #0x28]
    str r0, [ip, #0x28]
    str r1, [ip, #0x28]
    b L_021ff580
L_021ff570:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0xa0]
    bl func_ov026_021fdd28
    add r4, r4, #0x1
L_021ff580:
    ldr r0, [r5, #0x9c]
    cmp r4, r0
    blt L_021ff570
    ldr r0, [r5, #0xe0]
    bl func_ov026_021fe284
    ldr r0, [r5, #0xe4]
    bl func_ov026_021fe56c
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov026_021fd900
    ldr r0, [r5, #0x12c]
    tst r0, #0x80
    beq L_021ff610
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x2
    mov r3, #0x18
    str r0, [sp, #0x4]
    bl func_ov026_021fd964
    mov r4, #0x0
L_021ff5f0:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0xec]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    add r4, r4, #0x1
    cmp r4, #0x4
    blt L_021ff5f0
L_021ff610:
    ldr r0, [r5, #0x12c]
    tst r0, #0x8000
    bne L_021ff658
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    str r0, [sp, #0x4]
    mov r2, #0x3
    mov r3, #0x16
    bl func_ov026_021fd964
    ldr r1, [r5, #0x120]
    ldr r0, [r5, #0xe8]
    str r1, [r0, #0xa0]
    ldr r0, [r5, #0xe8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
L_021ff658:
    ldr r0, L_021ff670
    mov r1, #0x1
    str r1, [r0, #0x0]
L_021ff664:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
L_021ff66c: .word 0x4000444
L_021ff670: .word 0x4000448
.size func_ov026_021ff51c, .-func_ov026_021ff51c

