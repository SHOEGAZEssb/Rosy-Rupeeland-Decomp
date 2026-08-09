.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_02213100
func_ov082_02213100:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x260]
    mov r4, #0x0
    tst r1, #0x8
    beq .L_02213140
    tst r1, #0x2
    beq .L_02213134
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02213138
.L_02213134:
    mov r0, #0x0
.L_02213138:
    cmp r0, #0x0
    movne r4, #0x1
.L_02213140:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov082_02213100, . - func_ov082_02213100
