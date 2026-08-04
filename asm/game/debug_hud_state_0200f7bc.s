; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern func_0200f38c
.extern func_0200f788

    .global func_0200f7bc
func_0200f7bc: ; 0x0200f7bc
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    bl func_0200f38c
    add r1, sp, #0x0
    mov r0, r4
    bl func_0200f788
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size func_0200f7bc, . - func_0200f7bc

