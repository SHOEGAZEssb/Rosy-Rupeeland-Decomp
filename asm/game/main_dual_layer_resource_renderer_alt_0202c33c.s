; Matching retail form; see src/game/main_dual_layer_resource_renderer_alt.c.
.text
.extern func_020292f0
.extern Heap_Free

    .global func_0202c33c
    .type func_0202c33c, @function
func_0202c33c: ; 0x0202c33c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020292f0
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202c33c, . - func_0202c33c
