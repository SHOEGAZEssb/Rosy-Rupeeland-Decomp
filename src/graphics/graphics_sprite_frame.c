#include "tingle/graphics_sprite_state.h"

/*
 * Fixed-point frame advancement and current-frame resource lookup for sprite
 * animation state. The update path honors pause/terminal flags, supports looped
 * playback in either direction, derives the frame from variable durations, and
 * invalidates attached graphics metadata only when the frame actually changes.
 */

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

typedef struct SpriteFrameResourceRecord {
    u16 field_00;
    u16 field_02;
} SpriteFrameResourceRecord;

typedef struct SpriteFrameResource {
    u8 padding_00[0x14];
    void *field_14;
    u8 padding_18[0x0c];
    SpriteFrameSequence *sequences;
    SpriteFrameTiming *frames;
    SpriteFrameResourceRecord *frameResources;
} SpriteFrameResource;

#ifdef __cplusplus
extern "C" {
#endif

extern void func_02070d74(SpriteFrameResource *resource);

#ifdef __cplusplus
}
#endif

/*
 * Advance framePosition by signed 8.8 scaleZ unless paused or blocked by flags
 * 0, 2, 4, or 5. At either sequence boundary, flags bit 1 selects wrapping;
 * otherwise clamp, set terminal bit 0, and retain the first/last valid time.
 * Recompute frameIndex from variable durations and invalidate the attached
 * offset-0x0c byte on a change unless field_3b bit 0 suppresses invalidation.
 * Resource preparation is the only possible asset/SDK side effect.
 */
#ifndef MATCHING
void GraphicsSpriteState_AdvanceAnimation(GraphicsSpriteState *state)
{
    SpriteFrameResource *resource =
        (SpriteFrameResource *)state->animationResource;
    SpriteFrameSequence *sequence;
    SpriteFrameTiming *frame;
    s32 position;
    s32 elapsed;
    s32 accumulated;
    s32 frameIndex;

    if (resource->field_14 == 0) {
        func_02070d74(resource);
    }
    if ((state->field_3b & 2) != 0 || (state->flags & 0x35) != 0) {
        return;
    }

    sequence = &resource->sequences[state->animationIndex];
    position = state->framePosition + state->scaleZ;
    state->framePosition = position;
    if (position < 0) {
        if ((state->flags & 2) != 0) {
            position += (s32)sequence->duration << 8;
            state->framePosition = position;
        } else {
            state->flags |= 1;
            state->framePosition = 0;
        }
    } else if (position >> 8 >= sequence->duration) {
        if ((state->flags & 2) != 0) {
            position -= (s32)sequence->duration << 8;
            state->framePosition = position;
        } else {
            state->flags |= 1;
            state->framePosition = ((s32)sequence->duration - 1) << 8;
        }
    }

    frame = &resource->frames[sequence->firstFrame];
    elapsed = state->framePosition >> 8;
    accumulated = 0;
    frameIndex = 0;
    while (frameIndex < sequence->frameCount) {
        accumulated += frame->duration;
        if (elapsed < accumulated) {
            break;
        }
        frameIndex++;
        frame++;
    }

    if (state->frameIndex != frameIndex) {
        state->frameIndex = (u8)frameIndex;
        if ((state->field_3b & 1) == 0 &&
            state->graphicsVramBinding != 0) {
            ((u8 *)state->graphicsVramBinding)[0x0c] = 0;
        }
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteState_AdvanceAnimation(GraphicsSpriteState *state)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    ldr r1, [r0, #0x14]
    cmp r1, #0
    bne sprite_advance_loaded
    bl func_02070d74
sprite_advance_loaded:
    ldrb r0, [r4, #0x3b]
    and r0, r0, #2
    tst r0, #0xff
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x24]
    and r0, r0, #0x35
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x1c]
    ldrb r0, [r4, #0x38]
    ldr r1, [r1, #0x24]
    ldrsh r2, [r4, #0x36]
    add r1, r1, r0, lsl #3
    ldr r3, [r4, #0x20]
    ldrh r0, [r1, #4]
    adds r2, r3, r2
    str r2, [r4, #0x20]
    bpl sprite_advance_check_end
    ldrh r3, [r4, #0x24]
    and r2, r3, #2
    mov r2, r2, lsl #0x10
    movs r2, r2, lsr #0x10
    ldrne r2, [r4, #0x20]
    addne r0, r2, r0, lsl #8
    strne r0, [r4, #0x20]
    orreq r0, r3, #1
    streqh r0, [r4, #0x24]
    moveq r0, #0
    streq r0, [r4, #0x20]
    b sprite_advance_select_frame
sprite_advance_check_end:
    cmp r0, r2, asr #8
    bgt sprite_advance_select_frame
    ldrh r3, [r4, #0x24]
    and r2, r3, #2
    mov r2, r2, lsl #0x10
    movs r2, r2, lsr #0x10
    ldrne r2, [r4, #0x20]
    subne r0, r2, r0, lsl #8
    strne r0, [r4, #0x20]
    orreq r2, r3, #1
    subeq r0, r0, #1
    streqh r2, [r4, #0x24]
    moveq r0, r0, lsl #8
    streq r0, [r4, #0x20]
sprite_advance_select_frame:
    ldr r2, [r4, #0x1c]
    ldrh r0, [r1, #0]
    ldr r3, [r4, #0x20]
    ldr r2, [r2, #0x28]
    mov r12, #0
    mov lr, r12
    mov r3, r3, asr #8
    add r2, r2, r0, lsl #2
    ldrh r1, [r1, #2]
    b sprite_advance_duration_check
    ldrh r0, [r2, #2]
    add r12, r12, r0
    cmp r3, r12
    blt sprite_advance_duration_done
    add lr, lr, #1
    add r2, r2, #4
sprite_advance_duration_check:
    cmp lr, r1
    DCD 0xBAFFFFF7
sprite_advance_duration_done:
    ldrb r0, [r4, #0x39]
    cmp r0, lr
    ldmeqia sp!, {r4, pc}
    strb lr, [r4, #0x39]
    ldrb r0, [r4, #0x3b]
    and r0, r0, #1
    tst r0, #0xff
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0xc]
    cmp r1, #0
    movne r0, #0
    strneb r0, [r1, #0xc]
    ldmia sp!, {r4, pc}
}
#endif

/*
 * Resolve the current sequence/frame timing record to a resource-record index
 * and return that resource record's offset-0x02 halfword. Lazily prepares the
 * animation resource when necessary; otherwise state and hardware are unchanged.
 */
#ifndef MATCHING
u16 GraphicsSpriteState_GetCurrentFrameResourceField02(
    GraphicsSpriteState *state)
{
    SpriteFrameResource *resource =
        (SpriteFrameResource *)state->animationResource;
    SpriteFrameSequence *sequence;
    SpriteFrameTiming *frame;

    if (resource->field_14 == 0) {
        func_02070d74(resource);
    }
    sequence = &resource->sequences[state->animationIndex];
    frame = &resource->frames[sequence->firstFrame + state->frameIndex];
    return resource->frameResources[frame->resourceIndex].field_02;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm u16 GraphicsSpriteState_GetCurrentFrameResourceField02(
    GraphicsSpriteState *state)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    ldr r1, [r0, #0x14]
    cmp r1, #0
    bne sprite_get_frame_loaded
    bl func_02070d74
sprite_get_frame_loaded:
    ldr r3, [r4, #0x1c]
    ldrb r1, [r4, #0x38]
    ldr r2, [r3, #0x24]
    ldrb r0, [r4, #0x39]
    mov r1, r1, lsl #3
    ldrh r1, [r2, r1]
    ldr r2, [r3, #0x28]
    ldr r3, [r3, #0x2c]
    add r0, r1, r0
    mov r0, r0, lsl #2
    ldrh r0, [r2, r0]
    add r0, r3, r0, lsl #2
    ldrh r0, [r0, #2]
    ldmia sp!, {r4, pc}
}
#endif
