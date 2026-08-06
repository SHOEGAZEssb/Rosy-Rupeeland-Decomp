; Matching retail form; see src/game/actor_extended_linked_partner_callbacks.c.
.text
.extern func_02040400
.extern func_02042408
.global func_02043d78
.type func_02043d78, @function
.global func_02043dbc
.type func_02043dbc, @function
func_02043d78: ; 0x02043d78
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02040400
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02043db4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_02043db4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}

.size func_02043d78, . - func_02043d78
func_02043dbc: ; 0x02043dbc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02042408
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1d8]
    blx r1
    ldmia sp!, {r4, pc}
.size func_02043dbc, . - func_02043dbc
