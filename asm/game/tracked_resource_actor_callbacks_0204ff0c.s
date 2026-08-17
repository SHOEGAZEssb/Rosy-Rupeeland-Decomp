; Matching retail form; see src/game/tracked_resource_actor_callbacks.c.
.extern data_021052fc
.extern ActorMotionAreaFollower_GetPosition
.extern ActorContactState_AddContact
.extern Actor_SetInteractionFlag2000
.extern func_02034a60
.extern ActorDerivedType1_ScanActiveRecordCollisions
.text

    .global TrackedResourceActor_HandleInteractionCallback
TrackedResourceActor_HandleInteractionCallback: ; 0x0204ff0c
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r2
    mov r6, r0
    mov r5, r1
    bne .L_0204ff2c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xc4]
    blx r2
.L_0204ff2c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorContactState_AddContact
    ldmia sp!, {r4, r5, r6, pc}
.size TrackedResourceActor_HandleInteractionCallback, . - TrackedResourceActor_HandleInteractionCallback

    .global TrackedResourceActor_PostUpdate

TrackedResourceActor_PostUpdate: ; 0x0204ff40
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x100
    ldrh r0, [r0, #0xf0]
    mov r4, r1
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x11
    bne .L_0204ff84
    ldr r0, [r5, #0x1f4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    bne .L_0204ff84
    ldr r0, .L_0204ff94
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_ScanActiveRecordCollisions
.L_0204ff84:
    mov r0, r5
    mov r1, r4
    bl Actor_SetInteractionFlag2000
    ldmia sp!, {r3, r4, r5, pc}
.L_0204ff94: .word data_021052fc
.size TrackedResourceActor_PostUpdate, . - TrackedResourceActor_PostUpdate

    .global TrackedResourceActor_ActivateBoundedAction

TrackedResourceActor_ActivateBoundedAction: ; 0x0204ff98
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x1fc]
    ldrh r0, [r0, #0x1e]
    cmp r0, #0x0
    beq .L_0205006c
    ldr r0, .L_02050074
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r5, [r0, #0x4]
    ldrsh r2, [r4, #0x6c]
    ldr r0, [r0, #0x8]
    ldrsh ip, [r4, #0x68]
    ldrsh r3, [r4, #0x6a]
    ldrsh r1, [r4, #0x6e]
    mov r6, r5, asr #0xc
    ldr r7, [r4, #0x1c]
    ldr lr, [r4, #0x24]
    mov r0, r0, asr #0xc
    add lr, r0, lr, asr #0xc
    ldr r5, [r4, #0x20]
    strh r1, [sp, #0x6]
    rsb r6, r6, r7, asr #0xc
    rsb r0, r2, #0x0
    strh ip, [sp, #0x0]
    strh r3, [sp, #0x2]
    strh r2, [sp, #0x4]
    cmp r6, r0
    rsb r1, lr, r5, asr #0xc
    blt .L_0205006c
    ldrsh r0, [sp, #0x0]
    rsb r0, r0, #0x100
    cmp r6, r0
    bge .L_0205006c
    ldrsh r0, [sp, #0x6]
    rsb r0, r0, #0x0
    cmp r1, r0
    blt .L_0205006c
    ldrsh r0, [sp, #0x2]
    rsb r0, r0, #0xc0
    cmp r1, r0
    bge .L_0205006c
    ldr r1, [r4, #0x10]
    mov r0, r4
    orr r1, r1, #0x4
    str r1, [r4, #0x10]
    ldr r1, [r4, #0x1fc]
    mov r2, #0x0
    ldrh r1, [r1, #0x1e]
    bl func_02034a60
.L_0205006c:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02050074: .word data_021052fc
.size TrackedResourceActor_ActivateBoundedAction, . - TrackedResourceActor_ActivateBoundedAction

