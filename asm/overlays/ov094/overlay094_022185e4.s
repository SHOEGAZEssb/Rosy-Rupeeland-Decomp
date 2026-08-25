.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_ClearFlag
.extern data_020f4e14
.extern data_020f4e18
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02091b6c
.extern func_ov094_02217c34
.extern gDebugFont
.extern gGameWork
.extern genrand_int32

.global func_ov094_022185e4
func_ov094_022185e4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x8
    mov r5, r1
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x1c
    bl func_ov094_02217c34
    mov r0, #0x0
    str r0, [r4, #0x30]
    add r0, r4, #0x34
    bl func_02091b6c
    str r5, [r4, #0x0]
    mov r0, #0x0
    str r0, [r4, #0x4]
    bl genrand_int32
    ldr r3, .L_022186bc
    str r0, [r4, #0x30]
    ldr r1, .L_022186c0
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r4, #0x8
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, .L_022186c4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x14]
    ldr r0, .L_022186c8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x18]
    mov r1, #0x0
    str r1, [r0, #0x18]
    mov r1, #0x100
    str r1, [r0, #0x1c]
    ldr r0, .L_022186cc
    ldr r1, .L_022186d0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_022186cc
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_022186cc
    ldr r1, .L_022186d4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_022186cc
    ldr r1, .L_022186d8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_022186bc: .word 0x2238
.L_022186c0: .word data_020f4e18
.L_022186c4: .word data_020f4e14
.L_022186c8: .word gDebugFont
.L_022186cc: .word gGameWork
.L_022186d0: .word 0x3d3
.L_022186d4: .word 0x3d5
.L_022186d8: .word 0x3d6
.size func_ov094_022185e4, . - func_ov094_022185e4
