; Matching retail form; see src/game/owned_tile_buffer.c.
.text
.extern func_02029e64

    .global func_02029e44
    .type func_02029e44, @function
func_02029e44: ; 0x02029e44
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    beq .L_02029e5c
    bl func_02029e64
.L_02029e5c:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02029e44, . - func_02029e44

