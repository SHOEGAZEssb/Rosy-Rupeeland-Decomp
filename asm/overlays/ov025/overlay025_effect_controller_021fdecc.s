.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_construct.c. */
.extern __construct_array
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov025_02202c84
.extern data_ov025_02203354
.extern func_02071ea4
.extern func_02071eb8
.extern func_02071ee0
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_020918f4
.extern Presentation_Init
.extern func_ov025_021fe4cc
.extern gDebugFont
.extern genrand_int32


    .global func_ov025_021fdecc
func_ov025_021fdecc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    bl Presentation_Init
    ldr r0, L_021fe0a4
    ldr r4, L_021fe0a8
    str r0, [r6, #0x0]
    ldr r3, L_021fe0ac
    add r0, r6, #0xb0
    mov r1, #0x3
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    add r0, r6, #0xd4
    bl func_02071ea4
    mov r5, #0x0
    ldr r4, L_021fe0b0
    ldr r8, L_021fe0b4
    str r5, [r6, #0xf8]
    add r9, r6, #0xb0
    mov r7, #0xc
L_021fdf1c:
    add r3, r4, r5, lsl #0x3
    ldrh r1, [r3, #0x4]
    mla r0, r5, r7, r9
    str r1, [sp, #0x0]
    mov r1, r5, lsl #0x3
    ldrh r2, [r4, r1]
    ldrh r3, [r3, #0x2]
    ldr r1, [r8, #0x0]
    bl func_02071ee0
    add r5, r5, #0x1
    cmp r5, #0x3
    blt L_021fdf1c
    bl genrand_int32
    ldr r1, L_021fe0b8
    str r0, [r6, #0xf8]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, L_021fe0bc
    str r0, [r6, #0xe0]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r6, #0xe4]
    mov r1, #0x0
    str r1, [r0, #0x18]
    mov r1, #0x100
    str r1, [r0, #0x1c]
    ldr r0, [r6, #0xe0]
    add r1, r6, #0xb0
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r6, #0xe8]
    mov r1, #0x3
    strb r1, [r0, #0x3a]
    mov r1, #0x2000
    strh r1, [r0, #0x28]
    ldr r3, [r6, #0xe8]
    add r1, r6, #0xb0
    ldrh r0, [r3, #0x24]
    mov r2, #0x2
    orr r0, r0, #0x6
    strh r0, [r3, #0x24]
    ldr r0, [r6, #0xe4]
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r6, #0xf0]
    mov r1, #0x3
    strb r1, [r0, #0x3a]
    mov r1, #0x2000
    strh r1, [r0, #0x28]
    ldr r4, [r6, #0xf0]
    ldr r3, L_021fe0c0
    ldrh r2, [r4, #0x24]
    ldr r1, L_021fe0b4
    add r0, r6, #0xd4
    orr r2, r2, #0x6
    strh r2, [r4, #0x24]
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, [r6, #0xe0]
    add r1, r6, #0xd4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r6, #0xec]
    mov r1, #0x3
    strb r1, [r0, #0x3a]
    mov r1, #0x2100
    strh r1, [r0, #0x28]
    ldr r3, [r6, #0xec]
    add r1, r6, #0xd4
    ldrh r0, [r3, #0x24]
    mov r2, #0x1
    orr r0, r0, #0x6
    strh r0, [r3, #0x24]
    ldr r0, [r6, #0xe4]
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r6, #0xf4]
    mov r1, #0x3
    strb r1, [r0, #0x3a]
    mov r1, #0x2100
    strh r1, [r0, #0x28]
    ldr r4, [r6, #0xf4]
    mov r2, #0x0
    ldrh r3, [r4, #0x24]
    add r0, r6, #0xf8
    mov r1, #0x2
    orr r3, r3, #0x6
    strh r3, [r4, #0x24]
    str r2, [r6, #0xa8]
    bl func_020918f4
    str r0, [r6, #0xa4]
    mov r0, r6
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov025_021fe4cc
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fe0a4: .word data_ov025_02203354
L_021fe0a8: .word func_02071eb8
L_021fe0ac: .word func_02071ea4
L_021fe0b0: .word data_ov025_02202c84
L_021fe0b4: .word data_020f4e18
L_021fe0b8: .word data_020f4e14
L_021fe0bc: .word gDebugFont
L_021fe0c0: .word 0x1156
.size func_ov025_021fdecc, .-func_ov025_021fdecc

