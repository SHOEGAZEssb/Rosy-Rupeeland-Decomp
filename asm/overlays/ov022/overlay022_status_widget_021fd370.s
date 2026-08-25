    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */
    .extern data_020f4e18
    .extern data_ov022_02200608
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern func_ov022_021fd48c

.global func_ov022_021fd370
func_ov022_021fd370:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r1, L_021fd44c
    add r0, r4, #0x4
    str r1, [r4, #0x0]
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x10
    bl AnimationResourceState_InitEmbedded
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x30]
    bl func_ov022_021fd48c
    ldr r3, L_021fd450
    ldr r1, L_021fd454
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r4, #0x4
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    mov r0, #0x4b
    str r0, [sp, #0x0]
    ldr r1, L_021fd454
    add r0, r4, #0x10
    ldr r1, [r1, #0x0]
    mov r2, #0x49
    mov r3, #0x4a
    bl AnimationResourceState_ReplaceResources
    ldr r0, [r4, #0x1c]
    add r1, r4, #0x4
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x20]
    mov r1, #0x2
    strb r1, [r0, #0x3a]
    mov r1, #0x10
    strh r1, [r0, #0x28]
    ldr r0, [r4, #0x1c]
    add r1, r4, #0x10
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x24]
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r4, #0x24]
    mov r2, #0x40
    mov r3, #0x54
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
L_021fd44c: .word data_ov022_02200608
L_021fd450: .word 0x1571
L_021fd454: .word data_020f4e18
.size func_ov022_021fd370, . - func_ov022_021fd370
