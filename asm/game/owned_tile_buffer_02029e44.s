; Matching retail form; see src/game/owned_tile_buffer.c.
.text
.extern OwnedTileBuffer_Clear

    .global OwnedTileBuffer_Destroy
    .type OwnedTileBuffer_Destroy, @function
OwnedTileBuffer_Destroy: ; 0x02029e44
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    beq .L_02029e5c
    bl OwnedTileBuffer_Clear
.L_02029e5c:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size OwnedTileBuffer_Destroy, . - OwnedTileBuffer_Destroy

