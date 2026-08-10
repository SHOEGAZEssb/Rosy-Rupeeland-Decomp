; Matching retail form; see src/game/byte_tile_map_owner.c.
.text

    .global ByteTileMapOwner_ReturnZero
    .type ByteTileMapOwner_ReturnZero, @function
ByteTileMapOwner_ReturnZero: ; 0x0202bbd8
    stmdb sp!, {r3}
    sub sp, sp, #0x4
    mov r0, #0x0
    str r0, [sp, #0x0]
    add sp, sp, #0x4
    ldmia sp!, {r3}
    bx lr
    .size ByteTileMapOwner_ReturnZero, . - ByteTileMapOwner_ReturnZero
