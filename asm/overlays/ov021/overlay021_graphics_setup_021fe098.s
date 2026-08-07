    .text
/* Exact fallback; see src/overlays/ov021/overlay021_graphics_setup.c. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern func_020706c4
    .extern func_02070874
    .extern func_02070eac
    .extern func_02092b70
    .extern func_020b1ff0
    .extern func_020b44e8

.global func_ov021_021fe098
func_ov021_021fe098:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x400]
    bl func_02070874
    add r0, r0, #0x20
    str r0, [r4, #0x3f4]
    str r0, [r4, #0x3f0]
    mov r0, #0x10
    str r0, [r4, #0x3f8]
    ldr r0, [r4, #0x3f0]
    ldr r1, [r4, #0x3f4]
    mov r2, #0x0
    bl func_02092b70
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe13c
    ldr r1, L_021fe140
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070eac
    ldr r0, [r4, #0x3f0]
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe13c: .word 0xc008
L_021fe140: .word data_020f4e18
    .size func_ov021_021fe098, . - func_ov021_021fe098

