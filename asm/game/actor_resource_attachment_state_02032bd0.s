; Matching retail form; see src/game/actor_resource_attachment_state.c.
.text

    .global Actor_AssignPrimaryResource
    .type Actor_AssignPrimaryResource, @function
Actor_AssignPrimaryResource: ; 0x02032bd0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x10]
    orr r2, r2, #0x8
    str r2, [r4, #0x10]
    str r1, [r4, #0x180]
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x78]
    blx r2
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
    .size Actor_AssignPrimaryResource, . - Actor_AssignPrimaryResource
