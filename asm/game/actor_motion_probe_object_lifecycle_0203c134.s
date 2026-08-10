; Matching retail form; see src/game/actor_motion_probe_object_lifecycle.c.
.text
.extern Heap_Free
.extern data_020df61c
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern func_02033b38
.extern ActorDerivedRuntime_Init
.extern ActorDerivedRuntime_DestroyAlternate
.extern Actor_InitializeFromDescriptor
.extern ActorDerivedRuntime_UpdateFrame
    .global ActorMotionProbe_DrawDebugInfo
    .type ActorMotionProbe_DrawDebugInfo, @function
ActorMotionProbe_DrawDebugInfo: ; 0x0203c134
    ldr ip, .L_0203c13c
    bx ip
.L_0203c13c: .word func_02033b38
    .size ActorMotionProbe_DrawDebugInfo, . - ActorMotionProbe_DrawDebugInfo

    .global ActorMotionProbe_Init
    .type ActorMotionProbe_Init, @function
ActorMotionProbe_Init: ; 0x0203c140
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_Init
    ldr r1, .L_0203c1bc
    add r0, r4, #0x200
    str r1, [r4, #0x0]
    mov r1, #0x4000
    strh r1, [r0, #0x8]
    mov r1, #0x0
    strh r1, [r0, #0xa]
    mov r1, #0x1000
    add r0, r4, #0x210
    str r1, [r4, #0x20c]
    bl VecFx32Object_Init
    add r0, r4, #0x220
    bl VecFx32Object_Init
    add r0, r4, #0x230
    bl VecFx32Object_Init
    mov r0, #0x0
    str r0, [r4, #0x240]
    mov r0, #0x10
    str r0, [r4, #0x244]
    str r0, [r4, #0x248]
    mov r0, #0x1e
    str r0, [r4, #0x24c]
    mov r0, #0x5
    str r0, [r4, #0x250]
    mov r1, #0x640
    mov r0, r4
    str r1, [r4, #0x254]
    ldmia sp!, {r4, pc}
.L_0203c1bc: .word data_020df61c
    .size ActorMotionProbe_Init, . - ActorMotionProbe_Init

    .global ActorMotionProbe_Destroy
    .type ActorMotionProbe_Destroy, @function
ActorMotionProbe_Destroy: ; 0x0203c1c0
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x230
    bl VecFx32Object_Destroy
    add r0, r4, #0x220
    bl VecFx32Object_Destroy
    add r0, r4, #0x210
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size ActorMotionProbe_Destroy, . - ActorMotionProbe_Destroy

    .global ActorMotionProbe_DestroyAndFree
    .type ActorMotionProbe_DestroyAndFree, @function
ActorMotionProbe_DestroyAndFree: ; 0x0203c1f0
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x230
    bl VecFx32Object_Destroy
    add r0, r4, #0x220
    bl VecFx32Object_Destroy
    add r0, r4, #0x210
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size ActorMotionProbe_DestroyAndFree, . - ActorMotionProbe_DestroyAndFree

    .global ActorMotionProbe_InitializeFromDescriptor
    .type ActorMotionProbe_InitializeFromDescriptor, @function
ActorMotionProbe_InitializeFromDescriptor: ; 0x0203c228
    ldr ip, .L_0203c230
    bx ip
.L_0203c230: .word Actor_InitializeFromDescriptor
    .size ActorMotionProbe_InitializeFromDescriptor, . - ActorMotionProbe_InitializeFromDescriptor

    .global ActorMotionProbe_UpdateFrame
    .type ActorMotionProbe_UpdateFrame, @function
ActorMotionProbe_UpdateFrame: ; 0x0203c234
    ldr ip, .L_0203c23c
    bx ip
.L_0203c23c: .word ActorDerivedRuntime_UpdateFrame
    .size ActorMotionProbe_UpdateFrame, . - ActorMotionProbe_UpdateFrame

