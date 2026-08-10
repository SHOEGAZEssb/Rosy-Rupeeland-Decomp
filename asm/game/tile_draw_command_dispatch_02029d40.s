; Matching retail form; see src/game/tile_draw_command_dispatch.c.
.text
.extern ByteTileMapOwner_SetCell

    .global func_02029d40
    .type func_02029d40, @function
func_02029d40: ; 0x02029d40
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r3
    ldr r4, [r10, #0x0]
    ldr r3, [r10, #0x4]
    add r5, r1, r4
    str r0, [sp, #0x4]
    add r6, r2, r3
    ldr r11, [r10, #0x10]
    ldr r4, [r10, #0x14]
    mov r7, #0x0
    b .L_02029de4
.L_02029d70:
    mov r8, #0x0
    add r9, r6, r7
    b .L_02029dd8
.L_02029d7c:
    str r9, [sp, #0x0]
    ldr r2, [r10, #0x8]
    ldr r1, [r10, #0xc]
    ldr r0, [sp, #0x4]
    add r2, r2, r8
    ldr ip, [r0, #0x0]
    add r1, r1, r7
    add r1, r2, r1, lsl #0x4
    mov r2, r1, lsl #0x10
    ldr r3, [r10, #0x18]
    ldr ip, [ip, #0x30]
    and r1, r3, #0x3
    mov r2, r2, lsr #0x10
    add r3, r5, r8
    blx ip
    ldr r3, [r10, #0x18]
    ldr r0, [sp, #0x4]
    and r3, r3, #0x7c
    add r1, r5, r8
    mov r2, r9
    mov r3, r3, lsr #0x2
    bl ByteTileMapOwner_SetCell
    add r8, r8, #0x1
.L_02029dd8:
    cmp r8, r11
    blt .L_02029d7c
    add r7, r7, #0x1
.L_02029de4:
    cmp r7, r4
    blt .L_02029d70
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_02029d40, . - func_02029d40

