.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern Heap_Free

.global func_ov069_0221182c
func_ov069_0221182c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov069_0221182c, . - func_ov069_0221182c
