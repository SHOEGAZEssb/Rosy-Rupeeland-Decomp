; Matching retail form; see src/game/bg3_extended_tile_layer.c.
.text
.extern func_0202ac4c
.extern func_0202ac78

    .global func_0202b164
    .type func_0202b164, @function
func_0202b164: ; 0x0202b164
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
    bl func_0202ac4c
    ldmia sp!, {r3, pc}
.L_0202b19c:
    mov r0, #0x1
    ldr r2, [r1, #0x3c]
    ldr r3, [r1, #0x38]
    mov r1, r0
    bl func_0202ac78
    ldmia sp!, {r3, pc}
    .size func_0202b164, . - func_0202b164

