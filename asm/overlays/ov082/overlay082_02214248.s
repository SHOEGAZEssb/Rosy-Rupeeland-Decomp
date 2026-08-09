.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern func_0204067c

.global func_ov082_02214248
func_ov082_02214248:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204067c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r1, r4, #0x200
    ldrh r2, [r1, #0x98]
    mov r0, #0x1
    bic r2, r2, #0x1
    strh r2, [r1, #0x98]
    ldmia sp!, {r4, pc}
.size func_ov082_02214248, . - func_ov082_02214248
