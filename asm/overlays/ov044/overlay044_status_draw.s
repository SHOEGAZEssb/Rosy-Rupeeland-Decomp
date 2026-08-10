.text
.extern GraphicsSpriteCanvas_FillRect
.extern GraphicsSpriteRenderer_SetFontResource
.extern func_020791e0
.extern func_020761f8
.extern func_02076148
.extern gDebugFont
.extern data_021f3ecc

    .global func_ov044_0220c74c
func_ov044_0220c74c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r2, #0x16
    mov r4, r1
    str r2, [sp, #0x0]
    mov r1, #0x0
    ldr r2, .L_0220c804
    str r1, [sp, #0x4]
    mov r5, r0
    ldr r0, [r2, #0x0]
    mov r2, #0x6
    mov r3, #0xff
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, .L_0220c804
    ldr r1, [r5, #0x54]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r0, r4, lsl #0x10
    mov r4, r0, lsr #0x10
    ldr r0, .L_0220c808
    mov r1, r4
    bl func_020791e0
    mov r1, r0
    ldr r0, .L_0220c804
    mov r2, #0x8
    ldr r0, [r0, #0x0]
    mov r3, #0x0
    bl func_020761f8
    mov r1, r4
    mov r4, r0
    ldr r0, .L_0220c808
    bl func_020791e0
    rsb r2, r4, #0xf8
    mov r1, r0
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, .L_0220c804
    mov r3, #0x6
    ldr r0, [r0, #0x0]
    bl func_02076148
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0220c804: .word gDebugFont
.L_0220c808: .word data_021f3ecc
.size func_ov044_0220c74c, . - func_ov044_0220c74c
