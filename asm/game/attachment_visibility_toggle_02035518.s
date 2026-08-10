; Matching retail form; see src/game/attachment_visibility_toggle.c.
.text

    .global AttachmentController_SetEnabled
    .type AttachmentController_SetEnabled, @function
AttachmentController_SetEnabled: ; 0x02035518
    cmp r1, #0x0
    ldr r1, [r0, #0x4]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    strh r0, [r1, #0x24]
    bx lr
    .size AttachmentController_SetEnabled, . - AttachmentController_SetEnabled

    .global ActorDerivedType1_UpdateFrame

