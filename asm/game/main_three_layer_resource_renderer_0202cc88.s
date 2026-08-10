; Matching retail form; see src/game/main_three_layer_resource_renderer.c.
.text
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern func_02070638
.extern func_02070e0c
.extern func_02070b50
.extern func_02070874
.extern PaletteBuffer_Write
.extern GraphicsResourceSet_ReleaseHandles
.extern func_02070f80
.extern func_020b44e8
.extern GraphicsResourceSet_Destroy
.extern data_020f4e18
.extern gMainBgPaletteBuffer

    .global func_0202cc88
    .type func_0202cc88, @function
func_0202cc88: ; 0x0202cc88
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_0202cef4
    ldr r0, .L_0202cef8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r3, .L_0202cefc
    mov ip, #0x4000000
    ldrh r0, [r3, #0x0]
    mov r2, #0x0
    mov r1, #0x2
    and r0, r0, #0x43
    orr r0, r0, #0x1800
    strh r0, [r3, #0x0]
    ldrh r0, [r3, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r3, #0x0]
    ldr r3, [ip, #0x0]
    ldr r0, [ip, #0x0]
    and r3, r3, #0x1f00
    mov lr, r3, lsr #0x8
    bic r3, r0, #0x1f00
    orr r0, lr, #0x4
    orr r0, r3, r0, lsl #0x8
    str r0, [ip, #0x0]
    str r2, [ip, #0x18]
    ldr r0, [sp, #0x4]
    bl func_02070638
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0x8]
    mov r1, #0x0
    bl func_02070b50
    ldr r0, [sp, #0x8]
    bl func_02070874
    mov r1, r0
    ldr r0, .L_0202cf00
    mov r2, #0x0
    mov r3, #0xc0
    bl PaletteBuffer_Write
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    ldr r3, .L_0202cef4
    ldr r1, .L_0202cef8
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    add r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r1, .L_0202cf04
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x1600
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    mov r0, #0x0
    str r0, [r2, #0x14]
    ldr r0, [sp, #0xc]
    mov r1, #0x6
    bl func_02070f80
    bl func_020b44e8
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0x8]
    mov r1, #0xc0
    bl func_02070b50
    ldr r0, [sp, #0x8]
    bl func_02070874
    mov r1, r0
    mov r2, #0xc0
    ldr r0, .L_0202cf00
    mov r3, r2
    bl PaletteBuffer_Write
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    ldr r3, .L_0202cf08
    ldr r1, .L_0202cef8
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r3, .L_0202cf0c
    mov ip, #0x4000000
    ldrh r0, [r3, #0x0]
    mov r2, #0x0
    mov r1, #0x3
    and r0, r0, #0x43
    orr r0, r0, #0x208
    orr r0, r0, #0x1c00
    strh r0, [r3, #0x0]
    ldrh r0, [r3, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r3, #0x0]
    ldr r3, [ip, #0x0]
    ldr r0, [ip, #0x0]
    and r3, r3, #0x1f00
    mov lr, r3, lsr #0x8
    bic r3, r0, #0x1f00
    orr r0, lr, #0x8
    orr r0, r3, r0, lsl #0x8
    str r0, [ip, #0x0]
    str r2, [ip, #0x1c]
    ldr r0, [sp, #0x4]
    bl func_02070638
    ldr r0, [sp, #0xc]
    mov r1, #0xf
    bl func_02070f80
    bl func_020b44e8
    ldr r0, [sp, #0xc]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0x8]
    mov r1, #0x1e0
    bl func_02070b50
    ldr r0, [sp, #0x8]
    bl func_02070874
    mov r1, r0
    ldr r0, .L_0202cf00
    mov r2, #0x1e0
    mov r3, #0x20
    bl PaletteBuffer_Write
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_0202cef4: .word 0xa109
.L_0202cef8: .word data_020f4e18
.L_0202cefc: .word 0x400000c
.L_0202cf00: .word gMainBgPaletteBuffer
.L_0202cf04: .word 0x400000a
.L_0202cf08: .word 0xa110
.L_0202cf0c: .word 0x400000e
    .size func_0202cc88, . - func_0202cc88
