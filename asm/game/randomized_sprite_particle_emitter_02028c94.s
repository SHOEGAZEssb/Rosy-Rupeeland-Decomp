; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern data_020de89c

    .global RandomizedSpriteParticleList_Init
    .type RandomizedSpriteParticleList_Init, @function
RandomizedSpriteParticleList_Init: ; 0x02028c94
    ldr r2, .L_02028cb0
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
.L_02028cb0: .word data_020de89c
    .size RandomizedSpriteParticleList_Init, . - RandomizedSpriteParticleList_Init

