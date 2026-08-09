.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.

.global func_ov079_022139d4
func_ov079_022139d4:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x260]
    mov r4, #0x0
    tst r1, #0x8
    beq .L_02213a14
    tst r1, #0x2
    beq .L_02213a08
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02213a0c
.L_02213a08:
    mov r0, #0x0
.L_02213a0c:
    cmp r0, #0x0
    movne r4, #0x1
.L_02213a14:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov079_022139d4, . - func_ov079_022139d4
