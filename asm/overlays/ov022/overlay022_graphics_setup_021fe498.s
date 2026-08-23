    .text
/* Exact fallback; see src/overlays/ov022/overlay022_graphics_setup.c. */
    .extern data_020f4e18
    .extern func_020706c4
    .extern GraphicsBgResourceData_GetDecoded
    .extern GraphicsBgMapResource_UploadToSubBg
    .extern Presentation_BlendPalette16
    .extern func_020b1ff0
    .extern func_020b44e8
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load

.global func_ov022_021fe498
func_ov022_021fe498:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x374]
    bl GraphicsBgResourceData_GetDecoded
    add r0, r0, #0x20
    str r0, [r4, #0x36c]
    str r0, [r4, #0x368]
    mov r0, #0x10
    str r0, [r4, #0x370]
    ldr r0, [r4, #0x368]
    ldr r1, [r4, #0x36c]
    mov r2, #0x0
    bl Presentation_BlendPalette16
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe53c
    ldr r1, L_021fe540
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r0, [r4, #0x368]
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe53c: .word 0xc008
L_021fe540: .word data_020f4e18
.size func_ov022_021fe498, . - func_ov022_021fe498
