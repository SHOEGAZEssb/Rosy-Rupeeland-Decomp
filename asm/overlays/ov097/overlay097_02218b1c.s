.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_ov097_02218b40
.extern func_ov097_02218d3c

.global func_ov097_02218b1c
func_ov097_02218b1c:
    stmdb sp!, {r3, lr}
    ldrb r2, [r0, #0x2bc]
    cmp r2, #0x0
    bne .L_02218b34
    bl func_ov097_02218d3c
    ldmia sp!, {r3, pc}
.L_02218b34:
    bl func_ov097_02218b40
    ldmia sp!, {r3, pc}
.size func_ov097_02218b1c, . - func_ov097_02218b1c
