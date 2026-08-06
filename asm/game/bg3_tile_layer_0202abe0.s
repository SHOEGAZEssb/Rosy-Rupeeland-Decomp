; Matching retail form; see src/game/bg3_tile_layer.c.
.text
.extern func_0202ac4c
.extern func_0202ac78

    .global func_0202abe0
    .type func_0202abe0, @function
func_0202abe0: ; 0x0202abe0
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1000
    ldrb r1, [r0, #0x31]
    cmp r1, #0x1
    beq .L_0202ac04
    cmp r1, #0x2
    beq .L_0202ac28
    ldmia sp!, {r4, pc}
.L_0202ac04:
    ldr r2, [r0, #0x3c]
    ldr r3, [r0, #0x38]
    mov r0, #0x1
    mov r1, #0x0
    bl func_0202ac4c
    add r0, r4, #0x1000
    mov r1, #0x0
    strh r1, [r0, #0x34]
    ldmia sp!, {r4, pc}
.L_0202ac28:
    ldr r2, [r0, #0x3c]
    ldr r3, [r0, #0x38]
    mov r0, #0x1
    mov r1, #0x0
    bl func_0202ac78
    add r0, r4, #0x1000
    mov r1, #0x0
    strh r1, [r0, #0x34]
    ldmia sp!, {r4, pc}
    .size func_0202abe0, . - func_0202abe0

