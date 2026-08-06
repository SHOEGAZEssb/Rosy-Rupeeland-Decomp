; Matching retail form; see src/game/actor_virtual_default_helpers.c.
.text
.extern Heap_Free

    .global func_02034e08
    .type func_02034e08, @function
func_02034e08: ; 0x02034e08
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02034e08, . - func_02034e08

    .global func_02034e1c

