; Matching retail form; see src/game/actor_render_attachment.c.
.text
.extern GraphicsSpriteState_ReleaseFromGroup

    .global Actor_ReleasePrimaryRenderAttachment
    .type Actor_ReleasePrimaryRenderAttachment, @function
Actor_ReleasePrimaryRenderAttachment: ; 0x02031464
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl GraphicsSpriteState_ReleaseFromGroup
    mov r0, #0x0
    str r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
    .size Actor_ReleasePrimaryRenderAttachment, . - Actor_ReleasePrimaryRenderAttachment

