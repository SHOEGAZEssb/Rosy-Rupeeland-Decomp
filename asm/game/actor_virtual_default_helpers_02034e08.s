; Matching retail form; see src/game/actor_virtual_default_helpers.c.
.text
.extern Heap_Free

    .global S8BoundsCenter_DestroyAndFree
    .type S8BoundsCenter_DestroyAndFree, @function
S8BoundsCenter_DestroyAndFree: ; 0x02034e08
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size S8BoundsCenter_DestroyAndFree, . - S8BoundsCenter_DestroyAndFree

    .global Actor_BuildContactPosition
