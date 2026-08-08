.text

/* Exact fallback; see src/overlays/ov026/overlay026_lifecycle_tail.c. */
.extern func_ov026_021fce50
.extern Heap_Free


    .global func_ov026_02203ffc
func_ov026_02203ffc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov026_021fce50
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov026_02203ffc, .-func_ov026_02203ffc

