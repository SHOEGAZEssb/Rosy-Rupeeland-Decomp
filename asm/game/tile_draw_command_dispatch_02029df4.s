; Matching retail form; see src/game/tile_draw_command_dispatch.c.
.text


    .global func_02029df4
    .type func_02029df4, @function
func_02029df4: ; 0x02029df4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    b .L_02029e2c
.L_02029e0c:
    mov r0, r7
    ldr ip, [r0, #0x0]
    mov r1, r6
    ldr ip, [ip, #0x38]
    mov r2, r5
    mov r3, r4
    blx ip
    add r4, r4, #0x1c
.L_02029e2c:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    ldreq r0, [r4, #0x14]
    cmpeq r0, #0x0
    bne .L_02029e0c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_02029df4, . - func_02029df4

