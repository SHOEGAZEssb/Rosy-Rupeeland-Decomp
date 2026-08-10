.text

/* Exact fallback; see src/overlays/ov032/overlay032_runtime_setup.c for documented portable C. */
.extern GXS_SetGraphicsMode
.extern GX_SetBankForBG
.extern GX_SetGraphicsMode
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e14
.extern data_020f4e18
.extern data_021052fc
.extern GamePhaseState_SetEnabled
.extern GamePhaseAreaScene_SetEnabled
.extern func_0201e0f4
.extern func_0207042c
.extern func_02070638
.extern func_020706c4
.extern func_02070b50
.extern func_02070bc4
.extern func_02070e0c
.extern func_02070eac
.extern func_02072000
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern GraphicsSpriteRenderer_ConfigureTextGridPriority
.extern func_020923a4
.extern func_020925f8
.extern func_02092618
.extern func_02092638
.extern func_02092688
.extern func_020aea7c
.extern func_020af1f8
.extern func_020afd0c
.extern func_020b44e8
.extern func_ov032_021fde1c
.extern gDebugFont

    .global func_ov032_021fd994
func_ov032_021fd994:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r1, L_021fdddc
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0f4
    add r0, r4, #0x3e8
    add r0, r0, #0x800
    bl func_020923a4
    ldr r0, L_021fdde0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fdde4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fdddc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_SetEnabled
    ldr r0, L_021fdddc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    ldr r1, L_021fdde8
    mov r0, #0x0
    ldrh r3, [r1, #0x0]
    sub r2, r1, #0x2b4
    ldr r1, L_021fddec
    and r3, r3, #0x8000
    mov r3, r3, asr #0xf
    str r3, [r4, #0xb50]
    strh r0, [r2, #0x0]
    strh r0, [r1, #0x0]
    bl func_ov032_021fde1c
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r0, #0x2
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1300
    str r1, [r2, #0x0]
    bl GX_SetBankForBG
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl GX_SetGraphicsMode
    mov r0, #0x40
    bl func_020af1f8
    ldr r1, L_021fddf0
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x4]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0xe90
    orr r0, r0, #0x5000
    strh r0, [r1, #0x6]
    bl func_020925f8
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    ldr r1, L_021fddf4
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1e00
    str r0, [r1, #0x0]
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    mov r0, #0x80
    bl func_020aea7c
    ldr r2, L_021fddf8
    ldr r0, L_021fddfc
    ldrh r1, [r2, #0x0]
    add r0, r0, #0x288
    and r1, r1, #0x43
    orr r1, r1, #0x3a00
    strh r1, [r2, #0x0]
    ldrh r1, [r2, #0x2]
    and r1, r1, #0x43
    orr r1, r1, #0xc10
    orr r1, r1, #0x1000
    strh r1, [r2, #0x2]
    ldrh r1, [r2, #0x4]
    and r1, r1, #0x43
    orr r0, r1, r0
    strh r0, [r2, #0x4]
    bl func_02092618
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092688
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fde00
    ldr r1, L_021fde04
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
    bl func_02070638
    ldr r0, [sp, #0x4]
    bl func_0207042c
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [sp, #0x8]
    moveq r1, #0x0
    bl func_02070b50
    mov r1, #0x0
    ldr r0, [sp, #0xc]
    mov r2, r1
    bl func_02070e0c
    add r0, sp, #0x4
    bl func_02072000
    ldr r3, L_021fde08
    ldr r1, L_021fde04
    str r3, [sp, #0x0]
    sub r2, r3, #0x4
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0x4]
    bl func_0207042c
    cmp r0, #0x0
    movne r1, #0x4000
    ldr r0, [sp, #0x8]
    moveq r1, #0x0
    bl func_02070b50
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070e0c
    add r0, sp, #0x4
    bl func_02072000
    ldr r3, L_021fde0c
    ldr r1, L_021fde04
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x4]
    bl func_0207042c
    cmp r0, #0x0
    movne r1, #0x6000
    moveq r1, #0x0
    ldr r0, [sp, #0x8]
    bl func_02070bc4
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070eac
    add r0, sp, #0x4
    bl func_02072000
    ldr r3, L_021fde08
    ldr r1, L_021fde04
    str r3, [sp, #0x0]
    sub r2, r3, #0x4
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x4]
    bl func_0207042c
    cmp r0, #0x0
    movne r1, #0x4000
    ldr r0, [sp, #0x8]
    moveq r1, #0x0
    bl func_02070bc4
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070eac
    add r0, sp, #0x4
    bl func_02072000
    ldr r3, L_021fde10
    ldr r1, L_021fde04
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x4]
    bl func_0207042c
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [sp, #0x8]
    moveq r1, #0x0
    bl func_02070bc4
    ldr r0, [sp, #0xc]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02070eac
    add r0, sp, #0x4
    bl func_02072000
    mov r1, #0x5000000
    ldr r2, L_021fde14
    add r0, r1, #0x400
    strh r2, [r1, #0x0]
    strh r2, [r0, #0x0]
    mov r0, #0x8
    str r0, [sp, #0x0]
    ldr r0, L_021fde18
    mov r1, #0x2
    mov r2, #0x3c
    mov r3, #0xc
    bl func_020afd0c
    mov r0, #0x8
    str r0, [sp, #0x0]
    ldr r0, L_021fddec
    mov r1, #0x4
    mov r2, #0x38
    mov r3, #0xc
    bl func_020afd0c
    ldr r0, L_021fdde0
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
    ldr r0, L_021fdde4
    mov r1, #0x3
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
    mov r0, #0x1
    str r0, [r4, #0xf2c]
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fdddc: .word data_021052fc
L_021fdde0: .word data_020f4e14
L_021fdde4: .word gDebugFont
L_021fdde8: .word 0x4000304
L_021fddec: .word 0x4001050
L_021fddf0: .word 0x4000008
L_021fddf4: .word 0x4001000
L_021fddf8: .word 0x400100a
L_021fddfc: .word 0x1c10
L_021fde00: .word 0xa066
L_021fde04: .word data_020f4e18
L_021fde08: .word 0xa068
L_021fde0c: .word 0xa063
L_021fde10: .word 0x9013
L_021fde14: .word 0x24a3
L_021fde18: .word 0x4000050
.size func_ov032_021fd994, .-func_ov032_021fd994

