; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text

    .global Actor_SetAttachmentBaseScale
    .type Actor_SetAttachmentBaseScale, @function
Actor_SetAttachmentBaseScale: ; 0x02033f20
    str r1, [r0, #0x1d4]
    str r2, [r0, #0x1d8]
    bx lr
    .size Actor_SetAttachmentBaseScale, . - Actor_SetAttachmentBaseScale

    .global Actor_RefreshTerrainHeightIfEnabled
