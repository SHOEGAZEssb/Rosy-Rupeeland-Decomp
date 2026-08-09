.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern func_02074038

.global func_ov066_02210534
func_ov066_02210534:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x20]
    ldr r0, [r1, #0x0]
    bl func_02074038
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov066_02210534, . - func_ov066_02210534
