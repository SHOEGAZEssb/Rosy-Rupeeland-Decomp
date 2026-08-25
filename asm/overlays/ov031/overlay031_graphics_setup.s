.text

/* Exact fallback; see src/overlays/ov031/overlay031_transition_setup.c for documented portable C. */
.extern data_020f4e18
.extern func_020706c4
.extern func_02070bc4
.extern GraphicsBgMapResource_UploadToSubBg
.extern GraphicsResourceSet_ReleaseHandles
.extern TitleDisplay_ConfigureSub2dEngine
.extern TitleDisplay_ResetSubBgScroll
.extern TitleDisplay_SetSubBgPriorities
.extern func_020b44e8
.extern func_ov031_021fe148
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov031_021fdfa8
func_ov031_021fdfa8:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    mov r1, #0x17
    str r1, [r0, #0x4c]
    mov r0, #0x0
    bl TitleDisplay_ConfigureSub2dEngine
    mov r0, #0x0
    mov ip, #0x1
    mov r1, r0
    mov r3, r0
    mov r2, #0x1a
    str ip, [sp, #0x0]
    bl func_ov031_021fe148
    ldr r1, L_021fe134
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0xc90
    orr r0, r0, #0x3000
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x298
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x2]
    bl TitleDisplay_ResetSubBgScroll
    mov r0, #0x0
    mov r1, #0x2
    mov r2, #0x1
    mov r3, #0x3
    bl TitleDisplay_SetSubBgPriorities
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe138
    ldr r1, L_021fe13c
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0x4]
    mov r2, r1
    bl func_020706c4
    ldr r0, [sp, #0x8]
    mov r1, #0x0
    bl func_02070bc4
    mov r1, #0x0
    ldr r0, [sp, #0xc]
    mov r2, r1
    bl GraphicsBgMapResource_UploadToSubBg
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    ldr r3, L_021fe140
    ldr r1, L_021fe13c
    str r3, [sp, #0x0]
    sub r2, r3, #0x1
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x5
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x8]
    mov r1, #0x6000
    bl func_02070bc4
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    ldr r3, L_021fe144
    ldr r0, L_021fe13c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
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
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
L_021fe134: .word 0x400100a
L_021fe138: .word 0x9010
L_021fe13c: .word data_020f4e18
L_021fe140: .word 0x900d
L_021fe144: .word 0x9009
.size func_ov031_021fdfa8, .-func_ov031_021fdfa8
