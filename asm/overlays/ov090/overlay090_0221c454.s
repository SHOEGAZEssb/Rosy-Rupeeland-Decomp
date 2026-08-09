.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern Heap_Free

.global func_ov090_0221c454
func_ov090_0221c454:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov090_0221c454, . - func_ov090_0221c454
