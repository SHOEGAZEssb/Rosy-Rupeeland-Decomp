.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_020f4e14
.extern data_020f4e18
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_ov094_02217c34
.extern gDebugFont
.extern gGameWork
.extern genrand_int32

.global func_ov094_02217c74
func_ov094_02217c74:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x14
    bl func_ov094_02217c34
    mov r0, #0x0
    str r0, [r4, #0x28]
    bl genrand_int32
    str r0, [r4, #0x28]
    ldr r1, .L_02217d0c
    ldr r3, .L_02217d10
    ldr r1, [r1, #0x0]
    mov ip, #0xa
    add r1, r1, #0x200
    strh ip, [r1, #0x2]
    ldr r2, .L_02217d14
    str r3, [sp, #0x0]
    ldr r1, [r2, #0x0]
    sub r2, r3, #0x2
    mov r0, r4
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, .L_02217d18
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x18]
    sub r1, r1, #0xc0
    str r1, [r0, #0x1c]
    ldr r0, .L_02217d1c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x10]
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02217d0c: .word gGameWork
.L_02217d10: .word 0x400b
.L_02217d14: .word data_020f4e18
.L_02217d18: .word data_020f4e14
.L_02217d1c: .word gDebugFont
.size func_ov094_02217c74, . - func_ov094_02217c74
