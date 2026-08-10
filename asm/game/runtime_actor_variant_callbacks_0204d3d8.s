; Matching retail form; see src/game/runtime_actor_variant_callbacks.c.
.extern func_02032a94
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Assign
.extern VecFx32Object_Destroy
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern gActorRuntimeCollection
.text
    .global func_0204d3d8
func_0204d3d8: ; 0x0204d3d8
    bx lr
.size func_0204d3d8, . - func_0204d3d8

    .global func_0204d3dc
func_0204d3dc: ; 0x0204d3dc
    bx lr
.size func_0204d3dc, . - func_0204d3dc

    .global func_0204d3e0
func_0204d3e0: ; 0x0204d3e0
    bx lr
.size func_0204d3e0, . - func_0204d3e0

    .global func_0204d3e4
func_0204d3e4: ; 0x0204d3e4
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02032a94
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x0
    add r0, r6, #0x38
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    cmpeq r4, #0x0
    bne .L_0204d478
    ldr r0, [r6, #0x188]
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_0204d47c
    ldrb r0, [r6, #0xe8]
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_0204d47c
    ldr r0, .L_0204d484
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0204d478
    mov r0, r6
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    ldr r2, [r2, #0x78]
    blx r2
.L_0204d478:
    mov r0, #0x1
.L_0204d47c:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0204d484: .word gActorRuntimeCollection
.size func_0204d3e4, . - func_0204d3e4

