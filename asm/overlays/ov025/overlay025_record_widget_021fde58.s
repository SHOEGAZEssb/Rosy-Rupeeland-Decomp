.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_widget.c. */
.extern data_020f4e14
.extern GraphicsSpriteCanvas_FillRect


    .global func_ov025_021fde58
func_ov025_021fde58:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r1, [r0, #0x78]
    mov r0, #0x3c
    mul r2, r1, r0
    add r0, r2, #0x30
    str r0, [sp, #0x0]
    mov r1, #0x0
    ldr r0, L_021fde9c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    add r2, r2, #0x14
    mov r1, #0x40
    mov r3, #0xc0
    bl GraphicsSpriteCanvas_FillRect
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
L_021fde9c: .word data_020f4e14
.size func_ov025_021fde58, .-func_ov025_021fde58

