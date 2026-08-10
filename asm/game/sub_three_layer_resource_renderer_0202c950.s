; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern func_020706c4
.extern func_02070eac
.extern func_02070bc4
.extern func_02070874
.extern PaletteBuffer_Write
.extern GraphicsResourceSet_ReleaseHandles
.extern func_02070f80
.extern func_020b44e8
.extern GraphicsResourceSet_Destroy
.extern data_020f4e18
.extern data_020f5058

    .global func_0202c950
    .type func_0202c950, @function
func_0202c950: ; 0x0202c950
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r1, .L_0202cbc4
    ldr r3, .L_0202cbc8
    ldrh r0, [r1, #0x0]
    sub ip, r1, #0xc
    mov r4, #0x0
    and r0, r0, #0x43
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x0]
    ldrh r5, [r1, #0x0]
    ldr r2, .L_0202cbcc
    add r0, sp, #0x4
    bic r5, r5, #0x3
    orr r5, r5, #0x2
    strh r5, [r1, #0x0]
    ldr r6, [ip, #0x0]
    ldr r5, [ip, #0x0]
    and r6, r6, #0x1f00
    mov lr, r6, lsr #0x8
    bic r6, r5, #0x1f00
    orr r5, lr, #0x4
    orr r5, r6, r5, lsl #0x8
    str r5, [ip, #0x0]
    str r4, [r1, #0xc]
    str r3, [sp, #0x0]
    ldr r1, [r2, #0x0]
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, r4
    bl func_020706c4
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, r4
    bl func_02070eac
    ldr r0, [sp, #0x8]
    mov r1, r4
    bl func_02070bc4
    ldr r0, [sp, #0x8]
    bl func_02070874
    mov r1, r0
    ldr r0, .L_0202cbd0
    mov r2, r4
    mov r3, #0xc0
    bl PaletteBuffer_Write
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    ldr r0, .L_0202cbd4
    ldrh r1, [r0, #0x0]
    sub r3, r0, #0xa
    and r1, r1, #0x43
    orr r1, r1, #0x1a00
    strh r1, [r0, #0x0]
    ldrh r1, [r0, #0x0]
    bic r1, r1, #0x3
    orr r1, r1, #0x2
    strh r1, [r0, #0x0]
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r4, #0x2
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    ldr r3, .L_0202cbc8
    mov r1, #0x0
    str r1, [r0, #0xa]
    ldr r0, .L_0202cbcc
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    add r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x6
    bl func_02070f80
    bl func_020b44e8
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070eac
    ldr r0, [sp, #0x8]
    mov r1, #0xc0
    bl func_02070bc4
    ldr r0, [sp, #0x8]
    bl func_02070874
    mov r1, r0
    mov r2, #0xc0
    ldr r0, .L_0202cbd0
    mov r3, r2
    bl PaletteBuffer_Write
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    ldr r1, .L_0202cbd8
    mov ip, #0x0
    ldrh r0, [r1, #0x0]
    sub r5, r1, #0xe
    ldr r3, .L_0202cbdc
    and r0, r0, #0x43
    orr r0, r0, #0x208
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x0]
    ldrh r4, [r1, #0x0]
    ldr r2, .L_0202cbcc
    add r0, sp, #0x4
    bic r4, r4, #0x3
    orr r4, r4, #0x2
    strh r4, [r1, #0x0]
    ldr r4, [r5, #0x0]
    ldr lr, [r5, #0x0]
    and r4, r4, #0x1f00
    mov r6, r4, lsr #0x8
    bic r4, lr, #0x1f00
    orr lr, r6, #0x8
    orr r4, r4, lr, lsl #0x8
    str r4, [r5, #0x0]
    str ip, [r1, #0xe]
    str r3, [sp, #0x0]
    ldr r1, [r2, #0x0]
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0xc]
    mov r1, #0xc
    bl func_02070f80
    bl func_020b44e8
    ldr r0, [sp, #0xc]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02070eac
    ldr r0, [sp, #0x8]
    mov r1, #0x180
    bl func_02070bc4
    ldr r0, [sp, #0x8]
    bl func_02070874
    mov r1, r0
    ldr r0, .L_0202cbd0
    mov r2, #0x180
    mov r3, #0x80
    bl PaletteBuffer_Write
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0202cbc4: .word 0x400100c
.L_0202cbc8: .word 0xa105
.L_0202cbcc: .word data_020f4e18
.L_0202cbd0: .word data_020f5058
.L_0202cbd4: .word 0x400100a
.L_0202cbd8: .word 0x400100e
.L_0202cbdc: .word 0xa10d
    .size func_0202c950, . - func_0202c950
