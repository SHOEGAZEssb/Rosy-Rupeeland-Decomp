#include "tingle/heap.h"
#include "tingle/types.h"

/* Run the recovered per-frame state machine for the type-1 derived actor. */
extern void *gSceneManager;
extern void *gSoundContext;
extern void *gGameWork;
extern void *data_021052fc;
extern u8 data_020df494[];

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 dividend, s32 divisor);
extern void func_020349b8(void *actor, u32 sound, s32 extra);
extern void *SceneManager_GetCurrent(void *manager);
extern void func_02037bb0(void *actor);
extern void func_0205940c(void *sound, s32 first, s32 second);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void GameWork_SetFlag(void *work, u32 flag);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void ActorDerivedType1_UpdateHorizontalInputMotion(void *actor);
extern void func_02002d54(s32 first, s32 second);
extern void func_02002d74(s32 first, s32 second);
extern s32 func_02002d94(void);
extern s32 func_02002db0(void);
extern void func_02048bcc(void *object);
extern void func_02007f24(void *manager, s32 first, s32 second, s32 third,
                          s32 fourth, s32 fifth);
extern void ActorDerivedRuntime_UpdateFrame(void *actor);
extern s32 func_02032370(void *actor, void *state, s32 step);
extern s32 func_02032228(void *actor, s32 x, s32 y, s32 step);
extern void *func_0204c798(void *storage, void *actor);
extern void func_0204cc14(void *object);
extern void func_0203647c(void *actor);
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern s32 func_02005070(void *state);
extern void func_0200b2c0(void *state, s32 first, s32 second, s32 third);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern void func_020328d0(void *state, s32 scale);
extern void Actor_UpdateAnimationState(void *actor);
extern void func_0204ced8(void *state, s32 mode);
extern void Actor_ClearTransientContactState(void *actor);
#ifdef __cplusplus
}
#endif

/* Call a void actor virtual slot. */
static void callActorVoid(u8 *actor, u32 offset)
{
    (*(void (**)(void *))(*(u8 **)actor + offset))(actor);
}

/* Call an s32 actor virtual slot. */
static s32 callActorQuery(u8 *actor, u32 offset)
{
    return (*(s32 (**)(void *))(*(u8 **)actor + offset))(actor);
}

/* Invoke virtual slot 4 on a nullable object. */
static void destroyObject(void *object)
{
    if (object != 0)
        (*(void (**)(void *))(*(u8 **)object + 4))(object);
}

/*
 * Execute the type-1 actor frame update unless +0x230 has bit 0x100 or
 * 0x800000 set. The routine handles randomized spatial sound for +0xd0 bit
 * 0x4000, clears transient +0x230 bits, runs virtual update/state dispatch,
 * scene- and GameWork-dependent event branches, chooses orientation from
 * state +0x254 or motion, lazily owns object +0x270, refreshes actor motion and
 * optional-object state, selects owner-state mode +0x2a8, publishes orientation
 * to GameWork +0x24a, and mirrors +0xd0 bits 0x20/0x10 into GameWork flags
 * 0x3f0/0x3f1. Offset-derived fields remain unnamed where their meaning is not
 * confirmed. Returns no value; virtual, scene, GameWork, heap, sound, and owner
 * helpers have observable engine/SDK/hardware effects.
 */
void ActorDerivedType1_UpdateFrame(void *self)
{
    u8 *actor = (u8 *)self;
    u32 flags230 = *(u32 *)(actor + 0x230);
    s32 orientation;
    void *object;

    if ((flags230 & (0x100 | 0x800000)) != 0) return;

    if ((*(u32 *)(actor + 0xd0) & 0x4000) != 0) {
        s16 *counter = (s16 *)(actor + 0x268);
        if ((flags230 & 0x200000) != 0)
            *counter = 0x3c;
        else if ((flags230 & 0x400000) != 0)
            *counter = 0x8c;
        else if (*counter < 0x1e)
            *counter = 0x1e;
        func_020349b8(actor, 0x5f,
            func_020ada8c((s32)(genrand_int32() & 0x7fffffff), 4) << 6);
    }

    *(u32 *)(actor + 0x230) &= ~0x680000;
    callActorVoid(actor, 0x18);
    *(u16 *)(actor + 0x24c) = 0;
    if (actor[0x2a0] != 0) --actor[0x2a0];

    if (*(s32 *)((u8 *)SceneManager_GetCurrent(gSceneManager) + 4) != 3) {
        if ((*(u32 *)(actor + 0xd0) & 0x100) != 0) {
            if (*(s32 *)(actor + 0x248) > 0) {
                --*(s32 *)(actor + 0x248);
                if (*(void **)(actor + 0x26c) != 0) func_02037bb0(actor);
            } else {
                func_0205940c(gSoundContext, 0, 0x25);
                GameWork_ClearFlag(gGameWork, 0x3f5);
            }
        } else if (callActorQuery(actor, 0x38) == 0 &&
                   *(s16 *)(actor + 0xd6) != 0x0d) {
            s16 state = *(s16 *)(actor + 0xd6);
            if (*(void **)(actor + 0x26c) != 0) {
                func_02037bb0(actor);
            } else if ((*(u32 *)(actor + 0x230) & 0x40000000) != 0) {
                ActorDerivedType1_UpdateHorizontalInputMotion(actor);
            } else if (state != 0x11) {
                callActorVoid(actor, 0x44);
            } else if (*(u16 *)(actor + 0x234) != 0) {
                if (--*(u16 *)(actor + 0x234) == 0) {
                    func_02002d54(2, 0x10);
                    func_02002d74(2, 0x10);
                }
            } else if (func_02002d94() != 0 && func_02002db0() != 0) {
                u8 *managed = *(u8 **)((u8 *)data_021052fc + 0x2ea8);
                u8 *work = (u8 *)gGameWork;
                GameWork_SetFlag(work, 0x3f8);
                GameWork_SetFlag(work, 0x3f6);
                GameWork_SetFlag(work, 0x10);
                if (managed != 0 && (*(u32 *)(managed + 0x268) & 0x10) != 0)
                    func_02048bcc(managed);
                func_02007f24(data_021052fc, *(s16 *)(work + 0x200),
                              *(s16 *)(work + 0x1f6),
                              *(s16 *)(work + 0x1f4), 0, 0);
            }
        }
    }

    if ((*(u32 *)(actor + 0x10) & 0x108) == 0x108) ActorDerivedRuntime_UpdateFrame(actor);
    *(u32 *)(actor + 0x230) &= ~0x200;

    if (*(s16 *)(actor + 0x264) > 0) {
        orientation = func_02032370(actor, actor + 0x254, 0x1000);
        --*(s16 *)(actor + 0x264);
    } else if ((*(u32 *)(actor + 0x230) & 0x40000000) != 0) {
        orientation = func_02032228(
            actor, (*(u32 *)(actor + 0x230) & 0x80000000) != 0 ? -8 : 8,
            0, 0x800);
        if (*(s16 *)(actor + 0x266) > 0) --*(s16 *)(actor + 0x266);
    } else {
        if (*(s16 *)(actor + 0x252) > 0) {
            --*(s16 *)(actor + 0x252);
            *(u32 *)(actor + 0xd0) |= 0x8000;
        }
        orientation = func_02032228(actor, *(s32 *)(actor + 0x3c),
                                    *(s32 *)(actor + 0x40), 0x800);
        if (*(s16 *)(actor + 0x266) > 0) --*(s16 *)(actor + 0x266);
    }

    if (*(void **)(actor + 0x26c) == 0 &&
        GameWork_TestFlag(gGameWork, 0x3f2) != 0 &&
        *(void **)(actor + 0x270) == 0) {
        object = Heap_Alloc(0x2c, (const char *)data_020df494, 4,
                            &gHeapContext);
        if (object != 0) object = func_0204c798(object, actor);
        *(void **)(actor + 0x270) = object;
        GameWork_ClearFlag(gGameWork, 0x3f2);
        func_0204cc14(object); /* Retail calls this even after allocation failure. */
        *(u32 *)(actor + 0xd0) |= 8;
    }

    func_0203647c(actor);
    if (*(s16 *)(actor + 0xd6) == 8 || *(s16 *)(actor + 0xd6) == 7 ||
        *(s16 *)(actor + 0xd6) == 0x11) {
        *(s32 *)(actor + 0x3c) = 0;
        *(s32 *)(actor + 0x40) = 0;
    }
    object = *(void **)(actor + 0x270);
    if (object != 0)
        *(s32 *)((u8 *)object + 0x28) =
            *(s16 *)(actor + 0xd6) == 0x11 ? 0x40000 : 0;

    if ((*(u32 *)(actor + 0x10) & 0x108) != 0x108) {
        if (*(u16 *)(actor + 0x2a2) != 0 &&
            (*(u32 *)(actor + 0xd0) & 0x40) == 0)
            --*(u16 *)(actor + 0x2a2);
        callActorVoid(actor, 0xa4);
        if (Actor_IsAtCachedTerrainHeight(actor) != 0)
            *(u32 *)(actor + 0x230) &= ~0x40000;
    }

    {
        s32 magnitude = func_02005070(actor + 0x88);
        if (magnitude < 0x19a) {
            func_0200b2c0(actor + 0x88, 0, 0, 0);
        } else if (magnitude > 0x8000) {
            func_020328d0(actor + 0x88, func_020adc90(0x8000, magnitude));
        }
    }
    Actor_UpdateAnimationState(actor);

    object = *(void **)(actor + 0x270);
    if (object != 0) {
        if ((((u8 *)object)[0x10] & 8) != 0) {
            destroyObject(object);
            *(void **)(actor + 0x270) = 0;
        } else {
            (*(void (**)(void *))(*(u8 **)object + 8))(object);
        }
    }

    object = *(void **)(actor + 0x27c);
    if (object != 0 &&
        (*(s16 *)object == 0x7b || *(s16 *)object == 0x8c)) {
        func_0204ced8(actor + 0x2a8, 0x17);
    } else if (*(s16 *)(actor + 0x268) > 0) {
        func_0204ced8(actor + 0x2a8, 0x17);
    } else if (*(s16 *)(actor + 0x264) > 0 && *(s8 *)(actor + 0x26a) >= 0) {
        func_0204ced8(actor + 0x2a8, 0);
    } else {
        func_0204ced8(actor + 0x2a8, -1);
    }
    (*(void (**)(void *))(*(u8 **)(actor + 0x2a8) + 8))(actor + 0x2a8);
    Actor_ClearTransientContactState(actor);

    *(s16 *)((u8 *)gGameWork + 0x24a) = (s16)orientation;
    if ((*(u32 *)(actor + 0xd0) & 0x20) != 0)
        GameWork_SetFlag(gGameWork, 0x3f0);
    else
        GameWork_ClearFlag(gGameWork, 0x3f0);
    if ((*(u32 *)(actor + 0xd0) & 0x10) != 0)
        GameWork_SetFlag(gGameWork, 0x3f1);
    else
        GameWork_ClearFlag(gGameWork, 0x3f1);
}
