; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern Heap_Alloc
.extern gBallisticSpriteParticleListNodeAllocationTag
.extern gHeapContext

    .global BallisticSpriteParticleList_Append
    .type BallisticSpriteParticleList_Append, @function
BallisticSpriteParticleList_Append: ; 0x02023c4c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    ldr r1, .L_02023ca8
    ldr r3, .L_02023cac
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r4}
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    strne r0, [r1, #0x0]
    ldrne r1, [r5, #0x8]
    strne r1, [r0, #0x4]
    streq r0, [r5, #0x4]
    str r0, [r5, #0x8]
    ldr r1, [r5, #0xc]
    add r1, r1, #0x1
    str r1, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.L_02023ca8: .word gBallisticSpriteParticleListNodeAllocationTag
.L_02023cac: .word gHeapContext
    .size BallisticSpriteParticleList_Append, . - BallisticSpriteParticleList_Append
