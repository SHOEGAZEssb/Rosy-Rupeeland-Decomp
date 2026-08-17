#include "tingle/types.h"

/*
 * Overlay 13 scene/controller lifecycle and callback dispatch. The recovered
 * object owns four small resource handles, thirteen 0xAC-byte records, two
 * managers, and optional heap-allocated controllers.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* These linker symbols denote the addresses of the vtable and command stream. */
extern const u32 data_ov013_021fed6c[];
extern const char data_ov013_021fed80[];
extern const u32 data_ov013_021feb58[];
extern const s32 data_ov013_021fecf0[];
extern void *data_021052fc;
extern void *data_020f4e14;
extern void *data_020f4e18;
extern u8 gHeapContext[];
#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Init(void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void AnimationResourceState_Destroy(void *);
extern void func_020957bc(void *);
extern void func_02091b6c(void *);
extern void RuntimePresentationManager_BroadcastSlot1C(void *, s32);
extern u32 genrand_int32(void);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void *Heap_Alloc(u32, const char *, s32, void *);
extern void Heap_Free(void *);
extern void *SpritePresentation_Init(void *, void *);
extern void Presentation_SetScript(void *, const void *, s32);
extern void SpritePresentation_SyncPosition(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void GamePhaseRuntime_FinalizeActorCollections(void *, s32, s32);
extern void func_ov013_021fce00(void *);
extern void func_ov013_021fce04(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay013Destructor)(void *);
typedef s32 (*Overlay013Callback)(void *);

/* Invoke a selected vtable slot on a non-null object and return void. */
static void overlay013_destroy_dynamic(void *object, s32 slot)
{
    if (object != 0) {
        void **vtable = FIELD(void **, object, 0);
        ((Overlay013Destructor)vtable[slot])(object);
    }
}

/*
 * Construct state in caller-provided storage and return that same pointer.
 * Initialize the base object, resource handles +0x54/+0x60/+0x6C/+0x78,
 * seven records at +0x8C, five at +0x540, the final record at +0x89C, and RNG
 * storage +0x988. Enable the global scene mode, seed +0x978, initialize flags
 * and indexes +0x96C..+0x984, acquire managers +0x84/+0x88, create the
 * 0xA0-byte controller at +0x948, clear seven associated pointers +0x950, and
 * install the callback descriptor at +0x24/+0x28. Resource and SDK calls may
 * allocate, register graphics objects, and alter global mode state. Exact
 * resource type names remain unknown.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov013_021fce2c(void *state)
{
    s32 i;
    void *selected;
    void *controller;

    SceneInputBase_Init(state);
    FIELD(const void *, state, 0) = data_ov013_021fed6c;
    AnimationResourceState_InitEmbedded((u8 *)state + 0x54);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x60);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x6c);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x78);
    for (i = 0; i < 7; ++i)
        func_020957bc((u8 *)state + 0x8c + i * 0xac);
    for (i = 0; i < 5; ++i)
        func_020957bc((u8 *)state + 0x540 + i * 0xac);
    func_020957bc((u8 *)state + 0x89c);
    FIELD(s32, state, 0x978) = 0;
    func_02091b6c((u8 *)state + 0x988);

    RuntimePresentationManager_BroadcastSlot1C((u8 *)data_021052fc + 0x2f7c, 1);
    func_02071ee0((u8 *)state + 0x54, data_020f4e18,
                  0x3298, 0x3299, 0x329a);
    func_02071ee0((u8 *)state + 0x60, data_020f4e18,
                  0x32fd, 0x32fe, 0x32ff);
    func_02071ee0((u8 *)state + 0x6c, data_020f4e18,
                  0x3300, 0x3301, 0x3302);
    func_02071ee0((u8 *)state + 0x78, data_020f4e18,
                  0x4000, 0x4001, 0x4002);

    FIELD(void *, state, 0x9a4) = 0;
    FIELD(void *, state, 0x9a8) = 0;
    FIELD(u32, state, 0x978) = genrand_int32();
    FIELD(s32, state, 0x96c) = -1;
    FIELD(s32, state, 0x970) = -1;
    FIELD(s32, state, 0x97c) = 0;
    FIELD(s32, state, 0x980) = 0;
    /* This two-bit extraction and equality test are confirmed; its meaning is not. */
    if ((FIELD(u32, FIELD(u8 *, data_021052fc, 0x30bc), 0x40) >> 18 & 3) == 2)
        FIELD(s32, state, 0x97c) = 1;
    FIELD(s32, state, 0x974) = 0;
    FIELD(void *, state, 0x84) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    FIELD(void *, state, 0x88) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);

    selected = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x84),
                              (u8 *)state + 0x54, 2);
    GraphicsSpriteState_SetAnimationIndex(selected, 2);
    FIELD(u8, selected, 0x3a) = 3;
    controller = Heap_Alloc(0xa0, data_ov013_021fed80, 4, gHeapContext);
    if (controller != 0)
        controller = SpritePresentation_Init(controller, selected);
    FIELD(void *, state, 0x948) = controller;
    Presentation_SetScript(controller, data_ov013_021feb58, 1);
    FIELD(s32, state, 0x984) = 0;
    SpritePresentation_SyncPosition(controller);
    for (i = 0; i < 7; ++i)
        FIELD(void *, state, 0x950 + i * 4) = 0;
    func_ov013_021fce04(state, data_ov013_021fecf0[0],
                        data_ov013_021fecf0[1], 0);
    return state;
}

/*
 * Destroy all owned controllers, managers, records, and four resource handles;
 * disable the global scene mode and return state without freeing its storage.
 * Dynamic vtable calls and manager/resource destructors may release memory and
 * unregister SDK graphics state.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov013_021fd09c(void *state)
{
    s32 i;

    FIELD(const void *, state, 0) = data_ov013_021fed6c;
    FIELD(u32, state, 0x20) &= ~0x400u;
    overlay013_destroy_dynamic(FIELD(void *, state, 0x948), 1);
    overlay013_destroy_dynamic(FIELD(void *, state, 0x9a4), 1);
    overlay013_destroy_dynamic(FIELD(void *, state, 0x9a8), 2);
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x84));
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x88));
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);
    RuntimePresentationManager_BroadcastSlot1C((u8 *)data_021052fc + 0x2f7c, 0);
    func_ov013_021fce00((u8 *)state + 0x89c);
    for (i = 4; i >= 0; --i)
        func_ov013_021fce00((u8 *)state + 0x540 + i * 0xac);
    for (i = 6; i >= 0; --i)
        func_ov013_021fce00((u8 *)state + 0x8c + i * 0xac);
    AnimationResourceState_Destroy((u8 *)state + 0x78);
    AnimationResourceState_Destroy((u8 *)state + 0x6c);
    AnimationResourceState_Destroy((u8 *)state + 0x60);
    AnimationResourceState_Destroy((u8 *)state + 0x54);
    return state;
}

/* Call func_ov013_021fd09c, free the state allocation, and return its former address; heap state changes are observable. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov013_021fd1a0(void *state)
{
    func_ov013_021fd09c(state);
    Heap_Free(state);
    return state;
}

/*
 * If +0x9A8 is absent, request global phase/state 9 with argument 2. Dispatch
 * the callback encoded by fields +0x24/+0x28 using the ARM C++ member-function
 * pointer convention: +0x28>>1 adjusts `this`, bit 0 selects a vtable lookup,
 * and +0x24 is either the direct function or vtable byte offset. Return the
 * callback result, or zero when +0x24 is null. Callback/global effects pass
 * through unchanged.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fd2ac(void *state)
{
    u32 callback = FIELD(u32, state, 0x24);
    s32 encoding = FIELD(s32, state, 0x28);
    u8 *adjusted = (u8 *)state + (encoding >> 1);
    Overlay013Callback function;

    if (FIELD(void *, state, 0x9a8) == 0)
        GamePhaseRuntime_FinalizeActorCollections(data_021052fc, 9, 2);
    if (callback == 0)
        return 0;
    if (encoding & 1) {
        u8 *vtable = FIELD(u8 *, adjusted, 0);
        function = *(Overlay013Callback *)(vtable + callback);
    } else {
        function = (Overlay013Callback)callback;
    }
    return function(adjusted);
}
