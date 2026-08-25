; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern GraphicsSpriteGroup_ReleaseIndexedEntries

    .global RandomizedSpriteParticleEmitter_SetVisible
    .type RandomizedSpriteParticleEmitter_SetVisible, @function
RandomizedSpriteParticleEmitter_SetVisible: ; 0x02029170
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4c]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x20]
    ldmneia sp!, {r3, pc}
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r3, pc}
    .size RandomizedSpriteParticleEmitter_SetVisible, . - RandomizedSpriteParticleEmitter_SetVisible

