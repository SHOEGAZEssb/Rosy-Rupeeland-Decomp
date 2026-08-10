.text

/* Exact fallback; see src/overlays/ov030/overlay030_board_screen_setup.c for documented portable C. */
.extern data_020f4e14
.extern data_020f4e18
.extern func_02072048
.extern GraphicsSpriteRenderer_SetTextGridObjectMode
.extern func_02076004
.extern func_020b44e8
.extern func_ov030_021fe3e0
.extern func_ov030_021fe414
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov030_021fe554
func_ov030_021fe554:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r1, #0x1
    mov r0, #0x0
    mov r2, #0x18
    mov r3, #0x4
    str r1, [sp, #0x0]
    bl func_ov030_021fe3e0
    mov r1, #0x1
    mov r0, #0x2
    mov r2, #0x1a
    mov r3, #0x4
    str r1, [sp, #0x0]
    bl func_ov030_021fe414
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r0, [r4, #0x390]
    cmp r0, #0x1
    bne L_021fe5c8
    ldr r3, L_021fe744
    ldr r0, L_021fe748
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x3
    add r0, sp, #0x4
    sub r3, r3, #0x2
    bl GraphicsResourceSet_Load
    b L_021fe5e8
L_021fe5c8:
    ldr r3, L_021fe74c
    ldr r0, L_021fe748
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x3
    add r0, sp, #0x4
    sub r3, r3, #0x2
    bl GraphicsResourceSet_Load
L_021fe5e8:
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x0
    mov r2, #0x6000
    bl func_02072048
    ldr r0, [r4, #0x390]
    cmp r0, #0x1
    bne L_021fe668
    ldr r3, L_021fe750
    ldr r0, L_021fe748
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r1, L_021fe754
    ldr r2, L_021fe758
    add r0, r4, #0x2cc
    mov r3, #0x0
    bl func_02076004
    ldr r2, L_021fe758
    add r0, r4, #0x2ec
    mov r1, #0x1f4
    mov r3, #0x0
    bl func_02076004
    ldr r2, L_021fe758
    add r0, r4, #0x30c
    mov r1, #0xa
    mov r3, #0x0
    bl func_02076004
    b L_021fe6c4
L_021fe668:
    ldr r3, L_021fe75c
    ldr r0, L_021fe748
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r1, L_021fe760
    ldr r2, L_021fe758
    add r0, r4, #0x2cc
    mov r3, #0x0
    bl func_02076004
    ldr r2, L_021fe758
    add r0, r4, #0x2ec
    mov r1, #0x3e8
    mov r3, #0x0
    bl func_02076004
    ldr r2, L_021fe758
    add r0, r4, #0x30c
    mov r1, #0x64
    mov r3, #0x0
    bl func_02076004
L_021fe6c4:
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x1
    mov r2, #0x4000
    bl func_02072048
    mov r1, #0x10
    str r1, [r4, #0x33c]
    str r1, [r4, #0x338]
    ldr r0, L_021fe764
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetTextGridObjectMode
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    add r0, sp, #0x4
    bic r1, r1, #0xe000
    orr r1, r1, #0x8000
    str r1, [r2, #0x0]
    ldrh r1, [r2, #0x4a]
    bic r1, r1, #0x3f00
    orr r1, r1, #0x1f00
    strh r1, [r2, #0x4a]
    ldrh r1, [r2, #0x4a]
    bic r1, r1, #0x3f
    orr r1, r1, #0x3e
    strh r1, [r2, #0x4a]
    ldr r1, [r4, #0x48]
    orr r1, r1, #0x3
    str r1, [r4, #0x48]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe744: .word 0xb105
L_021fe748: .word data_020f4e18
L_021fe74c: .word 0xb109
L_021fe750: .word 0xb104
L_021fe754: .word 0x1388
L_021fe758: .word 0xff676980
L_021fe75c: .word 0xb108
L_021fe760: .word 0x2710
L_021fe764: .word data_020f4e14
.size func_ov030_021fe554, .-func_ov030_021fe554
