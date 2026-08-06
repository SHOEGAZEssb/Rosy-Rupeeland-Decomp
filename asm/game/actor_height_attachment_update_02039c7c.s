; Matching retail form; see src/game/actor_height_attachment_update.c.
.text
.extern func_020adae4
.extern func_020be334
    .global func_02039c7c
    .type func_02039c7c, @function
func_02039c7c: ; 0x02039c7c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x270]
    cmp r0, #0x0
    ldreq r4, [r5, #0x84]
    moveq r3, r4
    beq .L_02039cac
    ldr r1, [r0, #0x14]
    ldr r2, [r5, #0x1dc]
    ldr r0, [r0, #0x18]
    add r3, r2, r1
    add r4, r2, r0
.L_02039cac:
    ldr r0, [r5, #0x24]
    mov r1, #0x12
    add r0, r0, r0, lsl #0x4
    add r0, r3, r0
    bl func_020adae4
    str r0, [r5, #0x24]
    ldr r0, [r5, #0x270]
    cmp r0, #0x0
    beq .L_02039cdc
    ldrb r0, [r0, #0x10]
    tst r0, #0x2
    beq .L_02039cfc
.L_02039cdc:
    ldr r0, [r5, #0x24]
    sub r0, r0, r4
    bl func_020be334
    cmp r0, #0x4000
    ldrlt r0, [r5, #0xd0]
    orrlt r0, r0, #0x20
    strlt r0, [r5, #0xd0]
    ldmltia sp!, {r3, r4, r5, pc}
.L_02039cfc:
    ldr r0, [r5, #0xd0]
    bic r0, r0, #0x20
    str r0, [r5, #0xd0]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02039c7c, . - func_02039c7c
