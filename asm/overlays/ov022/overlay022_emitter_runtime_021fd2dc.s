    .text
/* Exact fallback; see src/overlays/ov022/overlay022_emitter_runtime.c. */


.global Overlay022_MovingSprite_SetLifetime
Overlay022_MovingSprite_SetLifetime:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
.size Overlay022_MovingSprite_SetLifetime, . - Overlay022_MovingSprite_SetLifetime
