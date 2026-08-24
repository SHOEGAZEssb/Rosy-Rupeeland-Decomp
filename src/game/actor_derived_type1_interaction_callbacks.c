#include "tingle/heap.h"
#include "tingle/types.h"

/* Provide type-1 actor interaction callbacks and their default return paths. */
extern void *gGamePhaseCurrencyHud;
extern const char data_020df4a4[];
extern u8 *data_021052fc;
extern void *gSceneManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseCurrencyHud_AddCurrency(void *context, s32 value, s32 extra);
extern void *ActorMotionAreaFollower_GetPosition(void *manager);
extern void *func_02022cb0(void *allocation, void *resource, void *owner,
                           s32 value, s32 first, s32 second);
extern void RuntimePresentationManager_AppendFirstListEffect(void *manager, void *object);
extern void Type1Actor_TryEnterFailureState(void *actor);
extern void *SceneManager_GetCurrent(void *manager);
#ifdef __cplusplus
}
#endif

/* Accept no inputs, change no state, and return no value. */
void ActorDerivedType1_InteractionNoOp(void) {}

/*
 * Return zero while optional object +0x270 has byte +0x10 bit one, actor
 * +0x230 bit 0x20000 is set, or amount is nonpositive. With +0xd0 bit 0x40000
 * clear, subtract the positive amount from currency, allocate/register a 0x44-byte
 * actor-owned effect with -amount, 0x2000, and -0xc0, call
 * Type1Actor_TryEnterFailureState, and
 * return one. With that bit set, instead dispatch source through current scene
 * object +0x4c virtual +0xcc and return its result. Heap, currency-HUD, manager, scene,
 * and virtual calls have observable engine state.
 */
s32 ActorDerivedType1_TryApplyInteractionAmount(void *self, s32 amount, void *source)
{
    u8 *actor = (u8 *)self;
    if (*(u8 **)(actor + 0x270) != 0 &&
        ((*(u8 **)(actor + 0x270))[0x10] & 1) != 0)
        return 0;
    if ((*(u32 *)(actor + 0x230) & 0x20000) != 0 || amount <= 0)
        return 0;
    if ((*(u32 *)(actor + 0xd0) & 0x40000) != 0) {
        u8 *scene = (u8 *)SceneManager_GetCurrent(gSceneManager);
        void *object = *(void **)(scene + 0x4c);
        return (*(s32 (**)(void *, void *))(*(u8 **)object + 0xcc))(object,
                                                                       source);
    } else {
        s32 negative = -amount;
        void *allocation;
        void *effect = 0;
        GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud, negative, 0);
        allocation = Heap_Alloc(0x44, data_020df4a4, 4, &gHeapContext);
        if (allocation != 0) {
            void *resource = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
            effect = func_02022cb0(allocation, resource, actor, negative,
                                   0x2000, -0xc0);
        }
        RuntimePresentationManager_AppendFirstListEffect(data_021052fc + 0x2f7c, effect);
        Type1Actor_TryEnterFailureState(actor);
        return 1;
    }
}

/* Ignore all inputs, change no state, and return zero. */
s32 ActorDerivedType1_ReturnZeroInteraction(void)
{
    return 0;
}
