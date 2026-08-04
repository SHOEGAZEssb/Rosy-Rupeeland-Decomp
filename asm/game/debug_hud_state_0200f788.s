; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text


    .global func_0200f788
func_0200f788: ; 0x0200f788
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x10]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x14]
    ldr r3, [r1, #0x8]
    ldr r2, [r1, #0x0]
    sub r2, r3, r2
    str r2, [r0, #0x18]
    ldr r2, [r1, #0xc]
    ldr r1, [r1, #0x4]
    sub r1, r2, r1
    str r1, [r0, #0x1c]
    bx lr
    .size func_0200f788, . - func_0200f788

