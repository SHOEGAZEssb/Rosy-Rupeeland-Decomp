.text
; Matching fallback for the portable implementation in
; src/overlays/ov094/overlay094_title_effect_owner_create.c.
.extern GameWork_ClearFlag
.extern data_020f4e14
.extern data_020f4e18
.extern gGamePhaseRuntime
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02091b6c
.extern func_ov094_02217c34
.extern gDebugFont
.extern gGameWork

.global func_ov094_02219568
func_ov094_02219568:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl AnimationResourceState_InitEmbedded
    mov r1, #0x0
    add r0, r4, #0x18
    str r1, [r4, #0x14]
    bl func_02091b6c
    add r0, r4, #0x34
    bl func_ov094_02217c34
    str r6, [r4, #0x44]
    ldr r0, .L_0221967c
    str r5, [r4, #0x48]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x0]
    cmp r0, #0xa7
    bne .L_022195e0
    ldr r3, .L_02219680
    ldr r0, .L_02219684
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    mov r0, r4
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_02071ee0
    b .L_02219600
.L_022195e0:
    ldr r3, .L_02219688
    ldr r0, .L_02219684
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    mov r0, r4
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_02071ee0
.L_02219600:
    ldr r0, .L_0221968c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, .L_02219690
    str r0, [r4, #0xc]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x10]
    mov r1, #0x0
    str r1, [r0, #0x18]
    mov r2, #0x100
    ldr r1, .L_02219694
    str r2, [r0, #0x1c]
    ldr r0, [r1, #0x0]
    ldr r1, .L_02219698
    bl GameWork_ClearFlag
    ldr r0, .L_02219694
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02219694
    ldr r1, .L_0221969c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02219694
    ldr r1, .L_022196a0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0221967c: .word gGamePhaseRuntime
.L_02219680: .word 0x1692
.L_02219684: .word data_020f4e18
.L_02219688: .word 0x13d1
.L_0221968c: .word data_020f4e14
.L_02219690: .word gDebugFont
.L_02219694: .word gGameWork
.L_02219698: .word 0x3d3
.L_0221969c: .word 0x3d5
.L_022196a0: .word 0x3d6
.size func_ov094_02219568, . - func_ov094_02219568
