#include "tingle/types.h"

/* Recovered overlay 77 actor, contact, and presentation runtime. */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define P(base, offset) ((void *)((u8 *)(base) + (offset)))
typedef s32 (*Method)(...);

extern "C" void *gActorRuntimeCollection;
extern "C" void *gGameWork;
extern "C" void *gHeapContext;
extern "C" void *gSoundContext;
extern "C" u8 *data_021052fc;
extern "C" s16 data_020c9670[];
extern "C" u8 data_020e83a0[];
extern "C" u8 data_ov077_02216f2c[], data_ov077_02216f34[];
extern "C" u8 data_ov077_02216f4c[], data_ov077_02216f64[];
extern "C" u8 data_ov077_02216f7c[], data_ov077_02216f94[];
extern "C" u8 data_ov077_02216fc8[], data_ov077_02216fd0[];
extern "C" u8 data_ov077_02216ff0[], data_ov077_02217018[];
extern "C" u8 data_ov077_02217020[], data_ov077_02217030[];
extern "C" u8 data_ov077_02217058[], data_ov077_022170d8[];
extern "C" u8 data_ov077_02217118[], data_ov077_022172f4[];
extern "C" u8 data_ov077_022174c8[], data_ov077_022174d0[];
extern "C" u8 data_ov077_022174d8[];

extern "C" void *Heap_Alloc(s32, const void *, s32, void *);
extern "C" void Heap_Free(void *);
extern "C" void ActorExtendedType2_Init(void *);
extern "C" void ActorExtendedType2_Destroy(void *);
extern "C" void Actor_UpdateAnimationState(void *);
extern "C" void ActorExtendedType2_InitializePresentation(void *);
extern "C" s16 ActorExtendedType2_GetDescriptorValue2A(void *);
extern "C" s16 ActorExtendedType2_GetDescriptorValue2C(void *);
extern "C" void *ActorExtendedType2Record_FindByIndex(s32);
extern "C" void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern "C" void *ActorCollection_GetSpriteOwner(void *);
extern "C" void *Actor_GetCollection(void *);
extern "C" void *ActorCollection_FindActorByDescriptorValue(void *, s32);
extern "C" void *GamePhaseMetadata_GetByIndex(s32);
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void *AnimationResource_Init(void *, s32, s32, s32);
extern "C" void *UtilAnimationResource_Init(void *, ...);

#define EXT(name) extern "C" s32 name(...)
EXT(ActorExtendedType2_ApplyAttachmentState);
EXT(ActorExtendedType2_ApplyContactResponse);
EXT(ActorExtendedType2_IncrementSavedProgressCounter);
EXT(ActorExtendedType2_RunRenderCallback);
EXT(ActorExtendedType2_UpdateFrame);
EXT(ActorContactState_AddContact);
EXT(ActorMotionJitter_EnsureMinimum);
EXT(ActorRuntimeCollection_GetPendingAttachmentFlag);
EXT(DisplayController_GetVerticalOffset);
EXT(GameWork_TestFlag);
EXT(GraphicsSpriteState_SetAnimationIndex);
EXT(PresentationBackedActor_SpawnAmountVariant);
EXT(SignedAbsoluteValue);
EXT(Sound_Play);
EXT(UtilAnimationResource_UpdatePosition);
EXT(func_0201e0ec);
EXT(func_02003e2c);
EXT(func_02004fe0);
EXT(func_02005030);
EXT(func_02005058);
EXT(func_020050a4);
EXT(func_020099c0);
EXT(func_02032228);
EXT(func_02032370);
EXT(func_020349b8);
EXT(func_0204cfa4);
EXT(func_020538a4);
EXT(func_020541d4);
EXT(func_020a27a0);
EXT(func_020a2844);
EXT(func_020ada8c);
EXT(func_020adc90);
EXT(func_020adff0);
EXT(func_020ae024);
EXT(func_020b57d4);
EXT(func_020befec);
EXT(func_020bf1f8);
EXT(genrand_int32);
EXT(func_ov090_0221b03c);
EXT(func_ov090_0221b194);
EXT(func_ov090_0221be40);
EXT(func_ov090_0221c184);
EXT(func_ov090_0221c318);
EXT(func_ov090_0221c3dc);
EXT(func_ov090_0221ca34);
EXT(func_ov090_0221ca58);
#undef EXT
extern "C" void *func_ov090_0221bc84(...);
extern "C" void *func_02053f9c(...);
extern "C" void *func_ov090_0221c440(...);
extern "C" void *func_ov090_0221c434(...);
extern "C" s32 func_ov090_0221c44c(...);
extern "C" void *func_ov090_0221c468(...);
extern "C" void *func_ov090_0221c73c(...);

extern "C" void *func_ov077_02212ae0(void *);
extern "C" void *func_ov077_02212b7c(void *);
extern "C" void *func_ov077_02212cb8(void *);
extern "C" void func_ov077_02212d04(void *);
extern "C" void func_ov077_02212e60(void *, void *, void *);
extern "C" void func_ov077_02212f18(void *, const void *);
extern "C" void func_ov077_022130b8(void *, const void *, const void *);
extern "C" void func_ov077_02213768(void *, u16);
extern "C" void func_ov077_02213c08(void *, s32);
extern "C" void func_ov077_02214298(void *, s32);
extern "C" void func_ov077_022142b4(void *, s32);
extern "C" s32 func_ov077_022142c8(void *);
extern "C" s32 func_ov077_022142e0(void *);
extern "C" void func_ov077_02214c7c(void *, s32);
extern "C" void func_ov077_02214cd4(void *, s32, s32, s32);
extern "C" void func_ov077_02214ce4(void *, const void *);
extern "C" void func_ov077_02214e00(void *, void *);
extern "C" void func_ov077_02214fc0(void *, s32);
extern "C" void func_ov077_02215494(void *);
extern "C" s32 func_ov077_02215f34(void *);
extern "C" s32 func_ov077_022169bc(void *);
extern "C" s32 func_ov077_02216cac(void *);

static void ReleaseOwned(void *object)
{
    if (object != 0)
        ((Method)F(void *, F(void *, object, 0), 4))(object);
}

/* Constructs the shared actor base and its presentation vectors. */
extern "C" void *func_ov077_02212ae0(void *actor)
{
    ActorExtendedType2_Init(actor);
    F(void *, actor, 0) = data_ov077_02217118;
    F(void *, actor, 0x298) = 0;
    F(void *, actor, 0x29c) = 0;
    F(u8, actor, 0x2a0) = F(u8, actor, 0x2a1) = 0;
    F(u16, actor, 0x2a2) = 0;
    VecFx32Object_InitComponents(P(actor, 0x2a4), 0, 0, 0);
    VecFx32Object_InitComponents(P(actor, 0x2b4), 0, 0, 0);
    F(u32, actor, 0x14) |= 0x40;
    F(u32, actor, 0x260) |= 0x10020;
    F(u32, actor, 0x5c) = (F(u32, actor, 0x5c) & 0xffff0000) | 0xffe0;
    return actor;
}

/* Constructs the alternate shared actor base with the same retail layout. */
extern "C" void *func_ov077_02212b7c(void *actor)
{
    return func_ov077_02212ae0(actor);
}

static void DestroyBase(void *actor)
{
    F(void *, actor, 0) = data_ov077_02217118;
    ReleaseOwned(F(void *, actor, 0x298));
    VecFx32Object_Destroy(P(actor, 0x2b4));
    VecFx32Object_Destroy(P(actor, 0x2a4));
    ActorExtendedType2_Destroy(actor);
}

/* Destroys the shared actor state without releasing caller-owned storage. */
extern "C" void *func_ov077_02212c18(void *actor)
{
    DestroyBase(actor);
    return actor;
}

/* Destroys the shared actor state and releases its allocation. */
extern "C" void *func_ov077_02212c64(void *actor)
{
    DestroyBase(actor);
    Heap_Free(actor);
    return actor;
}

/* Runs the non-deleting shared actor destructor variant. */
extern "C" void *func_ov077_02212cb8(void *actor)
{
    DestroyBase(actor);
    return actor;
}

/* Creates overlay-90 presentation state and fixes the actor's vertical pose. */
extern "C" void func_ov077_02212d04(void *actor)
{
    u8 config[64] = {0};
    ActorExtendedType2_InitializePresentation(actor);
    s16 descriptor = ActorExtendedType2_GetDescriptorValue2A(actor);
    func_020b57d4(0, config, 0x40);
    void *resource = Heap_Alloc(0x48, data_ov077_022174c8, 4, gHeapContext);
    if (resource != 0)
    {
        void *owner1 = ActorCollection_GetSpriteOwner(
            GamePhaseRuntime_GetActorCollection(data_021052fc, 1));
        void *owner2 = ActorCollection_GetSpriteOwner(
            GamePhaseRuntime_GetActorCollection(data_021052fc, 2));
        resource = func_ov090_0221bc84(resource, owner1, owner2,
                                       F(void *, actor, 0x210), P(actor, 0x18),
                                       0x6000, descriptor, config);
    }
    F(void *, actor, 0x298) = resource;
    func_ov090_0221c3dc(resource, 1);
    void *phase = F(void *, F(void *, data_021052fc, 0), 0x24);
    void *metadata = GamePhaseMetadata_GetByIndex(F(s32, phase, 0) - 1);
    if (((u32)F(s32, metadata, 0x40) & 0xc0000) != 0xc0000)
    {
        s32 count = func_ov090_0221c44c(resource);
        for (s32 i = 0; i < count; ++i)
        {
            void *entry = func_ov090_0221c440(resource, i);
            F(u16, F(void *, F(void *, entry, 4), 8), 0x24) |= 0x14;
        }
    }
    F(s32, actor, 0x24) = F(s32, actor, 0x238) + 0x20000;
}

/* Matching no-op callback used by the base vtable. */
extern "C" void func_ov077_02212e44(void)
{
}

/* Forwards to the inherited actor frame update. */
extern "C" void func_ov077_02212e48(void *actor)
{
    ActorExtendedType2_UpdateFrame(actor);
}

/* Forwards to the inherited actor render callback. */
extern "C" void func_ov077_02212e54(void *actor)
{
    ActorExtendedType2_RunRenderCallback(actor);
}

/* Synchronizes an overlay-90 presentation contact and actor coordinates. */
extern "C" void func_ov077_02212e60(void *out, void *actor, void *contact)
{
    ActorExtendedType2_ApplyContactResponse(out, actor, contact);
    void *sprite = F(void *, actor, 0x54);
    F(s16, sprite, 0x2c) =
        (s16)((F(s32, actor, 0x1c) >> 12) - (F(s32, contact, 4) >> 12) +
              (F(s32, actor, 0x2a8) >> 12) + (F(s32, actor, 0x2b8) >> 12));
    F(s16, sprite, 0x2e) =
        (s16)((F(s32, actor, 0x20) >> 12) - (F(s32, actor, 0x24) >> 12) -
              (F(s32, contact, 8) >> 12) + (F(s32, actor, 0x2ac) >> 12) +
              (F(s32, actor, 0x2bc) >> 12));
    F(s32, out, 4) = F(s16, sprite, 0x2c);
    F(s32, out, 8) = F(s16, sprite, 0x2e);
    s32 temporary[3];
    func_ov077_02212f18(temporary, out);
    ActorContactState_AddContact(actor, temporary);
    func_ov090_0221c318(F(void *, actor, 0x298), contact);
}

/* Matching no-op contact callback. */
extern "C" void func_ov077_02212f14(void)
{
}

/* Copies a two-coordinate contact record into its vtable-backed wrapper. */
extern "C" void func_ov077_02212f18(void *out, const void *source)
{
    F(void *, out, 0) = data_ov077_02216f2c;
    F(s32, out, 4) = F(s32, source, 4);
    F(s32, out, 8) = F(s32, source, 8);
}

/* Updates presentation jitter and submits the actor pose to overlay 90. */
extern "C" void func_ov077_02212f38(void *actor)
{
    if ((F(u32, actor, 0x14) & 0x200000) != 0)
        return;
    ActorExtendedType2_ApplyAttachmentState(actor);
    F(u8, actor, 0x2a0) += 3;
    F(u8, actor, 0x2a1) += 1;
    s32 xIndex = ((s8)F(u8, actor, 0x2a0)) << 8;
    s32 yIndex = ((s8)F(u8, actor, 0x2a1)) << 8;
    F(s32, actor, 0x2a8) = data_020c9670[(u16)xIndex >> 4] << 3;
    F(s32, actor, 0x2ac) = data_020c9670[((u16)yIndex >> 4) * 2] << 3;
    void *attachment = F(void *, actor, 0x29c);
    if (attachment != 0)
    {
        VecFx32Object_Assign(P(actor, 0x22c), P(attachment, 0x18));
        F(s32, actor, 0x234) +=
            ((F(s16, attachment, 0x6e) - F(s16, attachment, 0x6a)) / 2) *
            -0x1000;
    }
    F(s32, actor, 0x24) = F(s32, actor, 0x238) + 0x20000;
    F(s32, actor, 0x44) = 0;
    s32 pose[4];
    s32 transform[4];
    VecFx32Object_InitCopy(pose, P(actor, 0x22c));
    func_ov077_022130b8(transform, P(actor, 0x18), P(actor, 0x2a4));
    s32 angle = 0;
    if (ActorExtendedType2_GetDescriptorValue2C(actor) == 1)
        angle = func_020ae024(F(s32, actor, 0x230) - F(s32, actor, 0x1c),
                              F(s32, actor, 0x20) - F(s32, actor, 0x234));
    func_ov090_0221be40(F(void *, actor, 0x298), transform, pose,
                        F(u8, F(void *, actor, 0x54), 0x3a), angle, 0);
    VecFx32Object_Destroy(transform);
    VecFx32Object_Destroy(pose);
}

/* Builds an orientation transform between two optional vector objects. */
extern "C" void func_ov077_022130b8(void *out, const void *from, const void *to)
{
    VecFx32Object_InitComponents(out, 0, 0, 0);
    func_020adff0(from != 0 ? P(from, 4) : 0, to != 0 ? P(to, 4) : 0,
                  P(out, 4));
}

/* Finds and stores the actor selected by the inherited collection helper. */
extern "C" void func_ov077_022130f0(void *actor, s32 selector)
{
    void *collection = Actor_GetCollection(actor);
    F(void *, actor, 0x29c) =
        ActorCollection_FindActorByDescriptorValue(collection, selector);
}

/* Constructs the full overlay-77 actor and initializes its mode fields. */
extern "C" void *func_ov077_02213110(void *actor)
{
    func_ov077_02212ae0(actor);
    F(void *, actor, 0) = data_ov077_022172f4;
    F(u8, actor, 0x2e4) &= 0x0f;
    F(u8, actor, 0x2e5) = 0;
    F(u16, actor, 0x2e6) = F(u16, actor, 0x2e8) = 0;
    F(u16, actor, 0x2ea) = F(u16, actor, 0x2ec) = 0;
    F(u16, actor, 0x2ee) = 0;
    F(u16, actor, 0x2f2) &= 0x007f;
    F(void *, actor, 0x2f4) = F(void *, actor, 0x2f8) = 0;
    F(u16, actor, 0x2fc) = F(u16, actor, 0x2fe) = 0;
    F(u16, actor, 0x300) = 0;
    F(u16, actor, 0x302) = 0x1000;
    F(u16, actor, 0x304) = F(u16, actor, 0x306) = 0;
    F(s32, actor, 0x308) = -0xffff;
    u8 descriptor[37];
    ((Method)F(void *, F(void *, actor, 0), 0xc8))(actor, descriptor);
    F(s32, actor, 0x2d0) = func_020541d4((s8)descriptor[36]);
    F(u16, actor, 0x2ca) = 300;
    F(u16, actor, 0x2ce) = F(u16, actor, 0x2cc) = 0x1e;
    void *config = data_ov077_02216fc8;
    if (ActorExtendedType2_GetDescriptorValue2C(actor) == 0)
    {
        F(u8, actor, 0x2e4) &= 0xf0;
        F(u16, actor, 0x2c8) = 0;
        F(s32, actor, 0x218) = F(s32, config, 0x60);
        F(s32, actor, 0x21c) = F(s32, config, 0x64);
        F(u16, actor, 0x2f2) &= 0xfff9;
        F(u32, actor, 0x14) |= 2;
    }
    else
    {
        F(u8, actor, 0x2e4) = (F(u8, actor, 0x2e4) & 0xf0) | 1;
        F(u16, actor, 0x2c8) = F(u16, actor, 0x2ca);
        if (F(s32, actor, 0x1cc) == -1 || !GameWork_TestFlag(gGameWork))
        {
            F(u16, actor, 0x2f2) |= 6;
            F(u32, actor, 0x260) |= 0x1000;
        }
        else
        {
            F(s32, actor, 0x218) = F(s32, config, 0x48);
            F(s32, actor, 0x21c) = F(s32, config, 0x4c);
            F(u8, actor, 0x2e4) = (F(u8, actor, 0x2e4) & 0x8f) | 0x30;
            F(u16, actor, 0xda) = 3;
        }
    }
    F(u32, actor, 0x10) |= 0x1f0000;
    s32 tableIndex = F(s16, data_020e83a0, F(u16, actor, 0x4e) * 0x30);
    void *record = ActorExtendedType2Record_FindByIndex(tableIndex);
    F(u16, actor, 0x2f0) = (u16)func_020befec(F(s32, record, 0x20), 10);
    return actor;
}

static void DestroyDerived(void *actor)
{
    F(void *, actor, 0) = data_ov077_022172f4;
    for (s32 i = 0; i < 3; ++i)
        ReleaseOwned(F(void *, actor, 0x2d4 + i * 4));
    ReleaseOwned(F(void *, actor, 0x2e0));
    ReleaseOwned(F(void *, actor, 0x2c4));
    func_ov077_02212cb8(actor);
}

/* Destroys all derived presentation resources in place. */
extern "C" void *func_ov077_02213388(void *actor)
{
    DestroyDerived(actor);
    return actor;
}

/* Destroys the derived actor and releases its allocation. */
extern "C" void *func_ov077_02213408(void *actor)
{
    DestroyDerived(actor);
    Heap_Free(actor);
    return actor;
}

/* Allocates the actor's body, auxiliary sprites, and overlay-90 resources. */
extern "C" void func_ov077_02213490(void *actor)
{
    func_ov077_02212d04(actor);
    void *phase = F(void *, F(void *, data_021052fc, 0), 0x24);
    void *metadata = GamePhaseMetadata_GetByIndex(F(s32, phase, 0) - 1);
    bool hide = ((u32)F(s32, metadata, 0x40) & 0xc0000) != 0xc0000;
    void *body = Heap_Alloc(0x20, data_ov077_022174c8, 4, gHeapContext);
    if (body != 0)
    {
        void *owner1 = ActorCollection_GetSpriteOwner(
            GamePhaseRuntime_GetActorCollection(data_021052fc, 1));
        void *owner2 = ActorCollection_GetSpriteOwner(
            GamePhaseRuntime_GetActorCollection(data_021052fc, 2));
        body = UtilAnimationResource_Init(
            body, owner1, owner2, 2, F(s32, F(void *, actor, 0x20c), 4),
            F(s32, F(void *, actor, 0x20c), 8),
            F(s32, F(void *, actor, 0x20c), 12),
            DisplayController_GetVerticalOffset());
    }
    F(void *, actor, 0x2c4) = body;
    if (hide)
        F(u16, F(void *, F(void *, body, 8), 0), 0x24) |= 0x14;
    s8 variant = (s8)(F(u8, actor, 0x2e4) << 4) >> 4;
    if (variant == 0)
    {
        void *animation =
            Heap_Alloc(0x10, data_ov077_022174d0, 4, gHeapContext);
        if (animation != 0)
            animation =
                AnimationResource_Init(animation, 0x129c, 0x1298, 0x129d);
        F(void *, actor, 0x2e0) = animation;
        for (s32 i = 0; i < 3; ++i)
        {
            void *effect =
                Heap_Alloc(0x14, data_ov077_022174d0, 4, gHeapContext);
            if (effect != 0)
            {
                void *owner1 = ActorCollection_GetSpriteOwner(
                    GamePhaseRuntime_GetActorCollection(data_021052fc, 1));
                void *owner2 = ActorCollection_GetSpriteOwner(
                    GamePhaseRuntime_GetActorCollection(data_021052fc, 2));
                effect = func_ov090_0221c468(effect, owner1, owner2, animation,
                                             0, 0, -1);
            }
            F(void *, actor, 0x2d4 + i * 4) = effect;
            if (hide)
                F(u16, F(void *, F(void *, effect, 4), 8), 0x24) |= 0x14;
        }
    }
    else
    {
        F(void *, actor, 0x2e0) = 0;
        for (s32 i = 0; i < 3; ++i)
            F(void *, actor, 0x2d4 + i * 4) = 0;
    }
    bool invalidPair = false;
    if (variant == 1)
        invalidPair =
            !(F(s32, actor, 0x218) != F(s32, data_ov077_02216fc8, 0x68) ||
              (F(s32, actor, 0x21c) != F(s32, data_ov077_02217030, 4) &&
               F(s32, actor, 0x218) != 0));
    if (invalidPair)
    {
        F(u16, F(void *, actor, 0x54), 0x24) |= 0x10;
        func_ov077_02213768(body, 0x10);
        func_ov090_0221c3dc(F(void *, actor, 0x298), 0);
        if (variant == 0)
            for (s32 i = 0; i < 3; ++i)
                func_ov090_0221ca34(F(void *, actor, 0x2d4 + i * 4), 0);
    }
}

/* Applies a visibility mask to both sprites owned by one body resource. */
extern "C" void func_ov077_02213768(void *body, u16 mask)
{
    F(u16, F(void *, body, 4), 0x24) |= mask;
    F(u16, F(void *, body, 8), 0x24) |= mask;
}

/* Separates colliding actors unless attachment input currently owns motion. */
extern "C" void func_ov077_0221378c(void *actor, void *other, void *contact)
{
    if (!ActorRuntimeCollection_GetPendingAttachmentFlag(
            gActorRuntimeCollection))
    {
        s32 dx = F(s32, other, 0x1c) - F(s32, actor, 0x1c);
        s32 dy = F(s32, other, 0x20) - F(s32, actor, 0x20);
        s32 length = func_0204cfa4(dx, dy);
        if (length > 0x1000)
        {
            dx = func_020adc90(dx, length);
            dy = func_020adc90(dy, length);
            if (F(u8, other, 0x4d) == 2)
            {
                F(s32, actor, 0x8c) -= dx;
                F(s32, actor, 0x90) -= dy;
                F(s32, other, 0x8c) += dx;
                F(s32, other, 0x90) += dy;
            }
            else
            {
                F(s32, actor, 0x9c) -= dx;
                F(s32, actor, 0xa0) -= dy;
            }
        }
    }
    ActorContactState_AddContact(actor, other, contact);
}

/* Selects body and linked-sprite animations for the inherited actor state. */
extern "C" void func_ov077_02213874(void *actor)
{
    s32 state = F(s16, actor, 0xd6);
    s32 damage = F(s16, actor, 0xda);
    s32 variant = (s8)(F(u8, actor, 0x2e4) << 4) >> 4;
    s32 bodyAnimation = 0;
    s32 linkedAnimation = -1;
    s32 clearMask = 0;
    s32 setMask = 0;
    if (state == 2 || state == 3)
    {
        s32 limit = variant == 0 ? 3 : 2;
        if (damage > limit)
            damage = limit;
        bodyAnimation = state == 2 ? damage : damage + 0xd;
        linkedAnimation = F(u16, actor, 0xda) & 0xff;
        clearMask = 1;
        setMask = 2;
    }
    else if (state == 5)
    {
        if (damage > 2)
            damage = 2;
        bodyAnimation = damage + 4;
        linkedAnimation = 4;
        clearMask = 1;
        setMask = 2;
    }
    else if (state == 6 || state == 0xd || state == 0xe)
    {
        if (damage > 2)
            damage = 2;
        bodyAnimation = damage + (state == 0xe ? 4 : 7);
        linkedAnimation = state == 0xe ? 4 : 5;
        clearMask = 3;
    }
    else if (state == 0x10)
    {
        bodyAnimation = 0x10;
        linkedAnimation = 10;
        clearMask = 3;
    }
    else if (state == 0x13)
    {
        bodyAnimation = 4;
        linkedAnimation = 7;
        clearMask = 3;
    }
    if (linkedAnimation >= 0)
    {
        void *sprite = F(void *, actor, 0x54);
        F(u16, sprite, 0x24) =
            (F(u16, sprite, 0x24) & (u16)~clearMask) | setMask;
        void *body = F(void *, actor, 0x2c4);
        GraphicsSpriteState_SetAnimationIndex(F(void *, body, 4),
                                              linkedAnimation);
        GraphicsSpriteState_SetAnimationIndex(F(void *, body, 8),
                                              linkedAnimation);
        func_ov077_02213c08(body, clearMask == 3 ? 3 : 1);
        if (setMask != 0)
            func_ov077_02213768(body, setMask);
    }
    GraphicsSpriteState_SetAnimationIndex(F(void *, actor, 0x54),
                                          bodyAnimation & 0xff);
    F(u16, F(void *, actor, 0x54), 0x36) = 0x100;
    F(u16, F(void *, actor, 0x54), 0x30) = 0;
}

/* Clears a visibility mask from both sprites owned by one body resource. */
extern "C" void func_ov077_02213c08(void *body, s32 maskValue)
{
    u16 mask = (u16)maskValue;
    F(u16, F(void *, body, 4), 0x24) &= (u16)~mask;
    F(u16, F(void *, body, 8), 0x24) &= (u16)~mask;
}

static s32 SelectFormationOffset(void *actor)
{
    if ((s8)(F(u8, actor, 0x2e4) << 4) >> 4 != 0)
        return 0;
    if (func_ov077_022142c8(actor))
        return 4;
    return func_ov077_022142e0(actor) ? 8 : 0;
}

/* Synchronizes the main body, auxiliary effects, and attached actor pose. */
extern "C" void func_ov077_02213c30(void *out, void *actor, void *contact)
{
    func_ov077_02212e60(out, actor, contact);
    if ((F(u32, actor, 0x10) & 0x1000000) != 0)
        return;
    if (F(s16, actor, 0x2fe) == 0)
        F(s16, actor, 0x2fc) = 0;
    else
    {
        --F(s16, actor, 0x2fe);
        s32 mode = (F(u16, actor, 0x2f2) >> 6) & 3;
        if (mode == 0)
        {
            --F(s16, actor, 0x2fe);
            F(s16, actor, 0x2fc) -= F(s16, actor, 0x300);
        }
        else if (mode == 1)
        {
            s32 time = F(u16, actor, 0x2fe);
            if (time > 0x10)
                time = 0x10;
            s32 index = ((u16)(F(u16, actor, 0x2fe) << 12)) >> 4;
            F(s16, actor, 0x2fc) =
                (s16)((time * 2 * data_020c9670[index * 2]) >> 4);
        }
    }
    void *body = F(void *, actor, 0x2c4);
    F(s32, body, 0x18) =
        (F(s32, actor, 0x1c) >> 12) - (F(s32, contact, 4) >> 12) +
        (F(s32, actor, 0x2a8) >> 12) + (F(s32, actor, 0x2b8) >> 12);
    F(s32, body, 0x1c) =
        (F(s32, actor, 0x20) >> 12) - (F(s32, actor, 0x24) >> 12) -
        (F(s32, contact, 8) >> 12) + (F(s32, actor, 0x2ac) >> 12) +
        (F(s32, actor, 0x2bc) >> 12);
    func_ov077_02214298(body, F(u16, F(void *, actor, 0x54), 0x28) +
                                  (F(s16, actor, 0xda) < 2 ? -1 : 1));
    func_ov077_022142b4(body, F(u8, F(void *, actor, 0x54), 0x3a));
    F(s16, F(void *, body, 4), 0x30) = F(s16, actor, 0x2fc);
    F(s16, F(void *, body, 8), 0x30) = F(s16, actor, 0x2fc);
    s32 position[3] = {0, -0xc0 - DisplayController_GetVerticalOffset(), 0};
    s32 wrapper[3];
    func_ov077_02212f18(wrapper, position);
    UtilAnimationResource_UpdatePosition(body, wrapper);
    F(s16, F(void *, actor, 0x54), 0x30) = F(s16, actor, 0x2fc);

    s32 variant = (s8)(F(u8, actor, 0x2e4) << 4) >> 4;
    if (variant == 0)
    {
        void *bodySprite = F(void *, body, 4);
        u32 animation = F(u8, bodySprite, 0x38);
        u32 frame = F(u8, bodySprite, 0x39);
        bool visible = (F(u16, F(void *, actor, 0x54), 0x24) & 0x10) == 0;
        visible &= animation == 4 || animation == 5 || animation == 6
                       ? frame == 0
                       : (animation >= 7 && animation <= 9 ? frame > 2 : true);
        if (visible)
        {
            static const s16 *offsetsX = (const s16 *)data_ov077_02216f4c;
            static const s16 *offsetsY = (const s16 *)data_ov077_02216f64;
            void *primary = F(void *, F(void *, data_021052fc, 0), 0x2ea4);
            s32 trigIndex = ((u16)F(s16, actor, 0x2fc)) >> 4;
            s16 cosine = data_020c9670[trigIndex * 2];
            s16 sine = data_020c9670[trigIndex * 2 + 1];
            for (s32 i = 0; i < 3; ++i)
            {
                s32 slot = F(s16, actor, 0xda) * 3 + i;
                s32 x = (sine * offsetsX[slot] + cosine * offsetsY[slot]) >> 12;
                s32 y = (sine * offsetsY[slot] - cosine * offsetsX[slot]) >> 12;
                s32 style = F(s16, actor, 0xda);
                if ((F(u16, actor, 0x2f2) & 0x180) == 0 &&
                    (F(u16, actor, 0x2f2) & 0x40) == 0)
                {
                    if (F(s16, actor, 0xd6) == 3 && F(s16, actor, 0x2e6) > 0)
                        style = 6;
                    else if ((F(u16, actor, 0x2f2) & 1) != 0 ||
                             F(u16, actor, 0x2fe) != 0)
                        style = 5;
                }
                else
                    style = 4;
                void *effect = F(void *, actor, 0x2d4 + i * 4);
                func_ov090_0221ca34(effect, 1);
                func_ov090_0221ca58(effect, x, y);
                func_ov090_0221c73c(
                    effect, body,
                    (F(s32, primary, 0x1c) - F(s32, contact, 4)) >> 12,
                    (F(s32, primary, 0x20) - F(s32, primary, 0x24) -
                     F(s32, contact, 8)) >>
                        12,
                    style);
            }
        }
        else
            for (s32 i = 0; i < 3; ++i)
                func_ov090_0221ca34(F(void *, actor, 0x2d4 + i * 4), 0);
    }
    s16 direction = F(s16, F(void *, body, 4), 0x28);
    s32 count = func_ov090_0221c44c(F(void *, actor, 0x298));
    for (s32 i = 0; i < count; ++i)
    {
        void *entry = func_ov090_0221c440(F(void *, actor, 0x298), i);
        void *resource = F(void *, entry, 4);
        func_ov077_02214298(resource, direction + 1);
        func_ov077_022142b4(resource, F(u8, F(void *, body, 4), 0x3a));
    }
    s32 offset = SelectFormationOffset(actor);
    bool alternate = F(s32, actor, 0x218) == F(s32, data_ov077_02216fc8, 8) &&
                     (F(s32, actor, 0x21c) == F(s32, data_ov077_02216fd0, 4) ||
                      F(s32, actor, 0x218) == 0);
    u32 animation;
    if (!alternate)
    {
        s32 damage = F(s16, actor, 0xda);
        if (variant == 0 && damage >= 3)
            animation = func_ov077_022142c8(actor)
                            ? 0xd
                            : (func_ov077_022142e0(actor) ? 0xe : 0xc);
        else
            animation = damage + offset;
    }
    else if (variant == 0)
        animation = func_ov077_022142c8(actor)
                        ? 7
                        : (func_ov077_022142e0(actor) ? 0xb : 3);
    else
    {
        void *sprite = F(void *, F(void *, actor, 0x29c), 0x54);
        animation = offset + 3;
        if (F(u8, sprite, 0x38) > offset + 2)
            animation = F(u8, sprite, 0x38) == animation &&
                                (F(u16, sprite, 0x24) & 1) == 0
                            ? animation
                            : offset + 4;
    }
    void *linkedSprite = F(void *, F(void *, actor, 0x29c), 0x54);
    if (F(u8, linkedSprite, 0x38) != animation)
    {
        GraphicsSpriteState_SetAnimationIndex(linkedSprite, animation & 0xff);
        if (variant == 0 || F(s16, actor, 0xda) < 3)
            F(u16, linkedSprite, 0x24) |= 2;
        else
            F(u16, linkedSprite, 0x24) &= 0xfffd;
    }
}

/* Copies the direction halfword to both body sprites. */
extern "C" void func_ov077_02214298(void *body, s32 direction)
{
    F(u16, F(void *, body, 4), 0x28) = (u16)direction;
    F(u16, F(void *, body, 8), 0x28) = (u16)direction;
}

/* Copies the animation-state byte to both body sprites. */
extern "C" void func_ov077_022142b4(void *body, s32 state)
{
    F(u8, F(void *, body, 4), 0x3a) = (u8)state;
    F(u8, F(void *, body, 8), 0x3a) = (u8)state;
}

/* Reports the first descriptor pair used by formation selection. */
extern "C" s32 func_ov077_022142c8(void *actor)
{
    return F(s16, actor, 0x4e) == 0x81 || F(s16, actor, 0x4e) == 0x84;
}

/* Reports the second descriptor pair used by formation selection. */
extern "C" s32 func_ov077_022142e0(void *actor)
{
    return F(s16, actor, 0x4e) == 0x82 || F(s16, actor, 0x4e) == 0x85;
}

static s32 MultiplyFx(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

static void DispatchStoredCallback(void *actor, void *argument)
{
    u32 first = F(u32, actor, 0x218);
    u32 second = F(u32, actor, 0x21c);
    void *adjusted = P(actor, (s32)second >> 1);
    Method callback;
    if ((second & 1) != 0)
        callback = (Method)F(void *, F(void *, adjusted, 0), first);
    else
        callback = (Method)(u32)first;
    callback(adjusted, argument);
}

static bool CallbackPairMatches(void *actor, const void *first,
                                const void *second)
{
    return F(u32, actor, 0x218) == F(u32, first, 0) &&
           (F(u32, actor, 0x21c) == F(u32, second, 4) ||
            F(u32, actor, 0x218) == 0);
}

/* Updates callback-driven motion and submits every overlay-90 body sprite. */
extern "C" void func_ov077_022142f8(void *actor)
{
    if ((F(u32, actor, 0x14) & 0x200000) != 0)
        return;
    ((Method)F(void *, F(void *, actor, 0), 0x18))(actor);
    u8 callbackRecord[48];
    ((Method)F(void *, F(void *, actor, 0), 0xc8))(actor, callbackRecord);
    F(u8, actor, 0x24c) = 0;
    F(u32, actor, 0x260) &= ~1u;
    DispatchStoredCallback(actor, callbackRecord);
    ((Method)F(void *, F(void *, actor, 0), 0xa4))(actor);
    F(u8, actor, 0xd5) = F(u8, actor, 0xd4) = 0;
    Actor_UpdateAnimationState(actor);

    bool alternate = CallbackPairMatches(actor, P(data_ov077_02216fc8, 0x58),
                                         data_ov077_02217020) &&
                     ((F(u8, actor, 0x2e4) >> 4) & 7) != 0;
    if (!alternate)
        alternate = CallbackPairMatches(actor, P(data_ov077_02216fc8, 0x50),
                                        data_ov077_02217018) &&
                    ((F(u8, actor, 0x2e4) >> 4) & 7) == 0;
    s32 count = func_ov090_0221c44c(F(void *, actor, 0x298));
    if (alternate)
    {
        func_ov077_02214cd4(P(actor, 0x2a4), 0, 0, 0);
        func_ov077_02214cd4(P(actor, 0x2b4), 0, 0, 0);
    }
    else
    {
        s32 damage = F(s16, actor, 0xda);
        s32 variant = (s8)(F(u8, actor, 0x2e4) << 4) >> 4;
        s32 amplitude;
        if (variant == 0)
            amplitude = damage < 3 ? damage * 2 + 8 : 4;
        else if ((F(u8, actor, 0x2e4) & 0x80) != 0)
            amplitude = 10;
        else
            amplitude = 8;
        F(u8, actor, 0x2a0) += (u8)(damage + (variant == 0 ? 2 : 2));
        F(u8, actor, 0x2a1) += (u8)(damage + (variant == 0 ? 1 : 1));
        s32 ix = ((u16)((s8)F(u8, actor, 0x2a0) << 8)) >> 4;
        s32 iy = ((u16)((s8)F(u8, actor, 0x2a1) << 8)) >> 4;
        F(s32, actor, 0x2a8) = amplitude * data_020c9670[ix * 2];
        F(s32, actor, 0x2ac) = amplitude * data_020c9670[iy * 2];

        if (variant == 0 && F(s16, actor, 0x2ea) > 2)
        {
            s32 target = func_ov077_022142c8(actor)
                             ? 0x14000
                             : (func_ov077_022142e0(actor) ? -0x14000 : 0);
            s32 state = F(s16, actor, 0x2ea);
            if (state < 6 || state > 9)
            {
                F(s32, actor, 0x2b8) = MultiplyFx(F(s32, actor, 0x2b8), 0xeb8);
                F(s32, actor, 0x2bc) =
                    MultiplyFx(F(s32, actor, 0x2bc), 0xf33) - 0x2008;
            }
            else if (state == 6 && F(s16, actor, 0x25a) < 0x19)
            {
                F(s32, actor, 0x2b8) = MultiplyFx(F(s32, actor, 0x2b8), 0xeb8) +
                                       MultiplyFx(target, -0x148);
                F(s32, actor, 0x2bc) =
                    MultiplyFx(F(s32, actor, 0x2bc), 0xf33) - 0x380e;
            }
            else
            {
                F(s32, actor, 0x2b8) = MultiplyFx(F(s32, actor, 0x2b8), 0xe66) +
                                       MultiplyFx(target, 0x19a);
                F(s32, actor, 0x2bc) =
                    MultiplyFx(F(s32, actor, 0x2bc), 0xeb8) + 0x3340;
            }
            F(s32, actor, 0x2f4) = 0;
        }
        else if (F(s16, actor, 0x2ee) < F(s16, actor, 0x2ec))
        {
            s32 blend = F(s32, actor, 0x2f4) + 0x52;
            if (blend > 0xb33)
                blend = 0xb33;
            F(s32, actor, 0x2f4) = blend;
            s32 angle =
                ((F(s16, actor, 0x2ec) * F(s16, actor, 0x302)) & 0xffff) >> 4;
            s32 targetX = data_020c9670[angle * 2] * 12;
            s32 targetY = data_020c9670[angle * 2 + 1] * 12;
            if ((F(u16, actor, 0x2f2) & 0x180) != 0)
                targetY -= 0x30000;
            F(s32, actor, 0x2b8) =
                MultiplyFx(F(s32, actor, 0x2b8), 0x1000 - blend) +
                MultiplyFx(targetX, blend);
            F(s32, actor, 0x2bc) =
                MultiplyFx(F(s32, actor, 0x2bc), 0x1000 - blend) +
                MultiplyFx(targetY, blend);
        }
        else
        {
            func_ov077_02214c7c(P(actor, 0x2b4), 0xf0a);
            F(s32, actor, 0x2f4) = 0;
        }
    }

    s32 pose[4];
    if (F(void *, actor, 0x29c) == 0)
        VecFx32Object_Assign(pose, P(actor, 0x22c));
    else
        VecFx32Object_Assign(pose, P(F(void *, actor, 0x29c), 0x18));
    s32 variant = (s8)(F(u8, actor, 0x2e4) << 4) >> 4;
    if (variant == 1)
        F(s32, pose, 12) +=
            F(s16, data_ov077_02216f2c, F(s16, actor, 0xda) * 2) * 0x1000;
    else
    {
        s32 group = func_ov077_022142c8(actor)
                        ? 0
                        : (func_ov077_022142e0(actor) ? 2 : 1);
        F(s32, pose, 4) +=
            F(s16, data_ov077_02216f7c, (group * 4 + F(s16, actor, 0xda)) * 2) *
            0x1000;
        F(s32, pose, 8) +=
            F(s16, data_ov077_02216f34, (group * 4 + F(s16, actor, 0xda)) * 2) *
            0x1000;
    }
    if ((F(u32, actor, 0x14) & 0x40) != 0)
    {
        s32 oldY = F(s32, actor, 0x238);
        F(s32, actor, 0x24) = func_020befec(
            F(s32, actor, 0x24) * 0x62 + (F(s32, actor, 0x238) + 0x20000) * 2,
            100);
        s32 step = ((Method)F(void *, F(void *, actor, 0), 0xb0))(actor);
        F(s32, actor, 0x44) +=
            F(s32, actor, 0x24) > oldY + 0x20000 ? -step : step;
    }
    s32 first[4];
    s32 second[4];
    func_ov077_022130b8(first, P(actor, 0x18), P(actor, 0x2a4));
    func_ov077_022130b8(second, first, P(actor, 0x2b4));
    VecFx32Object_Destroy(first);
    if (alternate)
        func_ov090_0221c184(F(void *, actor, 0x298), second, pose,
                            F(u8, F(void *, actor, 0x54), 0x3a));
    else
        func_ov090_0221be40(F(void *, actor, 0x298), second, pose,
                            F(u8, F(void *, actor, 0x54), 0x3a), 0, 0);

    s8 direction = F(s8, actor, 0x2e5);
    if (direction != 0)
    {
        F(s16, actor, 0x2e6) += direction;
        if ((direction < 0 && F(s16, actor, 0x2e6) < 0) ||
            (direction > 0 && F(s16, actor, 0x2e6) >= (count + 1) * 0x18))
        {
            F(s8, actor, 0x2e5) = 0;
            F(s16, actor, 0x2e6) = 0;
        }
    }
    for (s32 i = 0; i < count; ++i)
    {
        void *entry =
            func_ov090_0221c434(F(void *, actor, 0x298), count - i - 1);
        void *resource = F(void *, entry, 4);
        s16 scale = 0x100;
        if (F(s8, actor, 0x2e5) != 0)
        {
            s32 index = (F(s16, actor, 0x2e6) - i * 0x18) / 4;
            if (index >= 0 && index < 20)
                scale += F(s16, data_ov077_02216f94, index * 2);
        }
        F(s16, F(void *, resource, 4), 0x32) = scale;
        F(s16, F(void *, resource, 4), 0x34) = scale;
        F(s16, F(void *, resource, 8), 0x32) = scale;
        F(s16, F(void *, resource, 8), 0x34) = scale;
        s32 animation = F(s16, actor, 0xda);
        if (animation > 2)
            animation = 2;
        if (i == 0)
            animation += 3;
        if (F(u8, F(void *, resource, 4), 0x38) != animation)
        {
            GraphicsSpriteState_SetAnimationIndex(F(void *, resource, 4),
                                                  animation);
            GraphicsSpriteState_SetAnimationIndex(F(void *, resource, 8),
                                                  animation);
        }
    }
    F(u32, actor, 0x260) |= 2;
    ((Method)F(void *, F(void *, actor, 0), 0x20))(actor);
    VecFx32Object_Destroy(second);
    VecFx32Object_Destroy(pose);
}

/* Scales the XYZ members of a fixed-point vector in place. */
extern "C" void func_ov077_02214c7c(void *vector, s32 scale)
{
    for (s32 offset = 4; offset <= 12; offset += 4)
        F(s32, vector, offset) = MultiplyFx(F(s32, vector, offset), scale);
}

/* Writes three components after an optional vector object's header word. */
extern "C" void func_ov077_02214cd4(void *vector, s32 x, s32 y, s32 z)
{
    if (vector != 0)
        vector = P(vector, 4);
    F(s32, vector, 0) = x;
    F(s32, vector, 4) = y;
    F(s32, vector, 8) = z;
}

/* Spawns a pushed presentation actor and applies the reciprocal impulse. */
extern "C" void func_ov077_02214ce4(void *actor, const void *target)
{
    s32 position[4];
    VecFx32Object_InitCopy(position, P(actor, 0x18));
    void *record = F(void *, actor, 0x2d0);
    void *spawned = func_02053f9c(F(s16, record, 0), position, 0);
    F(u32, spawned, 0x5c) = (F(u32, spawned, 0x5c) & 0xffff0000) | 0xffd8;
    s32 dx = F(s32, target, 4) - F(s32, position, 4);
    s32 dy = F(s32, target, 8) - F(s32, position, 8);
    s32 length = func_0204cfa4(dx, dy);
    if (length > 0x1000)
    {
        dx = func_020adc90(dx, length);
        dy = func_020adc90(dy, length);
        F(s32, actor, 0x8c) -= dx;
        F(s32, actor, 0x90) -= dy;
        F(s32, spawned, 0x3c) = dx * 3;
        F(s32, spawned, 0x40) = dy * 3;
    }
    F(s32, spawned, 0x44) = 0x2ccd;
    if (((s8)(F(u8, actor, 0x2e4) << 4) >> 4) == 0)
        func_ov077_02214c7c(P(spawned, 0x38), 0x2000);
    func_020349b8(actor, 0x9f81, 0);
    VecFx32Object_Destroy(position);
}

/* Resolves a physical collision into bounce or terminal contact state. */
extern "C" void func_ov077_02214e00(void *actor, void *other)
{
    bool idle = F(u16, actor, 0x2e8) == 0 && F(s16, actor, 0x2ea) == 0 &&
                F(s16, actor, 0x2ec) == 0;
    if (idle)
    {
        if (F(s16, other, 0x4e) != 0x71)
        {
            F(u16, actor, 0x2ec) = 0xb4;
            F(s32, other, 0x3c) *= -2;
            F(s32, other, 0x40) *= -2;
            Sound_Play(gSoundContext, 0x13f, 7);
        }
        else
        {
            F(u16, actor, 0x2ea) = 1;
            ((Method)F(void *, F(void *, other, 0), 0xe8))(other, 0);
            func_020349b8(actor, 0x9f80, 0);
        }
    }
    else
    {
        F(s32, other, 0x3c) = -(F(s32, other, 0x3c) / 2);
        F(s32, other, 0x40) = -(F(s32, other, 0x40) / 2);
    }
}

/* Enters the actor's hit response or rejects an incompatible attacker. */
extern "C" s32 func_ov077_02214eec(void *actor, void *other)
{
    if (F(s16, actor, 0xda) < 3 && F(u16, actor, 0x2e8) < 2 &&
        F(s16, actor, 0x2ea) < 1)
    {
        bool compatible = other == 0;
        if (other != 0)
            compatible = F(s16, F(void *, other, 0x1f8), 0) ==
                         F(s16, F(void *, actor, 0x2d0), 0);
        if (compatible)
        {
            F(u16, actor, 0x2ec) = 0;
            F(u16, actor, 0x2e8) = 0;
            F(u16, actor, 0x2ea) = 1;
            func_020349b8(actor, 0x9f80, 0);
            if (other == 0)
                F(u16, actor, 0x2f2) &= 0xfff7;
            else
                F(u16, actor, 0x2f2) |= 8;
            return other == 0;
        }
    }
    func_ov077_02214fc0(actor, 0x40);
    Sound_Play(gSoundContext, 0x13f, 7);
    return 2;
}

/* Starts the actor's fixed-amplitude presentation oscillation. */
extern "C" void func_ov077_02214fc0(void *actor, s32 duration)
{
    F(u16, actor, 0x2fe) = (u16)duration;
    F(u16, actor, 0x300) = 0;
    F(u16, actor, 0x2f2) = (F(u16, actor, 0x2f2) & 0xffcf) | 0x10;
}

/* Dispatches the normal update to the actor's active variant. */
extern "C" void func_ov077_02214fe8(void *actor)
{
    if (((s8)(F(u8, actor, 0x2e4) << 4) >> 4) != 0)
        func_ov077_02215494(actor);
    else
        func_ov077_02215f34(actor);
}

/* Dispatches the terminal update to the actor's active variant. */
extern "C" void func_ov077_0221501c(void *actor)
{
    if (((s8)(F(u8, actor, 0x2e4) << 4) >> 4) != 0)
        func_ov077_022169bc(actor);
    else
        func_ov077_02216cac(actor);
}

/* Transitions a completed linked actor or hides all surviving resources. */
extern "C" s32 func_ov077_02215050(void *actor)
{
    F(u16, actor, 0xd6) = 0x11;
    if ((F(u16, actor, 0x2f2) & 1) != 0)
    {
        F(u16, actor, 0x2f2) &= 0xfffe;
        ((Method)F(void *, F(void *, actor, 0), 0xc4))(actor);
        VecFx32Object_Assign(P(actor, 0x18), P(F(void *, actor, 0x29c), 0x18));
        F(u16, actor, 0xda) = 0;
        F(u16, actor, 0xd6) = 0x13;
        F(u32, actor, 0x218) = F(u32, data_ov077_02216fc8, 0x78);
        F(u32, actor, 0x21c) = F(u32, data_ov077_02216fc8, 0x7c);
        func_020349b8(actor, 0xa100, 0);
        F(u32, actor, 0x14) &= 0xefffffff;
        s32 variant = F(s16, actor, 0x4e) == 0x81
                          ? 2
                          : (F(s16, actor, 0x4e) == 0x82 ? 1 : 0);
        void *context =
            (void *)func_0201e0ec(P(F(void *, data_021052fc, 0), 0x2f7c));
        func_020a2844(context, variant, F(s32, actor, 0x1c) >> 12,
                      (F(s32, actor, 0x20) - F(s32, actor, 0x24)) >> 12, 3);
        func_020a2844(context, 2, F(s32, actor, 0x1c) >> 12,
                      (F(s32, actor, 0x20) - F(s32, actor, 0x24)) >> 12, 5);
        return 1;
    }
    F(u16, F(void *, actor, 0x54), 0x24) |= 0x13;
    if (F(void *, actor, 0x58) != 0)
        F(u16, F(void *, actor, 0x58), 0x24) |= 0x13;
    func_ov090_0221c3dc(F(void *, actor, 0x298), 0);
    func_ov077_02213768(F(void *, actor, 0x2c4), 0x10);
    F(u32, actor, 0x14) |= 0x10000000;
    return 0;
}

/* Hides and releases the actor's primary terminal resources. */
extern "C" void func_ov077_022151bc(void *actor)
{
    F(u16, actor, 0xd6) = 0x11;
    F(u16, F(void *, actor, 0x54), 0x24) |= 0x13;
    if (F(void *, actor, 0x58) != 0)
        F(u16, F(void *, actor, 0x58), 0x24) |= 0x13;
    ReleaseOwned(F(void *, actor, 0x298));
    F(void *, actor, 0x298) = 0;
    ReleaseOwned(F(void *, actor, 0x2c4));
    F(void *, actor, 0x2c4) = 0;
    F(u32, actor, 0x14) |= 0x10000000;
}

/* Advances the three-stage vertical return and idle countdown. */
extern "C" s32 func_ov077_02215240(void *actor)
{
    F(u16, actor, 0x2ee) = 0;
    F(u16, actor, 0xd6) = 0x13;
    F(u8, actor, 0x2e4) &= 0x7f;
    F(u32, actor, 0x260) &= ~3u;
    F(s32, actor, 0x3c) = F(s32, actor, 0x40) = 0;
    s32 phase = (F(u8, actor, 0x2e4) >> 4) & 7;
    if (phase == 0)
    {
        F(u16, F(void *, actor, 0x54), 0x24) &= 0xffef;
        if (F(void *, actor, 0x58) != 0)
            F(u16, F(void *, actor, 0x58), 0x24) &= 0xffef;
        func_ov090_0221c3dc(F(void *, actor, 0x298), 1);
        func_ov077_02213c08(F(void *, actor, 0x2c4), 0x10);
        if ((F(u16, F(void *, actor, 0x54), 0x24) & 1) != 0)
        {
            F(u8, actor, 0x2e4) = (F(u8, actor, 0x2e4) & 0x8f) | 0x10;
            F(u32, actor, 0x14) |= 0x40;
            s32 sound = func_ov077_022142c8(actor)
                            ? 0xa102
                            : (func_ov077_022142e0(actor) ? 0xa103 : 0xa101);
            func_020349b8(actor, sound, 0);
        }
    }
    else if (phase == 1)
    {
        F(u16, actor, 0xd6) = 2;
        s32 target = F(s32, actor, 0x1dc) + 0x20000;
        F(s32, actor, 0x24) =
            MultiplyFx(F(s32, actor, 0x24), 0xfae) + MultiplyFx(target, 0x52);
        if (SignedAbsoluteValue(F(s32, actor, 0x24) - target) < 0x1000)
        {
            F(u8, actor, 0x2e4) = (F(u8, actor, 0x2e4) & 0x8f) | 0x20;
            F(u16, actor, 0x2ec) = 0x78;
            F(u16, actor, 0x302) = 0x800;
        }
    }
    else if (phase == 2)
    {
        F(u16, actor, 0xd6) = 2;
        F(s32, actor, 0x24) = F(s32, actor, 0x1dc) + 0x20000;
        F(s32, actor, 0x44) = 0;
        if (F(s16, actor, 0x2ec) > 0 && --F(s16, actor, 0x2ec) == 0)
            F(u16, actor, 0x2ec) = 0x100;
    }
    return 0;
}

/* Restores the actor's default callback pair and movement parameters. */
extern "C" void func_ov077_02215444(void *actor)
{
    F(u8, actor, 0x2e4) &= 0x8f;
    F(u16, actor, 0x2f2) &= 0xfffe;
    F(u32, actor, 0x218) = F(u32, data_ov077_02216fc8, 0x18);
    F(u32, actor, 0x21c) = F(u32, data_ov077_02216fc8, 0x1c);
    F(u16, actor, 0x2ec) = 0;
    F(u16, actor, 0x302) = 0x1000;
}

/* Runs the alternate actor variant's pursuit, hit, and defeat state machine. */
extern "C" void func_ov077_02215494(void *actor)
{
    F(u16, actor, 0x2ee) = 0x5a;
    if ((s16)(F(s32, actor, 0x308) >> 16) != 0 &&
        (F(u32, actor, 0x10) & 4) != 0)
        F(s32, actor, 0x308) = 0x4f0000;
    s32 countdown = F(s32, actor, 0x308) >> 16;
    if (countdown > 0)
    {
        if (func_020ada8c(countdown, 0x14) == 0)
        {
            func_ov077_02214fc0(actor, 8);
            F(u16, actor, 0x2ec) = 8;
        }
        F(s32, actor, 0x308) =
            ((countdown - 1) << 16) | (F(s32, actor, 0x308) & 0xffff);
    }

    void *primary = F(void *, F(void *, data_021052fc, 0), 0x2ea4);
    bool pursue = false;
    if ((F(u32, primary, 0xd0) & 0x100) == 0 && F(s16, actor, 0x2ea) == 0 &&
        (F(u16, actor, 0x2f2) & 6) == 6 && F(s16, actor, 0x2e8) == 0)
    {
        s32 dx = (F(s32, actor, 0x1c) - F(s32, actor, 0x234)) >> 12;
        s32 dy = (F(s32, actor, 0x20) - F(s32, actor, 0x238)) >> 12;
        pursue = dx * dx + dy * dy < 0x10000;
    }
    if (pursue)
    {
        F(u32, actor, 0x218) = F(u32, data_ov077_02216fc8, 0);
        F(u32, actor, 0x21c) = F(u32, data_ov077_02216fc8, 4);
        ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, P(primary, 0x18));
        F(u16, actor, 0xd6) = 2;
        s32 step = ((Method)F(void *, F(void *, actor, 0), 0x144))(actor);
        func_02032370(actor, P(primary, 0x18), step);
    }
    else if (countdown <= 0)
    {
        F(u32, actor, 0x218) = F(u32, data_ov077_02216fc8, 0x38);
        F(u32, actor, 0x21c) = F(u32, data_ov077_02216fc8, 0x3c);
        s32 target[4];
        VecFx32Object_InitCopy(target, P(actor, 0x22c));
        ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, target);
        if (F(s16, actor, 0x2ea) < 1)
            F(u16, actor, 0xd6) = 2;
        else
        {
            F(u16, actor, 0xd6) = 5;
            F(s32, actor, 0x3c) *= 3;
            F(s32, actor, 0x40) *= 3;
        }
        s32 step = ((Method)F(void *, F(void *, actor, 0), 0x140))(actor);
        func_02032228(actor, F(s32, actor, 0x3c), F(s32, actor, 0x40), step);
        VecFx32Object_Destroy(target);
    }
    else
    {
        F(u32, actor, 0x218) = F(u32, data_ov077_02216fc8, 0x40);
        F(u32, actor, 0x21c) = F(u32, data_ov077_02216fc8, 0x44);
        s32 angle = ((countdown - 0x28) * 100) >> 4;
        s32 target[4];
        VecFx32Object_InitCopy(target, P(actor, 0x22c));
        F(s32, target, 4) += data_020c9670[(angle & 0xffff) >> 4] * 0x20;
        F(s32, target, 8) +=
            data_020c9670[((angle & 0xffff) >> 4) * 2 + 1] * 0x20;
        ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, target);
        F(s32, actor, 0x3c) <<= 2;
        F(s32, actor, 0x40) <<= 2;
        F(u16, actor, 0xd6) = 2;
        s32 step = ((Method)F(void *, F(void *, actor, 0), 0x140))(actor);
        func_02032228(actor, F(s32, actor, 0x3c), F(s32, actor, 0x40), step);
        VecFx32Object_Destroy(target);
    }

    s32 bodyCount = func_ov090_0221c44c(F(void *, actor, 0x298));
    s32 threshold = (bodyCount + 1) * 0x18;
    if (F(s16, actor, 0x2ec) > 0)
        --F(s16, actor, 0x2ec);
    else if (F(s16, actor, 0x2ea) == 1)
    {
        F(s16, actor, 0x2e6) = (s16)threshold;
        F(s8, actor, 0x2e5) = -2;
        F(u16, actor, 0x2ea) = 2;
        F(u16, actor, 0x25a) = 0;
    }
    else if (F(s16, actor, 0x2ea) == 2)
    {
        ++F(s16, actor, 0x25a);
        if (func_020befec(F(s16, actor, 0x25a), 10) == 0)
            func_020349b8(actor, 0x9f84, 0);
        if (F(s16, actor, 0x2e6) < 0x41)
        {
            s32 sound = F(s16, actor, 0x4e) == 0x84
                            ? 0x9f8a
                            : (F(s16, actor, 0x4e) == 0x85 ? 0x9f8c : 0x9f88);
            func_020349b8(actor, sound, 0);
            func_020349b8(actor, 0x4281, 0);
            if (F(s16, actor, 0xda) < 2)
            {
                F(u16, actor, 0x2ec) = 0x80;
                void *effect =
                    Heap_Alloc(0x14, data_ov077_022174d8, 4, gHeapContext);
                if (effect != 0)
                    PresentationBackedActor_SpawnAmountVariant(
                        effect, P(F(void *, actor, 0x29c), 0x18),
                        F(void *, F(void *, actor, 0x54), 0), 0x12ab, 0x12a7,
                        0x12ac, F(s16, actor, 0xda), -8, 1, 1);
            }
            else
            {
                F(u16, actor, 0x2ec) = 0xc0;
                F(u32, actor, 0x218) = F(u32, data_ov077_02216fc8, 0x10);
                F(u32, actor, 0x21c) = F(u32, data_ov077_02216fc8, 0x14);
                ActorExtendedType2_IncrementSavedProgressCounter(actor);
                func_ov077_02214cd4(P(actor, 0x38), 0, 0, 0);
                func_ov077_02214cd4(P(actor, 0x88), 0, 0, 0);
                func_ov077_02214cd4(P(actor, 0x98), 0, 0, 0);
                F(u8, actor, 0x2e4) &= 0x8f;
                func_020349b8(actor, 0x9f85, 0);
                func_020349b8(actor, 0x9f83, 0);
                void *context = (void *)func_0201e0ec(
                    P(F(void *, data_021052fc, 0), 0x2f7c));
                func_020a27a0(context, 2,
                              F(s32, F(void *, actor, 0x29c), 0x1c) >> 12,
                              ((F(s32, F(void *, actor, 0x29c), 0x20) -
                                F(s32, F(void *, actor, 0x29c), 0x24)) >>
                               12) +
                                  0x18);
            }
            ++F(s16, actor, 0xda);
            F(u16, actor, 0x2ea) = 0;
        }
    }
    F(u8, actor, 0x2e4) = (F(u8, actor, 0x2e4) & 0x7f) | (pursue ? 0x80 : 0);
    if (F(s16, actor, 0xd6) == 2 && F(s8, actor, 0x2e5) != 0)
        F(u16, actor, 0xd6) = 3;
}

/* Returns the alternate variant's horizontal motion step. */
extern "C" s32 func_ov077_02215f24(void)
{
    return 0x800;
}

/* Returns the alternate variant's target-following motion step. */
extern "C" s32 func_ov077_02215f2c(void)
{
    return 0x800;
}

/* Runs the normal variant's movement, hit, recovery, and defeat state machine.
 */
extern "C" s32 func_ov077_02215f34(void *actor)
{
    void *primary = F(void *, F(void *, data_021052fc, 0), 0x2ea4);
    F(u16, actor, 0x2ee) = 0x5a;
    bool pursued = (F(u16, actor, 0x2f2) & 4) != 0;

    if (pursued && F(s16, actor, 0x2ea) == 0)
    {
        F(s32, actor, 0x218) = F(s32, data_ov077_02216fc8, 0x80);
        F(s32, actor, 0x21c) = F(s32, data_ov077_02216fc8, 0x84);
        ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, P(primary, 0x18));
        F(u16, actor, 0xd6) = F(s16, actor, 0x2e6) < 1 ? 2 : 3;
        func_02032370(actor, P(primary, 0x18),
                      ((Method)F(void *, F(void *, actor, 0), 0x144))(actor));
    }
    else
    {
        F(s32, actor, 0x218) = F(s32, data_ov077_02216fc8, 0x78);
        F(s32, actor, 0x21c) = F(s32, data_ov077_02216fc8, 0x7c);
        s32 target[4];
        func_02005030(target, P(actor, 0x22c));
        ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, target);
        F(u16, actor, 0xd6) = F(s16, actor, 0x2ea) < 1 ? 2 : 5;
        if (F(s16, actor, 0x2ea) > 0)
        {
            F(s32, actor, 0x3c) *= 3;
            F(s32, actor, 0x40) *= 3;
        }
        func_02032228(actor, F(s32, actor, 0x3c), F(s32, actor, 0x40),
                      ((Method)F(void *, F(void *, actor, 0), 0x140))(actor));
        func_02005058(target);
    }

    s32 spacing = (func_ov090_0221c44c(F(void *, actor, 0x298)) + 1) * 0x18;
    s32 threshold = spacing - 0x30;
    u16 cooldown = (F(u16, actor, 0x2f2) >> 7) & 7;
    if (cooldown != 0)
        F(u16, actor, 0x2f2) =
            (F(u16, actor, 0x2f2) & 0xc7ff) | ((cooldown - 1) << 11);

    if (F(s16, actor, 0x2ec) > 0)
        --F(s16, actor, 0x2ec);
    else
    {
        switch (F(s16, actor, 0x2ea))
        {
        case 0:
            if (!pursued)
            {
                F(u16, actor, 0x2e8) = 0;
                break;
            }
            if (F(s16, actor, 0x2e6) >= threshold)
            {
                F(u16, actor, 0x2a2) = 0;
                F(u16, actor, 0x2ce) = 0;
                F(u16, actor, 0x2cc) = 0;
                F(s32, actor, 0x44) += 0x2800;
                func_ov077_02214fc0(actor, 8);
                F(u16, actor, 0xd6) = 0xd;
                F(u16, actor, 0x2e8) = 2;
            }
            else
                F(s32, actor, 0x44) = 0x1000;
            break;
        case 1:
            F(u16, actor, 0x25a) = 0;
            F(u16, actor, 0x2e6) = (u16)spacing;
            F(s8, actor, 0x2e5) = (F(u16, actor, 0x2f2) & 8) != 0 ? -1 : -2;
            F(u16, actor, 0x2ea) = (F(u16, actor, 0x2f2) & 8) != 0 ? 10 : 3;
            break;
        case 3:
            func_020349b8(actor, 0x43, 0);
            F(u16, actor, 0x2ea) = 4;
            F(u16, actor, 0xd6) = 0xe;
            break;
        case 4:
            F(u16, actor, 0xd6) = 0xe;
            ++F(u16, actor, 0x25a);
            if (func_020befec(F(s16, actor, 0x25a), 10) == 0)
                func_020349b8(actor, 0x9f84, 0);
            if (F(s8, actor, 0x2e5) == 0 || F(s16, actor, 0x2e6) < 0x31)
            {
                F(u16, actor, 0x2ea) = 5;
                F(u16, actor, 0x25a) = 0;
                func_020099c0(P(F(void *, data_021052fc, 0), 0x2fbc), 0x1e, 2);
                func_020349b8(actor, 0x9f86, 0);
            }
            break;
        case 5:
            F(u16, actor, 0xd6) = 0xe;
            if (++F(u16, actor, 0x25a) > 10)
            {
                F(s8, actor, 0x2e5) = 8;
                F(u16, actor, 0x2ea) = 6;
                F(u16, actor, 0x25a) = 0;
            }
            break;
        case 6:
            F(u16, actor, 0xd6) = 0xe;
            if (F(s8, actor, 0x2e5) == 0)
            {
                F(u16, actor, 0xd6) = 6;
                F(u16, actor, 0x2ea) = 7;
                F(u16, actor, 0x25a) = 0;
                func_ov090_0221b03c(F(void *, actor, 0x2f8), actor);
            }
            break;
        case 7:
            F(u16, actor, 0xd6) = 6;
            if (++F(u16, actor, 0x25a) > 0x3c)
                F(u16, actor, 0x2ea) = 0;
            break;
        case 10:
            func_020349b8(actor, 0x26, 0);
            F(u16, actor, 0x2ea) = 11;
            F(u16, actor, 0xd6) = 0xe;
            F(u16, actor, 0x25a) = 0;
            break;
        case 11:
            F(u16, actor, 0xd6) = 0xe;
            ++F(u16, actor, 0x25a);
            if (func_020befec(F(s16, actor, 0x25a), 10) == 0)
                func_020349b8(actor, 0x9f84, 0);
            if (F(s16, actor, 0x2e6) < 0x31)
            {
                func_020349b8(actor,
                              F(s16, actor, 0x4e) == 0x84 ? 0x9f8a : 0x9f88, 0);
                func_020349b8(actor, 0x4281, 0);
                ++F(s16, actor, 0xda);
                func_ov090_0221b03c(F(void *, actor, 0x2f8), actor);
                func_020099c0(P(F(void *, data_021052fc, 0), 0x2fbc), 0xf, 2);
                if (F(s16, actor, 0xda) < 3)
                {
                    func_ov077_02214fc0(actor, 0x80);
                    F(u16, actor, 0x2ec) = 0x80;
                    F(u16, actor, 0x2f2) =
                        (F(u16, actor, 0x2f2) & 0xc7ff) | 0x4000;
                }
                else
                {
                    F(u16, actor, 0x2fe) = 0xc0;
                    F(u16, actor, 0x300) = 0x1000;
                    F(u16, actor, 0x2ec) = 0xc0;
                    F(u16, actor, 0x2f2) =
                        (F(u16, actor, 0x2f2) & 0xc7c1) | 0x6000;
                }
                F(u16, actor, 0x2ea) = 0;
            }
            break;
        }
    }
    F(u8, actor, 0x2e4) =
        (F(u8, actor, 0x2e4) & 0x7f) | ((F(u16, actor, 0x2f2) & 2) ? 0x80 : 0);
    if (F(s16, actor, 0xd6) == 2 && F(s8, actor, 0x2e5) != 0)
        F(u16, actor, 0xd6) = 3;
    return 0;
}

/* Commits the normal variant's final defeat flags and audio cues. */
extern "C" void func_ov077_02216960(void *actor)
{
    F(u32, actor, 0x218) = F(u32, data_ov077_02216fc8, 0x70);
    F(u32, actor, 0x21c) = F(u32, data_ov077_02216fc8, 0x74);
    func_ov077_02216cac(actor);
    ActorExtendedType2_IncrementSavedProgressCounter(actor);
    func_020349b8(actor, 0x9f85, 0);
    func_020349b8(actor, 0x9f83, 0);
}

/* Advances the alternate variant through its terminal dust-and-hide sequence.
 */
extern "C" s32 func_ov077_022169bc(void *actor)
{
    F(u16, actor, 0x2ee) = 0;
    F(u16, actor, 0xd6) = 0x12;
    F(u8, actor, 0x2e4) &= 0x7f;
    F(u32, actor, 0x260) &= ~3u;
    F(s32, actor, 0x3c) = F(s32, actor, 0x40) = 0;
    void *effects =
        (void *)func_0201e0ec(P(F(void *, data_021052fc, 0), 0x2f7c));
    u32 phase = (F(u8, actor, 0x2e4) >> 4) & 7;
    if (phase == 0)
    {
        if (F(s16, actor, 0x2ec) > 0)
        {
            --F(s16, actor, 0x2ec);
            if ((F(s16, actor, 0x2ec) & 7) == 0)
                func_020a27a0(effects, 1, F(s32, actor, 0x1c) >> 12,
                              (F(s32, actor, 0x20) - F(s32, actor, 0x24)) >>
                                  12);
        }
        else
        {
            F(u8, actor, 0x2e4) = (F(u8, actor, 0x2e4) & 0x8f) | 0x10;
            F(u32, actor, 0x14) &= ~0x40u;
            F(u32, actor, 0xd0) |= 0x2000;
            F(s32, actor, 0x44) = 0x2000;
        }
    }
    else if (phase == 1)
    {
        s32 target[4];
        func_02004fe0(target);
        void *source = F(void *, actor, 0x29c) != 0
                           ? P(F(void *, actor, 0x29c), 0x18)
                           : P(actor, 0x22c);
        func_020050a4(target, source);
        ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, target);
        if (F(s32, actor, 0x44) == 0 &&
            F(s32, actor, 0x24) == F(s32, actor, 0x1dc))
        {
            F(u16, actor, 0x280) = 0;
            F(u8, actor, 0x2e4) = (F(u8, actor, 0x2e4) & 0x8f) | 0x20;
            static const s16 dustX[6] = {0, -0x18, 0x18, -0xc, 0xc, 0};
            static const s16 dustY[6] = {0x18, -8, -8, -0x14, -0x14, -0x18};
            for (s32 i = 0; i < 6; ++i)
                func_020a27a0(
                    effects, i == 0 ? 0 : 1,
                    (F(s32, actor, 0x1c) >> 12) + dustX[i],
                    ((F(s32, actor, 0x20) - F(s32, actor, 0x24)) >> 12) +
                        dustY[i]);
        }
        func_02005058(target);
    }
    else if (phase == 2)
    {
        F(u16, actor, 0xd6) = 0x10;
        if ((F(u16, F(void *, actor, 0x54), 0x24) & 1) != 0)
            F(u8, actor, 0x2e4) = (F(u8, actor, 0x2e4) & 0x8f) | 0x30;
    }
    else
    {
        F(u16, F(void *, actor, 0x54), 0x24) |= 0x10;
        func_ov077_02213768(F(void *, actor, 0x2c4), 0x10);
        func_ov090_0221c3dc(F(void *, actor, 0x298), 0);
        F(u16, F(void *, F(void *, actor, 0x29c), 0x54), 0x24) &= 0xfffd;
    }
    return 0;
}

/* Hides every presentation resource while preserving the actor allocation. */
extern "C" s32 func_ov077_02216cac(void *actor)
{
    F(u16, actor, 0x2ee) = 0;
    F(u16, actor, 0xd6) = 0x12;
    F(u8, actor, 0x2e4) &= 0x7f;
    F(u32, actor, 0x260) &= ~3u;
    F(s32, actor, 0x3c) = F(s32, actor, 0x40) = 0;
    F(u16, F(void *, actor, 0x54), 0x24) |= 0x10;
    F(u16, F(void *, actor, 0x58), 0x24) |= 0x10;
    func_ov077_02213768(F(void *, actor, 0x2c4), 0x10);
    func_ov090_0221c3dc(F(void *, actor, 0x298), 0);
    for (s32 i = 0; i < 3; ++i)
        func_ov090_0221ca34(F(void *, actor, 0x2d4 + i * 4), 0);
    F(u16, F(void *, F(void *, actor, 0x29c), 0x54), 0x24) &= 0xfffd;
    return 0;
}

/* Returns the base-class default result for an unused virtual query. */
extern "C" s32 func_ov077_02216d60(void)
{
    return 0;
}

/* Forwards a vector query to the inherited implementation with its embedded
 * vector. */
extern "C" void func_ov077_02216d68(void *actor, void *other)
{
    ((Method)F(void *, data_ov077_02217118, 0x68))(actor, P(other, 0x18));
}

/* Reports the actor's high collision-response bit. */
extern "C" u32 func_ov077_02216d78(void *actor)
{
    return F(u32, actor, 0xd0) & 0x80;
}

/* Reports the actor's secondary collision-response bit. */
extern "C" s32 func_ov077_02216d84(void *actor)
{
    return (F(u32, actor, 0xd0) & 0x40) != 0;
}

/* Returns the default result for the unused interaction query. */
extern "C" s32 func_ov077_02216d98(void)
{
    return 0;
}

/* Implements the intentionally empty inherited notification. */
extern "C" void func_ov077_02216da0(void)
{
}

/* Returns the actor's fixed presentation layer. */
extern "C" s32 func_ov077_02216da4(void)
{
    return 0x10;
}

/* Returns the default result for the unused range query. */
extern "C" s32 func_ov077_02216dac(void)
{
    return 0;
}

/* Enables the actor's terminal-update bit. */
extern "C" void func_ov077_02216db4(void *actor)
{
    F(u32, actor, 0x260) |= 0x10;
}

/* Reports whether the actor is grounded and its inherited guard accepts it. */
extern "C" s32 func_ov077_02216dc4(void *actor)
{
    return (F(u32, actor, 0x260) & 8) != 0 &&
           ((F(u32, actor, 0x260) & 2) == 0 ||
            ((Method)F(void *, F(void *, actor, 0), 0xa8))(actor) == 0);
}

/* Reports the terminal animation phase byte. */
extern "C" s32 func_ov077_02216e0c(void *actor)
{
    return F(s8, actor, 0x24c) == 8;
}

/* Reports whether the actor has not yet entered animation 16. */
extern "C" s32 func_ov077_02216e20(void *actor)
{
    return F(s16, actor, 0xd6) != 0x10;
}

/* Reports either walking animation. */
extern "C" s32 func_ov077_02216e40(void *actor)
{
    return F(s16, actor, 0xd6) == 5 || F(s16, actor, 0xd6) == 6;
}

/* Reports either secondary-state walking animation. */
extern "C" s32 func_ov077_02216e58(void *actor)
{
    return F(s16, actor, 0xd8) == 9 || F(s16, actor, 0xd8) == 10;
}

/* Reports either primary-state attack animation. */
extern "C" s32 func_ov077_02216e70(void *actor)
{
    return F(s16, actor, 0xd6) == 9 || F(s16, actor, 0xd6) == 10;
}

/* Implements an intentionally empty lifecycle hook. */
extern "C" void func_ov077_02216e88(void)
{
}

/* Implements an intentionally empty lifecycle hook. */
extern "C" void func_ov077_02216e8c(void)
{
}

/* Toggles the actor's auxiliary sprite suppression bit. */
extern "C" void func_ov077_02216e90(void *actor, s32 enabled)
{
    void *sprite = F(void *, actor, 0x288);
    if (enabled == 0)
        F(u16, sprite, 0x24) |= 4;
    else
        F(u16, sprite, 0x24) &= 0xfffb;
}

/* Returns the fixed collision radius in fx32 units. */
extern "C" s32 func_ov077_02216eb0(void)
{
    return 0x20000;
}

/* Invokes the inherited late-update virtual method. */
extern "C" void func_ov077_02216eb8(void *actor)
{
    ((Method)F(void *, F(void *, actor, 0), 0x1bc))(actor);
}

/* Invokes the inherited render-state virtual method. */
extern "C" void func_ov077_02216ecc(void *actor)
{
    ((Method)F(void *, F(void *, actor, 0), 0x154))(actor);
}

/* Implements an intentionally empty inherited notification. */
extern "C" void func_ov077_02216ee0(void)
{
}

/* Implements an intentionally empty inherited notification. */
extern "C" void func_ov077_02216ee4(void)
{
}

/* Implements an intentionally empty inherited notification. */
extern "C" void func_ov077_02216ee8(void)
{
}

/* Returns the linked presentation's embedded position vector. */
extern "C" void *func_ov077_02216eec(void *actor)
{
    return P(F(void *, actor, 0x29c), 0x18);
}

/* Returns the normal variant's fixed pursuit distance. */
extern "C" s32 func_ov077_02216ef8(void)
{
    return 0x10e000;
}

/* Returns an object's embedded position vector. */
extern "C" void *func_ov077_02216f04(void *object)
{
    return P(object, 0x18);
}

/* Returns the alternate variant's fixed pursuit distance. */
extern "C" s32 func_ov077_02216f0c(void)
{
    return 0xc0000;
}

/* Runs the inherited release callback and preserves its argument. */
extern "C" void *func_ov077_02216f14(void *object)
{
    func_02003e2c(object);
    return object;
}
