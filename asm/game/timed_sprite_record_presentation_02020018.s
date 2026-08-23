; Matching retail form; see src/game/timed_sprite_record_presentation.c.
.text
.extern FieldEffect_DestroyBase

.global func_02020018
    .type func_02020018, @function
func_02020018: ; 0x02020018
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02020018, .-func_02020018
