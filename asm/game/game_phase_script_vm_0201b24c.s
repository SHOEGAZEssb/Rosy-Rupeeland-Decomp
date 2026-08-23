; Matching retail form; see src/game/game_heap_delete_helper.c.
.text
.extern Heap_Free
.global CPoint2DS16_DestroyAndFree
CPoint2DS16_DestroyAndFree: ; 0x0201b24c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size CPoint2DS16_DestroyAndFree, . - CPoint2DS16_DestroyAndFree
