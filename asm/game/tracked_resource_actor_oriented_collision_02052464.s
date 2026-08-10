; Matching retail form; see src/game/tracked_resource_actor_oriented_collision.c.
.extern gActorRuntimeCollection
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorRuntimeTriple_Assign
.extern ActorCollection_QueueActorForRemoval
.extern func_020328d0
.extern Actor_GetCollection
.extern func_02050260
.extern func_02050560
.text
    .global func_02052464
func_02052464:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, .L_02052584
    mov r4, r1
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_02052504
    cmp r4, #0x0
    beq .L_02052504
    add r0, sp, #0x0
    add r1, r5, #0x38
    bl VecFx32Object_InitCopy
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r1, [r5, #0x1fc]
    add r0, sp, #0x0
    ldrsh r1, [r1, #0x2a]
    mov r1, r1, lsl #0x4
    bl func_020328d0
    ldrb r0, [r4, #0x4d]
    mov r2, #0x0
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, r2
    cmp r0, #0x0
    ldr r0, [r5, #0x1fc]
    beq .L_020524dc
    ldrsh r0, [r0, #0xc]
    b .L_020524e0
.L_020524dc:
    ldrsh r0, [r0, #0xe]
.L_020524e0:
    cmp r0, #0x0
    mov r0, r4
    ldr r3, [r0, #0x0]
    movgt r2, #0x1
    ldr r3, [r3, #0xb8]
    add r1, sp, #0x0
    blx r3
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02052504:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x38
    bl ActorRuntimeTriple_Assign
    add r1, r5, #0x100
    mov r0, #0x8000
    ldrh r2, [r1, #0xf0]
    rsb r0, r0, #0x0
    mov r3, #0x0
    and r0, r2, r0
    orr r0, r0, #0x2
    strh r0, [r1, #0xf0]
    ldr r0, [r5, #0x10]
    ldr r2, .L_02052588
    orr r0, r0, #0x1f0000
    str r0, [r5, #0x10]
    strh r3, [r1, #0xf8]
    ldr r1, [r5, #0x14]
    mov r0, r5
    and r1, r1, r2
    str r1, [r5, #0x14]
    bl Actor_GetCollection
    mov r1, r5
    bl ActorCollection_QueueActorForRemoval
    mov r0, r5
    bl func_02050260
    mov r0, r5
    mov r1, r4
    bl func_02050560
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02052584: .word gActorRuntimeCollection
.L_02052588: .word 0xff7fffbf
    .size func_02052464, . - func_02052464

