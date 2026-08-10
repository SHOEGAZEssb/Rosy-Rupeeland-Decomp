; Matching retail form; see src/game/bg3_extended_tile_layer.c.
.text
.extern Bg3TileLayer_SetMainControl
.extern Bg3TileLayer_SetSubControl

    .global Bg3ExtendedTileLayer_ConfigureControl
    .type Bg3ExtendedTileLayer_ConfigureControl, @function
Bg3ExtendedTileLayer_ConfigureControl: ; 0x0202b164
    stmdb sp!, {r3, lr}
    add r1, r0, #0x1000
    ldrb r0, [r1, #0x31]
    cmp r0, #0x1
    beq .L_0202b184
    cmp r0, #0x2
    beq .L_0202b19c
    ldmia sp!, {r3, pc}
.L_0202b184:
    mov r0, #0x1
    ldr r2, [r1, #0x3c]
    ldr r3, [r1, #0x38]
    mov r1, r0
    bl Bg3TileLayer_SetMainControl
    ldmia sp!, {r3, pc}
.L_0202b19c:
    mov r0, #0x1
    ldr r2, [r1, #0x3c]
    ldr r3, [r1, #0x38]
    mov r1, r0
    bl Bg3TileLayer_SetSubControl
    ldmia sp!, {r3, pc}
    .size Bg3ExtendedTileLayer_ConfigureControl, . - Bg3ExtendedTileLayer_ConfigureControl

