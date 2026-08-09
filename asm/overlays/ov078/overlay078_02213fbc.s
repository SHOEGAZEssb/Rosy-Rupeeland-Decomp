.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02213fbc
func_ov078_02213fbc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x260]
    mov r1, #0x2
    bic r2, r2, #0xb
    str r2, [r4, #0x260]
    strb r1, [r4, #0x24c]
    mov r1, #0x19
    strh r1, [r4, #0xd6]
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x98]
    add r2, r2, #0x1
    strh r2, [r1, #0x98]
    ldrsh r2, [r1, #0x98]
    cmp r2, #0x3c
    ble .L_02214010
    mov r2, #0x0
    strh r2, [r1, #0x9c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
.L_02214010:
    mov r0, #0x0
    str r0, [r4, #0x40]
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
.size func_ov078_02213fbc, . - func_ov078_02213fbc
