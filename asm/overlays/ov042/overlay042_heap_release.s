.text

/* Exact fallback for func_ov042_021fd658; see the documented portable C in
 * src/overlays/ov042/overlay042_scene_base.c. */
.extern Heap_Free

    .global func_ov042_021fd658
func_ov042_021fd658:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov042_021fd658, . - func_ov042_021fd658
