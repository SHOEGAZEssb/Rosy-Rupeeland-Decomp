#include "tingle/heap.h"
#include "tingle/types.h"

/* Classify type-1 actor motion and events into state/substate animation codes. */
extern void *data_021052fc;
extern void *gGameWork;
extern void *gSoundContext;
extern u8 data_020df49c[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern void *ActorDerivedType1_TeardownActiveRecord(void *actor);
extern void *func_020022dc(void *value);
extern void func_0200222c(void *value, s32 mode, u32 mask);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void *func_ov059_0220fd20(void *storage, s32 variant, s32 value);
extern void func_0204cc14(void *object);
extern void Sound_Play(void *soundContext, u32 sound, u32 variant);
#ifdef __cplusplus
}
#endif

/* Query packed terrain data through the global terrain object's vtable slot 0x2c. */
static u32 queryPackedTerrain(u8 *actor)
{
    void *terrain = *(void **)((u8 *)data_021052fc + 0x2ed4);
    u32 (*query)(void *, s32, s32, s32) =
        *(u32 (**)(void *, s32, s32, s32))(*(u8 **)terrain + 0x2c);

    return query(terrain, *(s32 *)(actor + 0x1c) >> 16,
                 *(s32 *)(actor + 0x20) >> 16, 0);
}

/*
 * Clear actor flag 0x10 at +0xd0 and substate +0xda, then derive state +0xd6
 * from actor flags, vertical position versus +0x34/+0x1dc, previous state
 * +0xd8, attachment completion flag 1, motion, countdowns, optional object
 * +0x270, and virtual queries. The confirmed state codes span 1..17. Falling
 * onto packed terrain subtype bits 10..13 equal to one launches an overlay
 * helper after ActorDerivedType1_TeardownActiveRecord/func_020022dc/func_0200222c and sets +0x230 bit
 * 0x80000. Grounded transitions can play sound 0x60 and update secondary
 * motion +0x8c/+0x90. Substate priority is countdown +0x268, +0x280, +0x264
 * with byte +0x26a, then +0x230 bit 0x200. Vtable slot 0xa8 can clear mode
 * +0x250; otherwise state 8 enters mode one and sets +0xd0 bit 0x1000 on the
 * transition, while ordinary states clear the mode. Returns no value; terrain,
 * overlay, heap, GameWork, sound, and virtual helpers have observable effects.
 */
void ActorDerivedType1_ClassifyState(void *self)
{
    u8 *actor = (u8 *)self;
    u32 flags230;
    u32 d0;
    s32 z;
    s32 ground;
    s32 previousZ;
    s16 previousState;
    s32 special;
    void *object;
    u32 packed;
    s32 queryResult;

    *(u32 *)(actor + 0xd0) &= ~0x10;
    *(s16 *)(actor + 0xda) = 0;
    if ((*(u32 *)(actor + 0x10) & 0x108) == 0x108) {
        *(s16 *)(actor + 0xd6) = 15;
        goto finalize;
    }

    flags230 = *(u32 *)(actor + 0x230);
    if ((flags230 & 0x400) != 0) {
        if (Actor_IsAtCachedTerrainHeight(actor) == 0) {
            *(s16 *)(actor + 0xd6) = 13;
        } else {
            *(s16 *)(actor + 0xd6) = 2;
            *(u32 *)(actor + 0x14) &= ~(2 | 4);
            *(u32 *)(actor + 0x10) &= ~0x1f0000;
            *(u32 *)(actor + 0x230) &= ~0x400;
        }
        goto finalize;
    }

    d0 = *(u32 *)(actor + 0xd0);
    if ((d0 & 0x100) != 0) {
        if (*(s16 *)(actor + 0x268) > 0 || (d0 & 0x4000) != 0) {
            *(s16 *)(actor + 0xd6) = 2;
            *(s16 *)(actor + 0xda) = 3;
        } else {
            *(s16 *)(actor + 0xd6) = 14;
        }
        goto finalize;
    }
    if ((flags230 & 0x10) != 0) {
        *(u32 *)(actor + 0xd0) |= 0x10;
        *(s16 *)(actor + 0xd6) = 17;
        goto finalize;
    }

    z = *(s32 *)(actor + 0x24);
    ground = *(s32 *)(actor + 0x1dc);
    previousZ = *(s32 *)(actor + 0x34);
    previousState = *(s16 *)(actor + 0xd8);
    if (z < ground) {
        *(s16 *)(actor + 0xd6) = 1;
        goto finalize;
    }
    if (previousState == 11 &&
        (*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 1) == 0 &&
        (flags230 & 0x800) == 0) {
        *(s16 *)(actor + 0xd6) = 11;
        if (*(s16 *)(actor + 0x268) > 0) *(s16 *)(actor + 0xda) = 3;
        goto finalize;
    }

    special = *(s16 *)(actor + 0xac) == 7;
    object = *(void **)(actor + 0x270);
    if (special || (object != 0 && (((u8 *)object)[0x10] & 1) != 0)) {
        *(s16 *)(actor + 0xd6) = 8;
        *(u32 *)(actor + 0xd0) |= 0x10;
        if ((*(u32 *)(actor + 0xd0) & 0x20) == 0)
            *(s16 *)(actor + 0xda) = 1;
        goto choose_substate;
    }

    if (z < previousZ) {
        if (z > ground) {
            *(s16 *)(actor + 0xd6) = 10;
            if (*(s16 *)(actor + 0x268) > 0) *(s16 *)(actor + 0xda) = 3;
            goto choose_substate;
        }
        *(s16 *)(actor + 0xd6) = 11;
        *(u32 *)(actor + 0x230) = (flags230 & ~1) | 2;
        packed = queryPackedTerrain(actor);
        if (((packed >> 10) & 0x0f) == 1) {
            void *value = func_020022dc(ActorDerivedType1_TeardownActiveRecord(actor));
            void *allocation;
            func_0200222c(value, 2, 0x40);
            allocation = Heap_Alloc(0x88, (const char *)data_020df49c, 4,
                                    &gHeapContext);
            if (allocation != 0) {
                s32 variant = GameWork_TestFlag(gGameWork, 0x12) != 0 ? 2 : 0;
                func_ov059_0220fd20(allocation, variant, 0xc8);
            }
            *(u32 *)(actor + 0x230) |= 0x80000;
            return;
        }
        if (*(s16 *)(actor + 0x268) > 0) *(s16 *)(actor + 0xda) = 3;
        goto choose_substate;
    }
    if (z > previousZ) {
        *(s16 *)(actor + 0xd6) = 9;
        if (*(s16 *)(actor + 0x268) > 0) *(s16 *)(actor + 0xda) = 3;
        goto choose_substate;
    }
    if (z > ground) {
        *(s16 *)(actor + 0xd6) = 10;
        if (*(s16 *)(actor + 0x268) > 0) *(s16 *)(actor + 0xda) = 3;
        goto choose_substate;
    }

    if (*(u16 *)(actor + 0x2a2) != 0) {
        *(s16 *)(actor + 0x264) = 0;
        *(s16 *)(actor + 0xd6) = 12;
        goto choose_substate;
    }
    if (object != 0 && (flags230 & 0x40) != 0) {
        if (previousState == 7 &&
            (*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 1) != 0) {
            *(u32 *)(actor + 0x230) &= ~0x40;
            if ((*(u32 *)(actor + 0xd0) & 8) == 0) {
                *(s16 *)(actor + 0xd6) = 1;
            } else {
                func_0204cc14(*(void **)(actor + 0x270));
                Sound_Play(gSoundContext, 0x60, 1);
                *(s16 *)(actor + 0xd6) = 8;
                *(s16 *)(actor + 0xda) = 1;
            }
            goto choose_substate;
        }
        if (previousState != 7) {
            *(s32 *)(actor + 0x8c) = *(s32 *)(actor + 0x3c);
            *(s32 *)(actor + 0x90) = *(s32 *)(actor + 0x40);
            Sound_Play(gSoundContext, 0x60, 0);
        }
        *(s16 *)(actor + 0xd6) = 7;
        goto choose_substate;
    }

    if ((*(s32 *)(actor + 0x3c) | *(s32 *)(actor + 0x40)) != 0) {
        *(s16 *)(actor + 0xd6) =
            (*(u32 *)(actor + 0xd0) & 2) != 0 ? 6 : 5;
    } else if (*(s16 *)(actor + 0x2a4) < 0x78) {
        *(s16 *)(actor + 0xd6) = 1;
        ++*(s16 *)(actor + 0x2a4);
    } else {
        queryResult =
            (*(s32 (**)(void *))(*(u8 **)actor + 0x6c))(actor);
        if ((previousState == 2 && queryResult == 0) ||
            (previousState == 3 &&
             (*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 1) == 0)) {
            *(s16 *)(actor + 0xd6) = 3;
        } else if ((previousState == 2 && queryResult == 1) ||
                   (previousState == 4 &&
                    (*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 1) == 0)) {
            *(s16 *)(actor + 0xd6) = 4;
        } else {
            *(s16 *)(actor + 0xd6) = 2;
        }
    }

choose_substate:
    if (*(s16 *)(actor + 0x268) > 0) {
        *(s16 *)(actor + 0xda) = 3;
    } else if (*(s16 *)(actor + 0x280) > 0) {
        *(s16 *)(actor + 0xda) = 7;
    } else if (*(s16 *)(actor + 0x264) > 0) {
        s8 mode = *(s8 *)(actor + 0x26a);
        *(s16 *)(actor + 0xda) = mode == 2 ? 6 : (mode == 3 ? 2 : 5);
    } else if ((*(u32 *)(actor + 0x230) & 0x200) != 0) {
        *(s16 *)(actor + 0xda) = 4;
    }

    if (*(s16 *)(actor + 0xd6) != 1 && *(s16 *)(actor + 0xd6) != 2 &&
        *(s16 *)(actor + 0xd6) != 3 && *(s16 *)(actor + 0xd6) != 4)
        *(s16 *)(actor + 0x2a4) = 0;

finalize:
    if ((*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) != 0) {
        *(s16 *)(actor + 0x250) = 0;
        return;
    }
    if (*(s16 *)(actor + 0xd6) == 9 || *(s16 *)(actor + 0xd6) == 10 ||
        *(s16 *)(actor + 0xd6) == 11)
        return;
    if (*(s16 *)(actor + 0xd6) == 8) {
        s16 oldMode = *(s16 *)(actor + 0x250);
        *(s16 *)(actor + 0x250) = 1;
        if (oldMode != 1) *(u32 *)(actor + 0xd0) |= 0x1000;
    } else {
        *(s16 *)(actor + 0x250) = 0;
    }
}
