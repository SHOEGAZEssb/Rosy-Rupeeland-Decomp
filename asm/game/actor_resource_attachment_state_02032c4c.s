; Matching retail form; see src/game/actor_resource_attachment_state.c.
.text
.extern func_02072b68

    .global func_02032c4c
    .type func_02032c4c, @function
func_02032c4c: ; 0x02032c4c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r1, [r4, #0x194]
    ldr r0, [r4, #0x54]
    bl func_02072b68
    ldrb r1, [r4, #0x195]
    ldr r0, [r4, #0x54]
    strb r1, [r0, #0x3a]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x20
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x10]
    bic r0, r0, #0x200
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
    .size func_02032c4c, . - func_02032c4c

