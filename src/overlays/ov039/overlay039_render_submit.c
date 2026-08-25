#include "tingle/types.h"

/*
 * Overlay 39 scene submission. This recovered pass attaches the encounter's
 * visible objects to a render context, updates positional sound, submits the
 * active helper pool, and feeds the target and trajectory effect systems.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039RenderVector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039RenderVector;

extern void *gSoundContext;
extern void *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0209a2ac(void *object, void *context, s32 enabled);
extern void Sound_SetEffectParameters(void *context, s32 soundId, s32 mode, s32 parameter,
                          s32 horizontalPosition, s32 verticalPosition);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *object);
extern void *GraphicsImmediateEffectRenderer_SetupProjection(void);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void GraphicsImmediateEffectRenderer_DrawTexturedQuad(void *resource, ...);
extern s32 func_020befec(s32 value, s32 divisor);
extern void func_ov069_0220ff38(void *system, void *position, s32 value,
                                s32 limit);
extern void func_ov069_0221070c(void *system, s32 value);
extern void func_ov049_0220c8a0(void *system, void *position);
extern void func_ov045_0220c48c(void *system, void *position, s32 width,
                                s32 height);
extern void func_ov039_021fda80(void *scene, s32 x, s32 y, s32 z,
                                s32 field_10);
extern s32 func_ov049_0220c254(void *system, void *iterator);
extern void func_ov049_0220cf94(void *system);
extern void func_ov069_0221100c(void *system, s32 value);
extern void func_ov069_02211274(void *system);
#ifdef __cplusplus
}
#endif

static void attachSceneObjects(void *scene, void *context)
{
    func_0209a2ac(scene, 0, 1);
    func_0209a2ac(FIELD(void *, scene, 0x74), context, 1);
    for (s32 i = 0; i < 10; i++) {
        func_0209a2ac(FIELD(void *, scene, 0x4c + i * 4), context, 1);
    }
    for (s32 i = 0; i < 2; i++) {
        func_0209a2ac(FIELD(void *, scene, 0x98 + i * 4), context, 1);
    }
    func_0209a2ac(FIELD(void *, scene, 0x78), context, 1);
    func_0209a2ac(FIELD(void *, scene, 0x7c), context, 1);
    for (s32 i = 5; i >= 0; i--) {
        func_0209a2ac(FIELD(void *, scene, 0x80 + i * 4), context, 1);
    }
}

/*
 * Attach all encounter objects to the supplied render context. The routine
 * also pans sound 0x63 from object +0x74, submits each inactive-marked helper
 * record (+0x18 == 0) from the thirty-entry pool, refreshes the +0x454 target
 * bounds from the owner chain, converts every pending trajectory hit into a
 * helper launch, and advances the +0xB50 effect system. When +0x98 is visible
 * and count +0x1DB0 is positive, one additional resource effect is submitted.
 * It returns no value; renderer, sound, helper, target, and effect state change.
 *
 * The render packet's small signed bounds and size-pair selection are confirmed
 * by the original accesses. Their SDK-level field meanings remain unknown.
 */
extern "C" void func_ov039_0220076c(void *scene, void *context)
{
    static const s32 sizePairs[8][2] = {
        {0x18000, 0}, {0x28000, 0x10000},
        {0x28000, 0}, {0x38000, 0x10000},
        {0x38000, 0}, {0x48000, 0x10000},
        {0x48000, 0}, {0x58000, 0x10000}
    };

    attachSceneObjects(scene, context);

    void *anchor = FIELD(void *, scene, 0x74);
    s32 pan = (FIELD(s32, anchor, 0x20) -
               (FIELD(s32, context, 4) + 0x80000) + 0x800) >> 12;
    if (pan < -0x80000) pan = -0x80000;
    if (pan > 0x7f000) pan = 0x7f000;
    Sound_SetEffectParameters(FIELD(void *, gSoundContext, 0), 0x63, 8, 0x64,
                  pan >> 12, 0);

    void *resource = RuntimePresentationManager_GetGraphics3dPresentation((u8 *)FIELD(void *, gGamePhaseRuntime, 0) +
                                   0x2f7c);
    void *renderer = GraphicsImmediateEffectRenderer_SetupProjection();
    for (s32 i = 29; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0xa0 + i * 4);
        if (FIELD(s32, helper, 0x18) != 0) continue;

        Overlay039RenderVector scale;
        Overlay039RenderVector position;
        s32 bounds[2] = {-8, -8};
        s32 packetSize[2] = {8, 8};
        VecFx32Object_InitComponents(&scale, 0x1000, 0x1000, 0x1000);
        VecFx32Object_Init(&position);
        position.x_04 = FIELD(s32, helper, 4);
        position.y_08 = FIELD(s32, helper, 8);
        position.z_0c = 0;
        const s32 *selectedSize = sizePairs[FIELD(s32, helper, 0x1c) & 6];
        GraphicsImmediateEffectRenderer_DrawTexturedQuad(renderer, resource, &position, &scale, 0,
                      bounds, 0, selectedSize, 0x7fff, 0, packetSize);
        VecFx32Object_Destroy(&position);
        VecFx32Object_Destroy(&scale);
    }

    s32 count = FIELD(s32, scene, 0x1db0);
    s32 step = count == 0 ? 0x733 : (count - 20) * 0x15 + 0x733;
    if (step > 0x1000) step = 0x1000;
    if ((FIELD(u16, anchor, 0x42) & 4) == 0 || count > 0) {
        void *target = FIELD(void *, scene, 0x98);
        if (count == 0 || (FIELD(u16, target, 0x42) & 4) == 0) {
            s32 limit = 10 - func_020befec(FIELD(u16, scene, 0x1cae), 7);
            if (limit < 0) limit = 0;
            func_ov069_0220ff38((u8 *)scene + 0x118, (u8 *)anchor + 0x1c,
                                FIELD(u16, scene, 0x1caa), limit);
        } else {
            Overlay039RenderVector point;
            VecFx32Object_InitCopy(&point, (u8 *)scene + 0x1da0);
            point.y_08 += step * 25;
            func_ov069_0220ff38((u8 *)scene + 0x118, &point, 0, 10);
            VecFx32Object_Destroy(&point);
        }
        func_ov069_0221070c((u8 *)scene + 0x118,
                            FIELD(s16, scene, 0x1ca8));
    }

    void *owner = FIELD(void *, scene, 0x48);
    func_ov049_0220c8a0((u8 *)scene + 0x454,
        (u8 *)FIELD(void *, FIELD(void *, owner, 8), 0x48) + 0x2c);
    func_ov045_0220c48c((u8 *)scene + 0x454,
        (u8 *)FIELD(void *, FIELD(void *, owner, 0x14), 0x98) + 0x1c,
        0x40000, 0x40000);

    Overlay039RenderVector iterator;
    VecFx32Object_Init(&iterator);
    while (func_ov049_0220c254((u8 *)scene + 0x454, &iterator)) {
        Overlay039RenderVector source;
        VecFx32Object_InitCopy(&source,
            (u8 *)FIELD(void *, FIELD(void *, owner, 8), 0x48) + 0x2c);
        func_ov039_021fda80(scene, source.x_04,
                            source.y_08 - iterator.y_08 - 0x10000,
                            iterator.z_0c, source.z_0c);
        VecFx32Object_Destroy(&source);
    }
    func_ov049_0220cf94((u8 *)scene + 0x454);
    VecFx32Object_Destroy(&iterator);

    func_ov069_0221100c((u8 *)scene + 0xb50, 0);
    func_ov069_02211274((u8 *)scene + 0xb50);

    if (count > 0 && (FIELD(u16, FIELD(void *, scene, 0x98), 0x42) & 4)) {
        Overlay039RenderVector scale;
        Overlay039RenderVector position;
        s32 bounds[2] = {-32, -32};
        s32 packetSize[2] = {32, 32};
        s32 size[4] = {0x80000, 0x40000, 0xc0000, 0x80000};
        VecFx32Object_InitComponents(&scale, step, step, step);
        VecFx32Object_InitCopy(&position, (u8 *)scene + 0x1da0);
        GraphicsImmediateEffectRenderer_DrawTexturedQuad(renderer, resource, &position, &scale, 0,
                      bounds, 0x1c, size, 0x7fff, 0x190, packetSize);
        VecFx32Object_Destroy(&position);
        VecFx32Object_Destroy(&scale);
    }
}
