.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern func_020425d4

.global func_ov082_02214358
func_ov082_02214358:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020425d4
    ldr r0, [r4, #0x1fc]
    cmp r0, #0x0
    ldmleia sp!, {r4, pc}
    add r0, r4, #0x200
    ldrh r1, [r0, #0x98]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    movne r1, #0x168
    strneh r1, [r0, #0x9a]
    ldmia sp!, {r4, pc}
.size func_ov082_02214358, . - func_ov082_02214358
