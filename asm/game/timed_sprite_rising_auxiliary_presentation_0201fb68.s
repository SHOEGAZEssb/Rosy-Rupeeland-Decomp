; Matching retail form; see src/game/timed_sprite_rising_auxiliary_presentation.c.
.text
.extern Heap_Free
.extern data_020d6180
.extern data_021052fc
.extern DisplayController_GetSubScreenVerticalOffset
.extern func_02005030
.extern func_02005058
.extern func_02009d78
.extern func_0201f724
.extern func_0201fa44

.global func_0201fb68
    .type func_0201fb68, @function
func_0201fb68: ; 0x0201fb68
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201fa44
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201fb68, .-func_0201fb68

