; Matching retail form; see src/game/bg2_tile_layer.c.
.text
.extern func_0202a950
.extern func_0202a97c

    .global func_0202a8e4
    .type func_0202a8e4, @function
func_0202a8e4: ; 0x0202a8e4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1000
    ldrb r1, [r0, #0x31]
    cmp r1, #0x1
    beq .L_0202a908
    cmp r1, #0x2
    beq .L_0202a92c
    ldmia sp!, {r4, pc}
.L_0202a908:
    ldr r2, [r0, #0x3c]
    ldr r3, [r0, #0x38]
    mov r0, #0x1
    mov r1, #0x0
    bl func_0202a950
    add r0, r4, #0x1000
    mov r1, #0x0
    strh r1, [r0, #0x34]
    ldmia sp!, {r4, pc}
.L_0202a92c:
    ldr r2, [r0, #0x3c]
    ldr r3, [r0, #0x38]
    mov r0, #0x1
    mov r1, #0x0
    bl func_0202a97c
    add r0, r4, #0x1000
    mov r1, #0x0
    strh r1, [r0, #0x34]
    ldmia sp!, {r4, pc}
    .size func_0202a8e4, . - func_0202a8e4

