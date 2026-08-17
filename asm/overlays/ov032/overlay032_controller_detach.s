.text

/* Exact fallback; see src/overlays/ov032/overlay032_child_controller_base.c for documented portable C. */
.extern GraphicsArchiveResource_ReleaseAlternateBuffer
.extern GraphicsSpriteGroup_ReleaseState

    .global func_ov032_0220147c
func_ov032_0220147c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    ldrne r1, [r4, #0x0]
    cmpne r1, #0x0
    beq L_0220149c
    bl GraphicsSpriteGroup_ReleaseState
L_0220149c:
    mov r0, #0x0
    str r0, [r4, #0x0]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ldrne r0, [r0, #0x4]
    cmpne r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl GraphicsArchiveResource_ReleaseAlternateBuffer
    ldmia sp!, {r4, pc}
.size func_ov032_0220147c, .-func_ov032_0220147c

