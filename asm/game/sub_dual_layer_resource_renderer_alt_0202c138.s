; Matching retail form; see src/game/sub_dual_layer_resource_renderer_alt.c.
.text
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern func_020b44e8
.extern func_02070eac
.extern func_02072000
.extern func_020706c4
.extern func_02070874
.extern MIi_CpuCopy16
.extern func_02029914
.extern GraphicsResourceSet_Destroy
.extern data_020f4e18

    .global func_0202c138
    .type func_0202c138, @function
func_0202c138: ; 0x0202c138
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r5, .L_0202c2f4
    ldr r3, .L_0202c2f8
    ldrh r2, [r5, #0x0]
    ldr r1, .L_0202c2fc
    add r0, sp, #0x4
    and r2, r2, #0x43
    orr r2, r2, #0x5800
    strh r2, [r5, #0x0]
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0xc]
    mov r2, r1
    bl func_02070eac
    mov r2, r5
    ldrh r1, [r2, #0x0]
    sub r3, r2, #0x8
    add r0, sp, #0x4
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2, #0x0]
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov r5, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r5, #0x1
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    bl func_02072000
    ldr r5, .L_0202c300
    ldr r3, .L_0202c304
    ldrh r2, [r5, #0x0]
    ldr r1, .L_0202c2fc
    add r0, sp, #0x4
    and r2, r2, #0x43
    orr r2, r2, #0xa10
    orr r2, r2, #0x5000
    strh r2, [r5, #0x0]
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x0
    ldr r0, [r0, #0x24]
    b .L_0202c248
.L_0202c21c:
    ldrh r3, [r0, #0x0]
    add r1, r1, #0x1
    mov r2, r3, lsl #0x10
    mov r2, r2, lsr #0x1c
    add r2, r2, #0x6
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r3, r3, #0xf000
    mov r2, r2, lsl #0x1c
    orr r2, r3, r2, lsr #0x10
    strh r2, [r0], #0x2
.L_0202c248:
    ldr r2, [sp, #0xc]
    ldr r2, [r2, #0x20]
    ldr r3, [r2, #0xc]
    ldr r2, [r2, #0x10]
    mul r2, r3, r2
    cmp r1, r2
    blt .L_0202c21c
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070eac
    ldr r5, [r4, #0x14]
    ldr r0, [sp, #0x8]
    bl func_02070874
    add r1, r5, #0x140
    add r0, r0, #0x80
    mov r2, #0xc0
    bl MIi_CpuCopy16
    mov r0, r4
    bl func_02029914
    ldr r2, .L_0202c300
    add r0, sp, #0x4
    ldrh r1, [r2, #0x0]
    sub r3, r2, #0xa
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2, #0x0]
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r4, #0x2
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0202c2f4: .word 0x4001008
.L_0202c2f8: .word 0xa014
.L_0202c2fc: .word data_020f4e18
.L_0202c300: .word 0x400100a
.L_0202c304: .word 0xa017
    .size func_0202c138, . - func_0202c138
