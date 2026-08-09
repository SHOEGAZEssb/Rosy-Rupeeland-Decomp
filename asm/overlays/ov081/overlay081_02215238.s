.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern Heap_Free

.global func_ov081_02215238
func_ov081_02215238:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov081_02215238, . - func_ov081_02215238
