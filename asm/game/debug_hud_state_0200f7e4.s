; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern data_0210548c
.extern func_02092f88

    .global DebugHudState_UploadRows
DebugHudState_UploadRows: ; 0x0200f7e4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r5, L_0200f820
    mov r7, r0
    mov r6, #0x0
    mov r4, #0x22
L_0200f7f8:
    mul r0, r6, r4
    adds r2, r5, r0
    beq L_0200f810
    ldr r0, [r7, #0x8]
    mov r1, r6
    bl func_02092f88
L_0200f810:
    add r6, r6, #0x1
    cmp r6, #0x8
    blt L_0200f7f8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0200f820: .word data_0210548c
    .size DebugHudState_UploadRows, . - DebugHudState_UploadRows

