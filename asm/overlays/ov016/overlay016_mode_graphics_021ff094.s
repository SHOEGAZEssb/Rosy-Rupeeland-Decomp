    .text

/* Exact fallback; see src/overlays/ov016/overlay016_mode_graphics.c. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern data_020f4e18
    .extern func_02070f80
    .extern func_02072048
    .extern func_020925f8
    .extern func_02092638
    .extern func_020b44e8
    .extern func_ov016_021fd188
    .extern func_ov016_021ff04c
    .extern func_ov016_021ff068
.global func_ov016_021ff094
func_ov016_021ff094:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r0, #0x0
    bl func_ov016_021ff04c
    mov r0, #0x0
    mov ip, #0x1c
    mov r1, r0
    mov r2, #0x1e
    mov r3, #0x4
    str ip, [r4, #0x48]
    bl func_ov016_021ff068
    bl func_020925f8
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021ff170
    ldr r1, L_021ff174
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl func_02070f80
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x100
    bl func_02072048
    ldr r3, L_021ff178
    ldr r1, L_021ff174
    str r3, [sp, #0x0]
    sub r2, r3, #0x5
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x4
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl func_02072048
    ldr r0, [r4, #0x444]
    bl func_ov016_021fd188
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021ff170: .word 0x8006
L_021ff174: .word data_020f4e18
L_021ff178: .word 0x8017

    .size func_ov016_021ff094, . - func_ov016_021ff094
