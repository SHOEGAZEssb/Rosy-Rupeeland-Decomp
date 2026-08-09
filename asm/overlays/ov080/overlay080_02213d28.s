.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.

.global func_ov080_02213d28
func_ov080_02213d28:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x260]
    mov r4, #0x0
    tst r1, #0x8
    beq .L_02213d68
    tst r1, #0x2
    beq .L_02213d5c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02213d60
.L_02213d5c:
    mov r0, #0x0
.L_02213d60:
    cmp r0, #0x0
    movne r4, #0x1
.L_02213d68:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov080_02213d28, . - func_ov080_02213d28
