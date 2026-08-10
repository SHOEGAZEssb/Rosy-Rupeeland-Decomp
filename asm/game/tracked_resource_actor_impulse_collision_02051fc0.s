; Matching retail form; see src/game/tracked_resource_actor_impulse_collision.c.
.extern gActorRuntimeCollection
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorRuntimeTriple_Assign
.extern func_020328d0
.text
    .global func_02051fc0
func_02051fc0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, .L_02052068
    mov r5, r1
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_02052030
    cmp r5, #0x0
    beq .L_02052030
    add r0, sp, #0x0
    add r1, r4, #0x38
    bl VecFx32Object_InitCopy
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r1, [r4, #0x1fc]
    add r0, sp, #0x0
    ldrsh r1, [r1, #0x2a]
    mov r1, r1, lsl #0x4
    bl func_020328d0
    mov r0, r5
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02052030:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl ActorRuntimeTriple_Assign
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc8]
    blx r1
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x800000
    str r0, [r4, #0x14]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02052068: .word gActorRuntimeCollection
    .size func_02051fc0, . - func_02051fc0
