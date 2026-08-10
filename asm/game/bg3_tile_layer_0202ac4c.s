; Matching retail form; see src/game/bg3_tile_layer.c.
.text


    .global Bg3TileLayer_SetMainControl
    .type Bg3TileLayer_SetMainControl, @function
Bg3TileLayer_SetMainControl: ; 0x0202ac4c
    stmdb sp!, {r3, lr}
    ldr lr, .L_0202ac74
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
.L_0202ac74: .word 0x400000e
    .size Bg3TileLayer_SetMainControl, . - Bg3TileLayer_SetMainControl

