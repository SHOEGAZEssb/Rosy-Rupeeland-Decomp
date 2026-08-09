.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern func_02005058
.extern func_ov081_022135a4

.global func_ov081_02213be8
func_ov081_02213be8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r1, [r4, #0xd0]
    orr r1, r1, #0x2
    str r1, [r4, #0xd0]
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    bne .L_02213c14
    bl func_ov081_022135a4
    b .L_02213c44
.L_02213c14:
    ldr r3, [r1, #0x0]
    add r0, sp, #0x0
    ldr r3, [r3, #0xb4]
    mov r2, r4
    blx r3
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    add r0, sp, #0x0
    bl func_02005058
.L_02213c44:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size func_ov081_02213be8, . - func_ov081_02213be8
