#include "tingle/types.h"

/* Overlay 16 single-sprite wrapper and small base-state lifecycle helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov016_02201520[];
extern const u32 data_ov016_0220155c[];
extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void PresentationList_DeleteAll(void *);
extern void SpritePresentation_InitVariant(void *, s32);
extern void SpritePresentation_Destroy(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct a sprite wrapper from a three-entry resource descriptor and owner.
 * Initialize its base through func_020953C8, install vtable 0x0220155C, initialize
 * resource +0xA0, store the descriptor at +0xAC, load the three nested +0x10
 * resource IDs, create sprite +0x9C on owner, and set sprite byte +0x3A to one.
 * Return state. SDK resource/sprite state changes; no direct MMIO.
 */
extern "C" void *func_ov016_021fe004(void *state, void *descriptor, void *owner)
{
    SpritePresentation_InitVariant(state, 0);
    FIELD(const u32 *, state, 0) = data_ov016_0220155c;
    AnimationResourceState_InitEmbedded((u8 *)state + 0xa0);
    FIELD(void *, state, 0xac) = descriptor;
    func_02071ee0((u8 *)state + 0xa0, data_020f4e18,
                  FIELD(s32, FIELD(void *, descriptor, 0), 0x10),
                  FIELD(s32, FIELD(void *, descriptor, 4), 0x10),
                  FIELD(s32, FIELD(void *, descriptor, 8), 0x10));
    FIELD(void *, state, 0x9c) = GraphicsSpriteGroup_CreateStateFromSource(owner, (u8 *)state + 0xa0, 2);
    FIELD(u8, FIELD(void *, state, 0x9c), 0x3a) = 1;
    return state;
}

/*
 * Destroy resource +0xA0 and the inherited base state, then return state.
 * SDK resources are released; the allocation itself is retained and no direct
 * hardware effects occur.
 */
extern "C" void *func_ov016_021fe08c(void *state)
{
    AnimationResourceState_Destroy((u8 *)state + 0xa0);
    SpritePresentation_Destroy(state);
    return state;
}

/*
 * Destroy resource +0xA0 and inherited base state, free the allocation, and
 * return its former pointer. Heap and SDK resources are released; no MMIO.
 */
extern "C" void *func_ov016_021fe0ac(void *state)
{
    AnimationResourceState_Destroy((u8 *)state + 0xa0);
    SpritePresentation_Destroy(state);
    Heap_Free(state);
    return state;
}

/* Empty callback: accept one pointer, change no state, return void, and perform no hardware effects. */
extern "C" void func_ov016_021fe0d4(void *state)
{
    (void)state;
}

/*
 * Install vtable 0x02201520 and clear words +4/+8/+0xC. Return void; the small
 * base state is initialized without SDK or hardware effects.
 */
extern "C" void Overlay016SmallBase_Init(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov016_02201520;
    FIELD(u32, state, 4) = 0;
    FIELD(u32, state, 8) = 0;
    FIELD(u32, state, 0xc) = 0;
}

/*
 * Restore vtable 0x02201520, destroy the inherited PresentationList_DeleteAll base, and
 * return state. SDK state may be released; there is no direct hardware access.
 */
extern "C" void *func_ov016_021fe0f8(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov016_02201520;
    PresentationList_DeleteAll(state);
    return state;
}
