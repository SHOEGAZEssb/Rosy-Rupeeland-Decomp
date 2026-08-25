; Matching retail form; see src/game/owned_tile_buffer.c.
.text
.extern Heap_FreeAlternateEntry

    .global OwnedTileBuffer_Clear
    .type OwnedTileBuffer_Clear, @function
OwnedTileBuffer_Clear: ; 0x02029e64
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02029e84
    bl Heap_FreeAlternateEntry
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_02029e84:
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
    .size OwnedTileBuffer_Clear, . - OwnedTileBuffer_Clear

