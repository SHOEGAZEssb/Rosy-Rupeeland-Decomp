#include "tingle/graphics_animation_instance.h"

/*
 * Per-tick advancement for the 0x5c-byte graphics animation instance. The
 * routine updates only time, terminal/loop flags, and the selected frame; it
 * does not prepare resources, invalidate cached graphics data, or touch the
 * rendering hardware.
 */

/*
 * Advance signed 24.8 animationTime by timeStep unless flags bits 0, 2, or 4
 * block playback. At either sequence boundary, flags bit 1 selects a one-span
 * wrap; otherwise clamp to the first or last valid tick and set terminal bit
 * 0. Resolve frameIndex by accumulating the current sequence's 16-bit frame
 * durations. Resource pointers and positive sequence duration/count are a
 * caller invariant; a tick large enough to cross multiple spans is outside
 * the behavior handled by one retail update.
 */
#ifndef MATCHING
void GraphicsAnimationInstance_Update(GraphicsAnimationInstance *instance)
{
    GraphicsAnimationSequenceInfo *sequence;
    GraphicsAnimationFrameInfo *frame;
    s32 position;
    s32 elapsed;
    s32 accumulated;
    s32 frameIndex;

    if ((instance->flags & 0x15) != 0) {
        return;
    }

    sequence = &instance->resource->sequences[instance->animationIndex];
    position = instance->animationTime + (s16)instance->timeStep;
    instance->animationTime = position;
    if (position < 0) {
        if ((instance->flags & 2) != 0) {
            position += (s32)sequence->duration << 8;
            instance->animationTime = position;
        } else {
            instance->flags |= 1;
            instance->animationTime = 0;
        }
    } else if (position / 0x100 >= sequence->duration) {
        if ((instance->flags & 2) != 0) {
            position -= (s32)sequence->duration << 8;
            instance->animationTime = position;
        } else {
            instance->flags |= 1;
            instance->animationTime = ((s32)sequence->duration - 1) << 8;
        }
    }

    frame = &instance->resource->frames[sequence->firstFrame];
    elapsed = instance->animationTime / 0x100;
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
    if (instance->frameIndex != frameIndex) {
        instance->frameIndex = (u8)frameIndex;
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsAnimationInstance_Update(GraphicsAnimationInstance *instance)
{
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r1, [r0, #0x50]
    and r1, r1, #0x15
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, [r0, #0x1c]
    ldrb r1, [r0, #0x54]
    ldr r2, [r2, #0x24]
    ldrsh r3, [r0, #0x52]
    add r2, r2, r1, lsl #3
    ldr r12, [r0, #0x30]
    ldrh r1, [r2, #4]
    adds r12, r12, r3
    str r12, [r0, #0x30]
    bpl animation_instance_update_check_end
    ldrh r12, [r0, #0x50]
    and r3, r12, #2
    mov r3, r3, lsl #0x10
    movs r3, r3, lsr #0x10
    ldrne r3, [r0, #0x30]
    addne r1, r3, r1, lsl #8
    strne r1, [r0, #0x30]
    orreq r1, r12, #1
    streqh r1, [r0, #0x50]
    moveq r1, #0
    streq r1, [r0, #0x30]
    b animation_instance_update_select_frame
animation_instance_update_check_end:
    mov r3, r12, asr #7
    add r3, r12, r3, lsr #0x18
    cmp r1, r3, asr #8
    bgt animation_instance_update_select_frame
    ldrh r12, [r0, #0x50]
    and r3, r12, #2
    mov r3, r3, lsl #0x10
    movs r3, r3, lsr #0x10
    ldrne r3, [r0, #0x30]
    subne r1, r3, r1, lsl #8
    strne r1, [r0, #0x30]
    orreq r3, r12, #1
    subeq r1, r1, #1
    streqh r3, [r0, #0x50]
    moveq r1, r1, lsl #8
    streq r1, [r0, #0x30]
animation_instance_update_select_frame:
    ldr r3, [r0, #0x30]
    ldr r12, [r0, #0x1c]
    mov r1, r3, asr #7
    add r1, r3, r1, lsr #0x18
    ldrh r3, [r2]
    ldr r12, [r12, #0x28]
    mov r4, #0
    mov r5, r4
    mov lr, r1, asr #8
    add r3, r12, r3, lsl #2
    ldrh r2, [r2, #2]
    b animation_instance_update_duration_check
animation_instance_update_duration_loop:
    ldrh r1, [r3, #2]
    add r4, r4, r1
    cmp lr, r4
    blt animation_instance_update_duration_done
    add r5, r5, #1
    add r3, r3, #4
animation_instance_update_duration_check:
    cmp r5, r2
    /* Hand encoded to avoid MWCC's backward-label fallthrough branch. */
    DCD 0xBAFFFFF7
animation_instance_update_duration_done:
    ldrb r1, [r0, #0x55]
    cmp r1, r5
    strneb r5, [r0, #0x55]
    ldmia sp!, {r3, r4, r5, pc}
}
#endif
