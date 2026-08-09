.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern func_0209a2ac

.global func_ov069_022124c4
func_ov069_022124c4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r5, #0x48]
    mov r1, r4
    mov r2, #0x1
    bl func_0209a2ac
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov069_022124c4, . - func_ov069_022124c4
