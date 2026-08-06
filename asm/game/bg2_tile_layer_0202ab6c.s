; Matching retail form; see src/game/bg2_tile_layer.c.
.text
.extern OS_Halt

    .global func_0202ab6c
    .type func_0202ab6c, @function
func_0202ab6c: ; 0x0202ab6c
    stmdb sp!, {r3, lr}
    add r0, r0, #0x1000
    ldrb r1, [r0, #0x31]
    cmp r1, #0x1
    beq .L_0202ab8c
    cmp r1, #0x2
    beq .L_0202ab98
    b .L_0202aba4
.L_0202ab8c:
    ldrh r0, [r0, #0x32]
    and r0, r0, #0x400
    ldmia sp!, {r3, pc}
.L_0202ab98:
    ldrh r0, [r0, #0x32]
    and r0, r0, #0x400
    ldmia sp!, {r3, pc}
.L_0202aba4:
    bl OS_Halt
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_0202ab6c, . - func_0202ab6c

