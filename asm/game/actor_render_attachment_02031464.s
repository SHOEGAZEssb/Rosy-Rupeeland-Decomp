; Matching retail form; see src/game/actor_render_attachment.c.
.text
.extern GraphicsSpriteState_ReleaseFromGroup

    .global func_02031464
    .type func_02031464, @function
func_02031464: ; 0x02031464
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl GraphicsSpriteState_ReleaseFromGroup
    mov r0, #0x0
    str r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
    .size func_02031464, . - func_02031464

