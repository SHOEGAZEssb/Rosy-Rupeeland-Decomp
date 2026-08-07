.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_machines.c. */
.extern Heap_Free


    .global func_ov022_02200478
func_ov022_02200478:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov022_02200478, .-func_ov022_02200478

