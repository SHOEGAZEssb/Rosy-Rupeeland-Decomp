.text

/* Exact fallback; see src/overlays/ov025/overlay025_graphics_setup.c. */
.extern data_020f4e18
.extern func_02070638
.extern GraphicsBgResourceData_GetDecoded
.extern func_02070e0c
.extern func_02070f34
.extern func_020afd0c
.extern func_020b2058
.extern func_020b44e8
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov025_022000a4
func_ov025_022000a4:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    mov r1, #0x1c
    str r1, [r0, #0x48]
    str r1, [r0, #0x4c]
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_02200168
    ldr r0, L_0220016c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl func_02070f34
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0x8]
    bl GraphicsBgResourceData_GetDecoded
    add r0, r0, #0xa0
    mov r1, #0x100
    mov r2, #0x20
    bl func_020b2058
    mov r3, #0x8
    ldr r0, L_02200170
    mov r1, #0x4
    mov r2, #0x18
    str r3, [sp, #0x0]
    bl func_020afd0c
    mov r3, #0x8
    ldr r0, L_02200174
    mov r1, #0x4
    mov r2, #0x18
    str r3, [sp, #0x0]
    bl func_020afd0c
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
L_02200168: .word 0xc008
L_0220016c: .word data_020f4e18
L_02200170: .word 0x4000050
L_02200174: .word 0x4001050
.size func_ov025_022000a4, .-func_ov025_022000a4

