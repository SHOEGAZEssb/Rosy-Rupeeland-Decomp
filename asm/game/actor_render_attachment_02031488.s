; Matching retail form; see src/game/actor_render_attachment.c.
.text
.extern GraphicsSpriteState_ReleaseFromGroup

    .global func_02031488
    .type func_02031488, @function
func_02031488: ; 0x02031488
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl GraphicsSpriteState_ReleaseFromGroup
    mov r0, #0x0
    str r0, [r4, #0x58]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x1
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
    .size func_02031488, . - func_02031488

