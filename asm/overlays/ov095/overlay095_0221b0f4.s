.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221b0f4
func_ov095_0221b0f4:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x260]
    mov r4, #0x0
    tst r1, #0x8
    beq .L_0221b134
    tst r1, #0x2
    beq .L_0221b128
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_0221b12c
.L_0221b128:
    mov r0, #0x0
.L_0221b12c:
    cmp r0, #0x0
    movne r4, #0x1
.L_0221b134:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov095_0221b0f4, . - func_ov095_0221b0f4
