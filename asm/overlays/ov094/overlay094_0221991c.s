.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_ClearFlag
.extern data_020f4e14
.extern data_020f4e18
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern gDebugFont
.extern gGameWork

.global func_ov094_0221991c
func_ov094_0221991c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl AnimationResourceState_InitEmbedded
    mov r0, #0x0
    mov r2, #0x4000
    ldr r1, .L_022199c0
    str r0, [r4, #0x14]
    ldr r0, .L_022199c4
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    mov r0, r4
    add r3, r2, #0x1
    bl func_02071ee0
    ldr r0, .L_022199c8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, .L_022199cc
    str r0, [r4, #0xc]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, .L_022199d0
    str r0, [r4, #0x10]
    ldr r0, [r1, #0x0]
    ldr r1, .L_022199d4
    bl GameWork_ClearFlag
    ldr r0, .L_022199d0
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_022199d0
    ldr r1, .L_022199d8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_022199d0
    ldr r1, .L_022199dc
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_022199c0: .word 0x4002
.L_022199c4: .word data_020f4e18
.L_022199c8: .word data_020f4e14
.L_022199cc: .word gDebugFont
.L_022199d0: .word gGameWork
.L_022199d4: .word 0x3d3
.L_022199d8: .word 0x3d5
.L_022199dc: .word 0x3d6
.size func_ov094_0221991c, . - func_ov094_0221991c
