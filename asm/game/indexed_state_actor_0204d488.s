; Matching retail form; see src/game/indexed_state_actor.c.
.extern ActorDerivedRuntime_Init
.extern ActorDerivedRuntime_DestroyAlternate
.extern Heap_Free
.extern ActorDerivedRuntime_UpdateFrame
.extern data_020e212c
.extern Actor_InitializeFromDescriptor
.text
    .global IndexedStateActor_Init
IndexedStateActor_Init: ; 0x0204d488
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorDerivedRuntime_Init
    ldr r0, .L_0204d4bc
    add r1, r5, #0x200
    str r0, [r5, #0x0]
    mov r0, #0x0
    strh r0, [r1, #0x8]
    ldrsh r2, [r4, #0x4e]
    mov r0, r5
    strh r2, [r1, #0xa]
    ldmia sp!, {r3, r4, r5, pc}
.L_0204d4bc: .word data_020e212c
.size IndexedStateActor_Init, . - IndexedStateActor_Init

    .global IndexedStateActor_Destroy
IndexedStateActor_Destroy: ; 0x0204d4c0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
.size IndexedStateActor_Destroy, . - IndexedStateActor_Destroy

    .global IndexedStateActor_DestroyAndFree
IndexedStateActor_DestroyAndFree: ; 0x0204d4d4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size IndexedStateActor_DestroyAndFree, . - IndexedStateActor_DestroyAndFree

    .global IndexedStateActor_EnterInitialState
IndexedStateActor_EnterInitialState: ; 0x0204d4f0
    ldr ip, .L_0204d4f8
    bx ip
.L_0204d4f8: .word Actor_InitializeFromDescriptor
.size IndexedStateActor_EnterInitialState, . - IndexedStateActor_EnterInitialState

    .global IndexedStateActor_Update
IndexedStateActor_Update: ; 0x0204d4fc
    stmdb sp!, {r3, lr}
    add r1, r0, #0x200
    ldrsh r1, [r1, #0x8]
    cmp r1, #0x0
    beq .L_0204d518
    cmp r1, #0x1
    ldmia sp!, {r3, pc}
.L_0204d518:
    bl ActorDerivedRuntime_UpdateFrame
    ldmia sp!, {r3, pc}
.size IndexedStateActor_Update, . - IndexedStateActor_Update
