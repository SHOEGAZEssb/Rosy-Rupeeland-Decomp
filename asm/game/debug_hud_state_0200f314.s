; Matching retail form; see src/game/debug_hud_state_lifecycle.c.
.text
.extern DebugHudState_Close

    .global DebugHudState_Destroy
DebugHudState_Destroy: ; 0x0200f314
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl DebugHudState_Close
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size DebugHudState_Destroy, . - DebugHudState_Destroy

