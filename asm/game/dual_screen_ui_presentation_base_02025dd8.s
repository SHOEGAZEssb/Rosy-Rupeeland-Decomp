; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern ExtendedPaletteBuffer_Write
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern gSubBgExtendedPaletteBuffer
.extern func_02070874
.extern func_02070eac

    .global func_02025dd8
    .type func_02025dd8, @function
func_02025dd8: ; 0x02025dd8
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_02025e74
    ldr r0, .L_02025e78
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x4
    add r0, sp, #0x4
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    ldr r3, .L_02025e7c
    mov r1, #0x2
    ldrh r0, [r3, #0x0]
    mov r2, #0x0
    and r0, r0, #0x43
    orr r0, r0, #0x1c80
    strh r0, [r3, #0x0]
    ldrh r0, [r3, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r3, #0x0]
    ldr r0, [sp, #0xc]
    bl func_02070eac
    ldr r0, [sp, #0x8]
    bl func_02070874
    mov r1, r0
    ldr r0, .L_02025e80
    mov r2, #0x4000
    mov r3, #0x200
    bl ExtendedPaletteBuffer_Write
    ldr r1, .L_02025e84
    mov r2, #0x0
    add r0, sp, #0x4
    str r2, [r1, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_02025e74: .word 0x802a
.L_02025e78: .word data_020f4e18
.L_02025e7c: .word 0x400100c
.L_02025e80: .word gSubBgExtendedPaletteBuffer
.L_02025e84: .word 0x4001018
    .size func_02025dd8, . - func_02025dd8
