.text
; Matching fallback for the portable implementation in src/game/modal_sprite_effects.c.
.extern func_02099fb0

.global func_0209f088
func_0209f088:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0209f088, . - func_0209f088
