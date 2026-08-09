.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_0221820c
func_ov096_0221820c:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x260]
    mov r4, #0x0
    tst r1, #0x8
    beq .L_0221824c
    tst r1, #0x2
    beq .L_02218240
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02218244
.L_02218240:
    mov r0, #0x0
.L_02218244:
    cmp r0, #0x0
    movne r4, #0x1
.L_0221824c:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov096_0221820c, . - func_ov096_0221820c
