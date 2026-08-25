; Matching retail form; see src/game/randomized_sprite_particle.c.
.text
.extern VecFx32Object_Destroy
.extern GraphicsSpriteGroup_ReleaseState

    .global RandomizedSpriteParticle_Destroy
    .type RandomizedSpriteParticle_Destroy, @function
RandomizedSpriteParticle_Destroy: ; 0x0202895c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x44]
    ldr r1, [r4, #0x40]
    bl GraphicsSpriteGroup_ReleaseState
    add r0, r4, #0x30
    bl VecFx32Object_Destroy
    add r0, r4, #0x20
    bl VecFx32Object_Destroy
    add r0, r4, #0x10
    bl VecFx32Object_Destroy
    mov r0, r4
    bl VecFx32Object_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size RandomizedSpriteParticle_Destroy, . - RandomizedSpriteParticle_Destroy

