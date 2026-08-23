; Matching retail form; see src/game/main_window_mask_presentation.c.
.text
.extern Heap_Free
.extern FieldEffect_DestroyBase

    .global func_020287b8
    .type func_020287b8, @function
func_020287b8: ; 0x020287b8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_020287b8, . - func_020287b8

