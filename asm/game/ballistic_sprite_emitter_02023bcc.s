; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern data_020d66b8

    .global BallisticSpriteParticleList_Init
    .type BallisticSpriteParticleList_Init, @function
BallisticSpriteParticleList_Init: ; 0x02023bcc
    ldr r2, .L_02023be8
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
.L_02023be8: .word data_020d66b8
    .size BallisticSpriteParticleList_Init, . - BallisticSpriteParticleList_Init
