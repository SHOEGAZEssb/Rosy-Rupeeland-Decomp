; Matching retail form; see src/game/actor_extended_link_source_motion_gate.c.
.text
.extern func_0200b2c0
.extern func_02032520
.global func_02043eb4
.type func_02043eb4, @function
func_02043eb4: ; 0x02043eb4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x29c]
    tst r1, #0x1
    beq .L_02043f08
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_0200b2c0
    ldmia sp!, {r4, pc}
.L_02043f08:
    bl func_02032520
    ldmia sp!, {r4, pc}
.size func_02043eb4, . - func_02043eb4
