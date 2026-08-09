.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern Heap_Free

.global func_ov066_02210444
func_ov066_02210444:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov066_02210444, . - func_ov066_02210444
