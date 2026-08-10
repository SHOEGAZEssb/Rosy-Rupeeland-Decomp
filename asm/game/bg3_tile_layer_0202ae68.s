; Matching retail form; see src/game/bg3_tile_layer.c.
.text
.extern OS_Halt

    .global Bg3TileLayer_IsVisible
    .type Bg3TileLayer_IsVisible, @function
Bg3TileLayer_IsVisible: ; 0x0202ae68
    stmdb sp!, {r3, lr}
    add r0, r0, #0x1000
    ldrb r1, [r0, #0x31]
    cmp r1, #0x1
    beq .L_0202ae88
    cmp r1, #0x2
    beq .L_0202ae94
    b .L_0202aea0
.L_0202ae88:
    ldrh r0, [r0, #0x32]
    and r0, r0, #0x800
    ldmia sp!, {r3, pc}
.L_0202ae94:
    ldrh r0, [r0, #0x32]
    and r0, r0, #0x800
    ldmia sp!, {r3, pc}
.L_0202aea0:
    bl OS_Halt
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size Bg3TileLayer_IsVisible, . - Bg3TileLayer_IsVisible

