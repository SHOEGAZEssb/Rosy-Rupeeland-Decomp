.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_handles.c for documented portable C. */

    .extern func_ov036_021fcf30
    .extern Heap_Free

    .global func_ov036_0220029c
func_ov036_0220029c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov036_021fcf30
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov036_0220029c, .-func_ov036_0220029c

