#include "tingle/types.h"

/*
 * Overlay 73 owns a paired sprite-stream presentation. It constructs two
 * child collections around an actor-following origin, advances their radial
 * motion, emits auxiliary sprites, and tears down every heap/resource owner.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov073_02210bcc[], data_ov073_02210be4[];
extern const u8 data_ov073_02210c04[], data_ov073_02210c0c[];
extern const u8 data_ov073_02210c14[];
extern const s16 data_020c9670[];
extern void *data_021052fc;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0201e290(void *, void *);
extern void *func_0201e380(void *);
extern void *func_0201e28c(void *);
extern void *TimedSpritePresentation_InitBase(void *);
extern void TimedSpritePresentation_SetVisible(void *, s32);
extern void *VecFx32Object_Init(void *);
extern void *VecFx32Object_InitCopy(void *, const void *);
extern void *VecFx32Object_InitComponents(void *, s32, s32, s32);
extern void *VecFx32Object_Assign(void *, const void *);
extern void *VecFx32Object_Add(void *, const void *);
extern void *VecFx32Object_Destroy(void *);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(
    void *, const void *, s32, s32, s32, s32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void Heap_Free(void *);
extern void *func_02003e20(u32, const void *, s32, void *);
extern void func_02003e38(void *);
extern s32 func_020adae4(s32, s32);
extern s32 func_020adfbc(const void *, const void *, void *);
extern s32 func_020ae024(s32, s32);
extern s32 func_020befec(s32, s32);
extern u64 func_020bf1f8(u32, u32);
extern s32 SignedAbsoluteValue(s32);
extern u32 genrand_int32(void);
extern void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern void *ActorCollection_GetSpriteOwner(void *);
extern void *ActorMotionAreaFollower_GetPosition(void *);
extern void *AuxiliaryTimedSpritePresentation_Init(void *, const void *, void *,
    s32, s32, s32, s32, s32, s32, s32);
extern void *AnimationResource_Init(void *, void *, void *, void *);
extern void *OverlayManager_GetGlobal(void);
extern void OverlayManager_UnloadOverlay(void *, s32);
#ifndef MATCHING
extern u32 TingleNativeMath_Sqrt64(u64);
#endif

void *func_ov073_022102bc(void *);
void *func_ov073_022102dc(void *);
void func_ov073_0220ff28(void *, s32, s32);
void func_ov073_0221007c(void *, const void *, const void *);
void func_ov073_0220feb8(void *, const void *, s32);
void func_ov073_02210338(void *, const void *);
void func_ov073_022106d0(void *, const void *, s32);

static s32 fx_mul(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

/* Construct one collection child from its position and resource descriptor. */
void *func_ov073_0220fd20(void *object, const void *position,
                          void *resources, s32 animation, s32 frameOffset)
{
    func_0201e290(object, resources);
    FIELD(const void *, object, 0) = data_ov073_02210bcc;
    VecFx32Object_InitCopy((u8 *)object + 0x2c, position);
    FIELD(u16, object, 0x3c) = (u16)frameOffset;
    FIELD(s16, object, 0x3e) = 0;
    FIELD(s16, object, 0x40) = 0;
    FIELD(s16, object, 0x42) = -1;
    FIELD(s16, object, 0x44) = 0;
    VecFx32Object_Assign((u8 *)object + 8, (u8 *)resources + 0x10);
    VecFx32Object_Assign((u8 *)object + 0x18, (u8 *)resources + 0x20);
    FIELD(s32, object, 0x28) = FIELD(s32, resources, 0x30);
    FIELD(u16, FIELD(void *, object, 4), 0x24) &= 0xfffdu;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 4), animation);
    return object;
}

/* Destroy one child without freeing its allocation. */
void *func_ov073_0220fdb8(void *object)
{
    VecFx32Object_Destroy((u8 *)object + 0x2c);
    func_0201e380(object);
    return object;
}

/* Destroy and free one child. */
void *func_ov073_0220fdd8(void *object)
{
    func_ov073_0220fdb8(object);
    Heap_Free(object);
    return object;
}

/* The recovered interface query is unsupported for this child type. */
s32 func_ov073_0220fe00(void *object)
{
    (void)object;
    return 0;
}

/* Advance one child's reveal delay, radial motion, and lifetime. */
s32 func_ov073_0220fe08(void *object)
{
    FIELD(u16, object, 0x3c) += 0x400;
    FIELD(s16, object, 0x3e) -= 2;
    if (FIELD(s16, object, 0x3e) < 1) FIELD(s16, object, 0x3e) = 1;
    if (FIELD(s16, object, 0x42) > 0 &&
        --FIELD(s16, object, 0x42) == 0)
        TimedSpritePresentation_SetVisible(object, 1);
    if ((FIELD(u16, FIELD(void *, object, 4), 0x24) & 4) == 0) {
        void (**vtable)(void *, const void *) =
            *(void (***)(void *, const void *))object;
        vtable[3](object, (u8 *)object + 0x2c);
        VecFx32Object_Add((u8 *)object + 8, (u8 *)object + 0x18);
    }
    if (--FIELD(s32, object, 0x28) < 0) {
        FIELD(s32, object, 0x28) = 0;
        return 1;
    }
    return 0;
}

/* Submit one child at its depth-ordered world position and update its frame. */
void func_ov073_0220feb8(void *object, const void *origin, s32 selector)
{
    GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(
        FIELD(void *, object, 4), origin, FIELD(s32, object, 0xc),
        FIELD(s32, object, 0x10), FIELD(s32, object, 0x14), 8);
    if (selector != -1)
        FIELD(u16, FIELD(void *, object, 4), 0x28) =
            (u16)(selector + FIELD(s16, object, 0x44));
    else
        FIELD(u16, FIELD(void *, object, 4), 0x28) +=
            (u16)FIELD(s16, object, 0x44);
    FIELD(u8, FIELD(void *, object, 4), 0x3a) = 1;
}

/* Set radial velocity, its interpolation origin, and reveal delay. */
void func_ov073_0220ff28(void *object, s32 velocity, s32 delay)
{
    FIELD(s16, object, 0x3e) = (s16)velocity;
    FIELD(s16, object, 0x40) = FIELD(s16, object, 0x3e);
    FIELD(s16, object, 0x42) = (s16)delay;
}

/* Update one child's velocity vector from its radial target and angle. */
void func_ov073_0220ff3c(void *object, const void *target)
{
    u8 delta[16];
    s32 phase = (u16)FIELD(u16, object, 0x3c) >> 4;
    s32 desired = FIELD(s32, target, 0xc) +
                  ((s32)data_020c9670[phase * 2] << 2);
    FIELD(s32, object, 0x24) = func_020adae4(
        desired - FIELD(s32, object, 0x14), FIELD(s16, object, 0x3e));
    func_ov073_0221007c(delta, target, (u8 *)object + 8);
    {
        s64 lengthSquared = (s64)FIELD(s32, delta, 4) * FIELD(s32, delta, 4) +
                            (s64)FIELD(s32, delta, 8) * FIELD(s32, delta, 8);
#ifndef MATCHING
        u32 sqrtResult = TingleNativeMath_Sqrt64((u64)lengthSquared << 2);
        if (((sqrtResult + 1) >> 1) > 0x2000) {
#else
        volatile u16 *sqrtControl = (volatile u16 *)0x040002b0;
        volatile u64 *sqrtInput = (volatile u64 *)0x040002b8;
        volatile u32 *sqrtResult = (volatile u32 *)0x040002b4;
        *sqrtControl = 1;
        *sqrtInput = (u64)lengthSquared << 2;
        while ((*sqrtControl & 0x8000) != 0) {}
        if (((*sqrtResult + 1) >> 1) > 0x2000) {
#endif
            s32 angle = func_020ae024(FIELD(s32, delta, 8), FIELD(s32, delta, 4));
            s32 interpolation = func_020befec(
                (s32)FIELD(s16, object, 0x3e) << 12,
                (s32)FIELD(s16, object, 0x40) * 2);
            s32 index = (angle >> 4) * 2;
            FIELD(s32, object, 0x1c) = fx_mul(
                data_020c9670[index + 1], 0xc00 - interpolation);
            FIELD(s32, object, 0x20) =
                fx_mul(data_020c9670[index], 0x800);
        }
    }
    VecFx32Object_Destroy(delta);
}

/* Initialize an output vector and calculate the offset between two positions. */
void func_ov073_0221007c(void *output, const void *left, const void *right)
{
    VecFx32Object_Init(output);
    func_020adfbc(left ? (const u8 *)left + 4 : 0,
                  right ? (const u8 *)right + 4 : 0,
                  (u8 *)output + 4);
}

/* Initialize the two embedded vectors in a temporary child descriptor. */
void *func_ov073_022102bc(void *descriptor)
{
    VecFx32Object_Init((u8 *)descriptor + 0x10);
    VecFx32Object_Init((u8 *)descriptor + 0x20);
    return descriptor;
}

/* Destroy all children, the pointer array, and the controller vectors. */
void *func_ov073_022102dc(void *controller)
{
    s32 i;
    for (i = 0; i < FIELD(s32, controller, 0x3c); ++i) {
        void *child = FIELD(void **, controller, 0)[i];
        if (child) {
            void (**vtable)(void *) = *(void (***)(void *))child;
            vtable[1](child);
        }
    }
    func_02003e38(FIELD(void *, controller, 0));
    VecFx32Object_Destroy((u8 *)controller + 0x18);
    VecFx32Object_Destroy((u8 *)controller + 8);
    return controller;
}

/* Construct a controller and its complete child collection. */
void *func_ov073_022100b4(void *controller, void *animation,
    s32 x, s32 y, s32 z, s32 speed, void *resource, s32 delayed,
    s32 count, s32 orientation)
{
    u8 descriptor[0x34];
    s32 i;
    VecFx32Object_InitComponents((u8 *)controller + 8, x, y, z);
    FIELD(void *, controller, 4) = animation;
    VecFx32Object_InitComponents((u8 *)controller + 0x18, 0, 0, 0);
    FIELD(s32, controller, 0x28) = 0;
    FIELD(s16, controller, 0x2c) = 0;
    FIELD(s16, controller, 0x2e) = (s16)orientation;
    FIELD(s32, controller, 0x30) = speed;
    FIELD(s32, controller, 0x34) = 0x1000;
    FIELD(s32, controller, 0x38) = 0;
    FIELD(s32, controller, 0x3c) = count;
    FIELD(void *, controller, 0) = func_02003e20(count * 4,
        data_ov073_02210c04, 4, gHeapContext);
    func_ov073_022102bc(descriptor);
    FIELD(void *, descriptor, 0) = ActorCollection_GetSpriteOwner(
        GamePhaseRuntime_GetActorCollection(data_021052fc, 1));
    FIELD(void *, descriptor, 4) = FIELD(void *, animation, 4);
    FIELD(void *, descriptor, 8) = FIELD(void *, animation, 8);
    FIELD(void *, descriptor, 0xc) = FIELD(void *, animation, 0xc);
    FIELD(void *, descriptor, 0x30) = resource;
    for (i = 0; i < count; ++i) {
        void *child;
        VecFx32Object_Assign(descriptor + 0x10, (u8 *)controller + 8);
        FIELD(s32, descriptor, 0x14) +=
            (s32)((genrand_int32() & 0xffff) - 0x8000);
        FIELD(s32, descriptor, 0x18) +=
            (s32)(func_020bf1f8(genrand_int32(), 0x6000) >> 32) - 0x6000;
        child = Heap_Alloc(0x48, data_ov073_02210c04, 4, gHeapContext);
        if (child) {
            s32 frame = (func_020befec(0x10000, count) * i) & 0xffff;
            child = func_ov073_0220fd20(child, (u8 *)controller + 8,
                                       descriptor, 1, frame);
        }
        FIELD(void **, controller, 0)[i] = child;
        FIELD(u16, FIELD(void *, child, 4), 0x24) |= 2;
        if (delayed) func_ov073_0220ff28(child, 6, i * 2 + 1);
    }
    if (delayed) FIELD(s32, controller, 0x38) = 0x1000;
    VecFx32Object_Destroy(descriptor + 0x20);
    VecFx32Object_Destroy(descriptor + 0x10);
    return controller;
}

/* Advance every child and periodically emit one auxiliary sprite. */
void func_ov073_02210338(void *controller, const void *origin)
{
    u8 scratch[16];
    s32 speed = func_020adae4(FIELD(s32, controller, 0x38) * 0x5c +
                              FIELD(s32, controller, 0x34) * 8, 0x64);
    s32 full = fx_mul(FIELD(s32, controller, 0x30), speed);
    s32 half = fx_mul(FIELD(s32, controller, 0x30) / 2, speed);
    s32 phase = (FIELD(s32, controller, 0x28) + 0x100) & 0xffff;
    s32 i;
    FIELD(s32, controller, 0x38) = speed;
    FIELD(s32, controller, 0x28) = phase;
    VecFx32Object_Init(scratch);
    if (FIELD(s16, controller, 0x2c) < 0x7fff) ++FIELD(s16, controller, 0x2c);
    for (i = 0; i < FIELD(s32, controller, 0x3c); ++i) {
        void *child = FIELD(void **, controller, 0)[i];
        s32 angle, index, sine, cosine, scale;
        if ((FIELD(u16, FIELD(void *, child, 4), 0x24) & 4) &&
            FIELD(s16, controller, 0x2c) >= i * 8)
            func_ov073_0220ff28(child, 0xb4, 1);
        VecFx32Object_Assign((u8 *)child + 0x2c, origin);
        angle = FIELD(s16, controller, 0x2e) ? phase : (0x10000 - phase) & 0xffff;
        index = (angle >> 4) * 2;
        sine = data_020c9670[index + 1];
        cosine = data_020c9670[index];
        FIELD(s32, child, 0x30) += fx_mul(sine, full);
        FIELD(s32, child, 0x34) -= fx_mul(cosine, half);
        scale = 0x80 - cosine / 0x40 - SignedAbsoluteValue(FIELD(s32, child, 0x24)) / 0x100;
        if (scale < 0x20) scale = 0x20;
        if (scale > 0x200) scale = 0x200;
        FIELD(u16, FIELD(void *, child, 4), 0x32) = (u16)scale;
        FIELD(u16, FIELD(void *, child, 4), 0x34) = (u16)scale;
        FIELD(s16, child, 0x44) = (s16)(cosine / 0x200);
        func_ov073_0220fe08(child);
        phase = (phase + func_020befec(0x10000,
                 FIELD(s32, controller, 0x3c))) & 0xffff;
    }
    if ((FIELD(s16, controller, 0x2c) & 7) == 0) {
        u8 emission[16];
        void *child;
        s32 dx, dy;
        s32 selected = (FIELD(s16, controller, 0x2c) & 8) ? 0 :
            (FIELD(s32, controller, 0x3c) +
             (FIELD(s32, controller, 0x3c) < 0 ? 1 : 0)) / 2;
        VecFx32Object_Init(emission);
        VecFx32Object_Assign(emission,
            (u8 *)FIELD(void **, controller, 0)[selected] + 8);
        dx = (s32)(func_020bf1f8(genrand_int32(), 0x3000) >> 32) - 0x1800;
        dy = (s32)(genrand_int32() & 0x1fff) - 0x1000;
        FIELD(s32, emission, 4) += dx * 8;
        FIELD(s32, emission, 8) += dy * 4;
        child = Heap_Alloc(0x14, data_ov073_02210c0c, 4, gHeapContext);
        if (child) child = AuxiliaryTimedSpritePresentation_Init(child, emission,
            ActorCollection_GetSpriteOwner(GamePhaseRuntime_GetActorCollection(data_021052fc, 1)),
            0x1642, 0x1640, 0x1643, 0, -3, 1, 1);
        {
            void *payload = FIELD(void *, child, 8);
            s32 *motion = payload ? (s32 *)((u8 *)payload + 0x1c) : 0;
            motion[0] = dx;
            motion[1] = dy;
            motion[2] = 0;
        }
        VecFx32Object_Destroy(emission);
    }
    VecFx32Object_Destroy(scratch);
}

/* Submit every child relative to a shared origin. */
void func_ov073_022106d0(void *controller, const void *origin, s32 selector)
{
    s32 i;
    for (i = 0; i < FIELD(s32, controller, 0x3c); ++i)
        func_ov073_0220feb8(FIELD(void **, controller, 0)[i], origin, selector);
}

/* Construct the paired controller scene and its shared animation resource. */
void *func_ov073_02210710(void *scene, void *owner, s32 x, s32 y, s32 z,
    void *resourceA, void *resourceB, void *resourceC, s32 delay,
    void *childResource, s32 mode)
{
    void *animation;
    s32 adjustedZ = z;
    TimedSpritePresentation_InitBase(scene);
    FIELD(const void *, scene, 0) = data_ov073_02210be4;
    FIELD(void *, scene, 0x10) = owner;
    FIELD(s16, scene, 0x18) = (s16)delay;
    FIELD(s16, scene, 0x1a) = 0;
    if (mode == 0) {
        u8 position[16];
        void *aux = 0;
        VecFx32Object_InitComponents(position, x, y, z);
        aux = Heap_Alloc(0x14, data_ov073_02210c0c, 4, gHeapContext);
        if (aux) AuxiliaryTimedSpritePresentation_Init(aux, position,
            ActorCollection_GetSpriteOwner(GamePhaseRuntime_GetActorCollection(data_021052fc, 1)),
            0x1644, 0x1645, 0x1646, 0, -4, 1, 1);
        VecFx32Object_Destroy(position);
    }
    animation = Heap_Alloc(0x10, data_ov073_02210c14, 4, gHeapContext);
    if (animation) animation = AnimationResource_Init(animation, resourceA,
                                                       resourceB, resourceC);
    FIELD(void *, scene, 0x14) = animation;
    if (mode == 0) adjustedZ += 0x30000;
    FIELD(void *, scene, 8) = Heap_Alloc(0x40, data_ov073_02210c14, 4, gHeapContext);
    if (FIELD(void *, scene, 8))
        func_ov073_022100b4(FIELD(void *, scene, 8), animation, x, y,
            adjustedZ, 0x20000, childResource, mode, 6, 0);
    FIELD(void *, scene, 0xc) = Heap_Alloc(0x40, data_ov073_02210c14, 4, gHeapContext);
    if (FIELD(void *, scene, 0xc))
        func_ov073_022100b4(FIELD(void *, scene, 0xc), animation, x, y,
            adjustedZ, 0x18000, childResource, mode, 4, 1);
    return scene;
}

static void Overlay073_DestroySceneMembers(void *scene)
{
    void *controller = FIELD(void *, scene, 8);
    if (controller) { func_ov073_022102dc(controller); Heap_Free(controller); }
    controller = FIELD(void *, scene, 0xc);
    if (controller) { func_ov073_022102dc(controller); Heap_Free(controller); }
    if (FIELD(void *, scene, 0x14)) {
        void *resource = FIELD(void *, scene, 0x14);
        void (**vtable)(void *) = *(void (***)(void *))resource;
        vtable[1](resource);
    }
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    func_0201e28c(scene);
}

/* Destroy the paired scene without freeing its allocation. */
void *func_ov073_02210900(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov073_02210be4;
    Overlay073_DestroySceneMembers(scene);
    return scene;
}

/* Destroy and free the paired scene. */
void *func_ov073_02210980(void *scene)
{
    func_ov073_02210900(scene);
    Heap_Free(scene);
    return scene;
}

/* Advance both streams, their start delay, and actor-relative submission. */
s32 func_ov073_02210a08(void *scene)
{
    u8 origin[16];
    s32 selector;
    VecFx32Object_InitCopy(origin, (u8 *)FIELD(void *, scene, 0x10) + 0x18);
    FIELD(s32, origin, 0xc) += 0x28000;
    func_ov073_02210338(FIELD(void *, scene, 8), origin);
    FIELD(s32, origin, 0xc) += 0x10000;
    func_ov073_02210338(FIELD(void *, scene, 0xc), origin);
    if (FIELD(s16, scene, 0x1a) == 0 && --FIELD(s16, scene, 0x18) <= 0) {
        FIELD(s16, scene, 0x1a) = 1;
        FIELD(s32, FIELD(void *, scene, 8), 0x34) = 0;
        FIELD(s32, FIELD(void *, scene, 0xc), 0x34) = 0;
    } else if (FIELD(s16, scene, 0x1a) == 1 &&
               FIELD(s32, FIELD(void *, scene, 8), 0x38) < 0x4cd) {
        VecFx32Object_Destroy(origin);
        return 1;
    }
    selector = FIELD(u16, FIELD(void *, FIELD(void *, scene, 0x10), 0x54), 0x28);
    {
        void *position = ActorMotionAreaFollower_GetPosition(
            (u8 *)data_021052fc + 0x2fbc);
        func_ov073_022106d0(FIELD(void *, scene, 8), position, selector);
        position = ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
        func_ov073_022106d0(FIELD(void *, scene, 0xc), position, selector);
    }
    VecFx32Object_Destroy(origin);
    return 0;
}

/* Preserve the first intentional no-op slot in the paired-scene vtable. */
void func_ov073_02210b38(void *scene) { (void)scene; }

/* Preserve the second intentional no-op slot in the paired-scene vtable. */
void func_ov073_02210b3c(void *scene) { (void)scene; }

/* Preserve the third intentional no-op slot in the paired-scene vtable. */
void func_ov073_02210b40(void *scene) { (void)scene; }

/* Preserve the fourth intentional no-op slot in the paired-scene vtable. */
void func_ov073_02210b44(void *scene) { (void)scene; }

/* Preserve the fifth intentional no-op slot in the paired-scene vtable. */
void func_ov073_02210b48(void *scene) { (void)scene; }

#ifdef __cplusplus
}
#endif
