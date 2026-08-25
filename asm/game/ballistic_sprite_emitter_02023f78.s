; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern Heap_Free
.extern data_020d66b8
.extern BallisticSpriteParticleList_Clear

    .global BallisticSpriteParticleList_DestroyAndFree
    .type BallisticSpriteParticleList_DestroyAndFree, @function
BallisticSpriteParticleList_DestroyAndFree: ; 0x02023f78
    stmdb sp!, {r4, lr}
    ldr r1, .L_02023f9c
    mov r4, r0
    str r1, [r4, #0x0]
    bl BallisticSpriteParticleList_Clear
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02023f9c: .word data_020d66b8
    .size BallisticSpriteParticleList_DestroyAndFree, . - BallisticSpriteParticleList_DestroyAndFree
