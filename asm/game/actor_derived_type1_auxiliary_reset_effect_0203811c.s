; Matching retail form; see src/game/actor_derived_type1_auxiliary_reset_effect.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Alloc
.extern Heap_Free
.extern data_020df4a4
.extern data_021052fc
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern func_02008378
.extern ActorMotionJitter_EnsureMinimum
.extern AuxiliaryTimedSpritePresentation_Init
.extern func_0206c978
.extern func_0206e590
.extern gGameWork
.extern gHeapContext

    .global ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect
    .type ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect, @function
ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect: ; 0x0203811c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x38
    mov r4, r0
    ldr r0, [r4, #0x26c]
    cmp r0, #0x0
    beq .L_0203817c
    mov r1, #0x0
    bl func_0206e590
    ldr r5, [r4, #0x26c]
    cmp r5, #0x0
    beq .L_02038158
    mov r0, r5
    bl func_0206c978
    mov r0, r5
    bl Heap_Free
.L_02038158:
    mov r1, #0x0
    ldr r0, .L_02038244
    str r1, [r4, #0x26c]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02038248
    bl GameWork_ClearFlag
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x68]
.L_0203817c:
    ldrb r0, [r4, #0x2a0]
    cmp r0, #0x0
    bne .L_0203823c
    mov r1, #0x8
    strb r1, [r4, #0x2a0]
    ldr r0, .L_0203824c
    mov r1, #0x1e
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
    mov r1, #0x0
    add r0, sp, #0x18
    mov r2, r1
    mov r3, #0x24000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x28
    add r2, sp, #0x18
    add r1, r4, #0x18
    bl func_02008378
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    ldr r1, .L_02038250
    ldr r3, .L_02038254
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02038234
    ldr r3, .L_02038258
    mov r2, #0x0
    str r3, [sp, #0x0]
    add r1, r3, #0x1
    stmib sp, {r1, r2}
    sub r1, r2, #0x4
    str r1, [sp, #0xc]
    sub r1, r2, #0x1
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x28
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl AuxiliaryTimedSpritePresentation_Init
.L_02038234:
    add r0, sp, #0x28
    bl VecFx32Object_Destroy
.L_0203823c:
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, pc}
.L_02038244: .word gGameWork
.L_02038248: .word 0x3ee
.L_0203824c: .word data_021052fc
.L_02038250: .word data_020df4a4
.L_02038254: .word gHeapContext
.L_02038258: .word 0x21e1
    .size ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect, . - ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect

