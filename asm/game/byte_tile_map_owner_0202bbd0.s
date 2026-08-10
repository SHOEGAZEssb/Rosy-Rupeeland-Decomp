; Matching retail form; see src/game/byte_tile_map_owner.c.
.text

    .global ByteTileMapOwner_ReturnOne
    .type ByteTileMapOwner_ReturnOne, @function
ByteTileMapOwner_ReturnOne: ; 0x0202bbd0
    mov r0, #0x1
    bx lr
    .size ByteTileMapOwner_ReturnOne, . - ByteTileMapOwner_ReturnOne
