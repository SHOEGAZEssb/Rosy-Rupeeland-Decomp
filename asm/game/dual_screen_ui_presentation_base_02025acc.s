; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern data_020d6b3c
.extern data_020f4e18
.extern func_020264c4
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern gDebugFont

    .global func_02025acc
    .type func_02025acc, @function
func_02025acc: ; 0x02025acc
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, .L_02025b44
    mov r4, r0
    mov r5, r1
    str r2, [r4, #0x0]
    add r0, r4, #0x4
    bl func_020264c4
    str r5, [r4, #0xac]
    add r0, r4, #0xb8
    bl AnimationResourceState_InitEmbedded
    ldr r1, [r4, #0xc4]
    ldr r0, .L_02025b48
    bic r1, r1, #0x1
    bic r1, r1, #0x2
    str r1, [r4, #0xc4]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r3, .L_02025b4c
    str r0, [r4, #0xa8]
    mov r1, #0x1
    str r1, [r0, #0x20]
    ldr r1, .L_02025b50
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r4, #0xb8
    sub r3, r3, #0x1
    bl func_02071ee0
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02025b44: .word data_020d6b3c
.L_02025b48: .word gDebugFont
.L_02025b4c: .word 0x32b9
.L_02025b50: .word data_020f4e18
    .size func_02025acc, . - func_02025acc
