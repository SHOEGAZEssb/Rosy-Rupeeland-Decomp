; Matching retail form; see src/game/animated_tile_staging_buffer.c.
.text

    .global AnimatedTileStagingBuffer_Init
    .type AnimatedTileStagingBuffer_Init, @function
AnimatedTileStagingBuffer_Init: ; 0x0202b730
    add r1, r0, #0x1000
    mov r2, #0x3
    str r2, [r1, #0x80c]
    mov r2, #0x0
    str r2, [r1, #0x810]
    str r2, [r1, #0x814]
    str r2, [r1, #0x818]
    bx lr
    .size AnimatedTileStagingBuffer_Init, . - AnimatedTileStagingBuffer_Init
