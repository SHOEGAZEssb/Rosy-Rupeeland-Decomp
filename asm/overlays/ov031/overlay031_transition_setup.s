.text

/* Exact fallback; see src/overlays/ov031/overlay031_transition_setup.c for documented portable C. */
.extern gDisplayBrightnessPair
.extern data_020f4e18
.extern DisplayBrightness_StartTransition
.extern DisplayBrightnessPair_GetScreen
.extern GraphicsBgCharacterResource_UploadToSubBg
.extern GraphicsBgPaletteResource_UploadToSubBg
.extern GraphicsBgMapResource_UploadToSubBg
.extern func_020b44e8
.extern func_ov031_021fe148
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern GXx_SetMasterBrightness_


    .global func_ov031_021fe1a8
func_ov031_021fe1a8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r2, #0x0
    ldr r0, L_021fe278
    sub r1, r2, #0x10
    str r2, [r4, #0xa0]
    bl GXx_SetMasterBrightness_
    mov r0, #0x0
    mov r1, #0x1
    mov r3, r0
    mov r2, #0x1a
    str r1, [sp, #0x0]
    bl func_ov031_021fe148
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe27c
    ldr r1, L_021fe280
    str r3, [sp, #0x0]
    sub r2, r3, #0x1
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0x4]
    mov r2, r1
    bl GraphicsBgCharacterResource_UploadToSubBg
    ldr r0, [sp, #0x8]
    mov r1, #0x4000
    bl GraphicsBgPaletteResource_UploadToSubBg
    mov r1, #0x0
    ldr r0, [sp, #0xc]
    mov r2, r1
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r0, [r4, #0x58]
    mov r1, #0x1
    str r1, [r0, #0x20]
    ldr r2, L_021fe284
    mov r3, #0x0
    ldr r0, L_021fe288
    str r3, [r2, #0x0]
    bl DisplayBrightnessPair_GetScreen
    mvn r1, #0xf
    mov r2, #0x0
    mov r3, #0x8
    bl DisplayBrightness_StartTransition
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe278: .word 0x400106c
L_021fe27c: .word 0x900b
L_021fe280: .word data_020f4e18
L_021fe284: .word 0x4001010
L_021fe288: .word gDisplayBrightnessPair
.size func_ov031_021fe1a8, .-func_ov031_021fe1a8
