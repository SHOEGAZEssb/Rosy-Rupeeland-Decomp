#include "tingle/types.h"

/*
 * Overlay 50 paired-sprite field-effect lifecycle. The recovered object owns
 * a render record, two sprite instances, randomized animation state, and a
 * small polymorphic base. Exact assembly preserves SDK call and RNG ordering.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *gGameWork;
extern "C" u8 data_ov050_0220e384[];
extern "C" void *VecFx32Object_Init(void *vector);
extern "C" void *VecFx32Object_InitCopy(void *vector, const void *source);
extern "C" void *VecFx32Object_InitComponents(void *vector, s32 x, s32 y,
                                               s32 z);
extern "C" void *VecFx32Object_Assign(void *vector, const void *source);
extern "C" void *VecFx32Object_Add(void *vector, const void *delta);
extern "C" void *VecFx32Object_Destroy(void *vector);
extern "C" void *GraphicsSpriteGroup_CreateState(
    void *group, void *resource0, void *resource1, void *resource2, s32 mode);
extern "C" void GraphicsSpriteGroup_ReleaseState(void *group, void *state);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *state, s32 index);
extern "C" s32 DisplayController_GetSubScreenVerticalOffset(void);
extern "C" u32 genrand_int32(void);
extern "C" void Heap_Free(void *allocation);

extern "C" void Overlay050PairedEffect_ResetMotion(void *effect, s32 scale);
extern "C" void Overlay050SpritePair_SetAlpha(void *pair, u32 alpha);
extern "C" void Overlay050EffectBase_Init(void *effect);
extern "C" void *Overlay050Effect_Destroy(void *effect);

/*
 * Construct caller-owned `effect`: copy origin, initialize velocity, create
 * one sprite in each borrowed group from the borrowed resource triplet, and
 * seed horizontal motion at 1.0 fixed scale. Returns `effect`; sprite/vector
 * state and RNG state change, but this routine allocates no storage.
 */
extern "C" void *func_ov050_0220d600(void *effect, void *primaryGroup,
                                      void *secondaryGroup,
                                      const void *resources,
                                      const void *origin)
{
    void *primary;
    void *secondary;

    VecFx32Object_InitCopy((u8 *)effect + 8, origin);
    VecFx32Object_Init((u8 *)effect + 0x18);
    FIELD(s32, effect, 0x28) = FIELD(s32, origin, 8);
    primary = GraphicsSpriteGroup_CreateState(
        primaryGroup, FIELD(void *, resources, 0),
        FIELD(void *, resources, 4), FIELD(void *, resources, 8), 1);
    FIELD(void *, effect, 0) = primary;
    GraphicsSpriteState_SetAnimationIndex(primary, 0);
    FIELD(s16, primary, 0x2c) = 0x80;
    FIELD(s16, primary, 0x2e) = 0x60;
    secondary = GraphicsSpriteGroup_CreateState(
        secondaryGroup, FIELD(void *, resources, 0),
        FIELD(void *, resources, 4), FIELD(void *, resources, 8), 1);
    FIELD(void *, effect, 4) = secondary;
    GraphicsSpriteState_SetAnimationIndex(secondary, 0);
    FIELD(s16, secondary, 0x2c) = 0x80;
    FIELD(s16, secondary, 0x2e) = 0x60;
    Overlay050PairedEffect_ResetMotion(effect, 0x1000);
    return effect;
}

/*
 * Release both sprites and destroy the embedded render/vector records, then
 * return the unchanged effect pointer. SDK sprite and object-owned state
 * change; storage is not freed and no direct hardware access occurs.
 */
extern "C" void *Overlay050PairedEffect_Destroy(void *effect)
{
    void *primary = FIELD(void *, effect, 0);
    void *secondary = FIELD(void *, effect, 4);

    GraphicsSpriteGroup_ReleaseState(FIELD(void *, primary, 0), primary);
    GraphicsSpriteGroup_ReleaseState(FIELD(void *, secondary, 0), secondary);
    VecFx32Object_Destroy((u8 *)effect + 0x18);
    VecFx32Object_Destroy((u8 *)effect + 8);
    return effect;
}

/*
 * Advance one effect frame: update the embedded animation, choose/apply sprite
 * frames and alpha, integrate the offset-derived transform values, and invoke
 * the shared feedback helper when its timer gate fires. Effect, sprite, and
 * SDK state change; the recovered status is returned and no direct MMIO occurs.
 */
extern "C" s32 Overlay050PairedEffect_Update(void *effect, const void *transform)
{
    s32 remaining;
    s32 frame;
    s32 x;
    s32 y;
    s32 subOffset;
    void *primary;
    void *secondary;

    VecFx32Object_Add((u8 *)effect + 8, (u8 *)effect + 0x18);
    FIELD(s32, effect, 0x20) +=
        FIELD(s16, (u8 *)gGameWork + 0x200, 0x10) / 2;
    if (FIELD(s32, effect, 0x10) > FIELD(s32, effect, 0x28))
        return 1;
    remaining = (FIELD(s32, effect, 0x28) - FIELD(s32, effect, 0x10)) >> 12;
    frame = remaining / 128;
    if (frame > 4)
        frame = 4;
    primary = FIELD(void *, effect, 0);
    secondary = FIELD(void *, effect, 4);
    GraphicsSpriteState_SetAnimationIndex(primary, 4 - frame);
    x = (FIELD(s32, effect, 0x0c) >> 12) - FIELD(s32, transform, 4);
    y = (FIELD(s32, effect, 0x10) >> 12) - FIELD(s32, transform, 8);
    subOffset = DisplayController_GetSubScreenVerticalOffset();
    FIELD(s16, primary, 0x2c) = (s16)x;
    FIELD(s16, primary, 0x2e) = (s16)(y - subOffset);
    FIELD(s16, secondary, 0x2c) = (s16)x;
    FIELD(s16, secondary, 0x2e) = (s16)y;
    return 0;
}

/*
 * Reset/randomize effect motion and animation records using genrand_int32,
 * reconstruct the embedded animation record, and release its prior state in
 * the recovered order. Effect and RNG/SDK animation state change; nothing is
 * returned and no direct MMIO occurs.
 */
extern "C" void Overlay050PairedEffect_ResetMotion(void *effect, s32 scale)
{
    s32 velocity[4];
    s32 sample = (s32)((genrand_int32() & 1) << 8) - 0x4000;
    s32 x = (s32)(((s64)sample * scale + 0x800) >> 12);

    VecFx32Object_InitComponents(velocity, x, 0, 0);
    VecFx32Object_Assign((u8 *)effect + 0x18, velocity);
    VecFx32Object_Destroy(velocity);
}

/*
 * Construct an effect manager in caller-provided storage, retain its paired
 * sprite groups and resource table, copy `origin`, and initialize cadence,
 * list, scale, and enable state. Return the same pointer. SDK vector state
 * changes; storage remains caller-owned and no direct MMIO occurs.
 */
extern "C" void *func_ov050_0220d824(void *effect, void *primaryGroup,
                                      void *secondaryGroup,
                                      const void *resources,
                                      const void *origin)
{
    Overlay050EffectBase_Init(effect);
    FIELD(s32, effect, 0x10) = 0;
    FIELD(void *, effect, 0x14) = primaryGroup;
    FIELD(void *, effect, 0x18) = secondaryGroup;
    FIELD(const void *, effect, 0x1c) = resources;
    VecFx32Object_InitCopy((u8 *)effect + 0x20, origin);
    FIELD(s32, effect, 0x30) = 0x1000;
    FIELD(s32, effect, 0x34) = 1;
    return effect;
}

/*
 * Run the base-effect teardown through Overlay050Effect_Destroy and return the
 * unchanged pointer. Owned effect state changes; storage is not freed.
 */
extern "C" void *Overlay050Effect_Delete(void *effect)
{
    FIELD(void *, effect, 0) = data_ov050_0220e384;
    Overlay050Effect_Destroy(effect);
    return effect;
}

/*
 * Release the base effect's optional owned pointer and restore terminal state,
 * freeing that nested allocation through Heap_Free when present. Return the
 * unchanged effect pointer; heap/owned state changes and no MMIO occurs.
 */
extern "C" void *Overlay050Effect_Destroy(void *effect)
{
    void *node = FIELD(void *, effect, 4);

    while (node != 0) {
        void *next = FIELD(void *, node, 0);
        Heap_Free(node);
        node = next;
    }
    FIELD(void *, effect, 4) = 0;
    FIELD(void *, effect, 8) = 0;
    FIELD(s32, effect, 0x0c) = 0;
    return effect;
}

/*
 * Apply byte-truncated `alpha` to the effect's paired sprites by forwarding to
 * Overlay050SpritePair_SetAlpha. Sprite/OAM-visible memory changes, nothing is returned,
 * and no direct hardware access occurs.
 */
extern "C" void Overlay050Effect_SetAlpha(void *effect, u32 alpha)
{
    void *node;

    if (FIELD(s32, effect, 0x0c) == 0)
        return;
    for (node = FIELD(void *, effect, 4); node != 0;
         node = FIELD(void *, node, 0))
        Overlay050SpritePair_SetAlpha(FIELD(void *, node, 8), alpha);
}
