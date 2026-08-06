; Matching retail form; see src/game/byte_tile_map_owner.c.
.text
.extern func_0202b4d4
.extern func_0202b3bc
.extern func_0200542c
.extern data_020deb5c

    .global func_0202b9dc
    .type func_0202b9dc, @function
func_0202b9dc: ; 0x0202b9dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_0202ba48
    add r0, r4, #0x4
    str r1, [r4, #0x0]
    bl func_0202b4d4
    add r0, r4, #0xc
    bl func_0202b3bc
    add r0, r4, #0x10
    bl func_0200542c
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
.L_0202ba48: .word data_020deb5c
    .size func_0202b9dc, . - func_0202b9dc
