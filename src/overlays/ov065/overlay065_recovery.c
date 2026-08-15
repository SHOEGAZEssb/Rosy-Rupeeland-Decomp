#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"
#include "tingle/types.h"

/* Overlay 65 owns the rupee-burst scene created by actor-script selector 8. */
#define F(t, o, n) (*(t *)((u8 *)(o) + (n)))

typedef struct O65Vec { void *vtable; s32 x, y, z; } O65Vec;
typedef struct O65Particle {
    void *sprite; s16 frame, duration, state, rotation, animation, padding;
    void *path;
} O65Particle;
typedef char O65ParticleSizeCheck[sizeof(O65Particle) == 0x14 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#define O65_ARGS ...
#else
#define O65_ARGS
#endif
extern void *data_020f4e14, *data_021052fc, *gDebugFont;
extern void *gLupyContext, *gSoundContext;
extern s16 data_020c9670[];
extern u16 data_ov065_02210b5c[];
extern u8 data_ov065_02210bb8[];
extern const char data_ov065_02210be4[];
extern void *data_ov065_02210c00;
extern void *AnimationResource_Init(O65_ARGS);
extern void *GraphicsSpriteGroupOwner_CreateGroup(O65_ARGS);
extern void GraphicsSpriteGroupOwner_DestroyGroup(O65_ARGS);
extern void GraphicsSpriteGroup_AdvanceAnimations(O65_ARGS);
extern void GraphicsSpriteGroup_Clear(O65_ARGS);
extern void GraphicsSpriteGroup_ReplaceStateResources(O65_ARGS);
extern void *GraphicsSpriteState_Create(O65_ARGS);
extern void GraphicsSpriteState_SetAnimationIndex(O65_ARGS);
extern void GraphicsSpriteState_SetDepthOrderedWorldPosition(O65_ARGS);
extern void GraphicsSpriteRenderer_ClearTextBuffer(O65_ARGS);
extern void GamePhaseCurrencyHud_AddCurrency(O65_ARGS);
extern void GamePhaseRuntime_UpdateActorPresentationState(O65_ARGS);
extern void ActorDerivedType1_ApplyResourceIndex(O65_ARGS);
extern void *VecFx32Object_Assign(O65_ARGS), *VecFx32Object_Init(O65_ARGS);
extern void *VecFx32Object_InitCopy(O65_ARGS), *VecFx32Triple_Init(O65_ARGS);
extern void VecFx32Object_Destroy(O65_ARGS);
extern void VecFx32Triple_Set(O65_ARGS), VecFx32Triple_Destroy(O65_ARGS);
extern void VecFx32Bezier_Evaluate3D(O65_ARGS), func_020adff0(O65_ARGS);
extern s32 func_020befec(s32, s32);
extern u32 genrand_int32(void);
extern void func_020593ac(O65_ARGS);
#ifdef __cplusplus
}
#endif
#undef O65_ARGS

void func_ov065_02210a04(void *self, s32 amount);

static s32 fxmul(s32 a, s32 b) { return (s32)(((s64)a * b + 0x800) >> 12); }
static void call_method(void *o, u32 offset, s32 arg)
{
    typedef void (*Method)(void *, s32);
    (*(Method *)((u8 *)F(void *, o, 0) + offset))(o, arg);
}
static void delete_resource(void *o) { if (o != 0) call_method(o, 4, 0); }

/* Initialize one reusable particle, sprite, and heap-owned path. */
O65Particle *func_ov065_0220fd20(O65Particle *p, s32 animation)
{
    p->frame = p->duration = 0; p->state = 3; p->rotation = 0;
    p->animation = (s16)animation; p->padding = 0;
    p->sprite = GraphicsSpriteState_Create(F(void *, data_ov065_02210c00, 0x24),
        F(void *, data_ov065_02210c00, 0x14c), 0, 0, 10, 0, 0);
    p->path = Heap_Alloc(0x30, data_ov065_02210be4, 4, &gHeapContext);
    if (p->path != 0) VecFx32Triple_Init(p->path);
    return p;
}

/* Initialize an fx32 vector with a scaled copy of the input components. */
void func_ov065_0220fe7c(O65Vec *out, const O65Vec *in, s32 scale)
{
    VecFx32Object_Init(out); out->x = fxmul(in->x, scale);
    out->y = fxmul(in->y, scale); out->z = fxmul(in->z, scale);
}

/* Initialize the output and derive the curve control point between two vectors. */
void func_ov065_0220fee8(O65Vec *out, O65Vec *a, O65Vec *b)
{
    VecFx32Object_Init(out);
    func_020adff0(a != 0 ? &a->x : 0, b != 0 ? &b->x : 0, &out->x);
}

/* Configure a particle path, timing, presentation resources, and rotation. */
void func_ov065_0220fdac(O65Particle *p, O65Vec *start, O65Vec *end,
                         s32 animation, s32 rotation, s32 duration)
{
    O65Vec a, b, control; void *r = F(void *, data_ov065_02210c00, 0x14c);
    func_ov065_0220fe7c(&a, start, 0x4cd); func_ov065_0220fe7c(&b, end, 0xb33);
    func_ov065_0220fee8(&control, &a, &b);
    VecFx32Object_Destroy(&b); VecFx32Object_Destroy(&a);
    VecFx32Triple_Set(p->path, start, end, &control);
    p->frame = 0; p->duration = (s16)duration; p->state = 0;
    p->rotation = (s16)rotation;
    GraphicsSpriteGroup_ReplaceStateResources(
        F(void *, p->sprite, 0), p->sprite,
        F(void *, r, 4), F(void *, r, 8), F(void *, r, 12));
    GraphicsSpriteState_SetAnimationIndex(p->sprite, animation & 0xff);
    VecFx32Object_Destroy(&control);
}

/* Advance one particle and return one while it remains active. */
s32 func_ov065_0220ff20(O65Particle *p, void *scene)
{
    if (p->state == 0) {
        O65Vec pos; s32 i; VecFx32Object_Init(&pos);
        VecFx32Bezier_Evaluate3D(&pos, p->path,
            func_020befec((s32)p->frame << 12, p->duration));
        i = (u16)func_020befec((s32)p->frame << 15, p->duration) >> 4;
        pos.z += p->rotation * data_020c9670[i];
        GraphicsSpriteState_SetDepthOrderedWorldPosition(p->sprite,
            pos.x, pos.y, pos.z, 8);
        F(u16, p->sprite, 0x28) += p->animation; F(u16, p->sprite, 0x24) |= 2;
        if (++p->frame > p->duration) { p->frame = p->duration; p->state = 1; }
        VecFx32Object_Destroy(&pos);
    } else if (p->state == 1) {
        void *r = F(void *, data_ov065_02210c00, 0x150);
        s32 animation, pan;
        GraphicsSpriteGroup_ReplaceStateResources(
            F(void *, p->sprite, 0), p->sprite,
            F(void *, r, 4), F(void *, r, 8), F(void *, r, 12));
        animation = F(u8, p->sprite, 0x38);
        GraphicsSpriteState_SetAnimationIndex(p->sprite, animation);
        F(u16, p->sprite, 0x24) &= 0xfffcu; p->state = 2;
        if (F(u16, scene, 0x11a) == 0) {
            pan = F(s16, p->sprite, 0x2c) - 0x7f;
            if (pan > 0x7f) pan = 0x7f; if (pan < -0x7f) pan = -0x7f;
            func_020593ac(gSoundContext, 0, 0xf, 0x64, pan, 0);
            animation = animation * 10 + 0x30;
            if (animation > 0x7f) animation = 0x7f;
            if (animation < 0x30) animation = 0x30;
            func_020593ac(gSoundContext, 0, 0x1d, animation, pan,
                          genrand_int32() & 0x7f);
            func_020593ac(gSoundContext, 0, 0x21, 0x7f - animation, pan,
                          genrand_int32() & 0x7f);
            F(u16, scene, 0x11a) = 6;
        }
    }
    if (p->state == 2) {
        GraphicsSpriteState_SetDepthOrderedWorldPosition(p->sprite,
            F(s32, p->path, 0x14), F(s32, p->path, 0x18),
            F(s32, p->path, 0x1c), 8);
        F(u16, p->sprite, 0x28) += p->animation;
        if ((F(u16, p->sprite, 0x24) & 1) != 0) {
            p->state = 3; F(u16, p->sprite, 0x24) |= 8;
        }
    }
    return p->state != 3;
}

/* Construct the scene, its graphics resources, and sixty reusable particles. */
void *func_ov065_022101bc(void *self, s32 value, O65Vec *position,
                          O65Vec *vector, s32 radius, s32 height)
{
    s32 group, index; void *r;
    Scene_Init((Scene *)self); F(void *, self, 0) = data_ov065_02210bb8;
    F(u16, self, 0x118) = F(u16, self, 0x11a) = 0;
    F(s32, self, 0x11c) = value;
    F(u16, self, 0x120) = F(u16, self, 0x122) = 0;
    VecFx32Object_InitCopy((u8 *)self + 0x124, position);
    VecFx32Object_InitCopy((u8 *)self + 0x134, vector);
    F(s32, self, 0x144) = radius; F(s32, self, 0x148) = height;
    F(s32, self, 4) = 0x11; F(s32, self, 8) = 0;
    data_ov065_02210c00 = self;
    F(void *, self, 0x24) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    r = Heap_Alloc(0x10, data_ov065_02210be4, 4, &gHeapContext);
    if (r != 0) AnimationResource_Init(r, 0x1714, 0x1715, 0x1716);
    F(void *, self, 0x14c) = r;
    r = Heap_Alloc(0x10, data_ov065_02210be4, 4, &gHeapContext);
    if (r != 0) AnimationResource_Init(r, 0x1625, 0x1626, 0x1627);
    F(void *, self, 0x150) = r;
    r = Heap_Alloc(0x10, data_ov065_02210be4, 4, &gHeapContext);
    if (r != 0) AnimationResource_Init(r, 0x100f, 0x1001, 0x1010);
    F(void *, self, 0x154) = r;
    F(void *, self, 0x158) = GraphicsSpriteState_Create(F(void *, self, 0x24),
        r, 12, 0, 6, 0, 0);
    for (group = 0; group < 2; ++group) for (index = 0; index < 30; ++index) {
        O65Particle *p = (O65Particle *)Heap_Alloc(0x14, data_ov065_02210be4, 4, &gHeapContext);
        if (p != 0) func_ov065_0220fd20(p, 0x10);
        F(O65Particle *, self, 0x28 + group * 0x78 + index * 4) = p;
    }
    F(s32, self, 0x15c) = func_020befec(value, value < 1000 ? 3 : value < 2000 ? 4 : 5);
    if (F(s32, self, 0x15c) < 30) F(s32, self, 0x15c) = 30;
    Scene_SetFlags03((Scene *)self); return self;
}

/* Tear down particles, presentation resources, the overlay slot, and base. */
void *func_ov065_022103c8(void *self)
{
    s32 g, i; F(void *, self, 0) = data_ov065_02210bb8;
    Scene_ClearFlags03((Scene *)self);
    for (g = 0; g < 2; ++g) for (i = 0; i < 30; ++i) {
        O65Particle *p = F(O65Particle *, self, 0x28 + g * 0x78 + i * 4);
        if (p != 0) { if (p->path != 0) { VecFx32Triple_Destroy(p->path);
            Heap_Free(p->path); } Heap_Free(p); }
    }
    GraphicsSpriteGroup_Clear(F(void *, self, 0x24));
    GraphicsSpriteGroupOwner_DestroyGroup(
        data_020f4e14, F(void *, self, 0x24));
    delete_resource(F(void *, self, 0x14c)); delete_resource(F(void *, self, 0x150));
    delete_resource(F(void *, self, 0x154)); data_ov065_02210c00 = 0;
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    VecFx32Object_Destroy((u8 *)self + 0x134); VecFx32Object_Destroy((u8 *)self + 0x124);
    Scene_Destroy((Scene *)self); return self;
}

/* Perform ordinary teardown and release the scene allocation. */
void *func_ov065_022104e0(void *self)
{ func_ov065_022103c8(self); Heap_Free(self); return self; }

/* Advance the scene state machine, HUD, particles, and animations. */
s32 func_ov065_02210600(void *self)
{
    void *actor; s32 offset = 0, active = 0, g, i;
    if (SceneManager_GetCurrent(gSceneManager) != self) return 0;
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    actor = F(void *, data_021052fc, 0x2ea4);
    if (F(u16, self, 0x11a) != 0) --F(u16, self, 0x11a);
    switch (F(s32, self, 8)) {
    case 0: call_method(actor, 0x54, 0); F(s32, self, 8) = 1;
    case 1:
        if (++F(u16, self, 0x120) > 20) { s32 amount = F(s32, self, 0x15c);
            F(s32, self, 8) = 2; GraphicsSpriteState_SetAnimationIndex(F(void *, self, 0x158), 20);
            F(u16, self, 0x120) = 0; if (amount > F(s32, self, 0x11c)) amount = F(s32, self, 0x11c);
            F(s32, self, 0x11c) -= amount; GamePhaseCurrencyHud_AddCurrency(gLupyContext, -amount, 0);
            func_ov065_02210a04(self, amount); } break;
    case 2:
        if (++F(u16, self, 0x120) > 30) {
            if (F(s32, self, 0x11c) > 0) { GraphicsSpriteState_SetAnimationIndex(F(void *, self, 0x158), 12);
                F(s32, self, 8) = 1; F(s16, self, 0x118) ^= 1; }
            else { ActorDerivedType1_ApplyResourceIndex(actor, 0); actor = F(void *, actor, 0x54);
                GraphicsSpriteState_SetAnimationIndex(actor, 4);
                call_method(F(void *, data_021052fc, 0x2ea4), 0x54, 1);
                F(u16, actor, 0x24) = (F(u16, actor, 0x24) | 2) & 0xfffeu;
                F(u16, F(void *, self, 0x158), 0x24) |= 0x10; F(s32, self, 8) = 3; }
            F(u16, self, 0x120) = 0;
        } else offset = fxmul(data_020c9670[(u16)func_020befec((s32)F(u16, self, 0x120) << 15, 30) >> 4], 0x6000);
        break;
    }
    for (g = 0; g < 2; ++g) for (i = 0; i < 30; ++i)
        active += func_ov065_0220ff20(F(O65Particle *, self, 0x28 + g * 0x78 + i * 4), self);
    if (F(s32, self, 8) == 3 && active == 0) { call_method(self, 4, 0); return 1; }
    GamePhaseRuntime_UpdateActorPresentationState(data_021052fc, 2);
    GraphicsSpriteState_SetDepthOrderedWorldPosition(F(void *, self, 0x158),
        F(s32, self, 0x128), F(s32, self, 0x12c), F(s32, self, 0x130) + offset, 4);
    GraphicsSpriteGroup_AdvanceAnimations(F(void *, self, 0x24)); return 0;
}

/* Invoke the global runtime transition callback and return zero. */
s32 func_ov065_022108f8(void) { call_method(data_021052fc, 12, 0); return 0; }

/* Generate a randomized target around the scene's source vector. */
void func_ov065_0221091c(void *self, O65Vec *out)
{
    s32 i, x, y, radius; F(u16, self, 0x122) += (u16)((genrand_int32() & 0x7ff) + 0x1000);
    i = F(u16, self, 0x122) >> 4;
    x = fxmul(data_020c9670[i * 2 + 1], F(s32, self, 0x144));
    y = fxmul(data_020c9670[i * 2], F(s32, self, 0x148)); radius = genrand_int32() & 0xfff;
    VecFx32Object_Assign(out, (u8 *)self + 0x134);
    out->x += fxmul(x, radius); out->y += fxmul(y, radius);
}

/* Split an amount into randomized denominations and launch its particles. */
void func_ov065_02210a04(void *self, s32 amount)
{
    u16 values[7]; O65Vec start, target; s32 denomination = 0, i, quotient;
    for (i = 0; i < 7; ++i) values[i] = data_ov065_02210b5c[i];
    quotient = func_020befec(amount, 30);
    while (denomination < 7 && (s16)values[denomination] <= quotient) ++denomination;
    if (denomination >= 7) denomination = 6;
    VecFx32Object_InitCopy(&start, (u8 *)self + 0x124); start.z += 0x1e000;
    VecFx32Object_Init(&target);
    for (i = 0; i < 30 && amount > 0; ++i) { s32 chosen = denomination;
        while (chosen >= 0) { s32 value = (s16)values[chosen];
            if (amount >= value) { O65Particle *p; amount -= value;
                func_ov065_0221091c(self, &target);
                if (chosen > 0 && (genrand_int32() & 7) == 0) --chosen;
                p = F(O65Particle *, self, 0x28 + F(s16, self, 0x118) * 0x78 + i * 4);
                /* Retail consumes the unsigned-division remainder in r1. */
                func_ov065_0220fdac(p, &start, &target, chosen, 0x50,
                    (s32)(genrand_int32() % 20) + 0x43); break; }
            --chosen;
        }
    }
    VecFx32Object_Destroy(&target); VecFx32Object_Destroy(&start);
}
