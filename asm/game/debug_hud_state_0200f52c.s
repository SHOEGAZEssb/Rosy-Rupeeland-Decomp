; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern data_020f4e18
.extern data_0210548c
.extern DebugHudState_ResetSelectedFont
.extern func_02071d4c

    .global DebugHudState_Close
DebugHudState_Close: ; 0x0200f52c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x20]
    cmp r1, #0x0
    beq L_0200f544
    bl DebugHudState_ResetSelectedFont
L_0200f544:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0200f568
    beq L_0200f560
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200f560:
    mov r0, #0x0
    str r0, [r4, #0x8]
L_0200f568:
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_0200f588
    ldr r0, L_0200f5b0
    ldr r0, [r0, #0x0]
    bl func_02071d4c
    mov r0, #0x0
    str r0, [r4, #0x4]
L_0200f588:
    mov ip, #0x0
    ldr r1, L_0200f5b4
    mov r3, ip
    mov r0, #0x22
L_0200f598:
    mul r2, ip, r0
    add ip, ip, #0x1
    strh r3, [r1, r2]
    cmp ip, #0x8
    blt L_0200f598
    ldmia sp!, {r4, pc}
L_0200f5b0: .word data_020f4e18
L_0200f5b4: .word data_0210548c
    .size DebugHudState_Close, . - DebugHudState_Close

