    .text
/* Exact fallback; see src/overlays/ov017/overlay017_ui_sprite_group.c. */
    .extern data_020f4e18
    .extern AnimationResourceState_InitEmbedded
    .extern func_02071ee0
    .extern func_02073e48
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern gDebugFont
.global Overlay017UiSpriteGroup_Init
Overlay017UiSpriteGroup_Init:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r9, r0
    add r0, r9, #0x4
    mov r5, r1
    mov r4, r2
    bl AnimationResourceState_InitEmbedded
    add r0, r9, #0x10
    bl AnimationResourceState_InitEmbedded
    str r5, [r9, #0x5c]
    str r4, [r9, #0x60]
    mov r1, #0x0
    ldr r0, L_021fe884
    str r1, [r9, #0x64]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r3, L_021fe888
    str r0, [r9, #0x0]
    ldr r1, L_021fe88c
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r9, #0x4
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r3, L_021fe890
    ldr r1, L_021fe88c
    str r3, [sp, #0x0]
    sub r2, r3, #0x1
    ldr r1, [r1, #0x0]
    add r0, r9, #0x10
    sub r3, r3, #0x3
    bl func_02071ee0
    ldr r0, [r9, #0x0]
    add r1, r9, #0x4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r9, #0x1c]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r9, #0x1c]
    mov r2, #0xdc
    mov r3, #0x86
    bl func_02073e48
    mov r8, #0x0
    mov r7, #0x1
    mov r6, r7
    mov r5, r8
    mov r4, #0x2
    mov r10, #0xb0
L_021fe830:
    ldr r0, [r9, #0x0]
    mov r2, r7
    add r1, r9, #0x10
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r9, r8, lsl #0x2
    str r0, [r1, #0x20]
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    str r4, [sp, #0x8]
    mov r2, r8, lsl #0x4
    ldr r0, [r1, #0x20]
    mov r1, r5
    add r2, r2, #0x10
    mov r3, r10
    bl func_02073e48
    add r8, r8, #0x1
    cmp r8, #0xf
    blt L_021fe830
    mov r0, r9
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_021fe884: .word gDebugFont
L_021fe888: .word 0x3295
L_021fe88c: .word data_020f4e18
L_021fe890: .word 0x3297
    .size Overlay017UiSpriteGroup_Init, . - Overlay017UiSpriteGroup_Init
