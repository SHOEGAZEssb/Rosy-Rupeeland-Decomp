#include "tingle/heap.h"
#include "tingle/types.h"

/* Spawn an actor presentation from a one-based entry in the recovered resource table. */
extern const char data_020df4f0[];
extern u8 data_021056e4[];
extern void *gSoundContext;
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorFeedbackResources_GetResource(u32 index);
extern u32 genrand_int32(void);
extern void *func_0201f378(void *allocation, ...);
extern void Sound_Play(void *context, s32 channel, s32 sound);
extern void func_0201ded4(void *manager, void *object);
#ifdef __cplusplus
}
#endif

/*
 * Fetch the one-based table resource; return if absent, otherwise advance the
 * global RNG once. Allocate a tagged 0x14-byte presentation and construct it
 * at actor position +0x18 with attachment +0x54/+0x00 and resource words
 * +0x04/+0x08/+0x0c. Index one uses variant zero and constants 0x12/two.
 * Indices seven/eight use variant (signed actor byte +0x1e6 + 2*orientation
 * byte +0xd4) and constants 0x40/two. Other indices use orientation as variant
 * and constants 0x12/two.
 *
 * Play the table record's packed sound +0x06 for index one, or for indices
 * seven/eight only when actor subtype byte +0x4d is one. Register the result
 * with manager data_021052fc +0x2f7c, then store value into halfword +0x36 of
 * the presentation's nested +0x08/+0x04 object. Returns no value. The matching
 * retail path assumes presentation allocation succeeds before that final
 * nested access; RNG, heap, sound, construction, and manager calls have
 * observable engine/SDK effects.
 */
void ActorFeedback_SpawnIndexedPresentation(void *self, u32 index, u16 value)
{
    u8 *actor = (u8 *)self;
    u8 *resource = (u8 *)ActorFeedbackResources_GetResource(index);
    void *presentation = 0;
    void *allocation;
    u16 sound;

    if (resource == 0)
        return;
    (void)genrand_int32();
    allocation = Heap_Alloc(0x14, data_020df4f0, 4, &gHeapContext);
    if (allocation != 0) {
        s32 variant;
        s32 constant;
        if (index == 1) {
            variant = 0;
            constant = 0x12;
        } else if (index == 7 || index == 8) {
            variant = *(s8 *)(actor + 0x1e6) + actor[0xd4] * 2;
            constant = 0x40;
        } else {
            variant = actor[0xd4];
            constant = 0x12;
        }
        presentation = func_0201f378(
            allocation, actor + 0x18, variant,
            **(void ***)(actor + 0x54), *(s32 *)(resource + 4),
            *(s32 *)(resource + 8), *(s32 *)(resource + 0x0c), constant, 2);
    }

    if (index == 1 ||
        ((index == 7 || index == 8) && actor[0x4d] == 1)) {
        u8 *records = *(u8 **)(data_021056e4 + 4);
        sound = *(u16 *)(records + (index - 1) * 8 + 6);
        if (sound != 0)
            Sound_Play(gSoundContext, sound >> 7, sound & 0x7f);
    }
    func_0201ded4(data_021052fc + 0x2f7c, presentation);
    *(u16 *)(*(u8 **)(*(u8 **)((u8 *)presentation + 8) + 4) + 0x36) = value;
}
