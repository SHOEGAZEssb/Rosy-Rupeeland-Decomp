; Matching retail form; see src/game/debug_hud_state_lifecycle.c.
.text
.extern func_0200f52c

    .global func_0200f314
func_0200f314: ; 0x0200f314
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0200f52c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0200f314, . - func_0200f314

