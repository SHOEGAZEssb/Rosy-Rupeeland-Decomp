#include "tingle/graphics_animation_instance.h"

/*
 * Initialization and direct sequence/frame selection for a 0x5c-byte graphics
 * animation instance. Resource-table interpretation is confirmed only for the
 * animation count, per-sequence first-frame/count pair, and frame durations.
 */

/*
 * Initialize instance with owner and retail defaults. All pointers, timing,
 * positions, and unknown controls are cleared; the two signed fixed-point
 * scale fields become 0x1000, field_4e becomes 0x7fff, field_52 becomes 0x100,
 * and byte defaults 0x59/0x5b become 2/0x1f. No allocation or hardware access
 * occurs and the resource pointer remains null.
 */
#ifndef MATCHING
void GraphicsAnimationInstance_Init(GraphicsAnimationInstance *instance, void *owner)
{
    instance->owner = owner;
    instance->next = 0;
    instance->previous = 0;
    instance->textureRegion = 0;
    instance->paletteRegion = 0;
    instance->textureResource = 0;
    instance->paletteResource = 0;
    instance->resource = 0;
    instance->field_40 = 0;
    instance->field_3c = 0;
    instance->field_28 = 0;
    instance->field_24 = 0;
    instance->field_20 = 0;
    instance->field_2c = 0;
    instance->animationTime = 0;
    instance->scaleY = 0x1000;
    instance->scaleX = 0x1000;
    instance->field_44 = 0;
    instance->field_4e = 0x7fff;
    instance->field_4c = 0;
    instance->field_4a = 0;
    instance->field_48 = 0;
    instance->flags = 0;
    instance->timeStep = 0x100;
    instance->field_56 = 0;
    instance->frameIndex = 0;
    instance->animationIndex = 0;
    instance->field_57 = 0;
    instance->field_58 = 0;
    instance->field_59 = 2;
    instance->field_5a = 0;
    instance->field_5b = 0x1f;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsAnimationInstance_Init(GraphicsAnimationInstance *instance, void *owner)
{
    str r1, [r0, #0]
    mov r2, #0
    str r2, [r0, #8]
    str r2, [r0, #4]
    str r2, [r0, #0xc]
    str r2, [r0, #0x10]
    str r2, [r0, #0x14]
    str r2, [r0, #0x18]
    str r2, [r0, #0x1c]
    str r2, [r0, #0x40]
    str r2, [r0, #0x3c]
    str r2, [r0, #0x28]
    str r2, [r0, #0x24]
    str r2, [r0, #0x20]
    str r2, [r0, #0x2c]
    mov r1, #0x1000
    str r2, [r0, #0x30]
    str r1, [r0, #0x38]
    str r1, [r0, #0x34]
    /* PC-relative load of the 0x7fff literal at the function tail. */
    DCD 0xE59F1048
    str r2, [r0, #0x44]
    strh r1, [r0, #0x4e]
    strh r2, [r0, #0x4c]
    strh r2, [r0, #0x4a]
    strh r2, [r0, #0x48]
    strh r2, [r0, #0x50]
    mov r1, #0x100
    strh r1, [r0, #0x52]
    strb r2, [r0, #0x56]
    strb r2, [r0, #0x55]
    strb r2, [r0, #0x54]
    strb r2, [r0, #0x57]
    strb r2, [r0, #0x58]
    mov r1, #2
    strb r1, [r0, #0x59]
    strb r2, [r0, #0x5a]
    mov r1, #0x1f
    strb r1, [r0, #0x5b]
    bx lr
animation_instance_field_4e_default:
    DCD 0x00007fff
}
#endif

/*
 * Select an animation, clamping indices at or beyond the signed resource count
 * to count-1 and truncating the result to u8. Reset frameIndex and animationTime
 * and clear flags bit 0. The resource and its nested setHeader must be valid;
 * count zero and negative caller indices are outside the confirmed contract.
 */
void GraphicsAnimationInstance_SetAnimation(GraphicsAnimationInstance *instance, s32 animationIndex)
{
    s32 count = instance->resource->setHeader->animationCount;

    if (animationIndex >= count) {
        animationIndex = (count - 1) & 0xff;
    }
    instance->animationIndex = (u8)animationIndex;
    instance->frameIndex = 0;
    instance->animationTime = 0;
    instance->flags &= ~1;
}

/*
 * Select a frame in the current animation, clamping at the sequence frame
 * count and truncating to u8. Sum the durations of preceding frames beginning
 * at firstFrame, convert that sum to signed 24.8 time, and set flags bit 0.
 * No rendering or hardware change occurs; all resource pointers must be valid.
 */
void GraphicsAnimationInstance_SetFrame(GraphicsAnimationInstance *instance, s32 frameIndex)
{
    GraphicsAnimationSequenceInfo *sequence =
        &instance->resource->sequences[instance->animationIndex];
    GraphicsAnimationFrameInfo *frame =
        &instance->resource->frames[sequence->firstFrame];
    s32 i;

    if (frameIndex >= sequence->frameCount) {
        frameIndex = (sequence->frameCount - 1) & 0xff;
    }
    instance->frameIndex = (u8)frameIndex;
    instance->animationTime = 0;
    for (i = 0; i < frameIndex;) {
        i++;
        instance->animationTime += frame->duration;
        frame++;
    }
    instance->animationTime <<= 8;
    instance->flags |= 1;
}
