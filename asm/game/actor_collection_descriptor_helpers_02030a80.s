; Matching retail form; see src/game/actor_collection_descriptor_helpers.c.
.text
.extern func_0202ecd0

    .global func_02030a80
    .type func_02030a80, @function
func_02030a80: ; 0x02030a80
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    b .L_02030abc
.L_02030a94:
    ldr r0, [r5, #0x28]
    orr r0, r0, #0x8
    str r0, [r5, #0x28]
    ldrsh r0, [r5, #0x50]
    cmp r0, r4
    bne .L_02030ab8
    mov r0, r6
    mov r1, r5
    bl func_0202ecd0
.L_02030ab8:
    add r5, r5, #0x64
.L_02030abc:
    ldrh r0, [r5, #0x0]
    cmp r0, #0x0
    bne .L_02030a94
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02030a80, . - func_02030a80

