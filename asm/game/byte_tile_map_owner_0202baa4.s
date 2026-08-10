; Matching retail form; see src/game/byte_tile_map_owner.c.
.text
.extern NclFile_Destroy
.extern func_0202b3c8
.extern func_0202b4e4

    .global func_0202baa4
    .type func_0202baa4, @function
func_0202baa4: ; 0x0202baa4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10
    bl NclFile_Destroy
    add r0, r4, #0xc
    bl func_0202b3c8
    add r0, r4, #0x4
    bl func_0202b4e4
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202baa4, . - func_0202baa4
