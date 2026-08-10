; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern func_020b44e8
.extern func_02070638
.extern func_02070e0c
.extern func_02070874
.extern PaletteBuffer_Write
.extern GraphicsResourceSet_ReleaseHandles
.extern GraphicsResourceSet_Destroy
.extern data_020f4e18
.extern gMainBgPaletteBuffer

    .global func_0202c7c4
    .type func_0202c7c4, @function
func_0202c7c4: ; 0x0202c7c4
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr ip, .L_0202c898
    ldr r3, .L_0202c89c
    ldrh r0, [ip, #0x0]
    mov r4, #0x4000000
    ldr r1, .L_0202c8a0
    and r0, r0, #0x43
    orr r0, r0, #0x8
    orr r0, r0, #0x1800
    strh r0, [ip, #0x0]
    ldrh r5, [ip, #0x0]
    add r0, sp, #0x4
    sub r2, r3, #0x2
    bic r5, r5, #0x3
    orr r5, r5, #0x3
    strh r5, [ip, #0x0]
    ldr lr, [r4, #0x0]
    ldr ip, [r4, #0x0]
    and lr, lr, #0x1f00
    mov r5, lr, lsr #0x8
    bic lr, ip, #0x1f00
    orr ip, r5, #0x1
    orr ip, lr, ip, lsl #0x8
    str ip, [r4, #0x0]
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0x4]
    mov r2, r1
    bl func_02070638
    mov r1, #0x0
    ldr r0, [sp, #0xc]
    mov r2, r1
    bl func_02070e0c
    ldr r0, [sp, #0x8]
    bl func_02070874
    add r1, r0, #0x180
    ldr r0, .L_0202c8a4
    mov r2, #0x180
    mov r3, #0x80
    bl PaletteBuffer_Write
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0202c898: .word 0x4000008
.L_0202c89c: .word 0xa00e
.L_0202c8a0: .word data_020f4e18
.L_0202c8a4: .word gMainBgPaletteBuffer
    .size func_0202c7c4, . - func_0202c7c4
