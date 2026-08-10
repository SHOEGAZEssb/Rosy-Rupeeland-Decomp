; Matching retail form; see src/game/byte_tile_map_owner.c.
.text
.extern func_0202b4c0
.extern func_0202b3fc

    .global ByteTileMapOwner_SetCell
    .type ByteTileMapOwner_SetCell, @function
ByteTileMapOwner_SetCell: ; 0x0202bb60
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r5, r1
    mov r6, r0
    mov r4, r2
    mov r7, r3
    ldmmiia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x20]
    mov r1, r0, lsl #0x10
    cmp r5, r1, lsr #0x10
    ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r4, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r4, r0, lsr #0x10
    ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, r6, #0xc
    bl func_0202b4c0
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x20]
    mov r0, r7, lsl #0x18
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mla r1, r4, r1, r5
    mov r2, r0, asr #0x18
    add r0, r6, #0xc
    and r2, r2, #0xff
    bl func_0202b3fc
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size ByteTileMapOwner_SetCell, . - ByteTileMapOwner_SetCell
