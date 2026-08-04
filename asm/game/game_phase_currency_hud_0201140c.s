; Matching retail form; see src/game/game_phase_currency_hud_display.c.
.text
.extern func_02010b78
.extern func_02074110
.extern gGameWork

    .global func_0201140c
func_0201140c: ; 0x0201140c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
    strh r4, [r5, #0xb2]
    cmp r1, #0x0
    beq L_02011444
    ldrh r2, [r5, #0xb0]
    ldr r1, L_0201146c
    bic r2, r2, #0x1
    strh r2, [r5, #0xb0]
    ldr r1, [r1, #0x0]
    ldr r1, [r1, #0x40]
    bl func_02010b78
    ldmia sp!, {r3, r4, r5, pc}
L_02011444:
    ldrh r0, [r5, #0xb0]
    orr r0, r0, #0x1
    strh r0, [r5, #0xb0]
    strh r4, [r5, #0xcc]
L_02011454:
    ldr r0, [r5, r4, lsl #0x2]
    bl func_02074110
    add r4, r4, #0x1
    cmp r4, #0x2
    blt L_02011454
    ldmia sp!, {r3, r4, r5, pc}
L_0201146c: .word gGameWork
    .size func_0201140c, . - func_0201140c

