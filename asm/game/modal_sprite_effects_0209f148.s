.text
.extern VecFx32Object_Assign
; Matching fallback for the portable implementation in src/game/modal_sprite_effects.c.

.global func_0209f148
func_0209f148:
    ldr ip, .L_0209f154
    add r0, r0, #0x2c
    bx ip
.L_0209f154: .word VecFx32Object_Assign
.size func_0209f148, . - func_0209f148
