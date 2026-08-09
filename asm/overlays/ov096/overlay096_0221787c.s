.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern Heap_Free
.extern func_0203e494

.global func_ov096_0221787c
func_ov096_0221787c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov096_0221787c, . - func_ov096_0221787c
