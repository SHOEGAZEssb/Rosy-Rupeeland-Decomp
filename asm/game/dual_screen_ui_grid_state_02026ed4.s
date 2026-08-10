; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text
.extern data_020c3704
.extern GraphicsSpriteState_SetAnimationIndex

    .global func_02026ed4
    .type func_02026ed4, @function
func_02026ed4: ; 0x02026ed4
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, .L_02026f34
    mov r6, r0
    mov r5, #0x0
.L_02026ee4:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x14]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02026f24
    add r1, r6, r5
    ldrb r1, [r1, #0x90]
    ldrb r1, [r4, r1]
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r6, r5, lsl #0x2
    ldr r1, [r0, #0x14]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_02026f24:
    add r5, r5, #0x1
    cmp r5, #0x14
    blt .L_02026ee4
    ldmia sp!, {r4, r5, r6, pc}
.L_02026f34: .word data_020c3704
    .size func_02026ed4, . - func_02026ed4
