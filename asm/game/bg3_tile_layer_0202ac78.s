; Matching retail form; see src/game/bg3_tile_layer.c.
.text


    .global Bg3TileLayer_SetSubControl
    .type Bg3TileLayer_SetSubControl, @function
Bg3TileLayer_SetSubControl: ; 0x0202ac78
    stmdb sp!, {r3, lr}
    ldr lr, .L_0202aca0
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
.L_0202aca0: .word 0x400100e
    .size Bg3TileLayer_SetSubControl, . - Bg3TileLayer_SetSubControl

