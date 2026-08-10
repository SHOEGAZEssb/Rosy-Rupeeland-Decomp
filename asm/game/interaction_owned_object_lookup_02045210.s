; Matching retail form; see src/game/interaction_owned_object_lookup.c.
.text
.extern Heap_Alloc
.extern data_020e16a8
.extern InteractionRecordAllocator_Init
.extern gHeapContext
.global InteractionRecordAllocatorPool_GetOrCreate
.type InteractionRecordAllocatorPool_GetOrCreate, @function
InteractionRecordAllocatorPool_GetOrCreate: ; 0x02045210
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, #0x0
    b .L_02045270
.L_02045224:
    ldr r0, [r6, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_02045240
    ldr r1, [r0, #0x0]
    cmp r1, r5
    bne .L_0204526c
    ldmia sp!, {r4, r5, r6, pc}
.L_02045240:
    ldr r1, .L_02045280
    ldr r3, .L_02045284
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02045264
    mov r1, r5
    bl InteractionRecordAllocator_Init
.L_02045264:
    str r0, [r6, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0204526c:
    add r4, r4, #0x1
.L_02045270:
    cmp r4, #0x10
    blt .L_02045224
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_02045280: .word data_020e16a8
.L_02045284: .word gHeapContext
.size InteractionRecordAllocatorPool_GetOrCreate, . - InteractionRecordAllocatorPool_GetOrCreate
