; Matching retail form; see src/graphics/sub_bg_resource_upload.c.
.text
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern GraphicsResourceSet_Destroy
.extern GraphicsBgMapResource_AddPaletteBankOffset
.extern func_020b44e8
.extern func_020706c4
.extern GraphicsResource_GetFormat
.extern func_02070bc4
.extern GraphicsBgMapResource_UploadToSubBg
.extern data_020f4e18
.global GraphicsSubBackground_LoadResources
GraphicsSubBackground_LoadResources: ; 0x0201ccf4
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x4
    mov r8, r1
    mov r7, r2
    mov r5, r3
    ldr r6, [sp, #0x2c]
    bl GraphicsResourceSet_Init
    ldr r0, L_0201ce90
    str r5, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, sp, #0x4
    mov r2, r8
    mov r3, r7
    bl GraphicsResourceSet_Load
    ldrh r5, [sp, #0x28]
    ldr r0, [sp, #0xc]
    mov r1, r5
    bl GraphicsBgMapResource_AddPaletteBankOffset
    ldr r0, L_0201ce94
    mov r1, #0x7c00
    strh r1, [r0, #0x0]
    bl func_020b44e8
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b L_0201ce7c
L_0201cd60: ; jump table
    b L_0201cd70 ; case 0
    b L_0201cda8 ; case 1
    b L_0201cdf0 ; case 2
    b L_0201ce38 ; case 3
L_0201cd70:
    cmp r6, #0x0
    beq L_0201cd94
    mov r1, #0x0
    ldr r0, [sp, #0x4]
    mov r2, r1
    bl func_020706c4
    ldr r0, [sp, #0x8]
    mov r1, r5, lsl #0x5
    bl func_02070bc4
L_0201cd94:
    mov r1, #0x0
    ldr r0, [sp, #0xc]
    mov r2, r1
    bl GraphicsBgMapResource_UploadToSubBg
    b L_0201ce7c
L_0201cda8:
    cmp r6, #0x0
    beq L_0201cddc
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x4]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x2000
    ldr r0, [sp, #0x8]
    moveq r1, r5, lsl #0x5
    bl func_02070bc4
L_0201cddc:
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    b L_0201ce7c
L_0201cdf0:
    cmp r6, #0x0
    beq L_0201ce24
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x4]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x4000
    ldr r0, [sp, #0x8]
    moveq r1, r5, lsl #0x5
    bl func_02070bc4
L_0201ce24:
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    b L_0201ce7c
L_0201ce38:
    cmp r6, #0x0
    beq L_0201ce6c
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x4]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [sp, #0x8]
    moveq r1, r5, lsl #0x5
    bl func_02070bc4
L_0201ce6c:
    ldr r0, [sp, #0xc]
    mov r1, #0x3
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
L_0201ce7c:
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_0201ce90: .word data_020f4e18
L_0201ce94: .word 0x5000400


.size GraphicsSubBackground_LoadResources, . - GraphicsSubBackground_LoadResources