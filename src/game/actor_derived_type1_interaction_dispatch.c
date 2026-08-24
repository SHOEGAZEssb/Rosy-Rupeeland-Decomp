#include "tingle/heap.h"
#include "tingle/types.h"

/* Dispatch a type-1 actor interaction into damage effects or the active scene. */
extern void *gGamePhaseCurrencyHud;
extern const char data_020df4a4[];
extern u8 *gGamePhaseRuntime;
extern void *gSceneManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseCurrencyHud_AddCurrency(void *context, s32 value, s32 extra);
extern void *ActorMotionAreaFollower_GetPosition(void *manager);
extern void *func_02022cb0(void *allocation, void *resource, void *owner,
                           s32 value, s32 first, s32 second);
extern void RuntimePresentationManager_AppendFirstListEffect(void *manager, void *object);
extern void ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect(void *actor);
extern void Actor_PlayHorizontalSpatialSound(void *actor, u32 packedSound, s32 pitch);
extern void Type1Actor_TryEnterFailureState(void *actor);
extern void ActorDerivedType1_StartRecord(void *actor, s32 record);
extern void *SceneManager_GetCurrent(void *manager);
#ifdef __cplusplus
}
#endif

/*
 * Return while optional actor object +0x270 has byte +0x10 bit one or actor
 * +0x230 bit 0x20000. With +0xd0 bit 0x40000 clear and positive amount,
 * subtract the amount from currency, allocate/register a 0x44-byte effect carrying
 * -amount, 0x2000, and -0xc0, then inspect source descriptor +0x1fc. IDs
 * 0x21/0x22/0x2e/0x2f/0x40 trigger auxiliary reset, sound 0x26, and actor
 * +0x230 bit 0x400000 when descriptor byte +0x2c is four or 0x200000 otherwise;
 * finally call Type1Actor_TryEnterFailureState. Independently, descriptor
 * halfword +0x2e other
 * than -1 starts a record through ActorDerivedType1_StartRecord.
 *
 * With actor +0xd0 bit 0x40000 set, positive amount instead dispatches source
 * to virtual +0xc8 on current scene object +0x4c. Returns no value; currency-HUD, heap,
 * manager, auxiliary, sound, record, and scene calls alter engine state.
 */
void ActorDerivedType1_DispatchInteractionAmount(void *self, s32 amount, void *sourceValue)
{
    u8 *actor = (u8 *)self;
    u8 *source = (u8 *)sourceValue;
    u8 *descriptor;

    if (*(u8 **)(actor + 0x270) != 0 &&
        ((*(u8 **)(actor + 0x270))[0x10] & 1) != 0)
        return;
    if ((*(u32 *)(actor + 0x230) & 0x20000) != 0)
        return;
    if ((*(u32 *)(actor + 0xd0) & 0x40000) != 0) {
        if (amount > 0) {
            u8 *scene = (u8 *)SceneManager_GetCurrent(gSceneManager);
            void *object = *(void **)(scene + 0x4c);
            (*(void (**)(void *, void *))(*(u8 **)object + 0xc8))(object,
                                                                    source);
        }
        return;
    }

    if (amount > 0) {
        s32 negative = -amount;
        void *allocation;
        void *effect = 0;
        GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud, negative, 0);
        allocation = Heap_Alloc(0x44, data_020df4a4, 4, &gHeapContext);
        if (allocation != 0) {
            void *resource = ActorMotionAreaFollower_GetPosition(gGamePhaseRuntime + 0x2fbc);
            effect = func_02022cb0(allocation, resource, actor, negative,
                                   0x2000, -0xc0);
        }
        RuntimePresentationManager_AppendFirstListEffect(gGamePhaseRuntime + 0x2f7c, effect);
        descriptor = *(u8 **)(source + 0x1fc);
        if (*(s16 *)descriptor == 0x21 || *(s16 *)descriptor == 0x22 ||
            *(s16 *)descriptor == 0x2e || *(s16 *)descriptor == 0x2f ||
            *(s16 *)descriptor == 0x40) {
            ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect(actor);
            Actor_PlayHorizontalSpatialSound(actor, 0x26, 0);
            if (*(s8 *)(descriptor + 0x2c) == 4)
                *(u32 *)(actor + 0x230) |= 0x400000;
            else
                *(u32 *)(actor + 0x230) |= 0x200000;
        }
        Type1Actor_TryEnterFailureState(actor);
    }
    descriptor = *(u8 **)(source + 0x1fc);
    if (*(s16 *)(descriptor + 0x2e) != -1)
        ActorDerivedType1_StartRecord(actor, *(s16 *)(descriptor + 0x2e));
}
