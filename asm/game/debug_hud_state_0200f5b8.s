; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern func_02093360
.extern gGameWork
.extern gPadState1
.extern gTouchPanelManager

    .global DebugHudState_PollInput
DebugHudState_PollInput: ; 0x0200f5b8
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x28
    ldr lr, L_0200f670
    add ip, sp, #0x10
    mov r3, #0xb
L_0200f5cc:
    ldrh r2, [lr], #0x2
    subs r3, r3, #0x1
    strh r2, [ip], #0x2
    bne L_0200f5cc
    cmp r1, #0x0
    ldrneh r1, [sp, #0x12]
    orrne r1, r1, #0x3
    strneh r1, [sp, #0x12]
    bne L_0200f630
    ldr r1, L_0200f674
    ldr r1, [r1, #0x0]
    ldr r1, [r1, #0x4]
    cmp r1, #0x1
    bne L_0200f630
    ldr r1, [r0, #0x8]
    ldr r2, [r1, #0x38]
    mov r1, r2, lsl #0x1e
    movs r1, r1, asr #0x1f
    ldrneh r1, [sp, #0x12]
    str r2, [sp, #0x8]
    orrne r1, r1, #0x1
    strneh r1, [sp, #0x12]
    ldreqh r1, [sp, #0x12]
    orreq r1, r1, #0x2
    streqh r1, [sp, #0x12]
L_0200f630:
    ldr r1, L_0200f678
    ldr ip, [r0, #0x8]
    ldr r1, [r1, #0x0]
    mov r2, #0x0
    add r1, r1, #0x100
    ldrsh r3, [r1, #0xd2]
    add r1, sp, #0x10
    str r3, [ip, #0xd0]
    str r2, [ip, #0xd4]
    ldr r0, [r0, #0x8]
    bl func_02093360
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0xc]
    add sp, sp, #0x28
    ldmia sp!, {r3, pc}
L_0200f670: .word gPadState1
L_0200f674: .word gTouchPanelManager
L_0200f678: .word gGameWork
    .size DebugHudState_PollInput, . - DebugHudState_PollInput

