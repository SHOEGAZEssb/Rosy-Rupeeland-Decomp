.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_ClearFlag
.extern data_020f4e14
.extern data_020f4e18
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02091b6c
.extern func_ov094_02217c34
.extern gDebugFont
.extern gGameWork
.extern genrand_int32

.global func_ov094_02218f14
func_ov094_02218f14:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    add r0, r4, #0x4
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x18
    bl func_ov094_02217c34
    mov r1, #0x0
    add r0, r4, #0x30
    str r1, [r4, #0x2c]
    bl func_02091b6c
    mov r0, #0x0
    str r0, [r4, #0x0]
    bl genrand_int32
    ldr r3, .L_02218fec
    str r0, [r4, #0x2c]
    ldr r1, .L_02218ff0
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r4, #0x4
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, .L_02218ff4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x10]
    ldr r0, .L_02218ff8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x14]
    mov r1, #0x0
    str r1, [r0, #0x18]
    mov r1, #0x100
    str r1, [r0, #0x1c]
    ldr r0, .L_02218ffc
    ldr r1, .L_02219000
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02218ffc
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02218ffc
    ldr r1, .L_02219004
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02218ffc
    ldr r1, .L_02219008
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02218fec: .word 0x2238
.L_02218ff0: .word data_020f4e18
.L_02218ff4: .word data_020f4e14
.L_02218ff8: .word gDebugFont
.L_02218ffc: .word gGameWork
.L_02219000: .word 0x3d3
.L_02219004: .word 0x3d5
.L_02219008: .word 0x3d6
.size func_ov094_02218f14, . - func_ov094_02218f14
