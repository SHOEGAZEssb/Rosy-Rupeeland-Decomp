; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text
.extern func_020264b0

    .global func_020264c4
    .type func_020264c4, @function
func_020264c4: ; 0x020264c4
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r1, #0x0
    mvn r0, #0x0
    strh r0, [r4, #0x74]
    mov r2, r1
    mov r3, r1
    strh r1, [r4, #0x76]
    mov ip, #0x1800
    add r0, r4, #0x7c
    str ip, [sp, #0x0]
    bl func_020264b0
    mov r1, #0x0
    strb r1, [r4, #0x8c]
    strb r1, [r4, #0x8d]
    mov r0, r4
    str r1, [r4, #0x0]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
    .size func_020264c4, . - func_020264c4
