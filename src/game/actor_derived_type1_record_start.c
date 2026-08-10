#include "tingle/types.h"

/* Start a descriptor-backed type-1 actor record when ownership gates permit. */
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedType1_TeardownActiveRecord(void *actor);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *value);
extern void *func_020541d4(void *records);
extern void *func_02053f9c(void *records, const void *position, s32 mode);
extern void ActorDerivedType1_ApplyActiveRecord(void *actor);
extern void Sound_Play(void *context, s32 channel, s32 sound);
#ifdef __cplusplus
}
#endif

/*
 * Return while auxiliary +0x26c exists, optional object +0x270 has byte +0x10
 * bit one set, or actor +0x230 bit 0x20000 is set. Otherwise tear down the old
 * record via ActorDerivedType1_TeardownActiveRecord, copy actor position +0x18 to a temporary, obtain a
 * descriptor from records into +0x27c, and when descriptor halfword +0x02 is
 * nonzero create/store a position-bound object at +0x278. If that halfword is
 * zero, play packed descriptor sound +0x2e when present. Then call
 * ActorDerivedType1_ApplyActiveRecord and destroy the temporary. Returns no value; record, object,
 * vector, and sound helpers have observable engine/SDK effects.
 */
void ActorDerivedType1_StartRecord(void *self, void *records)
{
    u8 *actor = (u8 *)self;
    u8 *descriptor;
    s32 position[4];

    if (*(void **)(actor + 0x26c) != 0)
        return;
    if (*(u8 **)(actor + 0x270) != 0 &&
        ((*(u8 **)(actor + 0x270))[0x10] & 1) != 0)
        return;
    if ((*(u32 *)(actor + 0x230) & 0x20000) != 0)
        return;

    ActorDerivedType1_TeardownActiveRecord(actor);
    VecFx32Object_InitCopy(position, actor + 0x18);
    descriptor = (u8 *)func_020541d4(records);
    *(u8 **)(actor + 0x27c) = descriptor;
    if (*(u16 *)(descriptor + 2) != 0) {
        *(void **)(actor + 0x278) = func_02053f9c(records, position, 1);
    } else if (*(u16 *)(descriptor + 0x2e) != 0) {
        s32 sound = *(u16 *)(descriptor + 0x2e);
        Sound_Play(gSoundContext, sound >> 7, sound & 0x7f);
    }
    ActorDerivedType1_ApplyActiveRecord(actor);
    VecFx32Object_Destroy(position);
}
