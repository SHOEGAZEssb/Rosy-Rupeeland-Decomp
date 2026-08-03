#include "tingle/graphics_sprite_state.h"

/*
 * Sequence and frame selection for the graphics sprite state. These routines
 * lazily prepare animation resources, clamp caller indices to resource bounds,
 * maintain an 8.8 frame-time accumulator, and invalidate an attached graphics
 * allocation when animation data changes.
 */

typedef struct SpriteSequenceRecord {
    u16 firstFrame;
    u16 frameCount;
    u16 field_04;
    u16 field_06;
} SpriteSequenceRecord;

typedef struct SpriteFrameRecord {
    u16 field_00;
    u16 duration;
} SpriteFrameRecord;

typedef struct SpriteSequenceSummary {
    u32 field_00;
    u32 animationCount;
} SpriteSequenceSummary;

typedef struct SpriteAnimationResource {
    u8 padding_00[0x14];
    void *field_14;
    u8 padding_18[8];
    SpriteSequenceSummary *summary;
    SpriteSequenceRecord *sequences;
    SpriteFrameRecord *frames;
} SpriteAnimationResource;

#ifdef __cplusplus
extern "C" {
#endif

extern void func_02070d74(SpriteAnimationResource *resource);

#ifdef __cplusplus
}
#endif

/*
 * Select animationIndex, clamping it to the resource's final sequence. Reset
 * frameIndex and framePosition, invalidate the attached offset-0x0c byte unless
 * state field_3b bit 0 suppresses it, and clear flags bit 0. Lazy resource
 * preparation may mutate animationResource; no direct hardware write occurs.
 */
#ifndef MATCHING
void func_02072b68(GraphicsSpriteState *state, u8 animationIndex)
{
    SpriteAnimationResource *resource =
        (SpriteAnimationResource *)state->animationResource;

    if (resource->field_14 == 0) {
        func_02070d74(resource);
    }
    if (animationIndex >= resource->summary->animationCount) {
        animationIndex = (u8)(resource->summary->animationCount - 1);
    }
    state->animationIndex = animationIndex;
    state->frameIndex = 0;
    state->framePosition = 0;
    if ((state->field_3b & 1) == 0 && state->field_0c != 0) {
        ((u8 *)state->field_0c)[0x0c] = 0;
    }
    state->flags &= (u16)~1;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02072b68(GraphicsSpriteState *state, u8 animationIndex)
{
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    mov r5, r1
    ldr r1, [r0, #0x14]
    cmp r1, #0
    bne sprite_set_animation_loaded
    bl func_02070d74
sprite_set_animation_loaded:
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
    bne sprite_set_animation_flags
    ldr r0, [r4, #0xc]
    cmp r0, #0
    strneb r1, [r0, #0xc]
sprite_set_animation_flags:
    ldrh r0, [r4, #0x24]
    bic r0, r0, #1
    strh r0, [r4, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
}
#endif

/*
 * Select frameIndex within the current sequence, clamping to its last frame.
 * Rebuild framePosition as the sum of preceding 16-bit durations in 8.8 form,
 * invalidate the attached offset-0x0c byte unless suppressed, and set flags
 * bit 0. Lazy resource preparation may occur; there is no direct hardware I/O.
 */
#ifndef MATCHING
void func_02072bdc(GraphicsSpriteState *state, u8 frameIndex)
{
    SpriteAnimationResource *resource =
        (SpriteAnimationResource *)state->animationResource;
    SpriteSequenceRecord *sequence;
    SpriteFrameRecord *frame;
    s32 i;

    if (resource->field_14 == 0) {
        func_02070d74(resource);
    }
    sequence = &resource->sequences[state->animationIndex];
    if (frameIndex >= sequence->frameCount) {
        frameIndex = (u8)(sequence->frameCount - 1);
    }
    state->frameIndex = frameIndex;
    frame = &resource->frames[sequence->firstFrame];
    state->framePosition = 0;
    for (i = 0; i < frameIndex; i++) {
        state->framePosition += frame[i].duration;
    }
    state->framePosition <<= 8;
    if ((state->field_3b & 1) == 0 && state->field_0c != 0) {
        ((u8 *)state->field_0c)[0x0c] = 0;
    }
    state->flags |= 1;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02072bdc(GraphicsSpriteState *state, u8 frameIndex)
{
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x1c]
    mov r4, r1
    ldr r1, [r0, #0x14]
    cmp r1, #0
    bne sprite_set_frame_loaded
    bl func_02070d74
sprite_set_frame_loaded:
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
    b sprite_set_frame_sum_check
    ldrh r0, [r2, #2]
    ldr r1, [r5, #0x20]
    add r3, r3, #1
    add r0, r1, r0
    str r0, [r5, #0x20]
    add r2, r2, #4
sprite_set_frame_sum_check:
    cmp r3, r4
    DCD 0xBAFFFFF7
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #8
    str r0, [r5, #0x20]
    ldrb r0, [r5, #0x3b]
    and r0, r0, #1
    tst r0, #0xff
    bne sprite_set_frame_flags
    ldr r1, [r5, #0xc]
    cmp r1, #0
    movne r0, #0
    strneb r0, [r1, #0xc]
sprite_set_frame_flags:
    ldrh r0, [r5, #0x24]
    orr r0, r0, #1
    strh r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
}
#endif

/*
 * Reset to frame zero and time zero, invalidate the attached offset-0x0c byte
 * unless field_3b bit 0 suppresses it, and clear flags bit 0. No resource is
 * loaded, released, or submitted to graphics hardware.
 */
#ifndef MATCHING
void func_02072c98(GraphicsSpriteState *state)
{
    state->frameIndex = 0;
    state->framePosition = 0;
    if ((state->field_3b & 1) == 0 && state->field_0c != 0) {
        ((u8 *)state->field_0c)[0x0c] = 0;
    }
    state->flags &= (u16)~1;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02072c98(GraphicsSpriteState *state)
{
    mov r2, #0
    strb r2, [r0, #0x39]
    str r2, [r0, #0x20]
    ldrb r1, [r0, #0x3b]
    and r1, r1, #1
    tst r1, #0xff
    bne sprite_reset_frame_flags
    ldr r1, [r0, #0xc]
    cmp r1, #0
    strneb r2, [r1, #0xc]
sprite_reset_frame_flags:
    ldrh r1, [r0, #0x24]
    bic r1, r1, #1
    strh r1, [r0, #0x24]
    bx lr
}
#endif

/*
 * Return the current sequence's offset-0x04 halfword, preparing the animation
 * resource first when needed. State is otherwise unchanged, and the resource
 * helper is the only possible SDK/asset side effect.
 */
#ifndef MATCHING
u16 func_02072cd0(GraphicsSpriteState *state)
{
    SpriteAnimationResource *resource =
        (SpriteAnimationResource *)state->animationResource;

    if (resource->field_14 == 0) {
        func_02070d74(resource);
    }
    return resource->sequences[state->animationIndex].field_04;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm u16 func_02072cd0(GraphicsSpriteState *state)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    ldr r1, [r0, #0x14]
    cmp r1, #0
    bne sprite_get_sequence_loaded
    bl func_02070d74
sprite_get_sequence_loaded:
    ldr r1, [r4, #0x1c]
    ldrb r0, [r4, #0x38]
    ldr r1, [r1, #0x24]
    add r0, r1, r0, lsl #3
    ldrh r0, [r0, #4]
    ldmia sp!, {r4, pc}
}
#endif
