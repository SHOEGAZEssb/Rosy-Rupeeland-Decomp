; Matching retail form; see src/game/animated_tile_staging_buffer.c.
.text
.extern AnimatedTileStagingBuffer_CopyFrom

    .global AnimatedTileStagingBuffer_Assign
    .type AnimatedTileStagingBuffer_Assign, @function
AnimatedTileStagingBuffer_Assign: ; 0x0202b838
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r4, r1
    ldmeqia sp!, {r4, pc}
    bl AnimatedTileStagingBuffer_CopyFrom
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size AnimatedTileStagingBuffer_Assign, . - AnimatedTileStagingBuffer_Assign
