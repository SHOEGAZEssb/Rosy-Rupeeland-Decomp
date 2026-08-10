; Matching retail form; see src/game/byte_tile_map_owner.c.
.text
.extern func_0202b4d4
.extern CompressedByteBuffer_Init
.extern NclFile_Init
.extern gByteTileMapOwnerVtable

    .global ByteTileMapOwner_Init
    .type ByteTileMapOwner_Init, @function
ByteTileMapOwner_Init: ; 0x0202b9dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_0202ba48
    add r0, r4, #0x4
    str r1, [r4, #0x0]
    bl func_0202b4d4
    add r0, r4, #0xc
    bl CompressedByteBuffer_Init
    add r0, r4, #0x10
    bl NclFile_Init
    ldr r1, [r4, #0x24]
    mov r0, #0x10000
    bic r1, r1, #0x1
    str r1, [r4, #0x24]
    ldr r1, [r4, #0x24]
    rsb r0, r0, #0x0
    orr r1, r1, #0x2
    str r1, [r4, #0x24]
    ldr r2, [r4, #0x20]
    mov r1, #0x0
    and r2, r2, r0
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0x20]
    mov r0, r4
    str r1, [r4, #0x1c]
    ldmia sp!, {r4, pc}
.L_0202ba48: .word gByteTileMapOwnerVtable
    .size ByteTileMapOwner_Init, . - ByteTileMapOwner_Init
