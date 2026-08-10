; Matching retail form; see src/game/byte_tile_map_owner.c.
.text

    .global ByteTileMapOwner_SetFlag2Enabled
    .type ByteTileMapOwner_SetFlag2Enabled, @function
ByteTileMapOwner_SetFlag2Enabled: ; 0x0202bbf8
    ldr r2, [r0, #0x24]
    mov r1, r1, lsl #0x1f
    bic r2, r2, #0x2
    orr r1, r2, r1, lsr #0x1e
    str r1, [r0, #0x24]
    bx lr
    .size ByteTileMapOwner_SetFlag2Enabled, . - ByteTileMapOwner_SetFlag2Enabled
