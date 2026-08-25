; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern gDebugHudTextRows
.extern DebugHud_CountDecimalDigits
.extern DebugHudState_UploadRows
.extern GraphicsSpriteText_FormatDecimal

    .global DebugHudState_SetNumberRow
DebugHudState_SetNumberRow: ; 0x0200f67c
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r5, r1
    mov r1, r4
    mov r6, r0
    bl DebugHud_CountDecimalDigits
    mov r3, #0x1
    mov ip, #0x0
    sub r2, r0, #0x1
    mov r1, #0xa
    b L_0200f6b4
L_0200f6a8:
    mul r0, r3, r1
    mov r3, r0
    add ip, ip, #0x1
L_0200f6b4:
    cmp ip, r2
    blt L_0200f6a8
    ldr r1, L_0200f6f0
    mov r0, #0x22
    mla r0, r5, r0, r1
    rsb r2, r3, #0x0
    mov r1, r4
    mov r3, #0x0
    bl GraphicsSpriteText_FormatDecimal
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl DebugHudState_UploadRows
    ldmia sp!, {r4, r5, r6, pc}
L_0200f6f0: .word gDebugHudTextRows
    .size DebugHudState_SetNumberRow, . - DebugHudState_SetNumberRow
