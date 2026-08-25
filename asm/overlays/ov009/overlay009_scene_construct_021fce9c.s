    .text
    .extern CheckedFS_CloseFile
    .extern CheckedFS_GetFileLength
    .extern CheckedFS_InitFile
    .extern CheckedFS_OpenFile
    .extern CheckedFS_ReadFile
    .extern GX_DispOn
    .extern GX_SetBankForBG
    .extern GX_SetGraphicsMode
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern Scene_Init
    .extern Scene_SetFlags03
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_ov009_021feb80
    .extern data_ov009_021feba8
    .extern data_ov009_021fee8c
    .extern data_ov009_021feec0
    .extern data_ov009_021feed4
    .extern Heap_AllocCore
    .extern AnimationResourceState_InitEmbedded
    .extern GraphicsResourceSet_ApplyToMainBg
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern SceneInputBase_Init
    .extern GraphicsBankStateSnapshot_Init
    .extern GraphicsBankStateSnapshot_Capture
    .extern TitleDisplay_SetMainBgPriorities
    .extern TitlePalette_SetMainBackdrop
    .extern TitlePalette_SetSubBackdrop
    .extern func_020b44e8
    .extern func_020b4554
    .extern func_ov009_021fce00
    .extern func_ov009_021fce1c
    .extern func_ov009_021fce48
    .extern func_ov009_021fce74
    .extern func_ov009_021fd294
    .extern func_ov009_021fd360
    .extern gHeapContext

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_scene_construct.c. */
    .global func_ov009_021fce9c
func_ov009_021fce9c: ; 0x021fce9c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x60
    mov r10, r0
    bl Scene_Init
    add r0, r10, #0x24
    bl SceneInputBase_Init
    ldr r0, L_021fd168
    ldr r1, L_021fd16c
    str r0, [r10, #0x0]
    add r0, r10, #0x78
    str r1, [r10, #0x24]
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x13c
    bl GraphicsBankStateSnapshot_Init
    add r0, r10, #0x13c
    bl GraphicsBankStateSnapshot_Capture
    mov r1, #0x0
    ldr r0, L_021fd170
    str r1, [r10, #0x74]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r9, #0x0
    ldr r5, L_021fd174
    ldr r7, L_021fd178
    add r8, sp, #0x18
    mov r11, #0x4
    mov r4, r9
L_021fcf08:
    mov r0, r8
    bl CheckedFS_InitFile
    ldr r1, [r7, r9, lsl #0x2]
    mov r0, r8
    bl CheckedFS_OpenFile
    cmp r0, #0x0
    beq L_021fcf84
    mov r0, r8
    bl CheckedFS_GetFileLength
    ldr r3, L_021fd17c
    mov r1, r5
    mov r2, r11
    mov r6, r0
    bl Heap_AllocCore
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x8c]
    mov r0, r6, lsr #0x5
    str r0, [r1, #0xa8]
    str r4, [r1, #0xc0]
    ldr r1, [r1, #0x8c]
    mov r0, r8
    mov r2, r6
    bl CheckedFS_ReadFile
    cmp r6, r0
    bne L_021fcf84
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x8c]
    mov r1, r6
    bl func_020b4554
    mov r0, r8
    bl CheckedFS_CloseFile
L_021fcf84:
    add r9, r9, #0x1
    cmp r9, #0x6
    blt L_021fcf08
    ldr r0, L_021fd170
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x84]
    mov r1, #0x0
    str r1, [r10, #0x88]
    mov r0, #0x1
    str r0, [r10, #0xa4]
    str r1, [r10, #0xd8]
    str r1, [r10, #0xdc]
    str r1, [r10, #0xe0]
    str r1, [r10, #0xec]
    mov r0, r10
    str r1, [r10, #0x11c]
    bl func_ov009_021fd294
    mov r0, r10
    bl func_ov009_021fd360
    mov r0, #0x0
    bl func_ov009_021fce00
    bl GX_DispOn
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r0, #0x1
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1800
    str r1, [r2, #0x0]
    mov r1, #0x0
    mov r2, r1
    bl GX_SetGraphicsMode
    mov r0, #0x2
    bl GX_SetBankForBG
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r0, #0x0
    bic r1, r1, #0x38000000
    str r1, [r2, #0x0]
    mov r1, r0
    mov r2, #0x1e
    mov r3, r0
    bl func_ov009_021fce1c
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x1e
    mov r3, r0
    bl func_ov009_021fce48
    ldr r0, [r10, #0xf0]
    ldr r1, L_021fd180
    rsb r0, r0, #0x0
    and r3, r0, r1
    ldr r2, [r10, #0xf4]
    mov r0, r1, lsl #0x10
    rsb r2, r2, #0x0
    and r0, r0, r2, lsl #0x10
    orr r2, r3, r0
    ldr r4, L_021fd184
    mov r0, r1, lsl #0x10
    str r2, [r4, #0x0]
    ldr r3, [r10, #0xf0]
    ldr r2, [r10, #0xf4]
    rsb r3, r3, #0x0
    and r3, r3, r1
    rsb r1, r2, #0x0
    and r0, r0, r1, lsl #0x10
    orr r0, r3, r0
    str r0, [r4, #0x4]
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    ldr r2, L_021fd188
    ldr r0, [r2, #0x0]
    orr r0, r0, #0x10000
    str r0, [r2, #0x0]
    ldr r1, [r2, #0x0]
    add r0, sp, #0xc
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    bl GraphicsResourceSet_Init
    ldr r3, L_021fd18c
    ldr r0, L_021fd190
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0xc
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0xc
    mov r1, #0x3
    mov r2, #0x0
    bl GraphicsResourceSet_ApplyToMainBg
    ldr r1, [r10, #0xe8]
    orr r0, r1, r1, lsl #0x5
    orr r0, r0, r1, lsl #0xa
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl TitlePalette_SetMainBackdrop
    mov r0, #0x0
    bl TitlePalette_SetSubBackdrop
    mov r0, r10
    bl Scene_SetFlags03
    ldr r1, L_021fd194
    add r2, sp, #0x4
    ldr r3, [r1, #0x10]
    ldr r1, [r1, #0x14]
    add r0, r10, #0x24
    sub r1, r1, #0x48
    str r3, [sp, #0x4]
    str r1, [sp, #0x8]
    ldmia r2, {r1, r2}
    bl func_ov009_021fce74
    add r0, sp, #0xc
    bl GraphicsResourceSet_Destroy
    mov r0, r10
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd168: .word data_ov009_021fee8c
L_021fd16c: .word data_ov009_021feec0
L_021fd170: .word data_020f4e14
L_021fd174: .word data_ov009_021feed4
L_021fd178: .word data_ov009_021feba8
L_021fd17c: .word gHeapContext
L_021fd180: .word 0x1ff
L_021fd184: .word 0x4000018
L_021fd188: .word 0x4001000
L_021fd18c: .word 0xc005
L_021fd190: .word data_020f4e18
L_021fd194: .word data_ov009_021feb80

    .size func_ov009_021fce9c, . - func_ov009_021fce9c
