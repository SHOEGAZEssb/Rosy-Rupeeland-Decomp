; Matching retail form; see src/game/debug_hud_state_lifecycle.c.
.text
.extern data_020f4e14
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern gDebugFont

    .global DebugHudState_ResetSelectedFont
DebugHudState_ResetSelectedFont: ; 0x0200f328
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne L_0200f348
    ldr r0, L_0200f358
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldmia sp!, {r3, pc}
L_0200f348:
    ldr r0, L_0200f35c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldmia sp!, {r3, pc}
L_0200f358: .word data_020f4e14
L_0200f35c: .word gDebugFont
    .size DebugHudState_ResetSelectedFont, . - DebugHudState_ResetSelectedFont

