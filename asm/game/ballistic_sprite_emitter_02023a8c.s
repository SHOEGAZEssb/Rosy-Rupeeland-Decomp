; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern Heap_Alloc
.extern __construct_array
.extern data_020d6718
.extern gBallisticSpriteParticleAllocationTag
.extern VecFx32Object_InitCopy
.extern AnimationResource_Init
.extern AnimationResource_Destroy
.extern AnimationResource_Assign
.extern AnimationResource_InitEmpty
.extern FieldEffect_Init
.extern BallisticSpriteParticle_Init
.extern BallisticSpriteParticleList_Init
.extern BallisticSpriteParticleList_Append
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern gDebugFont
.extern gHeapContext

    .global BallisticSpriteEmitter_Init
    .type BallisticSpriteEmitter_Init, @function
BallisticSpriteEmitter_Init: ; 0x02023a8c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x28
    mov r10, r0
    mov r4, r1
    mov r9, r2
    mov r8, r3
    bl FieldEffect_Init
    ldr r2, .L_02023bac
    mov r1, r4
    add r0, r10, #0x8
    str r2, [r10, #0x0]
    bl VecFx32Object_InitCopy
    ldr r1, .L_02023bb0
    ldr r3, .L_02023bb4
    str r1, [sp, #0x0]
    add r0, r10, #0x18
    mov r1, #0x2
    mov r2, #0x10
    bl __construct_array
    add r0, r10, #0x3c
    bl BallisticSpriteParticleList_Init
    ldr r1, .L_02023bb8
    add r0, sp, #0x18
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
    add r0, r10, #0x18
    add r1, sp, #0x18
    bl AnimationResource_Assign
    add r0, sp, #0x18
    bl AnimationResource_Destroy
    ldr r1, .L_02023bbc
    add r0, sp, #0x8
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
    add r0, r10, #0x28
    add r1, sp, #0x8
    bl AnimationResource_Assign
    add r0, sp, #0x8
    bl AnimationResource_Destroy
    ldr r0, .L_02023bc0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r5, .L_02023bc4
    ldr r11, .L_02023bc8
    str r0, [r10, #0x38]
    mov r7, #0x0
    mov r6, #0x34
    mov r4, #0x4
.L_02023b54:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, r11
    bl Heap_Alloc
    movs r1, r0
    beq .L_02023b8c
    str r9, [sp, #0x0]
    str r8, [sp, #0x4]
    ldr r1, [r10, #0x38]
    add r2, r10, #0x18
    add r3, r10, #0x8
    bl BallisticSpriteParticle_Init
    mov r1, r0
.L_02023b8c:
    add r0, r10, #0x3c
    bl BallisticSpriteParticleList_Append
    add r7, r7, #0x1
    cmp r7, #0x6
    blt .L_02023b54
    mov r0, r10
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02023bac: .word data_020d6718
.L_02023bb0: .word AnimationResource_Destroy
.L_02023bb4: .word AnimationResource_InitEmpty
.L_02023bb8: .word 0x1714
.L_02023bbc: .word 0x1688
.L_02023bc0: .word gDebugFont
.L_02023bc4: .word gBallisticSpriteParticleAllocationTag
.L_02023bc8: .word gHeapContext
    .size BallisticSpriteEmitter_Init, . - BallisticSpriteEmitter_Init
