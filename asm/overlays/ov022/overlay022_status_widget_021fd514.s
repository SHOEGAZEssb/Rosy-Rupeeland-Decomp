    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */
    .extern func_02072b68

.global func_ov022_021fd514
func_ov022_021fd514:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x28]
    cmp r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x20]
    mov r1, #0x0
    bl func_02072b68
    ldr r2, [r4, #0x20]
    mov r0, #0x1
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    bic r1, r1, #0x1
    strh r1, [r2, #0x24]
    str r0, [r4, #0x28]
    ldmia sp!, {r4, pc}
.size func_ov022_021fd514, . - func_ov022_021fd514
