; Matching retail form; see src/game/tracked_resource_actor_oriented_update.c.
.extern Actor_UpdateAnimationState
.text
    .global func_020523c8
func_020523c8:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x18]
    blx r1
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldrb r0, [r4, #0x4b]
    tst r0, #0xf
    beq .L_0205240c
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xc4]
    blx r2
.L_0205240c:
    ldr r0, [r4, #0xd0]
    add r1, r4, #0x100
    orr r0, r0, #0x2000
    str r0, [r4, #0xd0]
    ldrsh r2, [r1, #0xf8]
    mov r0, r4
    add r2, r2, #0x1
    strh r2, [r1, #0xf8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd4]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r0, r4
    bl Actor_UpdateAnimationState
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
    ldmia sp!, {r4, pc}
    .size func_020523c8, . - func_020523c8
