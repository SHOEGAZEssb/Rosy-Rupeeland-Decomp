; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern DebugHud_GetCurrentRectangle
.extern DebugHudState_SetRectangle

    .global DebugHudState_RefreshRectangle
DebugHudState_RefreshRectangle: ; 0x0200f7bc
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    bl DebugHud_GetCurrentRectangle
    add r1, sp, #0x0
    mov r0, r4
    bl DebugHudState_SetRectangle
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size DebugHudState_RefreshRectangle, . - DebugHudState_RefreshRectangle

