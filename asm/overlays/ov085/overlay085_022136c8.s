.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_02005030
.extern func_02005058
.extern func_02031758
.extern func_ov085_02213194

.global func_ov085_022136c8
func_ov085_022136c8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r1
    mov r4, r2
    bl func_02031758
    ldr r0, [r5, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02213734
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl func_02005030
    ldr r1, [sp, #0x8]
    add r0, r5, #0x23c
    sub r1, r1, #0x18000
    str r1, [sp, #0x8]
    ldr ip, [r0, #0x0]
    add r2, sp, #0x0
    ldr ip, [ip, #0xc]
    mov r1, r4
    mov r3, #0x0
    blx ip
    add r0, sp, #0x0
    bl func_02005058
    b .L_02213740
.L_02213734:
    add r0, r5, #0x23c
    mov r1, #0x0
    bl func_ov085_02213194
.L_02213740:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov085_022136c8, . - func_ov085_022136c8
