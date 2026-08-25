    .text
/* Exact fallback; see src/overlays/ov022/overlay022_core_helpers.c. */
    .extern data_020f4e18
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern TitleInterpolatedValue_Init
    .extern func_ov022_021fcec8
    .extern gDebugFont
    .extern genrand_int32

.global func_ov022_021fcf08
func_ov022_021fcf08:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    add r0, r4, #0x4
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x10
    bl TitleInterpolatedValue_Init
    add r0, r4, #0x2c
    bl TitleInterpolatedValue_Init
    add r0, r4, #0x48
    bl func_ov022_021fcec8
    mov r0, #0x0
    str r0, [r4, #0x64]
    bl genrand_int32
    str r0, [r4, #0x64]
    ldr r0, L_021fcf8c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x0]
    ldr r3, L_021fcf90
    add r0, r4, #0x4
    str r3, [sp, #0x0]
    ldr r1, L_021fcf94
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    mov r0, #0x0
    str r0, [r4, #0x58]
    str r0, [r4, #0x5c]
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fcf8c: .word gDebugFont
L_021fcf90: .word 0x1716
L_021fcf94: .word data_020f4e18
.size func_ov022_021fcf08, . - func_ov022_021fcf08
