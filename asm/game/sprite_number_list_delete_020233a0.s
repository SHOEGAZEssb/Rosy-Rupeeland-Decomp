; Matching retail form; see src/game/sprite_number_list_delete.c.
.text
.extern Heap_Free
.extern data_020d660c
.extern SpriteNodeList_Clear
.global func_020233a0
    .type func_020233a0, @function
func_020233a0:
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
    .size func_020233a0, .-func_020233a0
