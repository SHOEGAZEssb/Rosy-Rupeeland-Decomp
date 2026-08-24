.text

/* Exact fallback; see src/overlays/ov032/overlay032_child_controller_base.c for documented portable C. */
.extern GraphicsSpriteState_ApplyRenderConfig

    .global func_ov032_022014c0
func_ov032_022014c0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    str r1, [r4, #0x10]
    str r2, [r4, #0x14]
    ldr r0, [sp, #0x1c]
    ldr ip, [sp, #0x20]
    str r0, [sp, #0x0]
    mov r2, r3
    ldr r0, [sp, #0x24]
    str ip, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x18]
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [sp, #0x28]
    str r0, [r4, #0x2c]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.size func_ov032_022014c0, .-func_ov032_022014c0

