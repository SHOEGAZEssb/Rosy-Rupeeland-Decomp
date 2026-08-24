.text
.extern data_020d4264
.extern gGamePhaseRuntimeFieldLoaderAllocationTag
.extern ActorRuntimeAnimationResourceLists_Init
.extern ActorRuntimeAnimationResourceLists_AppendRecords
.extern gHeapContext
.extern Heap_Alloc

    .global GamePhaseRuntime_SetDisplayRouting
.type GamePhaseRuntime_SetDisplayRouting, @function
GamePhaseRuntime_SetDisplayRouting:
    ldr r2, L_02006fec
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsl #0xf
    strh r0, [r2, #0x0]
    bx lr
L_02006fec: .word 0x4000304
    .size GamePhaseRuntime_SetDisplayRouting, .-GamePhaseRuntime_SetDisplayRouting

    .global GamePhaseRuntime_CreateFieldLoader
.type GamePhaseRuntime_CreateFieldLoader, @function
GamePhaseRuntime_CreateFieldLoader:
    stmdb sp!, {r4, lr}
    ldr r1, L_02007034
    mov r4, r0
    ldr r3, L_02007038
    mov r0, #0x34
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02007018
    bl ActorRuntimeAnimationResourceLists_Init
L_02007018:
    add r1, r4, #0x3000
    str r0, [r1, #0xb4]
    ldr r1, L_0200703c
    mov r2, #0xb
    mov r3, #0x0
    bl ActorRuntimeAnimationResourceLists_AppendRecords
    ldmia sp!, {r4, pc}
L_02007034: .word gGamePhaseRuntimeFieldLoaderAllocationTag
L_02007038: .word gHeapContext
L_0200703c: .word data_020d4264
    .size GamePhaseRuntime_CreateFieldLoader, .-GamePhaseRuntime_CreateFieldLoader

    .global GamePhaseRuntime_DestroyFieldLoader
.type GamePhaseRuntime_DestroyFieldLoader, @function
GamePhaseRuntime_DestroyFieldLoader:
    stmdb sp!, {r3, lr}
    add r0, r0, #0x3000
    ldr r0, [r0, #0xb4]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldmia sp!, {r3, pc}
    .size GamePhaseRuntime_DestroyFieldLoader, .-GamePhaseRuntime_DestroyFieldLoader

