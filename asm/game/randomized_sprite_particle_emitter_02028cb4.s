; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern data_020de89c
.extern RandomizedSpriteParticleList_Clear

    .global RandomizedSpriteParticleList_Destroy
    .type RandomizedSpriteParticleList_Destroy, @function
RandomizedSpriteParticleList_Destroy: ; 0x02028cb4
    stmdb sp!, {r4, lr}
    ldr r1, .L_02028cd0
    mov r4, r0
    str r1, [r4, #0x0]
    bl RandomizedSpriteParticleList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02028cd0: .word data_020de89c
    .size RandomizedSpriteParticleList_Destroy, . - RandomizedSpriteParticleList_Destroy

