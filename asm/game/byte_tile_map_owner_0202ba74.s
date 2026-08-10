; Matching retail form; see src/game/byte_tile_map_owner.c.
.text
.extern NclFile_Destroy
.extern CompressedByteBuffer_Destroy
.extern SizedCompressedBuffer_Destroy
.extern Heap_Free

    .global ByteTileMapOwner_DestroyAndFree
    .type ByteTileMapOwner_DestroyAndFree, @function
ByteTileMapOwner_DestroyAndFree: ; 0x0202ba74
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10
    bl NclFile_Destroy
    add r0, r4, #0xc
    bl CompressedByteBuffer_Destroy
    add r0, r4, #0x4
    bl SizedCompressedBuffer_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size ByteTileMapOwner_DestroyAndFree, . - ByteTileMapOwner_DestroyAndFree
