; Matching retail form; see src/game/tile_layer_state_lifecycle.c.
.text
.extern data_020deb1c
.extern func_02029f2c

    .global func_02029e90
    .type func_02029e90, @function
func_02029e90: ; 0x02029e90
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, .L_02029ed0
    mov r6, r0
    str ip, [r6, #0x0]
    add ip, r6, #0x1000
    mov lr, #0x0
    str lr, [ip, #0x8]
    mov r5, r2
    mov r4, r3
    str lr, [ip, #0xc]
    bl func_02029f2c
    add r1, r6, #0x1000
    str r5, [r1, #0x38]
    mov r0, r6
    str r4, [r1, #0x3c]
    ldmia sp!, {r4, r5, r6, pc}
.L_02029ed0: .word data_020deb1c
    .size func_02029e90, . - func_02029e90

