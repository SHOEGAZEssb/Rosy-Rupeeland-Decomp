    .text
    .extern CheckedFS_CloseFile
    .extern CheckedFS_GetFileLength
    .extern CheckedFS_InitFile
    .extern CheckedFS_OpenFile
    .extern CheckedFS_ReadFile
    .extern GXS_SetGraphicsMode
    .extern GX_DispOn
    .extern GX_SetBankForSubBG
    .extern GraphicsResourceSet_Init
    .extern Scene_Init
    .extern Scene_SetFlags03
    .extern data_020f4e14
    .extern data_ov011_021fe3b0
    .extern data_ov011_021fe3f0
    .extern data_ov011_021fe578
    .extern data_ov011_021fe5ac
    .extern data_ov011_021fe610
    .extern Heap_AllocCore
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern SceneInputBase_Init
    .extern GraphicsBankStateSnapshot_Init
    .extern func_020923a4
    .extern func_02092618
    .extern func_02092688
    .extern TitlePalette_SetMainBackdrop
    .extern func_020aea7c
    .extern func_020b4554
    .extern func_ov011_021fce00
    .extern func_ov011_021fce1c
    .extern func_ov011_021fce50
    .extern func_ov011_021fd188
    .extern gDebugFont
    .extern gHeapContext

/* Exact fallback; see src/overlays/ov011/overlay011_scene_construct.c. */
    .global func_ov011_021fce78
func_ov011_021fce78: ; 0x021fce78
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x54
    mov r10, r0
    bl Scene_Init
    add r0, r10, #0x24
    bl SceneInputBase_Init
    ldr r0, L_021fd06c
    ldr r1, L_021fd070
    str r0, [r10, #0x0]
    add r0, r10, #0x78
    str r1, [r10, #0x24]
    bl GraphicsResourceSet_Init
    add r0, r10, #0x98
    bl GraphicsBankStateSnapshot_Init
    mov r1, #0x0
    str r1, [r10, #0x74]
    str r1, [r10, #0x108]
    ldr r0, L_021fd074
    str r1, [r10, #0xcc]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fd078
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r9, #0x0
    ldr r5, L_021fd07c
    ldr r7, L_021fd080
    add r8, sp, #0xc
    mov r11, #0x4
    mov r4, r9
L_021fcef0:
    mov r0, r8
    bl CheckedFS_InitFile
    ldr r1, [r7, r9, lsl #0x2]
    mov r0, r8
    bl CheckedFS_OpenFile
    cmp r0, #0x0
    beq L_021fcf6c
    mov r0, r8
    bl CheckedFS_GetFileLength
    ldr r3, L_021fd084
    mov r1, r5
    mov r2, r11
    mov r6, r0
    bl Heap_AllocCore
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x84]
    mov r0, r6, lsr #0x5
    str r0, [r1, #0xd4]
    str r4, [r1, #0xe8]
    ldr r1, [r1, #0x84]
    mov r0, r8
    mov r2, r6
    bl CheckedFS_ReadFile
    cmp r6, r0
    bne L_021fcf6c
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x84]
    mov r1, r6
    bl func_020b4554
    mov r0, r8
    bl CheckedFS_CloseFile
L_021fcf6c:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt L_021fcef0
    mov r1, #0x0
    str r1, [r10, #0xd0]
    mov r0, #0x1
    str r1, [r10, #0x104]
    bl func_ov011_021fce00
    add r0, r10, #0x98
    bl func_020923a4
    bl GX_DispOn
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r1, #0x0]
    ldr r1, [r2, #0x0]
    mov r0, #0x0
    orr r1, r1, #0x10000
    str r1, [r2, #0x0]
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1200
    str r1, [r2, #0x0]
    bl GXS_SetGraphicsMode
    mov r0, #0x4
    bl GX_SetBankForSubBG
    mov r0, #0x80
    bl func_020aea7c
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x10
    mov r3, r0
    str r0, [sp, #0x0]
    bl func_ov011_021fce1c
    bl func_02092618
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092688
    mov r0, #0x0
    str r0, [r10, #0xfc]
    str r0, [r10, #0x100]
    mov r0, r10
    bl func_ov011_021fd188
    mov r0, #0x0
    bl TitlePalette_SetMainBackdrop
    mov r0, r10
    bl Scene_SetFlags03
    ldr r1, L_021fd088
    add r2, sp, #0x4
    ldr r3, [r1, #0x30]
    ldr r1, [r1, #0x34]
    add r0, r10, #0x24
    sub r1, r1, #0x48
    str r3, [sp, #0x4]
    str r1, [sp, #0x8]
    ldmia r2, {r1, r2}
    bl func_ov011_021fce50
    mov r0, r10
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd06c: .word data_ov011_021fe578
L_021fd070: .word data_ov011_021fe5ac
L_021fd074: .word data_020f4e14
L_021fd078: .word gDebugFont
L_021fd07c: .word data_ov011_021fe610
L_021fd080: .word data_ov011_021fe3f0
L_021fd084: .word gHeapContext
L_021fd088: .word data_ov011_021fe3b0

    .size func_ov011_021fce78, . - func_ov011_021fce78
