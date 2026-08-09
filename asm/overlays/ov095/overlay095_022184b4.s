.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_ov095_02218450
.extern func_ov095_02218534

.global func_ov095_022184b4
func_ov095_022184b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x260]
    ldr r1, .L_0221852c
    orr r2, r2, #0x21
    orr r2, r2, #0x1000
    and r1, r2, r1
    str r1, [r4, #0x260]
    mov r1, #0x3
    strb r1, [r4, #0x24c]
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x98]
    add r2, r2, #0x1
    strh r2, [r1, #0x98]
    ldrsh r1, [r1, #0x98]
    cmp r1, #0x5a
    bge .L_0221851c
    ldr r2, [r0, #0x0]
    ldr r1, [r4, #0x228]
    ldr r2, [r2, #0xd0]
    add r1, r1, #0x18
    blx r2
    ldr r1, .L_02218530
    add r0, r4, #0x38
    bl func_ov095_02218534
    b .L_02218520
.L_0221851c:
    bl func_ov095_02218450
.L_02218520:
    mov r0, #0x1a
    strh r0, [r4, #0xd6]
    ldmia sp!, {r4, pc}
.L_0221852c: .word 0xfffffbf5
.L_02218530: .word 0xe66
.size func_ov095_022184b4, . - func_ov095_022184b4
