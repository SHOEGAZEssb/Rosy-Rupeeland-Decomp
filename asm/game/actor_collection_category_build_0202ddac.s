; Matching retail form; see src/game/actor_collection_category_build.c.
.text

    .global Actor_GetCategorizationWidth
    .type Actor_GetCategorizationWidth, @function
Actor_GetCategorizationWidth: ; 0x0202ddac
    ldrsb r1, [r0, #0xa]
    ldrsb r0, [r0, #0x8]
    sub r0, r1, r0
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    bx lr
    .size Actor_GetCategorizationWidth, . - Actor_GetCategorizationWidth
