; Matching retail form; see src/game/game_heap_delete_helper.c.
.text
.extern Heap_Free
.global func_0201b24c
func_0201b24c: ; 0x0201b24c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0201b24c, . - func_0201b24c
