; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern func_02057084
.extern func_02072b68

    .global func_02032d64
    .type func_02032d64, @function
func_02032d64: ; 0x02032d64
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r1
    mov r1, r2
    bl func_02057084
    mov r2, r0
    strb r2, [r4, #0xd4]
    ldrb r1, [r4, #0xe7]
    ldr r0, [r4, #0x54]
    add r1, r2, r1
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x40
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
    .size func_02032d64, . - func_02032d64
