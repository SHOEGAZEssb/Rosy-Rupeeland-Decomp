; Matching retail form; see src/game/bg2_tile_layer.c.
.text


    .global Bg2TileLayer_SetSubControl
    .type Bg2TileLayer_SetSubControl, @function
Bg2TileLayer_SetSubControl: ; 0x0202a97c
    stmdb sp!, {r3, lr}
    ldr lr, .L_0202a9a4
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
.L_0202a9a4: .word 0x400100c
    .size Bg2TileLayer_SetSubControl, . - Bg2TileLayer_SetSubControl

