.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_021052fc
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern SplineMover_Destroy
.extern SplineMover_InitTransition
.extern SplineMover_Assign
.extern SplineMover_Evaluate2D
.extern GamePhaseRuntime_GetActorCollection
.extern func_0200875c
.extern ActorMotion_GetActor
.extern ActorMotion_SetPosition
.extern ActorMotionAreaFollower_GetPosition
.extern ActorDerivedType1_GetSingletonObject
.extern Type7Actor_ProcessBoundaryTransition
.extern func_ov074_02210a04
.extern func_ov074_02211644

.global func_ov074_02210b90
func_ov074_02210b90:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x144
    sub sp, sp, #0x400
    ldr r1, .L_02211640
    mov r6, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    add r0, sp, #0x500
    add r0, r0, #0x34
    bl VecFx32Object_InitCopy
    ldr r0, .L_02211640
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_GetActor
    mov r1, r0
    add r0, r6, #0x28
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    ldr r1, .L_02211640
    add r0, sp, #0x500
    ldr r1, [r1, #0x0]
    add r0, r0, #0x24
    add r1, r1, #0x2000
    ldr r1, [r1, #0xed4]
    ldr r1, [r1, #0x20]
    mov r2, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r4, r2, lsr #0xc
    mov r5, r1, lsl #0x4
    bl VecFx32Object_Init
    add r0, sp, #0x500
    add r0, r0, #0x14
    bl VecFx32Object_Init
    add r0, sp, #0x500
    add r0, r0, #0x4
    bl VecFx32Object_Init
    ldr r0, [r6, #0x24]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_022114b0
.L_02210c40:
    b .L_02210c50
    b .L_02210ec8
    b .L_022110c0
    b .L_022112bc
.L_02210c50:
    ldr r0, [r6, #0x2c]
    sub r1, r4, #0x40
    sub r2, r4, #0x20
    sub r0, r0, #0x20000
    add r0, r0, r2, lsl #0xc
    str r0, [r6, #0x2c]
    add r0, sp, #0x400
    ldr r2, [sp, #0x53c]
    add r0, r0, #0xf4
    mov r1, r1, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x500
    add r1, sp, #0x400
    add r0, r0, #0x24
    add r1, r1, #0xf4
    bl VecFx32Object_Assign
    add r0, sp, #0x400
    add r0, r0, #0xf4
    bl VecFx32Object_Destroy
    sub r0, r4, #0x100
    mov r1, r0, lsl #0xc
    add r0, sp, #0x400
    ldr r2, [sp, #0x53c]
    add r0, r0, #0xe4
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x500
    add r1, sp, #0x400
    add r0, r0, #0x14
    add r1, r1, #0xe4
    bl VecFx32Object_Assign
    add r0, sp, #0x400
    add r0, r0, #0xe4
    bl VecFx32Object_Destroy
    add r0, sp, #0x500
    add r1, sp, #0x500
    add r0, r0, #0x4
    add r1, r1, #0x14
    bl VecFx32Object_Assign
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r0, sp, #0x400
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r3, sp, #0x500
    add r0, r0, #0xa8
    add r1, r1, #0x14
    add r2, r2, #0x24
    add r3, r3, #0x4
    bl SplineMover_InitTransition
    add r1, sp, #0x400
    add r0, r6, #0x8c
    add r1, r1, #0xa8
    bl SplineMover_Assign
    add r0, sp, #0x400
    add r0, r0, #0xa8
    bl SplineMover_Destroy
    add r0, sp, #0x400
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r0, r0, #0x98
    add r1, r1, #0x14
    add r2, r2, #0x24
    bl func_ov074_02211644
    mov r1, #0x0
    add r0, sp, #0x400
    add r0, r0, #0x88
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, sp, #0x400
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r0, r0, #0x78
    add r1, r1, #0x14
    add r2, r2, #0x24
    bl func_ov074_02211644
    mov r0, #0x20
    add r1, sp, #0x400
    add r2, sp, #0x400
    add r3, sp, #0x400
    str r0, [sp, #0x0]
    add r0, sp, #0xb8
    add r1, r1, #0x98
    add r2, r2, #0x88
    add r3, r3, #0x78
    bl SplineMover_InitTransition
    add r1, sp, #0xb8
    add r0, r6, #0x50
    bl SplineMover_Assign
    add r0, sp, #0xb8
    bl SplineMover_Destroy
    add r0, sp, #0x400
    add r0, r0, #0x78
    bl VecFx32Object_Destroy
    add r0, sp, #0x400
    add r0, r0, #0x88
    bl VecFx32Object_Destroy
    add r0, sp, #0x400
    add r0, r0, #0x98
    bl VecFx32Object_Destroy
    ldr r1, .L_02211640
    add r0, sp, #0x400
    ldr r1, [r1, #0x0]
    add r0, r0, #0x68
    bl func_0200875c
    add r0, sp, #0x500
    add r1, sp, #0x400
    add r0, r0, #0x24
    add r1, r1, #0x68
    bl VecFx32Object_Assign
    add r0, sp, #0x400
    add r0, r0, #0x68
    bl VecFx32Object_Destroy
    add r0, sp, #0x400
    mov r1, #0x80000
    mov r2, #0x0
    add r0, r0, #0x58
    rsb r1, r1, #0x0
    mov r3, r2
    bl VecFx32Object_InitComponents
    add r0, sp, #0x400
    add r1, sp, #0x500
    add r2, sp, #0x400
    add r0, r0, #0x48
    add r1, r1, #0x24
    add r2, r2, #0x58
    bl func_ov074_02210a04
    add r0, sp, #0x500
    add r1, sp, #0x400
    add r0, r0, #0x14
    add r1, r1, #0x48
    bl VecFx32Object_Assign
    add r0, sp, #0x400
    add r0, r0, #0x48
    bl VecFx32Object_Destroy
    add r0, sp, #0x400
    add r0, r0, #0x58
    bl VecFx32Object_Destroy
    mov r0, #0x20
    add r1, sp, #0x500
    str r0, [sp, #0x0]
    add r0, sp, #0x400
    add r1, r1, #0x14
    add r2, sp, #0x500
    add r0, r0, #0xc
    add r2, r2, #0x24
    mov r3, r1
    bl SplineMover_InitTransition
    add r1, sp, #0x400
    add r0, r6, #0xc8
    add r1, r1, #0xc
    bl SplineMover_Assign
    add r0, sp, #0x400
    add r0, r0, #0xc
    bl SplineMover_Destroy
    b .L_022114b0
.L_02210ec8:
    ldr r1, [r6, #0x2c]
    sub r0, r4, #0x20
    sub r0, r1, r0, lsl #0xc
    add r0, r0, #0x20000
    str r0, [r6, #0x2c]
    mov r1, #0xc0000
    ldr r2, [sp, #0x53c]
    add r0, sp, #0x3fc
    rsb r1, r1, #0x0
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x500
    add r0, r0, #0x24
    add r1, sp, #0x3fc
    bl VecFx32Object_Assign
    add r0, sp, #0x3fc
    bl VecFx32Object_Destroy
    mov r1, #0x0
    ldr r2, [sp, #0x53c]
    add r0, sp, #0x3ec
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, sp, #0x500
    add r0, r0, #0x14
    add r1, sp, #0x3ec
    bl VecFx32Object_Assign
    add r0, sp, #0x3ec
    bl VecFx32Object_Destroy
    add r0, sp, #0x500
    add r1, sp, #0x500
    add r0, r0, #0x4
    add r1, r1, #0x14
    bl VecFx32Object_Assign
    mov r0, #0x20
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r3, sp, #0x500
    str r0, [sp, #0x0]
    add r0, sp, #0x3b0
    add r1, r1, #0x14
    add r2, r2, #0x24
    add r3, r3, #0x4
    bl SplineMover_InitTransition
    add r0, r6, #0x8c
    add r1, sp, #0x3b0
    bl SplineMover_Assign
    add r0, sp, #0x3b0
    bl SplineMover_Destroy
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r0, sp, #0x3a0
    add r1, r1, #0x14
    add r2, r2, #0x24
    bl func_ov074_02211644
    mov r1, #0x0
    add r0, sp, #0x390
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r0, sp, #0x380
    add r1, r1, #0x14
    add r2, r2, #0x24
    bl func_ov074_02211644
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r0, sp, #0x7c
    add r1, sp, #0x3a0
    add r2, sp, #0x390
    add r3, sp, #0x380
    bl SplineMover_InitTransition
    add r1, sp, #0x7c
    add r0, r6, #0x50
    bl SplineMover_Assign
    add r0, sp, #0x7c
    bl SplineMover_Destroy
    add r0, sp, #0x380
    bl VecFx32Object_Destroy
    add r0, sp, #0x390
    bl VecFx32Object_Destroy
    add r0, sp, #0x3a0
    bl VecFx32Object_Destroy
    ldr r1, .L_02211640
    add r0, sp, #0x370
    ldr r1, [r1, #0x0]
    bl func_0200875c
    add r0, sp, #0x500
    add r0, r0, #0x24
    add r1, sp, #0x370
    bl VecFx32Object_Assign
    add r0, sp, #0x370
    bl VecFx32Object_Destroy
    mov r2, #0x0
    add r0, sp, #0x360
    mov r1, #0x80000
    mov r3, r2
    bl VecFx32Object_InitComponents
    add r1, sp, #0x500
    add r0, sp, #0x350
    add r1, r1, #0x24
    add r2, sp, #0x360
    bl func_ov074_02210a04
    add r0, sp, #0x500
    add r0, r0, #0x14
    add r1, sp, #0x350
    bl VecFx32Object_Assign
    add r0, sp, #0x350
    bl VecFx32Object_Destroy
    add r0, sp, #0x360
    bl VecFx32Object_Destroy
    add r1, sp, #0x500
    mov r0, #0x20
    add r1, r1, #0x14
    add r2, sp, #0x500
    str r0, [sp, #0x0]
    add r0, sp, #0x314
    add r2, r2, #0x24
    mov r3, r1
    bl SplineMover_InitTransition
    add r0, r6, #0xc8
    add r1, sp, #0x314
    bl SplineMover_Assign
    add r0, sp, #0x314
    bl SplineMover_Destroy
    b .L_022114b0
.L_022110c0:
    ldr r0, [r6, #0x30]
    sub r2, r5, #0x40
    sub r1, r5, #0x20
    sub r0, r0, #0x20000
    add r0, r0, r1, lsl #0xc
    str r0, [r6, #0x30]
    ldr r1, [sp, #0x538]
    add r0, sp, #0x304
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x500
    add r0, r0, #0x24
    add r1, sp, #0x304
    bl VecFx32Object_Assign
    add r0, sp, #0x304
    bl VecFx32Object_Destroy
    sub r0, r5, #0xc0
    mov r2, r0, lsl #0xc
    ldr r1, [sp, #0x538]
    add r0, sp, #0x2f4
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x500
    add r0, r0, #0x14
    add r1, sp, #0x2f4
    bl VecFx32Object_Assign
    add r0, sp, #0x2f4
    bl VecFx32Object_Destroy
    add r0, sp, #0x500
    add r1, sp, #0x500
    add r0, r0, #0x4
    add r1, r1, #0x14
    bl VecFx32Object_Assign
    mov r0, #0x20
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r3, sp, #0x500
    str r0, [sp, #0x0]
    add r0, sp, #0x2b8
    add r1, r1, #0x14
    add r2, r2, #0x24
    add r3, r3, #0x4
    bl SplineMover_InitTransition
    add r0, r6, #0x8c
    add r1, sp, #0x2b8
    bl SplineMover_Assign
    add r0, sp, #0x2b8
    bl SplineMover_Destroy
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r0, sp, #0x2a8
    add r1, r1, #0x14
    add r2, r2, #0x24
    bl func_ov074_02211644
    mov r1, #0x0
    add r0, sp, #0x298
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r0, sp, #0x288
    add r1, r1, #0x14
    add r2, r2, #0x24
    bl func_ov074_02211644
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r0, sp, #0x40
    add r1, sp, #0x2a8
    add r2, sp, #0x298
    add r3, sp, #0x288
    bl SplineMover_InitTransition
    add r1, sp, #0x40
    add r0, r6, #0x50
    bl SplineMover_Assign
    add r0, sp, #0x40
    bl SplineMover_Destroy
    add r0, sp, #0x288
    bl VecFx32Object_Destroy
    add r0, sp, #0x298
    bl VecFx32Object_Destroy
    add r0, sp, #0x2a8
    bl VecFx32Object_Destroy
    ldr r1, .L_02211640
    add r0, sp, #0x278
    ldr r1, [r1, #0x0]
    bl func_0200875c
    add r0, sp, #0x500
    add r0, r0, #0x24
    add r1, sp, #0x278
    bl VecFx32Object_Assign
    add r0, sp, #0x278
    bl VecFx32Object_Destroy
    mov r1, #0x0
    add r0, sp, #0x268
    sub r2, r1, #0x60000
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x500
    add r0, sp, #0x258
    add r1, r1, #0x24
    add r2, sp, #0x268
    bl func_ov074_02210a04
    add r0, sp, #0x500
    add r0, r0, #0x14
    add r1, sp, #0x258
    bl VecFx32Object_Assign
    add r0, sp, #0x258
    bl VecFx32Object_Destroy
    add r0, sp, #0x268
    bl VecFx32Object_Destroy
    add r1, sp, #0x500
    mov r0, #0x20
    add r1, r1, #0x14
    add r2, sp, #0x500
    str r0, [sp, #0x0]
    add r0, sp, #0x21c
    add r2, r2, #0x24
    mov r3, r1
    bl SplineMover_InitTransition
    add r0, r6, #0xc8
    add r1, sp, #0x21c
    bl SplineMover_Assign
    add r0, sp, #0x21c
    bl SplineMover_Destroy
    b .L_022114b0
.L_022112bc:
    ldr r1, [r6, #0x30]
    sub r0, r5, #0x20
    sub r0, r1, r0, lsl #0xc
    add r0, r0, #0x20000
    str r0, [r6, #0x30]
    mov r2, #0x80000
    ldr r1, [sp, #0x538]
    add r0, sp, #0x20c
    rsb r2, r2, #0x0
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x500
    add r0, r0, #0x24
    add r1, sp, #0x20c
    bl VecFx32Object_Assign
    add r0, sp, #0x20c
    bl VecFx32Object_Destroy
    mov r2, #0x0
    ldr r1, [sp, #0x538]
    add r0, sp, #0x1fc
    mov r3, r2
    bl VecFx32Object_InitComponents
    add r0, sp, #0x500
    add r0, r0, #0x14
    add r1, sp, #0x1fc
    bl VecFx32Object_Assign
    add r0, sp, #0x1fc
    bl VecFx32Object_Destroy
    add r0, sp, #0x500
    add r1, sp, #0x500
    add r0, r0, #0x4
    add r1, r1, #0x14
    bl VecFx32Object_Assign
    mov r0, #0x20
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r3, sp, #0x500
    str r0, [sp, #0x0]
    add r0, sp, #0x1c0
    add r1, r1, #0x14
    add r2, r2, #0x24
    add r3, r3, #0x4
    bl SplineMover_InitTransition
    add r0, r6, #0x8c
    add r1, sp, #0x1c0
    bl SplineMover_Assign
    add r0, sp, #0x1c0
    bl SplineMover_Destroy
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r0, sp, #0x1b0
    add r1, r1, #0x14
    add r2, r2, #0x24
    bl func_ov074_02211644
    mov r1, #0x0
    add r0, sp, #0x1a0
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x500
    add r2, sp, #0x500
    add r0, sp, #0x190
    add r1, r1, #0x14
    add r2, r2, #0x24
    bl func_ov074_02211644
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r0, sp, #0x4
    add r1, sp, #0x1b0
    add r2, sp, #0x1a0
    add r3, sp, #0x190
    bl SplineMover_InitTransition
    add r1, sp, #0x4
    add r0, r6, #0x50
    bl SplineMover_Assign
    add r0, sp, #0x4
    bl SplineMover_Destroy
    add r0, sp, #0x190
    bl VecFx32Object_Destroy
    add r0, sp, #0x1a0
    bl VecFx32Object_Destroy
    add r0, sp, #0x1b0
    bl VecFx32Object_Destroy
    ldr r1, .L_02211640
    add r0, sp, #0x180
    ldr r1, [r1, #0x0]
    bl func_0200875c
    add r0, sp, #0x500
    add r0, r0, #0x24
    add r1, sp, #0x180
    bl VecFx32Object_Assign
    add r0, sp, #0x180
    bl VecFx32Object_Destroy
    mov r1, #0x0
    add r0, sp, #0x170
    mov r2, #0x60000
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x500
    add r0, sp, #0x160
    add r1, r1, #0x24
    add r2, sp, #0x170
    bl func_ov074_02210a04
    add r0, sp, #0x500
    add r0, r0, #0x14
    add r1, sp, #0x160
    bl VecFx32Object_Assign
    add r0, sp, #0x160
    bl VecFx32Object_Destroy
    add r0, sp, #0x170
    bl VecFx32Object_Destroy
    add r1, sp, #0x500
    mov r0, #0x20
    add r1, r1, #0x14
    add r2, sp, #0x500
    str r0, [sp, #0x0]
    add r0, sp, #0x124
    add r2, r2, #0x24
    mov r3, r1
    bl SplineMover_InitTransition
    add r0, r6, #0xc8
    add r1, sp, #0x124
    bl SplineMover_Assign
    add r0, sp, #0x124
    bl SplineMover_Destroy
.L_022114b0:
    ldr r0, .L_02211640
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r2, r0, #0x2000
    ldr r0, .L_02211640
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    ldr r4, [r2, #0xe7c]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r5, [r0, #0xe7c]
    add r0, r4, #0x28
    add r1, r6, #0x28
    bl VecFx32Object_Assign
    mov r1, r0
    add r0, r5, #0x18
    bl VecFx32Object_Assign
    mov r1, #0x0
    add r0, sp, #0x114
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    ldr r0, .L_02211640
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    add r1, sp, #0x114
    add r0, r0, #0x38
    bl VecFx32Object_Assign
    add r0, sp, #0x114
    bl VecFx32Object_Destroy
    bl ActorDerivedType1_GetSingletonObject
    cmp r0, #0x0
    beq .L_02211588
    bl ActorDerivedType1_GetSingletonObject
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02211588
    bl ActorDerivedType1_GetSingletonObject
    mov r4, r0
    bl ActorDerivedType1_GetSingletonObject
    add r0, r0, #0x28
    add r1, r6, #0x28
    bl VecFx32Object_Assign
    mov r1, r0
    add r0, r4, #0x18
    bl VecFx32Object_Assign
.L_02211588:
    ldr r0, .L_02211640
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_022115ac
    ldr r2, [r6, #0x24]
    add r1, r6, #0x28
    bl Type7Actor_ProcessBoundaryTransition
.L_022115ac:
    add r0, sp, #0x104
    add r1, r6, #0x8c
    bl SplineMover_Evaluate2D
    ldr r0, .L_02211640
    add r1, sp, #0x104
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_SetPosition
    add r0, sp, #0x104
    bl VecFx32Object_Destroy
    add r0, sp, #0xf4
    add r1, r6, #0xc8
    bl SplineMover_Evaluate2D
    ldr r0, .L_02211640
    add r1, sp, #0xf4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_SetPosition
    add r0, sp, #0xf4
    bl VecFx32Object_Destroy
    add r0, sp, #0x500
    add r0, r0, #0x4
    bl VecFx32Object_Destroy
    add r0, sp, #0x500
    add r0, r0, #0x14
    bl VecFx32Object_Destroy
    add r0, sp, #0x500
    add r0, r0, #0x24
    bl VecFx32Object_Destroy
    add r0, sp, #0x500
    add r0, r0, #0x34
    bl VecFx32Object_Destroy
    add sp, sp, #0x144
    add sp, sp, #0x400
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02211640: .word data_021052fc
.size func_ov074_02210b90, . - func_ov074_02210b90
