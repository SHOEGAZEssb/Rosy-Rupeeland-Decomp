; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern data_020d66b8
.extern BallisticSpriteParticleList_Clear

    .global BallisticSpriteParticleList_Destroy
    .type BallisticSpriteParticleList_Destroy, @function
BallisticSpriteParticleList_Destroy: ; 0x02023bec
    stmdb sp!, {r4, lr}
    ldr r1, .L_02023c08
    mov r4, r0
    str r1, [r4, #0x0]
    bl BallisticSpriteParticleList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02023c08: .word data_020d66b8
    .size BallisticSpriteParticleList_Destroy, . - BallisticSpriteParticleList_Destroy
