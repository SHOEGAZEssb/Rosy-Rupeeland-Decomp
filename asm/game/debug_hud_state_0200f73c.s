; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern OS_Halt
.extern data_020d5554

    .global func_0200f73c
func_0200f73c: ; 0x0200f73c
    stmdb sp!, {r4, lr}
    cmp r1, #0x0
    mov r4, #0x0
    beq L_0200f758
    cmp r1, #0x1
    beq L_0200f768
    b L_0200f778
L_0200f758:
    ldr r0, L_0200f784
    ldr r0, [r0, #0x0]
    ldr r4, [r0, r2, lsl #0x2]
    b L_0200f77c
L_0200f768:
    ldr r0, L_0200f784
    ldr r0, [r0, #0x4]
    ldr r4, [r0, r2, lsl #0x2]
    b L_0200f77c
L_0200f778:
    bl OS_Halt
L_0200f77c:
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200f784: .word data_020d5554
    .size func_0200f73c, . - func_0200f73c

