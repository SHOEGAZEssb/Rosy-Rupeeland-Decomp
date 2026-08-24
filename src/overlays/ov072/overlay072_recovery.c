#include "tingle/types.h"

/*
 * Recovered overlay 72 actor-transition presentation scene.
 *
 * The scene temporarily replaces an actor's presentation with a central
 * sprite and eight orbiting sprites. Its state machine selects an area or
 * proximity outcome, coordinates animation and sound, records the result in
 * GameWork, and restores the actor during teardown.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void Scene_Init(void *);
extern "C" void Scene_Destroy(void *);
extern "C" void Scene_SetFlags03(void *);
extern "C" void *Heap_Alloc(s32, const void *, s32, void *);
extern "C" void Heap_Free(void *);
extern "C" void *AnimationResource_Init(void *, s32, s32, s32);
extern "C" void *GraphicsSpriteState_Create(void *, void *, u8, s32, u16,
                                             s32, s32);
extern "C" void GraphicsSpriteState_ReleaseFromGroup(void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void GraphicsSpriteState_SetDepthOrderedWorldPosition(
    void *, s32, s32, s32, s32);
extern "C" void GraphicsSpriteState_SetScreenPositionCulled(void *, s32, s32,
                                                             s32);
extern "C" void Type7Actor_EnterSpecialPresentationState(void *);
extern "C" void Type7Actor_LeaveSpecialPresentationState(void *);
extern "C" void Actor_SetDirectionFromVector(void *, s32, s32);
extern "C" void GamePhaseRuntime_StageAreaRequest(void *, s32, s32, s32,
                                                   s32, s32);
extern "C" void GamePhaseRuntime_UpdateActorPresentationState(void *, s32);
extern "C" s32 GameWork_TestFlag(void *, s32);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_UnloadOverlay(void *, s32);
extern "C" void DebugText_BeginFrame(void);
extern "C" void Sound_Play(void *, s32, s32);
extern "C" void Sound_LoadGroup(void *, s32);
extern "C" void Sound_ReleaseGroup(void *, s32);

extern "C" void *gGamePhaseRuntime;
extern "C" void *gGameWork;
extern "C" void *gHeapContext;
extern "C" void *gSoundContext;
extern "C" const s16 gFx32CosSinTable[];
extern "C" u8 data_ov072_022109dc[];
extern "C" u8 data_ov072_02210a30[];
extern "C" u8 data_ov072_02210b0c[];
extern "C" u8 data_ov072_02210b38[];

extern "C" s32 func_ov072_02210214(void *);
extern "C" s32 func_ov072_02210818(void *);
extern "C" s32 func_ov072_022108e8(void *);

typedef s32 (*Overlay72Method)(void *);

static s32 call_method(void *object, u32 offset)
{
    void *vtable = FIELD(void *, object, 0);
    Overlay72Method method = *(Overlay72Method *)((u8 *)vtable + offset);
    return method(object);
}

static void *runtime_actor(void)
{
    return FIELD(void *, gGamePhaseRuntime, 0x2ea4);
}

static void set_animation_finished_flags(void *sprite)
{
    FIELD(u16, sprite, 0x24) |= 2;
    FIELD(u16, sprite, 0x24) &= (u16)~1;
}

static void *allocate_animation(s32 first, s32 second, s32 third)
{
    void *resource = Heap_Alloc(0x10, data_ov072_02210b38, 4,
                                gHeapContext);
    if (resource != 0) {
        resource = AnimationResource_Init(resource, first, second, third);
    }
    return resource;
}

/* Construct the scene and its central and eight orbiting sprite states. */
extern "C" void *func_ov072_0220fd20(void *scene, s32 variant)
{
    void *actor;
    void *actorPresentation;
    void *sprite;
    s16 x;
    s16 y;
    s32 i;

    Scene_Init(scene);
    FIELD(void *, scene, 0) = data_ov072_02210b0c;
    FIELD(s32, scene, 0x70) = 0;
    FIELD(s32, scene, 0x74) = variant;
    FIELD(s32, scene, 0x78) = -1;
    FIELD(s32, scene, 0x7c) = 0;

    actor = runtime_actor();
    actorPresentation = FIELD(void *, actor, 0x54);
    x = FIELD(s16, actorPresentation, 0x2c);
    y = FIELD(s16, actorPresentation, 0x2e);

    FIELD(void *, scene, 0x24) =
        variant == 0 ? allocate_animation(0x10c8, 0x1001, 0x10c9)
                     : allocate_animation(0x10ca, 0x1001, 0x10cb);
    sprite = GraphicsSpriteState_Create(
        FIELD(void *, actorPresentation, 0), FIELD(void *, scene, 0x24),
        FIELD(u8, actorPresentation, 0x3a), 0,
        FIELD(u16, actorPresentation, 0x28), 6, 0);
    FIELD(void *, scene, 0x2c) = sprite;
    FIELD(s16, sprite, 0x2c) = x;
    FIELD(s16, sprite, 0x2e) = y;

    FIELD(void *, scene, 0x28) =
        variant == 0 ? allocate_animation(0x10cc, 0x1078, 0x10cd)
                     : allocate_animation(0x10ce, 0x1078, 0x10cf);
    for (i = 0; i < 8; ++i) {
        sprite = GraphicsSpriteState_Create(
            FIELD(void *, actorPresentation, 0), FIELD(void *, scene, 0x28),
            FIELD(u8, actorPresentation, 0x3a), 0,
            (u16)(FIELD(u16, actorPresentation, 0x28) - 1), 6, 0);
        FIELD(void *, scene, 0x30 + i * 4) = sprite;
        FIELD(s32, scene, 0x50 + i * 4) = 0;
    }

    if (FIELD(void *, gGamePhaseRuntime, 0x2ea8) != 0) {
        Type7Actor_EnterSpecialPresentationState(
            FIELD(void *, gGamePhaseRuntime, 0x2ea8));
    }
    Scene_SetFlags03(scene);
    return scene;
}

/* Store a signed outcome in one of GameWork's paired indexed arrays. */
extern "C" void func_ov072_0221004c(void *work, s32 secondArray,
                                     s32 index, s32 value)
{
    s32 offset = secondArray == 0 ? 0x3cc : 0x5cc;
    FIELD(s32, work, offset + index * 4) = (s16)value;
}

static void destroy_scene(void *scene)
{
    void *actor;
    void *actorPresentation;
    s32 i;

    FIELD(void *, scene, 0) = data_ov072_02210b0c;
    GraphicsSpriteState_ReleaseFromGroup(FIELD(void *, scene, 0x2c));
    for (i = 0; i < 8; ++i) {
        GraphicsSpriteState_ReleaseFromGroup(
            FIELD(void *, scene, 0x30 + i * 4));
    }
    if (FIELD(void *, scene, 0x24) != 0) {
        call_method(FIELD(void *, scene, 0x24), 4);
    }
    if (FIELD(void *, scene, 0x28) != 0) {
        call_method(FIELD(void *, scene, 0x28), 4);
    }

    actor = runtime_actor();
    actorPresentation = FIELD(void *, actor, 0x54);
    FIELD(u16, actorPresentation, 0x24) &= (u16)~4;
    Actor_SetDirectionFromVector(actor, 0, 0x1000);
    call_method(actor, 0x5c);
    if (FIELD(void *, gGamePhaseRuntime, 0x2ea8) != 0) {
        Type7Actor_LeaveSpecialPresentationState(
            FIELD(void *, gGamePhaseRuntime, 0x2ea8));
    }

    if (FIELD(s32, scene, 0x7c) == 1) {
        s32 index = FIELD(s32, scene, 0x78);
        s32 area = FIELD(s32, data_ov072_022109dc, index * 0x1c + 0x14);
        GamePhaseRuntime_StageAreaRequest(gGamePhaseRuntime, area, 0, 0, 0, 0);
    }
    func_ov072_0221004c(gGameWork, 0, 0x78,
                        FIELD(s32, scene, 0x7c));
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    Scene_Destroy(scene);
}

/* Destroy the scene while retaining its allocation. */
extern "C" void *func_ov072_0220ff04(void *scene)
{
    destroy_scene(scene);
    return scene;
}

/* Destroy the scene and release its allocation. */
extern "C" void *func_ov072_02210070(void *scene)
{
    destroy_scene(scene);
    Heap_Free(scene);
    return scene;
}

/* Advance the scene and request its virtual close callback on completion. */
extern "C" s32 func_ov072_022101c0(void *scene)
{
    s32 finished = func_ov072_02210214(scene);
    GamePhaseRuntime_UpdateActorPresentationState(gGamePhaseRuntime, 2);
    if (finished != 0) {
        if (scene != 0) {
            call_method(scene, 4);
        }
        return 1;
    }
    return 0;
}

static s32 animation_finished(void *sprite)
{
    return (FIELD(u16, sprite, 0x24) & 1) != 0;
}

static void begin_terminal_animation(void *sprite)
{
    GraphicsSpriteState_SetAnimationIndex(sprite, 3);
    set_animation_finished_flags(sprite);
}

static s32 update_state(void *scene, void *actor)
{
    void *sprite = FIELD(void *, scene, 0x2c);
    s32 state = FIELD(s32, scene, 8);
    s32 timer;
    s32 result;

    switch (state) {
    case 0:
        FIELD(s32, scene, 8) = 1;
        FIELD(u16, FIELD(void *, actor, 0x54), 0x24) |= 4;
        GraphicsSpriteState_SetAnimationIndex(sprite, 1);
        FIELD(u16, sprite, 0x24) &= (u16)~6;
        Sound_Play(gSoundContext, 0, 0x3f);
        /* The retail state deliberately continues into state one. */
    case 1:
        if (animation_finished(sprite)) {
            FIELD(s32, scene, 8)++;
            GraphicsSpriteState_SetAnimationIndex(sprite, 0);
            set_animation_finished_flags(sprite);
            Sound_Play(gSoundContext, 0,
                       FIELD(s32, scene, 0x74) == 0 ? 0x68 : 0x13);
        }
        break;
    case 2:
        timer = FIELD(s32, scene, 0x70);
        if (timer % 40 == 0) {
            s32 index = (timer / 40) % 8;
            void *orbit = FIELD(void *, scene, 0x30 + index * 4);
            FIELD(s16, orbit, 0x2c) = FIELD(s16, sprite, 0x2c);
            FIELD(s16, orbit, 0x2e) =
                (s16)(FIELD(s16, sprite, 0x2e) - 0x24);
            FIELD(u16, orbit, 0x24) &= (u16)~4;
            FIELD(s32, scene, 0x50 + index * 4) = 0;
        }
        timer++;
        FIELD(s32, scene, 0x70) = timer;
        if (timer > 0xf0) {
            FIELD(s32, scene, 8)++;
            FIELD(s32, scene, 0x70) = 0;
            result = func_ov072_02210818(scene);
            if (result != -1) {
                if (result < 0) {
                    FIELD(s32, scene, 0x7c) = 2;
                    FIELD(s32, scene, 8) = 15;
                } else {
                    FIELD(s32, scene, 0x78) = result;
                    FIELD(u32, actor, 0x230) |= 0x100000;
                    FIELD(s32, scene, 0x7c) = 1;
                    FIELD(s32, scene, 8) = 10;
                }
            } else {
                FIELD(s32, scene, 0x7c) = 0;
                result = func_ov072_022108e8(scene);
                if (result == 1) {
                    FIELD(s32, scene, 8) = 20;
                    FIELD(s32, scene, 0x7c) = 3;
                } else if (result == 0) {
                    FIELD(s32, scene, 8) = 30;
                    FIELD(s32, scene, 0x7c) = 4;
                } else {
                    FIELD(s32, scene, 8) = 99;
                    FIELD(s32, scene, 0x7c) = 0;
                }
            }
            FIELD(s32, scene, 0x78) = result;
            GraphicsSpriteState_SetAnimationIndex(sprite, 2);
            FIELD(u16, sprite, 0x24) &= (u16)~3;
        }
        break;
    case 10:
        FIELD(s32, scene, 8)++;
        /* State ten intentionally continues into the timed state. */
    case 11:
        if (animation_finished(sprite)) {
            begin_terminal_animation(sprite);
        }
        timer = ++FIELD(s32, scene, 0x70);
        if (timer > 0x78) {
            return 1;
        }
        if (timer == 0x3c) {
            Sound_Play(gSoundContext, 0, 0x31);
        }
        break;
    case 15:
        if (animation_finished(sprite)) {
            return 1;
        }
        break;
    case 20:
    case 30:
        if (animation_finished(sprite)) {
            FIELD(s32, scene, 8)++;
            begin_terminal_animation(sprite);
            Sound_LoadGroup(gSoundContext, 0x5e);
        }
        break;
    case 21:
    case 31:
        timer = ++FIELD(s32, scene, 0x70);
        if (timer > 0x5a) {
            FIELD(s32, scene, 8) = 50;
            FIELD(s32, scene, 0x70) = 0;
            Sound_Play(gSoundContext, 0x5e, state == 21 ? 1 : 0);
        }
        break;
    case 50:
        timer = ++FIELD(s32, scene, 0x70);
        if (timer > 0x5a) {
            Sound_ReleaseGroup(gSoundContext, 0x5e);
            return 1;
        }
        if (timer == 10) {
            GraphicsSpriteState_SetAnimationIndex(
                sprite, FIELD(s32, scene, 0x7c) == 4 ? 4 : 5);
        }
        break;
    case 99:
        if (animation_finished(sprite)) {
            begin_terminal_animation(sprite);
        }
        if (++FIELD(s32, scene, 0x70) > 0x5a) {
            return 1;
        }
        break;
    }
    return 0;
}

/* Advance the scripted presentation and update all nine sprite positions. */
extern "C" s32 func_ov072_02210214(void *scene)
{
    void *actor;
    void *central;
    s32 finished;
    s32 i;

    DebugText_BeginFrame();
    actor = runtime_actor();
    finished = update_state(scene, actor);
    if (finished != 0) {
        return 1;
    }

    central = FIELD(void *, scene, 0x2c);
    GraphicsSpriteState_SetDepthOrderedWorldPosition(
        central, FIELD(s32, actor, 0x1c), FIELD(s32, actor, 0x20),
        FIELD(s32, actor, 0x24), 8);
    for (i = 0; i < 8; ++i) {
        void *orbit = FIELD(void *, scene, 0x30 + i * 4);
        if ((FIELD(u16, orbit, 0x24) & 4) == 0) {
            s32 phase = FIELD(s32, scene, 0x50 + i * 4);
            s32 angle = (s32)(((u32)phase << 26) >> 20);
            s32 wave = gFx32CosSinTable[angle * 2];
            s32 delta = (wave + ((u32)(wave >> 9) >> 22)) >> 10;
            GraphicsSpriteState_SetScreenPositionCulled(
                orbit, FIELD(s16, central, 0x2c) + delta,
                FIELD(s16, orbit, 0x2e) - (phase & 1), 4);
            FIELD(u8, orbit, 0x3a) = 1;
            FIELD(s32, scene, 0x50 + i * 4) = phase + 1;
        }
    }
    return 0;
}

/* Dispatch runtime route slot 0x0c and return callback status zero. */
extern "C" s32 func_ov072_022107d4(void)
{
    call_method(gGamePhaseRuntime, 0x0c);
    return 0;
}

/* Dispatch runtime route slot 0x10 and return its result. */
extern "C" s32 func_ov072_022107f8(void)
{
    return call_method(gGamePhaseRuntime, 0x10);
}

/* Select the actor's containing three-entry area record. */
extern "C" s32 func_ov072_02210818(void *)
{
    void *actor = runtime_actor();
    s32 type = FIELD(s32, FIELD(void *, gGamePhaseRuntime, 0x303bc), 0);
    s32 x = FIELD(s32, actor, 0x1c) >> 12;
    s32 y = FIELD(s32, actor, 0x20) >> 12;
    s32 i;

    for (i = 0; i < 3; ++i) {
        u8 *record = data_ov072_022109dc + i * 0x1c;
        if (FIELD(s32, record, 0) == type &&
            x >= FIELD(s32, record, 4) &&
            x <= FIELD(s32, record, 4) + FIELD(s32, record, 0x0c) &&
            y >= FIELD(s32, record, 8) &&
            y <= FIELD(s32, record, 8) + FIELD(s32, record, 0x10)) {
            s32 flag = FIELD(s32, record, 0x18);
            if (flag != -1 && GameWork_TestFlag(gGameWork, flag) != 0) {
                return i;
            }
            return -2;
        }
    }
    return -1;
}

/* Classify proximity to the first enabled matching record in a 12-entry set. */
extern "C" s32 func_ov072_022108e8(void *scene)
{
    void *actor;
    s32 type;
    s32 actorX;
    s32 actorY;
    s32 i;

    if (FIELD(s32, scene, 0x74) == 0) {
        return -1;
    }
    actor = runtime_actor();
    type = FIELD(s32, FIELD(void *, gGamePhaseRuntime, 0x303bc), 0);
    actorX = FIELD(s32, actor, 0x1c) >> 12;
    actorY = FIELD(s32, actor, 0x20) >> 12;
    for (i = 0; i < 12; ++i) {
        u8 *record = data_ov072_02210a30 + i * 0x10;
        s32 flag;
        s32 dx;
        s32 dy;
        if (FIELD(s32, record, 0) != type) {
            continue;
        }
        flag = FIELD(s32, record, 0x0c);
        if (flag != -1 && GameWork_TestFlag(gGameWork, flag) == 0) {
            continue;
        }
        dx = FIELD(s32, record, 8) - actorY;
        dy = FIELD(s32, record, 4) - actorX;
        return dx * dx + dy * dy < 0x2400 ? 1 : 0;
    }
    return -1;
}
