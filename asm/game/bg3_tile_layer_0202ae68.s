; Matching retail form; see src/game/bg3_tile_layer.c.
.text
.extern OS_Halt

    .global func_0202ae68
    .type func_0202ae68, @function
func_0202ae68: ; 0x0202ae68
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
    .size func_0202ae68, . - func_0202ae68

