.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern Heap_Free

.global func_ov077_02216f14
func_ov077_02216f14:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov077_02216f14, . - func_ov077_02216f14
