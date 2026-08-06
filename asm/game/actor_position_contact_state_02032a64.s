; Matching retail form; see src/game/actor_position_contact_state.c.
.text
.extern func_020050a4

    .global func_02032a64
    .type func_02032a64, @function
func_02032a64: ; 0x02032a64
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xd0]
    add r0, r4, #0x28
    bic r2, r2, #0x80
    orr r2, r2, #0x200
    str r2, [r4, #0xd0]
    bl func_020050a4
    mov r1, r0
    add r0, r4, #0x18
    bl func_020050a4
    ldmia sp!, {r4, pc}
    .size func_02032a64, . - func_02032a64

