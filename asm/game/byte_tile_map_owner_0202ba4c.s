; Matching retail form; see src/game/byte_tile_map_owner.c.
.text
.extern NclFile_Destroy
.extern CompressedByteBuffer_Destroy
.extern func_0202b4e4

    .global func_0202ba4c
    .type func_0202ba4c, @function
func_0202ba4c: ; 0x0202ba4c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10
    bl NclFile_Destroy
    add r0, r4, #0xc
    bl CompressedByteBuffer_Destroy
    add r0, r4, #0x4
    bl func_0202b4e4
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202ba4c, . - func_0202ba4c
