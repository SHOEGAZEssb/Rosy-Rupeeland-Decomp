.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_sub_scene_recovery.c.
.extern GXS_SetGraphicsMode
.extern GX_SetBankForSubBG
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern data_ov051_0220df98
.extern func_020706c4
.extern func_02070bc4
.extern GraphicsBgMapResource_UploadToSubBg
.extern GraphicsBgMapResource_Convert32x32BlockMajorToRowMajor
.extern func_020aea7c
.extern func_020afd28
.extern func_020b44e8
.extern func_ov051_0220d600
.extern func_ov051_0220d84c

.global func_ov051_0220d878
func_ov051_0220d878:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_ov051_0220d600
    ldr r1, .L_0220d988
    add r0, sp, #0x8
    str r1, [r4, #0x0]
    bl GraphicsResourceSet_Init
    ldr r1, .L_0220d98c
    str r5, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r7
    mov r3, r6
    add r0, sp, #0x8
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0x10]
    bl GraphicsBgMapResource_Convert32x32BlockMajorToRowMajor
    bl func_020b44e8
    mov r0, #0x4
    bl GX_SetBankForSubBG
    mov r0, #0x80
    bl func_020aea7c
    mov r0, #0x5
    bl GXS_SetGraphicsMode
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x10
    mov r3, #0x4
    bl func_ov051_0220d84c
    ldr r3, .L_0220d990
    mov r1, #0x2
    ldr r0, [r3, #0x0]
    mov r2, #0x0
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1400
    str r0, [r3, #0x0]
    ldr r0, [sp, #0x8]
    bl func_020706c4
    ldr r0, [sp, #0xc]
    mov r1, #0x4000
    bl func_02070bc4
    ldr r0, [sp, #0x10]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, .L_0220d994
    add r1, r4, #0xc10
    mov r2, #0x80
    mov r3, #0x60
    bl func_020afd28
    ldr r0, [r4, #0x4]
    ldr r1, .L_0220d998
    bic r0, r0, #0x1
    orr r0, r0, #0x3
    str r0, [r4, #0x4]
    mov r2, #0x0
    add r0, sp, #0x8
    strh r2, [r1, #0x0]
    bl GraphicsResourceSet_Destroy
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0220d988: .word data_ov051_0220df98
.L_0220d98c: .word data_020f4e18
.L_0220d990: .word 0x4001000
.L_0220d994: .word 0x4001020
.L_0220d998: .word 0x4001050
.size func_ov051_0220d878, . - func_ov051_0220d878
