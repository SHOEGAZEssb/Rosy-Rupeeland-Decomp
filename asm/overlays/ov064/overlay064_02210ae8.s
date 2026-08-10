.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern data_021052fc
.extern func_02005058
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseRuntime_SynchronizeActorPlacement
.extern func_0200875c
.extern GamePhaseRuntime_UpdateDualScreenUiPresentation
.extern ActorMotionAreaFollower_GetPosition
.extern func_02010e68
.extern func_0201dcec
.extern ActorCollection_DispatchEventToActors
.extern ActorCollection_GetSpriteOwner
.extern ActorFeedback_UpdatePresentations
.extern func_020740a4
.extern gLupyContext

.global func_ov064_02210ae8
func_ov064_02210ae8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x70]
    tst r0, #0x1
    add r0, r5, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r5, #0x6c]
    ldrne r1, [r2, r1]
    ldreq r1, [r5, #0x6c]
    blx r1
    ldrb r1, [r5, #0x77]
    mov r4, r0
    cmp r1, #0x3
    beq .L_02210c10
    ldr r0, .L_02210c54
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    bl ActorFeedback_UpdatePresentations
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    ldr r1, .L_02210c54
    mov r6, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    mov r0, r6
    bl ActorCollection_DispatchEventToActors
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    bl func_020740a4
    ldr r1, .L_02210c54
    add r0, sp, #0x0
    ldr r1, [r1, #0x0]
    bl func_0200875c
    ldr r0, .L_02210c54
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r1, sp, #0x0
    bl ActorCollection_DispatchEventToActors
    add r0, sp, #0x0
    bl func_02005058
    ldr r0, .L_02210c54
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    bl func_020740a4
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201dcec
    ldr r0, .L_02210c58
    ldr r0, [r0, #0x0]
    bl func_02010e68
    ldr r0, .L_02210c54
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateDualScreenUiPresentation
    b .L_02210c20
.L_02210c10:
    ldr r0, [r5, #0x3c]
    bl func_020740a4
    ldr r0, [r5, #0x40]
    bl func_020740a4
.L_02210c20:
    cmp r4, #0x0
    beq .L_02210c48
    cmp r5, #0x0
    beq .L_02210c40
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210c40:
    mov r0, #0x1
    b .L_02210c4c
.L_02210c48:
    mov r0, #0x0
.L_02210c4c:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02210c54: .word data_021052fc
.L_02210c58: .word gLupyContext
.size func_ov064_02210ae8, . - func_ov064_02210ae8
