.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_heap_delete.c. */
.extern Heap_Free

    .global func_ov041_02201058
func_ov041_02201058: ; 0x02201058
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov041_02201058, . - func_ov041_02201058

