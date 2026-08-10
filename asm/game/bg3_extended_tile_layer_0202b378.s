; Matching retail form; see src/game/bg3_extended_tile_layer.c.
.text
.extern OS_Halt

    .global Bg3ExtendedTileLayer_IsVisible
    .type Bg3ExtendedTileLayer_IsVisible, @function
Bg3ExtendedTileLayer_IsVisible: ; 0x0202b378
    stmdb sp!, {r3, lr}
    add r0, r0, #0x1000
    ldrb r1, [r0, #0x31]
    cmp r1, #0x1
    beq .L_0202b398
    cmp r1, #0x2
    beq .L_0202b3a4
    b .L_0202b3b0
.L_0202b398:
    ldrh r0, [r0, #0x32]
    and r0, r0, #0x800
    ldmia sp!, {r3, pc}
.L_0202b3a4:
    ldrh r0, [r0, #0x32]
    and r0, r0, #0x800
    ldmia sp!, {r3, pc}
.L_0202b3b0:
    bl OS_Halt
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size Bg3ExtendedTileLayer_IsVisible, . - Bg3ExtendedTileLayer_IsVisible

