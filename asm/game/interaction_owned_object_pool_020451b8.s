; Matching retail form; see src/game/interaction_owned_object_pool.c.
.text
.extern Heap_Free
.extern Heap_FreeAlternateEntry
.global InteractionRecordAllocatorPool_Init
.type InteractionRecordAllocatorPool_Init, @function
.global InteractionRecordAllocatorPool_DestroyContents
.type InteractionRecordAllocatorPool_DestroyContents, @function
InteractionRecordAllocatorPool_Init: ; 0x020451b8
    mov r2, #0x0
    mov r1, r2
.L_020451c0:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x10
    blt .L_020451c0
    bx lr

.size InteractionRecordAllocatorPool_Init, . - InteractionRecordAllocatorPool_Init
InteractionRecordAllocatorPool_DestroyContents: ; 0x020451d4
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, #0x0
.L_020451e0:
    ldr r5, [r6, r4, lsl #0x2]
    cmp r5, #0x0
    beq .L_020451fc
    ldr r0, [r5, #0x4]
    bl Heap_FreeAlternateEntry
    mov r0, r5
    bl Heap_Free
.L_020451fc:
    add r4, r4, #0x1
    cmp r4, #0x10
    blt .L_020451e0
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.size InteractionRecordAllocatorPool_DestroyContents, . - InteractionRecordAllocatorPool_DestroyContents
