.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_02219bc8
func_ov097_02219bc8:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x108]
    blx r3
    ldmia sp!, {r3, pc}
.size func_ov097_02219bc8, . - func_ov097_02219bc8
