.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_02219be8
func_ov097_02219be8:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x260]
    mov r4, #0x0
    tst r1, #0x8
    beq .L_02219c28
    tst r1, #0x2
    beq .L_02219c1c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02219c20
.L_02219c1c:
    mov r0, #0x0
.L_02219c20:
    cmp r0, #0x0
    movne r4, #0x1
.L_02219c28:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov097_02219be8, . - func_ov097_02219be8
