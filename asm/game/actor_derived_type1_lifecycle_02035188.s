; Matching retail form; see src/game/actor_derived_type1_lifecycle.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020df3c8
.extern VecFx32Object_Destroy
.extern Actor_ReleaseSecondaryRenderAttachment
.extern ActorDerivedRuntime_DestroyAlternate
.extern Type7MarkerPresentation_Destroy
.extern AuxiliaryInteraction_Destroy
.extern gGameWork

    .global ActorDerivedType1_Destroy
    .type ActorDerivedType1_Destroy, @function
ActorDerivedType1_Destroy: ; 0x02035188
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02035284
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r5, [r4, #0x26c]
    cmp r5, #0x0
    beq .L_020351c8
    beq .L_020351b8
    mov r0, r5
    bl AuxiliaryInteraction_Destroy
    mov r0, r5
    bl Heap_Free
.L_020351b8:
    ldr r0, .L_02035288
    ldr r1, .L_0203528c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
.L_020351c8:
    ldr r0, [r4, #0x270]
    cmp r0, #0x0
    beq .L_020351e0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020351e0:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    mov r5, #0x0
.L_020351fc:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    beq .L_02035218
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02035218:
    add r5, r5, #0x1
    cmp r5, #0x9
    blt .L_020351fc
    ldr r0, [r4, #0x22c]
    cmp r0, #0x0
    beq .L_0203523c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203523c:
    ldr r0, [r4, #0x274]
    cmp r0, #0x0
    beq .L_02035254
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02035254:
    add r0, r4, #0x2a8
    bl Type7MarkerPresentation_Destroy
    add r0, r4, #0x284
    bl VecFx32Object_Destroy
    add r0, r4, #0x254
    bl VecFx32Object_Destroy
    add r0, r4, #0x238
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02035284: .word data_020df3c8
.L_02035288: .word gGameWork
.L_0203528c: .word 0x3ee
    .size ActorDerivedType1_Destroy, . - ActorDerivedType1_Destroy

    .global ActorDerivedType1_DestroyAndFree

