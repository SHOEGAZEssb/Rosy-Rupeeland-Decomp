; Matching retail form; see src/game/tracked_resource_actor_timed_proximity.c.
.extern data_021052fc
.extern VecFx32Object_Destroy
.extern VecFx32Object_GetMagnitude
.extern VecFx32_Subtract
.extern Actor_SetInteractionFlag2000
.extern ActorDerivedType1_TrySetStateVector
.extern func_020adae4
.text
    .global func_0205184c
func_0205184c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r2, .L_02051968
    mov r5, r0
    ldr r2, [r2, #0x0]
    add r0, sp, #0x0
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea4]
    mov r4, r1
    add r1, r2, #0x18
    add r2, r5, #0x18
    bl VecFx32_Subtract
    mov r1, #0x0
    add r0, sp, #0x0
    str r1, [sp, #0xc]
    bl VecFx32Object_GetMagnitude
    mov r6, r0
    cmp r6, #0x28000
    bge .L_02051944
    ldr r1, .L_02051968
    mov r0, r5
    ldr r1, [r1, #0x0]
    ldr r2, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r2, [r2, #0xc4]
    blx r2
    rsb r6, r6, #0x28000
    mov r0, r6
    mov r1, #0x28
    bl func_020adae4
    add r2, r0, #0x2000
    ldr r1, [r5, #0x8c]
    mov r0, r6
    smull r3, r2, r1, r2
    adds r3, r3, #0x800
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r5, #0x8c]
    mov r1, #0x28
    bl func_020adae4
    add r2, r0, #0x2000
    ldr r1, [r5, #0x90]
    mov r0, #0x3000
    smull r3, r2, r1, r2
    adds r3, r3, #0x800
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r5, #0x90]
    str r0, [r5, #0x44]
    mov r2, #0xa
    add r0, r5, #0x200
    strh r2, [r0, #0x0]
    ldr r0, .L_02051968
    add r1, r5, #0x18
    ldr r0, [r0, #0x0]
    sub r3, r2, #0xb
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_TrySetStateVector
.L_02051944:
    mov r0, r5
    mov r1, r4
    bl Actor_SetInteractionFlag2000
    mov r4, r0
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02051968: .word data_021052fc
    .size func_0205184c, . - func_0205184c

