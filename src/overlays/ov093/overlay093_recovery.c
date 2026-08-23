#include "tingle/types.h"

/*
 * Recovered overlay 93 boss-stage actor and presentation controller.
 *
 * This derived actor owns two animation resources, eight sprite states, a
 * fixed-point position helper, and the ten-stage sequence which changes the
 * scene backgrounds, brightness, sound, debris motion, and particle output.
 * Offset accesses are retained where the surrounding actor and scene types
 * have not yet received stable names.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_0204d520(void *);
extern "C" void func_0204d570(void *);
extern "C" void func_0204d3d8(void *);
extern "C" void func_0204d308(void *);
extern "C" void *Actor_GetOwningCollection(void *);
extern "C" void *ActorCollection_GetSpriteGroup(void *);
extern "C" void *Heap_Alloc(s32, const void *, s32, void *);
extern "C" void Heap_Free(void *);
extern "C" void *AnimationResource_Init(void *, s32, s32, s32);
extern "C" void *GraphicsSpriteGroup_CreateState(void *, void *, void *, void *, s32);
extern "C" void GraphicsSpriteState_Configure(void *, s32, s32, s32, s32, s32);
extern "C" void *GraphicsSpriteState_Create(void *, void *, s32, s32, s32, s32, s32);
extern "C" void GraphicsSpriteState_ReleaseFromGroup(void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void GraphicsSpriteState_SetDepthOrderedWorldPosition(void *, s32, s32, s32, s32);
extern "C" void Type7Actor_SetActorEnabled(void *, s32);
extern "C" void VecFx32Object_Init(void *);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void GameWork_ClearFlag(void *, s32);
extern "C" void GameWork_SetFlag(void *, s32);
extern "C" void GamePhaseCurrencyHud_SetVisible(void *, s32);
extern "C" void ActorMotionAreaFollower_BindActor(void *, void *);
extern "C" void ActorMotion_BindActor(void *, void *);
extern "C" void *SceneManager_GetCurrent(void *);
extern "C" void Scene_ClearFlag02(void *);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_LoadOverlay(void *, s32, s32);
extern "C" void GX_VBlankIntr(s32);
extern "C" void GX_HBlankIntr(s32);
extern "C" void *DisplayBrightnessPair_GetScreen(void *, s32);
extern "C" void DisplayBrightness_StartTransition(void *, s32, s32, s32);
extern "C" void GXx_SetMasterBrightness_(void *, s32);
extern "C" void func_020afce8(void *, s32, s32);
extern "C" void *func_0201e0ec(void *);
extern "C" void Actor_UpdatePresentation(void *, void *);
extern "C" void Sound_Play(void *, s32, s32);
extern "C" s32 Sound_IsEffectPlaying(void *, s32, s32);
extern "C" void Sound_PlayEffectWithParameters(void *, s32, s32, s32, s32, s32);
extern "C" void Sound_FadeEffectVolume(void *, s32, s32, s32, s32);
extern "C" void func_020a6404(void *);
extern "C" void func_020a6548(void *);
extern "C" void func_020a68fc(void *, s32, s32);
extern "C" s32 func_020befec(s32, s32);
extern "C" u32 genrand_int32(void);
extern "C" void *AuxiliaryTimedSpritePresentation_Init(void *, const void *, void *, s32, s32, s32, s32, s32, s32, s32);
extern "C" void func_020a28e0(void *, s32, s32, s32, s32);
extern "C" void func_020a2960(void *, s32, s32, s32, s32);
extern "C" void func_020a29ac(void *, s32, s32, s32);
extern "C" void *func_ov060_0220fd54(void *, void *, s32);
extern "C" void func_ov063_02210314(void *);

extern "C" void *data_021052fc;
extern "C" void *gGameWork;
extern "C" void *gLupyContext;
extern "C" void *gHeapContext;
extern "C" void *gSceneManager;
extern "C" void *gSoundContext;
extern "C" u8 gDisplayBrightnessPair[];
extern "C" const s16 data_020c9670[];
extern "C" const u8 data_ov093_022187f0[];
extern "C" u8 data_ov093_022188f0[];
extern "C" u8 data_ov093_022189e0[];
extern "C" u8 data_ov093_022189e8[];
extern "C" u8 data_ov093_022189f0[];

typedef void (*Ov93VoidMethod)(void *);

static void call_void_method(void *object, u32 offset)
{
    void *vtable = FIELD(void *, object, 0);
    Ov93VoidMethod method = *(Ov93VoidMethod *)((u8 *)vtable + offset);
    method(object);
}

static s32 random_below(s32 limit)
{
    return (s32)(genrand_int32() % (u32)limit);
}

static s32 random_centered(s32 span, s32 center)
{
    return random_below(span) - span / 2 + center;
}

/* Store three fixed-point components at vector+4, or address zero for the retail null case. */
extern "C" void func_ov093_022177e0(void *vector, s32 x, s32 y, s32 z)
{
    u8 *components = vector != 0 ? (u8 *)vector + 4 : (u8 *)0;
    FIELD(s32, components, 0) = x;
    FIELD(s32, components, 4) = y;
    FIELD(s32, components, 8) = z;
}

/* Construct the derived actor, reset the stage flags, and hide the currency HUD. */
extern "C" void *func_ov093_022177f0(void *actor)
{
    void *primary;

    func_0204d520(actor);
    FIELD(void *, actor, 0) = data_ov093_022188f0;
    VecFx32Object_Init((u8 *)actor + 0x1ec);
    FIELD(u8, actor, 0x1fc) = 0;
    FIELD(u8, actor, 0x1fd) = 0;
    FIELD(u16, actor, 0x1fe) = 0;
    FIELD(s16, actor, 0x23c) = 0;
    FIELD(s16, actor, 0x23e) = 0;
    FIELD(s16, actor, 0x240) = -16;
    FIELD(s32, actor, 0x244) = -0x180000;
    FIELD(s32, actor, 0x248) = -0x248000;
    FIELD(s32, actor, 0x24c) = 0;

    primary = FIELD(void *, data_021052fc, 0x2ea4);
    FIELD(u32, primary, 0x230) &= ~4u;
    call_void_method(primary, 0x54);
    GameWork_ClearFlag(gGameWork, 0x3ec);
    GameWork_SetFlag(gGameWork, 0x3f5);
    GameWork_SetFlag(gGameWork, 0x403);
    GameWork_SetFlag(gGameWork, 0x3f8);
    GamePhaseCurrencyHud_SetVisible(gLupyContext, 0);
    func_ov093_022177e0((u8 *)actor + 0x18, 0x180000,
                        FIELD(s32, actor, 0x244), 0);
    func_ov093_022177e0((u8 *)actor + 0x1ec, 0x180000,
                        FIELD(s32, actor, 0x248), 0);
    return actor;
}

static void *allocate_animation(s32 first, s32 second, s32 third)
{
    void *resource = Heap_Alloc(0x10, data_ov093_022189e0, 4, gHeapContext);
    if (resource != 0) {
        resource = AnimationResource_Init(resource, first, second, third);
    }
    return resource;
}

/* Allocate both animation resources and create the three main and five debris sprites. */
extern "C" void func_ov093_02217908(void *actor)
{
    void *owner;
    void *resource;
    s32 i;

    func_0204d3d8(actor);
    resource = allocate_animation(0x23a8, 0x23a9, 0x23aa);
    FIELD(void *, actor, 0x200) = resource;
    owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor));
    FIELD(void *, actor, 0x204) = GraphicsSpriteGroup_CreateState(
        owner, FIELD(void *, resource, 4), FIELD(void *, resource, 8),
        FIELD(void *, resource, 0xc), 1);
    GraphicsSpriteState_Configure(FIELD(void *, actor, 0x204), 0, 0, 0, 6, 0);

    resource = allocate_animation(0x10a6, 0x10a7, 0x10a8);
    FIELD(void *, actor, 0x20c) = resource;
    owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor));
    FIELD(void *, actor, 0x210) = GraphicsSpriteState_Create(owner, resource, 1, 0, 0, 6, 0);

    resource = FIELD(void *, actor, 0x200);
    owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor));
    FIELD(void *, actor, 0x208) = GraphicsSpriteGroup_CreateState(
        owner, FIELD(void *, resource, 4), FIELD(void *, resource, 8),
        FIELD(void *, resource, 0xc), 1);
    GraphicsSpriteState_Configure(FIELD(void *, actor, 0x208), 1, 0, 0, 6, 0);

    if (FIELD(void *, data_021052fc, 0x2ea8) != 0) {
        Type7Actor_SetActorEnabled(FIELD(void *, data_021052fc, 0x2ea8), 0);
    }
    for (i = 0; i < 5; ++i) {
        const u8 *record = data_ov093_022187f0 + i * 0x14;
        owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor));
        FIELD(void *, actor, 0x214 + i * 4) = GraphicsSpriteGroup_CreateState(
            owner, FIELD(void *, resource, 4), FIELD(void *, resource, 8),
            FIELD(void *, resource, 0xc), 1);
        GraphicsSpriteState_Configure(FIELD(void *, actor, 0x214 + i * 4),
                                      FIELD(s32, record, 0x10), 0, 0, 6, 0);
        FIELD(s32, actor, 0x228 + i * 4) = FIELD(s32, record, 4);
    }
}

static void destroy_actor(void *actor)
{
    s32 i;

    FIELD(void *, actor, 0) = data_ov093_022188f0;
    GameWork_SetFlag(gGameWork, 0x3ec);
    GameWork_ClearFlag(gGameWork, 0x3f5);
    GraphicsSpriteState_ReleaseFromGroup(FIELD(void *, actor, 0x204));
    GraphicsSpriteState_ReleaseFromGroup(FIELD(void *, actor, 0x208));
    GraphicsSpriteState_ReleaseFromGroup(FIELD(void *, actor, 0x210));
    for (i = 0; i < 5; ++i) {
        GraphicsSpriteState_ReleaseFromGroup(FIELD(void *, actor, 0x214 + i * 4));
    }
    if (FIELD(void *, actor, 0x200) != 0) {
        call_void_method(FIELD(void *, actor, 0x200), 4);
    }
    if (FIELD(void *, actor, 0x20c) != 0) {
        call_void_method(FIELD(void *, actor, 0x20c), 4);
    }
    VecFx32Object_Destroy((u8 *)actor + 0x1ec);
    func_0204d570(actor);
}

/* Tear down every owned presentation object while retaining the actor allocation. */
extern "C" void *func_ov093_02217ad8(void *actor)
{
    destroy_actor(actor);
    return actor;
}

/* Tear down the actor and return the released address, matching the deleting destructor ABI. */
extern "C" void *func_ov093_02217b90(void *actor)
{
    destroy_actor(actor);
    Heap_Free(actor);
    return actor;
}

static void set_interrupts(s32 enabled)
{
    GX_VBlankIntr(enabled);
    GX_HBlankIntr(enabled);
}

static s32 scene_resource_ready(void *scene)
{
    return FIELD(s16, FIELD(void *, FIELD(void *, scene, 0x24), 0x4a4), 4) == 1;
}

/* Advance the ten-stage boss presentation and its five falling debris sprites. */
extern "C" void func_ov093_02217c50(void *actor)
{
    void *primary;
    void *scene;
    void *particleSystem;
    u16 timer;
    s32 i;

    func_0204d308(actor);
    primary = FIELD(void *, data_021052fc, 0x2ea4);
    scene = SceneManager_GetCurrent(gSceneManager);
    if (FIELD(s32, scene, 4) == 2) {
        return;
    }
    ActorMotionAreaFollower_BindActor((u8 *)data_021052fc + 0x2fbc, actor);
    ActorMotion_BindActor((u8 *)data_021052fc + 0x3044, actor);
    scene = SceneManager_GetCurrent(gSceneManager);
    particleSystem = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
    timer = FIELD(u16, actor, 0x1fe);

    switch (FIELD(u8, actor, 0x1fc)) {
    case 0: {
        void *presentation;
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3f);
        presentation = Heap_Alloc(0x58, data_ov093_022189e8, 4, gHeapContext);
        if (presentation != 0) {
            func_ov060_0220fd54(presentation, actor, 1);
        }
        FIELD(u8, actor, 0x1fc) = 1;
        FIELD(u16, actor, 0x1fe) = 0;
        call_void_method(primary, 0x54);
        break;
    }
    case 1:
        set_interrupts(0);
        func_020a6404(FIELD(void *, scene, 0x24));
        set_interrupts(1);
        FIELD(u16, actor, 0x1fe) = 0;
        FIELD(u8, actor, 0x1fc) = 2;
        Sound_Play(gSoundContext, 0x12d, 10);
        FIELD(u32, scene, 0x50) &= ~0x8000u;
        break;
    case 2: {
        void *mainSprite = FIELD(void *, actor, 0x210);
        u8 animation;
        s32 jitter;
        if (FIELD(s32, actor, 0x244) >= 0x80000) {
            if (FIELD(s16, actor, 0x240) < 0) {
                FIELD(s16, actor, 0x240)++;
            }
            if (Sound_IsEffectPlaying(gSoundContext, 0x12d, 8) == 0) {
                Sound_PlayEffectWithParameters(gSoundContext, 0x12d, 8, 0, 0, 0);
                Sound_FadeEffectVolume(gSoundContext, 0x12d, 8, 100, 120);
            }
        }
        animation = FIELD(u8, mainSprite, 0x38);
        if (animation == 1) {
            s32 velocity = timer < 0x16 ? 0xa000 : 0x499a;
            FIELD(s32, actor, 0x248) += velocity;
            if (FIELD(s32, actor, 0x248) >= 0x198000) {
                void *auxiliary;
                u8 vector[0x10];
                FIELD(s32, actor, 0x248) = 0x198000;
                FIELD(u16, mainSprite, 0x24) &= (u16)~3;
                GraphicsSpriteState_SetAnimationIndex(mainSprite, 2);
                VecFx32Object_InitComponents(vector, 0x180000, 0x194000, 0);
                auxiliary = Heap_Alloc(0x14, data_ov093_022189f0, 4, gHeapContext);
                if (auxiliary != 0) {
                    AuxiliaryTimedSpritePresentation_Init(
                        auxiliary, vector,
                        ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)),
                        0x163c, 0x163d, 0x163e, 0, 0, 0, 1);
                }
                Sound_Play(gSoundContext, 0x12d, 7);
                VecFx32Object_Destroy(vector);
            }
        } else if (animation == 2 && (FIELD(u16, mainSprite, 0x24) & 1) != 0) {
            FIELD(u16, mainSprite, 0x24) &= (u16)~1;
            FIELD(u16, mainSprite, 0x24) |= 2;
            GraphicsSpriteState_SetAnimationIndex(mainSprite, 0);
        }
        jitter = animation == 1 ? 0x4000 : 0xa000;
        FIELD(s32, actor, 0x244) += animation == 1 ? 0x4000 : 0xb000;
        FIELD(s32, actor, 0x1c) = random_centered(jitter, 0x180000);
        if (FIELD(s32, actor, 0x244) >= 0x1f0000) {
            FIELD(s32, actor, 0x244) = 0x1f0000;
            FIELD(s32, actor, 0x1c) = 0x180000;
            if (animation == 0) {
                FIELD(u8, actor, 0x1fc) = 3;
                FIELD(u16, actor, 0x1fe) = 0;
            }
        }
        FIELD(s32, actor, 0x20) =
            (FIELD(s32, actor, 0x244) < 0x80000 ? 0x80000 : FIELD(s32, actor, 0x244))
            + random_below(0x3000) - 0x1800;
        break;
    }
    case 3:
        if (timer > 120) {
            func_ov093_022177e0((u8 *)actor + 0x18, 0x180000, 0x1f0000, 0);
            FIELD(u8, actor, 0x1fc) = 4;
            FIELD(u16, actor, 0x1fe) = 0;
        } else {
            s32 remaining = 120 - timer;
            s32 spanX = func_020befec(remaining * 0xa000, 120);
            s32 spanY = func_020befec(remaining * 0x6000, 120);
            FIELD(s32, actor, 0x1c) = random_centered(spanX, 0x180000);
            FIELD(s32, actor, 0x20) = random_centered(spanY, 0x1f0000);
        }
        break;
    case 4:
        if (FIELD(s16, actor, 0x240) < 0) {
            FIELD(s16, actor, 0x240)++;
        }
        if (timer > 60) {
            FIELD(u16, actor, 0x1fe) = 0;
            set_interrupts(0);
            func_020a6548(FIELD(void *, scene, 0x24));
            func_020a68fc(FIELD(void *, scene, 0x24), 0x45, 0);
            set_interrupts(1);
            Sound_Play(gSoundContext, 0, 0x6f);
            FIELD(u8, actor, 0x1fc) = 5;
        }
        break;
    case 5:
        if (scene_resource_ready(scene)) {
            FIELD(u16, actor, 0x1fe) = 0;
            FIELD(u8, actor, 0x1fc) = 6;
        }
        break;
    case 6:
        if (timer > 90) {
            FIELD(u16, actor, 0x1fe) = 0;
            FIELD(u8, actor, 0x1fc) = 7;
            func_020a68fc(FIELD(void *, scene, 0x24), 0x46, 0);
        }
        break;
    case 7:
        if (scene_resource_ready(scene)) {
            void *screen;
            FIELD(u16, actor, 0x1fe) = 0;
            FIELD(u8, actor, 0x1fc) = 8;
            screen = DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 0);
            DisplayBrightness_StartTransition(screen, 0, 16, 119);
            screen = DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 1);
            DisplayBrightness_StartTransition(screen, 0, 16, 119);
            Sound_PlayEffectWithParameters(gSoundContext, 0x12d, 12, 0, 0, 0);
            Sound_FadeEffectVolume(gSoundContext, 0x12d, 12, 100, 119);
        }
        break;
    case 8:
        if (timer > 120) {
            FIELD(s32, actor, 0x1c) = 0x180000;
            FIELD(u16, actor, 0x1fe) = 0;
            FIELD(u8, actor, 0x1fc) = 9;
            set_interrupts(0);
            func_ov063_02210314(scene);
            Scene_ClearFlag02(scene);
            set_interrupts(1);
        } else {
            s32 spanX = func_020befec(timer * 0xa000, 120);
            s32 spanY = func_020befec(timer * 0x6000, 120);
            FIELD(s32, actor, 0x1c) = random_centered(spanX, 0x180000);
            FIELD(s32, actor, 0x20) = random_centered(spanY, 0x1f0000);
        }
        break;
    case 9:
    default:
        break;
    }

    FIELD(u16, actor, 0x1fe)++;
    FIELD(u16, actor, 0x23c) += 0x400;
    for (i = 0; i < 5; ++i) {
        void *sprite = FIELD(void *, actor, 0x214 + i * 4);
        const u8 *record = data_ov093_022187f0 + i * 0x14;
        if ((FIELD(u16, sprite, 0x24) & 0x10) == 0) {
            FIELD(s32, actor, 0x228 + i * 4) += FIELD(s32, record, 8);
            if (FIELD(s32, actor, 0x228 + i * 4) >= 0x234000) {
                s32 burst;
                s32 sourceX = FIELD(s32, record, 0);
                s32 pan;
                FIELD(u16, sprite, 0x24) |= 0x10;
                for (burst = 0; burst < 6; ++burst) {
                    func_020a28e0(particleSystem, 1,
                                  (sourceX >> 12) - 12 + random_below(24),
                                  0x240 - (s32)(genrand_int32() & 7), 0xf0);
                }
                pan = ((sourceX - 0x180000) >> 12) / 2;
                if (pan > 127) pan = 127;
                if (pan < -127) pan = -127;
                Sound_PlayEffectWithParameters(gSoundContext, 0x12d, 11, 100, pan, 0);
            } else {
                FIELD(s16, sprite, 0x30) =
                    (s16)(FIELD(s16, sprite, 0x30) + FIELD(s32, record, 0xc));
            }
        }
    }
    if (FIELD(u8, actor, 0x1fc) >= 6) {
        FIELD(s32, actor, 0x24c) =
            func_020befec(FIELD(s32, actor, 0x24c) * 0x3e3 - 0x140000, 1000);
    }
}

/* Dispatch the actor's virtual slot 0x1c. */
extern "C" void func_ov093_02218500(void *actor)
{
    call_void_method(actor, 0x1c);
}

/* Submit the main and debris sprites and emit their periodic ground particles. */
extern "C" void func_ov093_02218514(void *unused, void *actor)
{
    void *particleSystem;
    s32 y;
    s32 i;

    Actor_UpdatePresentation(unused, actor);
    GraphicsSpriteState_SetDepthOrderedWorldPosition(
        FIELD(void *, actor, 0x204), 0x180000,
        FIELD(s32, actor, 0x24c) + 0x240000 +
            data_020c9670[(FIELD(u16, actor, 0x23c) >> 4) * 2] * 3,
        0, 4);
    FIELD(u8, FIELD(void *, actor, 0x204), 0x3a) = 2;
    GraphicsSpriteState_SetDepthOrderedWorldPosition(
        FIELD(void *, actor, 0x208), 0x180000, 0x198000, 0, 4);
    y = FIELD(s32, actor, 0x244) < 0x80000
            ? FIELD(s32, actor, 0x248) - FIELD(s32, actor, 0x244) + 0x80000
            : FIELD(s32, actor, 0x248);
    GraphicsSpriteState_SetDepthOrderedWorldPosition(
        FIELD(void *, actor, 0x210), 0x180000, y, 0, 4);
    particleSystem = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
    if (FIELD(u8, FIELD(void *, actor, 0x210), 0x38) == 1 &&
        FIELD(u16, actor, 0x1fe) % 4 == 0) {
        func_020a29ac(particleSystem, 0, 0x180, (y >> 12) - 12);
    }
    for (i = 0; i < 5; ++i) {
        void *sprite = FIELD(void *, actor, 0x214 + i * 4);
        const u8 *record = data_ov093_022187f0 + i * 0x14;
        if ((FIELD(u16, sprite, 0x24) & 0x10) == 0) {
            s32 debrisY = FIELD(s32, actor, 0x244) < 0x80000
                          ? FIELD(s32, actor, 0x228 + i * 4) - FIELD(s32, actor, 0x244) + 0x80000
                          : FIELD(s32, actor, 0x228 + i * 4);
            GraphicsSpriteState_SetDepthOrderedWorldPosition(
                sprite, FIELD(s32, record, 0), debrisY, 0, 4);
            if (FIELD(u16, actor, 0x1fe) % 8 == 0) {
                func_020a29ac(particleSystem, 0, FIELD(s32, record, 0) >> 12,
                              (debrisY >> 12) - 12);
            }
        }
    }
}

/* Apply the stage brightness and, before state eight, mirror it to sub-engine master brightness. */
extern "C" void func_ov093_022186bc(void *actor)
{
    *(volatile u16 *)0x04000050 = 0;
    func_020afce8((void *)0x04000050, 14, FIELD(s16, actor, 0x240));
    if (FIELD(u8, actor, 0x1fc) < 8) {
        GXx_SetMasterBrightness_((void *)0x0400106c, FIELD(s16, actor, 0x240));
    }
}

/* Return the actor completion route used once the sequence reaches state nine. */
extern "C" s32 func_ov093_02218708(void *actor) { return FIELD(u8, actor, 0x1fc) == 9 ? 3 : 0; }
/* Report that this derived actor supports the corresponding capability slot. */
extern "C" s32 func_ov093_0221871c(void *) { return 1; }
/* Return the fixed 64-pixel fixed-point extent used by the actor framework. */
extern "C" s32 func_ov093_02218724(void *) { return 0x40000; }
/* Return the default zero result for this unsupported query. */
extern "C" s32 func_ov093_0221872c(void *) { return 0; }
/* Copy the actor's position vector into the caller-owned output object. */
extern "C" void func_ov093_02218734(void *output, void *actor) { VecFx32Object_InitCopy(output, (u8 *)actor + 0x18); }
/* Return the raw 0x80 actor-status bit. */
extern "C" u32 func_ov093_02218744(void *actor) { return FIELD(u32, actor, 0xd0) & 0x80; }
/* Return whether actor-status bit 0x40 is set. */
extern "C" s32 func_ov093_02218750(void *actor) { return (FIELD(u32, actor, 0xd0) & 0x40) != 0; }
/* Return zero for the unused interaction query. */
extern "C" s32 func_ov093_02218764(void *) { return 0; }
/* Intentionally ignore the unused actor callback. */
extern "C" void func_ov093_0221876c(void *) {}
/* Intentionally ignore the unused actor callback. */
extern "C" void func_ov093_02218770(void *) {}
/* Intentionally ignore the unused actor callback. */
extern "C" void func_ov093_02218774(void *) {}
/* Mark actor-status bit 0x80. */
extern "C" void func_ov093_02218778(void *actor) { FIELD(u32, actor, 0xd0) |= 0x80; }
/* Return zero for the unused resource query. */
extern "C" s32 func_ov093_02218788(void *) { return 0; }
/* Return zero for the unused resource query. */
extern "C" s32 func_ov093_02218790(void *) { return 0; }
/* Return zero for the unused resource query. */
extern "C" s32 func_ov093_02218798(void *) { return 0; }
/* Return zero for the unused resource query. */
extern "C" s32 func_ov093_022187a0(void *) { return 0; }
/* Intentionally ignore the unused resource callback. */
extern "C" void func_ov093_022187a8(void *) {}
/* Intentionally ignore the unused resource callback. */
extern "C" void func_ov093_022187ac(void *) {}
/* Intentionally ignore the unused resource callback. */
extern "C" void func_ov093_022187b0(void *) {}
/* Return the actor's fixed resource identifier 0x309. */
extern "C" s32 func_ov093_022187b4(void *) { return 0x309; }
/* Return zero for the unused presentation query. */
extern "C" s32 func_ov093_022187c0(void *) { return 0; }
/* Intentionally ignore the unused presentation callback. */
extern "C" void func_ov093_022187c8(void *) {}
/* Intentionally ignore the unused presentation callback. */
extern "C" void func_ov093_022187cc(void *) {}
/* Return zero for the unused route query. */
extern "C" s32 func_ov093_022187d0(void *) { return 0; }
/* Return zero for the unused route query. */
extern "C" s32 func_ov093_022187d8(void *) { return 0; }
/* Return the actor's fixed type identifier 0x83. */
extern "C" s32 func_ov093_022187e0(void *) { return 0x83; }
