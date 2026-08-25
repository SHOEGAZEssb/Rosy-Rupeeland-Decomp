; Matching retail form; see src/game/actor_collection_category_build.c.
.text

    .global Actor_GetCategorizationHeight
    .type Actor_GetCategorizationHeight, @function
Actor_GetCategorizationHeight: ; 0x0202ddc4
    ldrsb r1, [r0, #0xb]
    ldrsb r0, [r0, #0x9]
    sub r0, r1, r0
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    bx lr
    .size Actor_GetCategorizationHeight, . - Actor_GetCategorizationHeight
