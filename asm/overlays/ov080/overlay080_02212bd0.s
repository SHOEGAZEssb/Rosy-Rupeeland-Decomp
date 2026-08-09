.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern Heap_Free
.extern func_0203e494

.global func_ov080_02212bd0
func_ov080_02212bd0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov080_02212bd0, . - func_ov080_02212bd0
