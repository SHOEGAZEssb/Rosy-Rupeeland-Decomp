; Matching retail form; see src/game/actor_runtime_frame_state.c.
.text

    .global func_02031720
    .type func_02031720, @function
func_02031720: ; 0x02031720
    mov r1, #0x0
    strb r1, [r0, #0x4b]
    strb r1, [r0, #0x4a]
    strb r1, [r0, #0x49]
    ldr r1, [r0, #0x10]
    tst r1, #0x2000
    orrne r1, r1, #0x4000
    biceq r1, r1, #0x4000
    str r1, [r0, #0x10]
    bx lr
    .size func_02031720, . - func_02031720

