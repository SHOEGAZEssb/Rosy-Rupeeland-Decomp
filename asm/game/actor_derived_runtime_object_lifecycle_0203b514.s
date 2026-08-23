; Matching retail form; see src/game/actor_derived_runtime_object_lifecycle.c.
.text
.extern Heap_Free
.extern data_020df510
.extern AnimationResource_Destroy
.extern AnimationResource_InitEmpty
.extern ActorRuntimeBase_Init
.extern func_0203130c
.extern Actor_ReleaseSecondaryRenderAttachment
    .global ActorDerivedRuntime_Init
    .type ActorDerivedRuntime_Init, @function
ActorDerivedRuntime_Init: ; 0x0203b514
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorRuntimeBase_Init
    ldr r1, .L_0203b550
    add r0, r4, #0x1ec
    str r1, [r4, #0x0]
    bl AnimationResource_InitEmpty
    mvn r0, #0x0
    str r0, [r4, #0x1fc]
    str r0, [r4, #0x200]
    add r1, r4, #0x200
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x4]
    ldmia sp!, {r4, pc}
.L_0203b550: .word data_020df510
    .size ActorDerivedRuntime_Init, . - ActorDerivedRuntime_Init

    .global ActorDerivedRuntime_InitAlternate
    .type ActorDerivedRuntime_InitAlternate, @function
ActorDerivedRuntime_InitAlternate: ; 0x0203b554
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorRuntimeBase_Init
    ldr r1, .L_0203b590
    add r0, r4, #0x1ec
    str r1, [r4, #0x0]
    bl AnimationResource_InitEmpty
    mvn r0, #0x0
    str r0, [r4, #0x1fc]
    str r0, [r4, #0x200]
    add r1, r4, #0x200
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x4]
    ldmia sp!, {r4, pc}
.L_0203b590: .word data_020df510
    .size ActorDerivedRuntime_InitAlternate, . - ActorDerivedRuntime_InitAlternate

    .global ActorDerivedRuntime_Destroy
    .type ActorDerivedRuntime_Destroy, @function
ActorDerivedRuntime_Destroy: ; 0x0203b594
    stmdb sp!, {r4, lr}
    ldr r1, .L_0203b5d0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    add r0, r4, #0x1ec
    bl AnimationResource_Destroy
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0203b5d0: .word data_020df510
    .size ActorDerivedRuntime_Destroy, . - ActorDerivedRuntime_Destroy

    .global ActorDerivedRuntime_DestroyAndFree
    .type ActorDerivedRuntime_DestroyAndFree, @function
ActorDerivedRuntime_DestroyAndFree: ; 0x0203b5d4
    stmdb sp!, {r4, lr}
    ldr r1, .L_0203b618
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    add r0, r4, #0x1ec
    bl AnimationResource_Destroy
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0203b618: .word data_020df510
    .size ActorDerivedRuntime_DestroyAndFree, . - ActorDerivedRuntime_DestroyAndFree

    .global ActorDerivedRuntime_DestroyAlternate
    .type ActorDerivedRuntime_DestroyAlternate, @function
ActorDerivedRuntime_DestroyAlternate: ; 0x0203b61c
    stmdb sp!, {r4, lr}
    ldr r1, .L_0203b658
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    add r0, r4, #0x1ec
    bl AnimationResource_Destroy
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0203b658: .word data_020df510
    .size ActorDerivedRuntime_DestroyAlternate, . - ActorDerivedRuntime_DestroyAlternate


