; Matching retail form; see src/game/actor_extended_type2_constructor_duplicate.c.
.text
.extern Heap_Alloc
.extern data_020dfee4
.extern data_020e00b8
.extern data_020e00c0
.extern data_020e83a0
.extern data_02105778
.extern func_02004fe0
.extern func_020050a4
.extern Actor_AdjustPositionForTerrainHeight
.extern ActorDerivedRuntime_Init
.extern ActorExtendedRecordArray_Init
.extern InteractionRecordAllocator_ReserveRandomRecord
.extern InteractionRecordAllocatorPool_GetOrCreate
.extern InteractionWaypointCursor_InitNearest
.extern InteractionWaypointCursor_GetCurrentRecord
.extern InteractionWaypointCursor_GetCurrentYPointer
.extern InteractionWaypointCursor_GetCurrentDurationFrames
.extern func_0204cca8
.extern func_0206899c
.extern gHeapContext
    .global ActorExtendedType2_InitDuplicate
    .type ActorExtendedType2_InitDuplicate, @function
ActorExtendedType2_InitDuplicate: ; 0x0203df4c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r5, r0
    mov r4, r1
    bl ActorDerivedRuntime_Init
    ldr r1, .L_0203e1fc
    add r0, r5, #0x22c
    str r1, [r5, #0x0]
    bl func_02004fe0
    add r0, r5, #0x23c
    bl func_02004fe0
    add r0, r5, #0x200
    mov r2, #0x0
    strh r2, [r0, #0x52]
    mov r1, r5
    add r0, r5, #0x284
    str r2, [r5, #0x260]
    bl func_0204cca8
    mov r2, #0x0
    add r0, r5, #0x22c
    add r1, r5, #0x18
    strb r2, [r5, #0x294]
    bl func_020050a4
    mov r0, #0x2
    strb r0, [r5, #0x4d]
    ldr r0, [r5, #0x14]
    mov r2, #0x0
    tst r0, #0x400
    ldrne r0, [r5, #0xd0]
    orrne r0, r0, #0x4
    strne r0, [r5, #0xd0]
    str r2, [r5, #0x26c]
    ldr r1, [r4, #0x54]
    add r0, r5, #0x200
    strh r1, [r0, #0x50]
    ldr r1, [r4, #0x30]
    strh r1, [r0, #0x72]
    ldr r1, [r4, #0x34]
    cmp r1, #0x0
    streq r2, [r5, #0x274]
    beq .L_0203e030
    ldr r0, .L_0203e200
    ldr r0, [r0, #0x0]
    bl InteractionRecordAllocatorPool_GetOrCreate
    str r0, [r5, #0x274]
    mov r1, r5
    bl InteractionRecordAllocator_ReserveRandomRecord
    ldrsh r1, [r0, #0x0]
    mov r1, r1, lsl #0xc
    str r1, [r5, #0x1c]
    str r1, [r5, #0x230]
    ldrsh r1, [r0, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0xc
    str r1, [r5, #0x20]
    str r1, [r5, #0x234]
    bl Actor_AdjustPositionForTerrainHeight
.L_0203e030:
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_0203e0b4
    ldr r1, .L_0203e204
    ldr r3, .L_0203e208
    mov r0, #0x8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    str r0, [r5, #0x26c]
    ldr r2, [r5, #0x230]
    ldr r3, [r5, #0x234]
    ldr r1, [r4, #0x38]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl InteractionWaypointCursor_InitNearest
    ldr r0, [r5, #0x26c]
    bl InteractionWaypointCursor_GetCurrentRecord
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0xc
    str r0, [r5, #0x230]
    ldr r0, [r5, #0x26c]
    bl InteractionWaypointCursor_GetCurrentYPointer
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0xc
    str r0, [r5, #0x234]
    ldr r0, [r5, #0x26c]
    bl InteractionWaypointCursor_GetCurrentDurationFrames
    add r1, r5, #0x200
    strh r0, [r1, #0x6a]
    b .L_0203e0c4
.L_0203e0b4:
    mov r1, #0x0
    str r1, [r5, #0x26c]
    add r0, r5, #0x200
    strh r1, [r0, #0x6a]
.L_0203e0c4:
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x80]
    str r1, [r5, #0x264]
    strb r1, [r5, #0x268]
    strb r1, [r5, #0x269]
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    beq .L_0203e114
    ldr r1, .L_0203e20c
    ldr r3, .L_0203e208
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203e10c
    ldr r1, [r4, #0x40]
    bl ActorExtendedRecordArray_Init
.L_0203e10c:
    str r0, [r5, #0x278]
    b .L_0203e118
.L_0203e114:
    str r1, [r5, #0x278]
.L_0203e118:
    ldrsh r2, [r4, #0x4c]
    add r1, r5, #0x200
    mov r0, r5
    strh r2, [r1, #0x7c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldrh r2, [r5, #0x4e]
    mov r0, #0x30
    ldr r1, .L_0203e210
    mul r0, r2, r0
    ldrsh r0, [r1, r0]
    bl func_0206899c
    ldr r1, [r0, #0xc]
    mov r0, r5
    str r1, [r5, #0x200]
    str r1, [r5, #0x1fc]
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    ldrsb r0, [sp, #0x24]
    strb r0, [r5, #0x27e]
    ldr r0, [r5, #0x260]
    orr r0, r0, #0x8
    str r0, [r5, #0x260]
    ldrsh r0, [sp, #0x22]
    strb r0, [r5, #0x27f]
    ldrh r0, [sp, #0x1a]
    tst r0, #0x40
    ldrne r0, [r5, #0x260]
    orrne r0, r0, #0x8000
    strne r0, [r5, #0x260]
    ldr r1, [r5, #0x1cc]
    mvn r0, #0x0
    cmp r1, r0
    addne r0, r5, #0x200
    ldrneh r1, [r0, #0x72]
    orrne r1, r1, #0x800
    strneh r1, [r0, #0x72]
    ldrh r0, [r5, #0x4e]
    cmp r0, #0x67
    blt .L_0203e1d4
    cmp r0, #0x71
    ldrlt r0, [r5, #0x260]
    orrlt r0, r0, #0x100000
    strlt r0, [r5, #0x260]
.L_0203e1d4:
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_0203e1f0
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_0203e1f0:
    mov r0, r5
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_0203e1fc: .word data_020dfee4
.L_0203e200: .word data_02105778
.L_0203e204: .word data_020e00b8
.L_0203e208: .word gHeapContext
.L_0203e20c: .word data_020e00c0
.L_0203e210: .word data_020e83a0
    .size ActorExtendedType2_InitDuplicate, . - ActorExtendedType2_InitDuplicate
