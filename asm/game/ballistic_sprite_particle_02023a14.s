; Matching retail form; see src/game/ballistic_sprite_particle.c.
.text
.extern VecFx32Object_Add

.global BallisticSpriteParticle_Update
    .type BallisticSpriteParticle_Update, @function
BallisticSpriteParticle_Update: ; 0x02023a14
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x28]
    mov r4, #0x0
    cmp r1, #0x0
    bne .L_02023a84
    add r1, r5, #0x10
    bl VecFx32Object_Add
    ldr r0, [r5, #0x18]
    add r0, r0, #0x200
    str r0, [r5, #0x18]
    ldrh r1, [r5, #0x2c]
    ldrh r0, [r5, #0x2e]
    add r0, r1, r0
    strh r0, [r5, #0x2c]
    ldmib r5, {r0, r2}
    ldr r1, [r5, #0x20]
    mov r0, r0, asr #0xc
    strh r0, [r1, #0x2c]
    mov r0, r2, asr #0xc
    strh r0, [r1, #0x2e]
    ldrh r1, [r5, #0x2c]
    ldr r0, [r5, #0x20]
    strh r1, [r0, #0x30]
    ldr r0, [r5, #0x24]
    subs r0, r0, #0x1
    str r0, [r5, #0x24]
    movmi r4, #0x1
.L_02023a84:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
    .size BallisticSpriteParticle_Update, . - BallisticSpriteParticle_Update
