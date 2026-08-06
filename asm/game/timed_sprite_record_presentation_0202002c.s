; Matching retail form; see src/game/timed_sprite_record_presentation.c.
.text
.extern Heap_Free
.extern func_0201e28c

.global func_0202002c
    .type func_0202002c, @function
func_0202002c: ; 0x0202002c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202002c, .-func_0202002c
