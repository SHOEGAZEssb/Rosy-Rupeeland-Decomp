/*
 * Recovered sprite animation and explicit-frame selection for archive-backed
 * sprite states. These routines prepare lazy animation metadata and mutate
 * caller-owned playback state; the shared graphics archive retains resources.
 */
#include "tingle/graphics_sprite_state.h"

typedef struct SpriteFrameSequence {
    u16 firstFrame;
    u16 frameCount;
    u16 duration;
    u16 field_06;
} SpriteFrameSequence;

typedef struct SpriteFrameTiming {
    u16 resourceIndex;
    u16 duration;
} SpriteFrameTiming;

typedef struct SpriteAnimationResource {
    u8 padding_00[0x14];
    void *allocation;
    u8 padding_18[0x0c];
    SpriteFrameSequence *sequences;
    SpriteFrameTiming *frames;
} SpriteAnimationResource;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02070d74(void *resource);
#ifdef __cplusplus
}
#endif

#ifndef MATCHING
/* Selects a clamped animation index, resets playback, invalidates any attached
 * render record, and clears the terminal flag. Resource preparation is the
 * only archive-side effect; the function has no return value. */
void GraphicsSpriteState_SetAnimationIndex(GraphicsSpriteState *sprite,
                                           u8 animation)
{
    SpriteAnimationResource *resource =
        (SpriteAnimationResource *)sprite->animationResource;
    u32 animationCount;

    if (resource->allocation == 0) {
        func_02070d74(resource);
    }
    animationCount = *(u32 *)((u8 *)resource->allocation + 4);
    if (animation >= animationCount) {
        animation = (u8)(animationCount - 1);
    }
    sprite->animationIndex = animation;
    sprite->frameIndex = 0;
    sprite->framePosition = 0;
    if ((sprite->field_3b & 1u) == 0 && sprite->field_0c != 0) {
        *(u8 *)((u8 *)sprite->field_0c + 0x0c) = 0;
    }
    sprite->flags &= 0xfffeu;
}

/* Selects a clamped frame in the current sequence, converts preceding frame
 * durations to an 8.8 position, invalidates attached render metadata, and
 * marks the state as explicitly positioned. */
void GraphicsSpriteState_SetFrameIndex(GraphicsSpriteState *sprite,
                                       u8 frameIndex)
{
    SpriteAnimationResource *resource =
        (SpriteAnimationResource *)sprite->animationResource;
    SpriteFrameSequence *sequence;
    SpriteFrameTiming *frame;
    u32 index;

    if (resource->allocation == 0) {
        func_02070d74(resource);
    }
    sequence = &resource->sequences[sprite->animationIndex];
    if (frameIndex >= sequence->frameCount) {
        frameIndex = (u8)(sequence->frameCount - 1);
    }
    sprite->frameIndex = frameIndex;
    sprite->framePosition = 0;
    frame = &resource->frames[sequence->firstFrame];
    for (index = 0; index < frameIndex; ++index) {
        sprite->framePosition += frame[index].duration;
    }
    sprite->framePosition <<= 8;
    if ((sprite->field_3b & 1u) == 0 && sprite->field_0c != 0) {
        *(u8 *)((u8 *)sprite->field_0c + 0x0c) = 0;
    }
    sprite->flags |= 1;
}

/* Restarts the current sequence at frame/time zero, invalidates attached
 * render metadata, and clears the terminal flag. */
void GraphicsSpriteState_ResetFrame(GraphicsSpriteState *sprite)
{
    sprite->frameIndex = 0;
    sprite->framePosition = 0;
    if ((sprite->field_3b & 1u) == 0 && sprite->field_0c != 0) {
        *(u8 *)((u8 *)sprite->field_0c + 0x0c) = 0;
    }
    sprite->flags &= 0xfffeu;
}

/* Returns the selected sequence's total duration, lazily preparing its
 * animation resource first. Resource preparation is the only external effect. */
u16 GraphicsSpriteState_GetSequenceDuration(GraphicsSpriteState *sprite)
{
    SpriteAnimationResource *resource =
        (SpriteAnimationResource *)sprite->animationResource;

    if (resource->allocation == 0) {
        func_02070d74(resource);
    }
    return resource->sequences[sprite->animationIndex].duration;
}

/* Address-derived ABI wrapper retained for portable callers that have not yet
 * migrated to the semantic sprite-state interface. */
void func_02072b68(void *sprite, u32 animation)
{
    GraphicsSpriteState_SetAnimationIndex((GraphicsSpriteState *)sprite,
                                           (u8)animation);
}
#else
/* Matching implementations of the four documented portable routines above. */
asm void GraphicsSpriteState_SetAnimationIndex(GraphicsSpriteState *sprite,
                                                u8 animation)
{
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    mov r5, r1
    ldr r1, [r0, #0x14]
    cmp r1, #0
    bne sprite_animation_loaded
    bl func_02070d74
sprite_animation_loaded:
    ldr r0, [r4, #0x1c]
    mov r1, #0
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #4]
    cmp r5, r0
    subge r0, r0, #1
    andge r5, r0, #0xff
    strb r5, [r4, #0x38]
    strb r1, [r4, #0x39]
    str r1, [r4, #0x20]
    ldrb r0, [r4, #0x3b]
    and r0, r0, #1
    tst r0, #0xff
    bne sprite_animation_clear_terminal
    ldr r0, [r4, #0xc]
    cmp r0, #0
    strneb r1, [r0, #0xc]
sprite_animation_clear_terminal:
    ldrh r0, [r4, #0x24]
    bic r0, r0, #1
    strh r0, [r4, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
}

asm void GraphicsSpriteState_SetFrameIndex(GraphicsSpriteState *sprite,
                                            u8 frameIndex)
{
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x1c]
    mov r4, r1
    ldr r1, [r0, #0x14]
    cmp r1, #0
    bne sprite_frame_loaded
    bl func_02070d74
sprite_frame_loaded:
    ldr r1, [r5, #0x1c]
    ldrb r0, [r5, #0x38]
    ldr r3, [r1, #0x24]
    ldr r2, [r1, #0x28]
    mov r1, r0, lsl #3
    add r0, r3, r0, lsl #3
    ldrh r0, [r0, #2]
    ldrh r1, [r3, r1]
    mov r3, #0
    cmp r4, r0
    subge r0, r0, #1
    andge r4, r0, #0xff
    strb r4, [r5, #0x39]
    add r2, r2, r1, lsl #2
    str r3, [r5, #0x20]
    b sprite_frame_sum_check
sprite_frame_sum:
    ldrh r0, [r2, #2]
    ldr r1, [r5, #0x20]
    add r3, r3, #1
    add r0, r1, r0
    str r0, [r5, #0x20]
    add r2, r2, #4
sprite_frame_sum_check:
    cmp r3, r4
    blt sprite_frame_sum
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #8
    str r0, [r5, #0x20]
    ldrb r0, [r5, #0x3b]
    and r0, r0, #1
    tst r0, #0xff
    bne sprite_frame_set_terminal
    ldr r1, [r5, #0xc]
    cmp r1, #0
    movne r0, #0
    strneb r0, [r1, #0xc]
sprite_frame_set_terminal:
    ldrh r0, [r5, #0x24]
    orr r0, r0, #1
    strh r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
}

asm void GraphicsSpriteState_ResetFrame(GraphicsSpriteState *sprite)
{
    mov r2, #0
    strb r2, [r0, #0x39]
    str r2, [r0, #0x20]
    ldrb r1, [r0, #0x3b]
    and r1, r1, #1
    tst r1, #0xff
    bne sprite_reset_clear_terminal
    ldr r1, [r0, #0xc]
    cmp r1, #0
    strneb r2, [r1, #0xc]
sprite_reset_clear_terminal:
    ldrh r1, [r0, #0x24]
    bic r1, r1, #1
    strh r1, [r0, #0x24]
    bx lr
}

asm u16 GraphicsSpriteState_GetSequenceDuration(GraphicsSpriteState *sprite)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    ldr r1, [r0, #0x14]
    cmp r1, #0
    bne sprite_duration_loaded
    bl func_02070d74
sprite_duration_loaded:
    ldr r1, [r4, #0x1c]
    ldrb r0, [r4, #0x38]
    ldr r1, [r1, #0x24]
    add r0, r1, r0, lsl #3
    ldrh r0, [r0, #4]
    ldmia sp!, {r4, pc}
}
#endif
