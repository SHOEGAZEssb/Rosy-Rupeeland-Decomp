; Matching retail form; see src/game/interaction_record_allocator.c.
.text
.extern gInteractionRecordAllocatorAllocationTag
.extern Heap_AllocAlternateEntry
.extern Heap_FreeAlternateEntry
.extern func_020bf1f8
.extern gHeapContext
.extern genrand_int32
.global InteractionRecordAllocator_Init
.type InteractionRecordAllocator_Init, @function
.global InteractionRecordAllocator_ReserveRandomRecord
.type InteractionRecordAllocator_ReserveRandomRecord, @function
.global InteractionRecordAllocator_ReleaseOwner
.type InteractionRecordAllocator_ReleaseOwner, @function
InteractionRecordAllocator_Init: ; 0x02045058
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x0]
    mov r0, #0x0
    str r0, [r4, #0x8]
    mvn r0, #0x0
.L_02045070:
    ldrsh r2, [r1, #0x0]
    cmp r2, r0
    ldrne r2, [r4, #0x8]
    addne r1, r1, #0x4
    addne r2, r2, #0x1
    strne r2, [r4, #0x8]
    bne .L_02045070
    ldr r0, [r4, #0x8]
    ldr r1, .L_020450d4
    ldr r3, .L_020450d8
    mov r0, r0, lsl #0x2
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    mov r2, #0x0
    str r0, [r4, #0x4]
    mov r1, r2
    b .L_020450c0
.L_020450b4:
    ldr r0, [r4, #0x4]
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
.L_020450c0:
    ldr r0, [r4, #0x8]
    cmp r2, r0
    blt .L_020450b4
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020450d4: .word gInteractionRecordAllocatorAllocationTag
.L_020450d8: .word gHeapContext

.size InteractionRecordAllocator_Init, . - InteractionRecordAllocator_Init
InteractionRecordAllocator_ReserveRandomRecord: ; 0x020450dc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, [r5, #0x8]
    mov r4, r1
    ldr r1, .L_0204517c
    ldr r3, .L_02045180
    mov r0, r0, lsl #0x2
    mov r2, #0x4
    mov r7, #0x0
    bl Heap_AllocAlternateEntry
    mov r6, r0
    mov r1, r7
    b .L_0204512c
.L_02045110:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    cmpne r0, r4
    streq r1, [r6, r7, lsl #0x2]
    addeq r7, r7, #0x1
    add r1, r1, #0x1
.L_0204512c:
    ldr r0, [r5, #0x8]
    cmp r1, r0
    blt .L_02045110
    cmp r7, #0x0
    ble .L_0204516c
    bl genrand_int32
    mov r1, r7
    bl func_020bf1f8
    mov r0, r6
    ldr r6, [r6, r1, lsl #0x2]
    bl Heap_FreeAlternateEntry
    ldr r0, [r5, #0x4]
    str r4, [r0, r6, lsl #0x2]
    ldr r0, [r5, #0x0]
    add r0, r0, r6, lsl #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0204516c:
    mov r0, r6
    bl Heap_FreeAlternateEntry
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0204517c: .word gInteractionRecordAllocatorAllocationTag
.L_02045180: .word gHeapContext

.size InteractionRecordAllocator_ReserveRandomRecord, . - InteractionRecordAllocator_ReserveRandomRecord
InteractionRecordAllocator_ReleaseOwner: ; 0x02045184
    stmdb sp!, {r3, lr}
    mov lr, #0x0
    mov r3, lr
    b .L_020451a8
.L_02045194:
    ldr ip, [r0, #0x4]
    ldr r2, [ip, lr, lsl #0x2]
    cmp r2, r1
    streq r3, [ip, lr, lsl #0x2]
    add lr, lr, #0x1
.L_020451a8:
    ldr r2, [r0, #0x8]
    cmp lr, r2
    blt .L_02045194
    ldmia sp!, {r3, pc}
.size InteractionRecordAllocator_ReleaseOwner, . - InteractionRecordAllocator_ReleaseOwner
