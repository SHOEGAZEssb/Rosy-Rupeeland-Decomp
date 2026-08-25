; Matching retail form; see src/game/sprite_number_list_delete.c.
.text
.extern Heap_Free
.extern data_020d660c
.extern SpriteNodeList_Clear
.global SpriteNodeList_DestroyAndFree
    .type SpriteNodeList_DestroyAndFree, @function
SpriteNodeList_DestroyAndFree:
    stmdb sp!, {r4, lr}
    ldr r1, .L_020233c4
    mov r4, r0
    str r1, [r4, #0x0]
    bl SpriteNodeList_Clear
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020233c4: .word data_020d660c
    .size SpriteNodeList_DestroyAndFree, .-SpriteNodeList_DestroyAndFree
