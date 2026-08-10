; Matching retail form; see src/game/game_phase_state_configuration.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_ClearPointerBank
.extern GameWork_SetFlag
.extern OverlaySlot_LoadOverlay
.extern func_0200e480
.extern func_0200f0b4
.extern func_0202751c
.extern func_020275b0
.extern func_02027f2c
.extern func_02027f94
.extern func_020598a0
.extern gGameWork
.extern gLupyContext
.extern gSoundContext

    .global func_0200e780
func_0200e780: ; 0x0200e780
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldr r1, [r4, #0x0]
    ldr r2, L_0200e9a8
    mov r5, r0
    mov r1, r1, lsl #0x10
    ldr r0, [r2, #0x0]
    mov r1, r1, lsr #0x10
    bl func_020598a0
    mov r0, r5
    mov r1, r4
    bl func_0200f0b4
    add r0, r5, #0x2a4
    ldr r1, [r4, #0x1c]
    add r0, r0, #0x2c00
    bl OverlaySlot_LoadOverlay
    ldr r0, L_0200e9ac
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearPointerBank
    ldr r2, L_0200e9ac
    mov r3, #0x0
    ldr r0, [r2, #0x0]
    mov r1, #0x3ec
    add r0, r0, #0x200
    strh r3, [r0, #0x28]
    ldr r0, [r2, #0x0]
    bl GameWork_SetFlag
    mov r3, #0x0
    ldr r2, L_0200e9ac
    mov r1, #0x400
    ldr r0, [r2, #0x0]
    add r0, r0, #0x200
    strh r3, [r0, #0xc]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x200
    strh r3, [r0, #0xe]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x200
    ldrsh r3, [r0, #0x48]
    strh r3, [r0, #0x46]
    ldr r3, [r4, #0x0]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x200
    strh r3, [r0, #0x48]
    ldr r0, [r2, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9b0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9b4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9b8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9bc
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9c0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov ip, #0x10
    ldr r2, L_0200e9ac
    mov r3, #0x0
    ldr r0, [r2, #0x0]
    ldr r1, L_0200e9c4
    add r0, r0, #0x100
    strh ip, [r0, #0x9e]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x200
    strh r3, [r0, #0x18]
    ldr r0, [r2, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9c8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    mov r1, #0x11
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    mov r1, #0x12
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    mov r1, #0x3f4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9cc
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    mov r1, #0x39c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    mov r1, #0x16
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9d0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9d4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e9ac
    ldr r1, L_0200e9d8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    bl func_02027f94
    bl func_02027f2c
    bl func_0200e480
    ldr r0, [r4, #0x40]
    mov r0, r0, lsl #0x6
    mov r4, r0, asr #0x1f
    bl func_02027f94
    str r4, [r0, #0x8]
    ldr r0, L_0200e9dc
    mov r1, #0xb4
    ldr r2, [r0, #0x0]
    mov r0, #0x3
    strh r1, [r2, #0xcc]
    strh r0, [r2, #0xce]
    bl func_020275b0
    add r1, r5, #0x2000
    ldr r1, [r1, #0xeb0]
    bl func_0202751c
    ldmia sp!, {r3, r4, r5, pc}
L_0200e9a8: .word gSoundContext
L_0200e9ac: .word gGameWork
L_0200e9b0: .word 0x3ee
L_0200e9b4: .word 0x3fd
L_0200e9b8: .word 0x403
L_0200e9bc: .word 0x404
L_0200e9c0: .word 0x402
L_0200e9c4: .word 0x40a
L_0200e9c8: .word 0x35a
L_0200e9cc: .word 0x395
L_0200e9d0: .word 0x417
L_0200e9d4: .word 0x438
L_0200e9d8: .word 0x419
L_0200e9dc: .word gLupyContext
    .size func_0200e780, . - func_0200e780

