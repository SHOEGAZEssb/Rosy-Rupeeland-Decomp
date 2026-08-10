; Matching retail form; see src/game/byte_tile_map_owner.c.
.text
.extern NclFile_Destroy
.extern CompressedByteBuffer_Destroy
.extern func_0202b4e4
.extern Heap_Free

    .global func_0202ba74
    .type func_0202ba74, @function
func_0202ba74: ; 0x0202ba74
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10
    bl NclFile_Destroy
    add r0, r4, #0xc
    bl CompressedByteBuffer_Destroy
    add r0, r4, #0x4
    bl func_0202b4e4
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202ba74, . - func_0202ba74
