; Matching retail form; see src/game/debug_hud_state_lifecycle.c.
.text
.extern gGameWork
.extern gSystemState

    .global func_0200f38c
func_0200f38c: ; 0x0200f38c
    ldr r1, L_0200f3fc
    ldrb r1, [r1, #0x5f]
    cmp r1, #0x0
    bne L_0200f3b8
    ldr r1, L_0200f400
    mov r2, #0xe0
    ldr r1, [r1, #0x0]
    add r1, r1, #0x200
    ldrsh r1, [r1, #0xc]
    add r1, r1, #0x20
    b L_0200f3d0
L_0200f3b8:
    ldr r1, L_0200f400
    mov r2, #0xf0
    ldr r1, [r1, #0x0]
    add r1, r1, #0x200
    ldrsh r1, [r1, #0xc]
    add r1, r1, #0x10
L_0200f3d0:
    str r1, [r0, #0x0]
    ldr r1, L_0200f400
    str r2, [r0, #0x8]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x200
    ldrsh r1, [r1, #0xe]
    add r1, r1, #0x83
    str r1, [r0, #0x4]
    add r1, r1, #0x2d
    str r1, [r0, #0xc]
    bx lr
L_0200f3fc: .word gSystemState
L_0200f400: .word gGameWork
    .size func_0200f38c, . - func_0200f38c

