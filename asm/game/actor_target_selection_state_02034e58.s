; Matching retail form; see src/game/actor_target_selection_state.c.
.text
.extern data_021052fc
.extern data_0210568c
.extern data_02105690

    .global func_02034e58
    .type func_02034e58, @function
func_02034e58: ; 0x02034e58
    mov r1, #0x0
    ldr r0, .L_02034e9c
    mov r3, r1
.L_02034e64:
    str r3, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0xa
    blt .L_02034e64
    ldr r1, .L_02034ea0
    mvn r2, #0x0
    strh r3, [r1, #0x2]
    ldr r0, .L_02034ea4
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r3, [r0, #0x278]
    bx lr
.L_02034e9c: .word data_02105690
.L_02034ea0: .word data_0210568c
.L_02034ea4: .word data_021052fc
    .size func_02034e58, . - func_02034e58

    .global func_02034ea8

