; Matching retail form; see src/game/bg2_extended_tile_layer.c.
.text
.extern func_0202a950
.extern func_0202a97c

    .global func_0202aedc
    .type func_0202aedc, @function
func_0202aedc: ; 0x0202aedc
    stmdb sp!, {r3, lr}
    add r1, r0, #0x1000
    ldrb r0, [r1, #0x31]
    cmp r0, #0x1
    beq .L_0202aefc
    cmp r0, #0x2
    beq .L_0202af14
    ldmia sp!, {r3, pc}
.L_0202aefc:
    mov r0, #0x1
    ldr r2, [r1, #0x3c]
    ldr r3, [r1, #0x38]
    mov r1, r0
    bl func_0202a950
    ldmia sp!, {r3, pc}
.L_0202af14:
    mov r0, #0x1
    ldr r2, [r1, #0x3c]
    ldr r3, [r1, #0x38]
    mov r1, r0
    bl func_0202a97c
    ldmia sp!, {r3, pc}
    .size func_0202aedc, . - func_0202aedc

