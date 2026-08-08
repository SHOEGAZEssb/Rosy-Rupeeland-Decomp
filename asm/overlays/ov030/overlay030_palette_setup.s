.text

/* Exact fallback; see src/overlays/ov030/overlay030_palette_setup.c for documented portable C. */
.extern data_020f4e18
.extern func_02070638
.extern func_020706c4
.extern func_02070874
.extern func_02070e0c
.extern func_02070eac
.extern func_020afd0c
.extern func_020b1ff0
.extern func_020b2058
.extern func_020b44e8
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov030_021fe448
func_ov030_021fe448:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe544
    ldr r0, L_021fe548
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0x360]
    bl func_02070874
    add r0, r0, #0x20
    str r0, [r4, #0x330]
    str r0, [r4, #0x32c]
    mov r0, #0x10
    str r0, [r4, #0x334]
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [r4, #0x32c]
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b2058
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070eac
    ldr r0, [r4, #0x32c]
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    mov r3, #0x8
    ldr r0, L_021fe54c
    mov r1, #0x4
    mov r2, #0x18
    str r3, [sp, #0x0]
    bl func_020afd0c
    mov r3, #0x8
    ldr r0, L_021fe550
    mov r1, #0x4
    mov r2, #0x18
    str r3, [sp, #0x0]
    bl func_020afd0c
    mov r0, #0x1c
    str r0, [r4, #0x48]
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fe544: .word 0xc008
L_021fe548: .word data_020f4e18
L_021fe54c: .word 0x4000050
L_021fe550: .word 0x4001050
.size func_ov030_021fe448, .-func_ov030_021fe448
