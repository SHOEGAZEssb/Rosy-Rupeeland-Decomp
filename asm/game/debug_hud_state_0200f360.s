; Matching retail form; see src/game/debug_hud_state_lifecycle.c.
.text
.extern func_020befec

    .global DebugHud_CountDecimalDigits
DebugHud_CountDecimalDigits: ; 0x0200f360
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, #0x1
    mov r4, #0xa
L_0200f36c:
    mov r0, r1
    mov r1, r4
    bl func_020befec
    movs r1, r0
    addne r5, r5, #0x1
    bne L_0200f36c
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
    .size DebugHud_CountDecimalDigits, . - DebugHud_CountDecimalDigits

