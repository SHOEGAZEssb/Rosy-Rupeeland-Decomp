; Matching retail form; see src/game/actor_primary_attachment_rebuild.c.
.text
.extern data_020f4e18
.extern ActorCollection_GetSpriteOwner
.extern func_020313b4
.extern Actor_GetCollection
.extern func_02071ee0
.extern func_02071f38
.extern func_02073fc4
.extern func_02074038
    .global func_0203bae4
    .type func_0203bae4, @function
func_0203bae4: ; 0x0203bae4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    ldr r1, [r4, #0x54]
    mov r6, r2
    mov r5, r3
    cmp r1, #0x0
    beq .L_0203bb0c
    ldr r0, [r1, #0x0]
    bl func_02074038
.L_0203bb0c:
    ldr r1, [r4, #0x58]
    cmp r1, #0x0
    beq .L_0203bb20
    ldr r0, [r1, #0x0]
    bl func_02074038
.L_0203bb20:
    mov r1, #0x0
    add r0, r4, #0x1f0
    str r1, [r4, #0x58]
    bl func_02071f38
    ldr r0, .L_0203bba0
    str r5, [sp, #0x0]
    ldr r1, [r0, #0x0]
    mov r2, r7
    mov r3, r6
    add r0, r4, #0x1f0
    bl func_02071ee0
    mov r0, r4
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldrh r1, [sp, #0x18]
    and r1, r1, #0xff
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x1f0]
    ldr r2, [r4, #0x1f4]
    ldr r3, [r4, #0x1f8]
    bl func_02073fc4
    str r0, [r4, #0x54]
    ldr r0, [r4, #0x14]
    tst r0, #0x1
    beq .L_0203bb98
    ldrh r2, [sp, #0x18]
    mov r0, r4
    add r1, r4, #0x1ec
    and r2, r2, #0xff
    bl func_020313b4
.L_0203bb98:
    ldr r0, [r4, #0x54]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0203bba0: .word data_020f4e18

    .size func_0203bae4, . - func_0203bae4

