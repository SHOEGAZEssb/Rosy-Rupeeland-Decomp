; Matching retail form; see src/game/bg2_tile_layer.c.
.text
.extern data_020dea9c
.extern func_02029e90

    .global func_0202a8b4
    .type func_0202a8b4, @function
func_0202a8b4: ; 0x0202a8b4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02029e90
    ldr r1, .L_0202a8e0
    mov r0, r4
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202a8e0: .word data_020dea9c
    .size func_0202a8b4, . - func_0202a8b4

