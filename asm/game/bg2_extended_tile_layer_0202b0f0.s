; Matching retail form; see src/game/bg2_extended_tile_layer.c.
.text
.extern OS_Halt

    .global func_0202b0f0
    .type func_0202b0f0, @function
func_0202b0f0: ; 0x0202b0f0
    stmdb sp!, {r3, lr}
    add r0, r0, #0x1000
    ldrb r1, [r0, #0x31]
    cmp r1, #0x1
    beq .L_0202b110
    cmp r1, #0x2
    beq .L_0202b11c
    b .L_0202b128
.L_0202b110:
    ldrh r0, [r0, #0x32]
    and r0, r0, #0x400
    ldmia sp!, {r3, pc}
.L_0202b11c:
    ldrh r0, [r0, #0x32]
    and r0, r0, #0x400
    ldmia sp!, {r3, pc}
.L_0202b128:
    bl OS_Halt
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_0202b0f0, . - func_0202b0f0

