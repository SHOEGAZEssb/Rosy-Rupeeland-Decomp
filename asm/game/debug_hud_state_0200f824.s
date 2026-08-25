; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern __register_global_object
.extern gDebugHudStateInitializationFlags
.extern gDebugHudStateDestructorRecord
.extern gDebugHudState
.extern DebugHudState_Init
.extern DebugHudState_Destroy

    .global DebugHudState_GetGlobal
DebugHudState_GetGlobal: ; 0x0200f824
    stmdb sp!, {r3, lr}
    ldr r0, L_0200f868
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    bne L_0200f860
    ldr r0, L_0200f86c
    bl DebugHudState_Init
    ldr r0, L_0200f86c
    ldr r1, L_0200f870
    ldr r2, L_0200f874
    bl __register_global_object
    ldr r0, L_0200f868
    ldr r1, [r0, #0x0]
    orr r1, r1, #0x1
    str r1, [r0, #0x0]
L_0200f860:
    ldr r0, L_0200f86c
    ldmia sp!, {r3, pc}
L_0200f868: .word gDebugHudStateInitializationFlags
L_0200f86c: .word gDebugHudState
L_0200f870: .word DebugHudState_Destroy
L_0200f874: .word gDebugHudStateDestructorRecord
    .size DebugHudState_GetGlobal, . - DebugHudState_GetGlobal
