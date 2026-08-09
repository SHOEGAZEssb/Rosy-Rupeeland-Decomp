.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern Heap_Free

.global func_ov089_022195d4
func_ov089_022195d4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov089_022195d4, . - func_ov089_022195d4
