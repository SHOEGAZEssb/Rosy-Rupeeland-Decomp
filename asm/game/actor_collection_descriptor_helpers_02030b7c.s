; Matching retail form; see src/game/actor_collection_descriptor_helpers.c.
.text

    .global func_02030b7c
    .type func_02030b7c, @function
func_02030b7c: ; 0x02030b7c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe78]
    mov r0, r0, lsl #0x1e
    mov r0, r0, asr #0x1f
    bx lr
    .size func_02030b7c, . - func_02030b7c

