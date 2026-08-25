; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern Heap_Free
.extern data_020de89c
.extern RandomizedSpriteParticleList_Clear

    .global RandomizedSpriteParticleList_DestroyAndFree
    .type RandomizedSpriteParticleList_DestroyAndFree, @function
RandomizedSpriteParticleList_DestroyAndFree: ; 0x02029190
    stmdb sp!, {r4, lr}
    ldr r1, .L_020291b4
    mov r4, r0
    str r1, [r4, #0x0]
    bl RandomizedSpriteParticleList_Clear
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020291b4: .word data_020de89c
    .size RandomizedSpriteParticleList_DestroyAndFree, . - RandomizedSpriteParticleList_DestroyAndFree

