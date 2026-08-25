.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern Heap_Free
.extern TemporaryObject_NoOpDestructor

.global func_ov059_0221058c
func_ov059_0221058c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TemporaryObject_NoOpDestructor
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov059_0221058c, . - func_ov059_0221058c
