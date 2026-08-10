#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Provide impact feedback and attachment-state transitions for the registered
 * table-record actor subclass.
 */
extern const char gActorRegisteredSubclassPresentationAllocationTag[];
extern u8 *data_021052fc;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020be334(s32 value);
extern s32 func_020be328(s32 value);
extern s32 func_020adae4(s32 dividend, s32 divisor);
extern void *ActorMotionAreaFollower_GetPosition(void *manager);
extern void func_020593ac(void *context, s32 sound, s32 variant,
                          s32 volume, s32 pan, s32 extra);
extern void *func_0201f864(void *allocation, ...);
extern void GraphicsSpriteState_SetAnimationIndex(void *attachment, u32 animation);
extern void *TrackedResourceActor_SpawnFromKey(s32 effect, const void *first, const void *second);
#ifdef __cplusplus
}
#endif

/*
 * If the signed magnitude derived from actor +0x44 exceeds 0x1000, compute a
 * horizontal pan from the global reference at manager offset +0x2fbc, clamp it
 * to [-128,127], and play sound 0x1c4 variant seven. Volume is magnitude>>7
 * minus abs(pan)/3, clamped to [0,127]. Then allocate and construct a timed
 * presentation using attachment resource +0x00 and constants 0x162b..0x162d.
 * Returns no value; sound hardware, heap, and presentation state may change.
 */
void ActorRegisteredSubclass_EmitImpactFeedback(void *self)
{
    u8 *actor = (u8 *)self;
    s32 magnitude = func_020be334(*(s32 *)(actor + 0x44));

    if (magnitude > 0x1000) {
        u8 *reference = (u8 *)ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
        s32 pan = (*(s32 *)(actor + 0x1c) - *(s32 *)(reference + 4) -
                   0x80000) >> 12;
        s32 volume;
        void *allocation;

        if (pan < -128)
            pan = -128;
        if (pan > 127)
            pan = 127;
        volume = (magnitude >> 7) - func_020adae4(func_020be328(pan), 3);
        if (volume > 127)
            volume = 127;
        if (volume < 0)
            volume = 0;
        func_020593ac(gSoundContext, 0x1c4, 7, volume, pan, 0);

        allocation = Heap_Alloc(0x14, gActorRegisteredSubclassPresentationAllocationTag, 4, &gHeapContext);
        if (allocation != 0) {
            u8 *attachment = *(u8 **)(actor + 0x54);
            (void)func_0201f864(allocation, actor + 0x18,
                                *(void **)attachment, 0x162b,
                                0x162c, 0x162d, 0, 0x80, 2, 1);
        }
    }
}

/*
 * Synchronize attachment +0x54 with state halfword +0xd6. States zero and one
 * select animation zero or one, set attachment +0x24 bit two, and clear bits
 * 0x01/0x10. State two only sets bit 0x10; other states do nothing. Returns no
 * value; attachment animation and flags change.
 */
void ActorRegisteredSubclass_UpdatePresentationState(void *self)
{
    u8 *actor = (u8 *)self;
    s16 state = *(s16 *)(actor + 0xd6);
    u8 *attachment;

    if (state == 2) {
        attachment = *(u8 **)(actor + 0x54);
        *(u16 *)(attachment + 0x24) |= 0x10;
        return;
    }
    if (state != 0 && state != 1)
        return;

    attachment = *(u8 **)(actor + 0x54);
    GraphicsSpriteState_SetAnimationIndex(attachment, state != 0);
    *(u16 *)(attachment + 0x24) |= 2;
    *(u16 *)(attachment + 0x24) &= ~0x11;
}

/*
 * Enter state two: set actor +0x14 bits 0x2/0x4, set word +0x114 to one, and
 * set attachment +0x24 bit 0x10. Spawn effect 0x1c at actor vector +0x18 and
 * set bit 0x100 in the returned object's word +0x10. Returns no value; actor,
 * attachment, and effect-manager state change. The returned object is assumed
 * non-null because the retail code dereferences it unconditionally.
 */
void ActorRegisteredSubclass_EnterState2(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *effect;

    *(s16 *)(actor + 0xd6) = 2;
    *(u32 *)(actor + 0x14) |= 0x6;
    *(s32 *)(actor + 0x114) = 1;
    *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) |= 0x10;
    effect = (u8 *)TrackedResourceActor_SpawnFromKey(0x1c, actor + 0x18, actor + 0x18);
    *(u32 *)(effect + 0x10) |= 0x100;
}
