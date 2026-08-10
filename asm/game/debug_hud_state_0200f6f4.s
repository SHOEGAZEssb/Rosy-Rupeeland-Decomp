; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern data_0210548c
.extern DebugHudState_UploadRows

    .global DebugHudState_SetTextRow
DebugHudState_SetTextRow: ; 0x0200f6f4
    stmdb sp!, {r3, lr}
    ldr ip, L_0200f738
    mov r3, #0x22
    mla r3, r1, r3, ip
    b L_0200f710
L_0200f708:
    ldrh r1, [r2], #0x2
    strh r1, [r3], #0x2
L_0200f710:
    ldrh r1, [r2, #0x0]
    cmp r1, #0x0
    bne L_0200f708
    mov r1, #0x0
    strh r1, [r3, #0x0]
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    bl DebugHudState_UploadRows
    ldmia sp!, {r3, pc}
L_0200f738: .word data_0210548c
    .size DebugHudState_SetTextRow, . - DebugHudState_SetTextRow

