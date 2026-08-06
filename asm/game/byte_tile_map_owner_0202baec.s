; Matching retail form; see src/game/byte_tile_map_owner.c.
.text
.extern func_0202b4c0
.extern func_0202b3f0

    .global func_0202baec
    .type func_0202baec, @function
func_0202baec: ; 0x0202baec
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r1
    mov r6, r0
    mov r4, r2
    bmi .L_0202bb20
    ldr r0, [r6, #0x20]
    mov r1, r0, lsl #0x10
    cmp r5, r1, lsr #0x10
    bhs .L_0202bb20
    cmp r4, #0x0
    blt .L_0202bb20
    cmp r4, r0, lsr #0x10
    blo .L_0202bb28
.L_0202bb20:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_0202bb28:
    add r0, r6, #0xc
    bl func_0202b4c0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x20]
    add r0, r6, #0xc
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mla r1, r4, r1, r5
    bl func_0202b3f0
    cmp r0, #0x80
    subhs r0, r0, #0x100
    ldmia sp!, {r4, r5, r6, pc}
    .size func_0202baec, . - func_0202baec
