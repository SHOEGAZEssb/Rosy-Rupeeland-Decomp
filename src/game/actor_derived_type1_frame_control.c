#include "tingle/heap.h"
#include "tingle/types.h"

/* Advance type-1 actor timers, timed effects, input motion, and attachment state. */
extern void *gLupyContext;
extern const char data_020df4a4[];
extern HeapContext gHeapContext;
extern u8 *data_021052fc;
extern void *gSoundContext;
extern void *gGameWork;
extern s16 data_0210568c[];
extern u8 gSystemState[];
extern s32 data_020df254[];
extern s32 data_020df258[];
extern u8 gSceneTouchInitialData[];

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedType1_TeardownActiveRecord(void *actor);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern void func_02010c00(void *context, s32 value, s32 extra);
extern void *func_02009d78(void *manager);
extern void *func_02022cb0(void *allocation, void *resource, void *actor,
                           s32 value, s32 first, s32 second);
extern void func_0201ded4(void *manager, void *object);
extern void Sound_Play(void *context, u32 sound, u32 variant);
extern void Type1Actor_TryEnterFailureState(void *actor);
extern u32 genrand_int32(void);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02008378(void *output, const void *left, const void *right);
extern void func_02005058(void *vector);
extern void *func_0201f864(void *allocation, ...);
extern void *func_0201e0ec(void *manager);
extern void func_020a28e0(void *effect, s32 kind, s32 x, s32 y, s32 duration);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void func_02058d40(void *context, s32 value);
extern void func_0205958c(void *context, s32 value);
extern void func_02059278(void *context, s32 first, s32 second);
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern void ActorDerivedType1_StartRecord(void *actor);
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern void Actor_TryInitializeHeightBandFromPoint(void *actor,
                                                  const void *record);
extern s32 func_020be334(s32 value);
extern void Actor_UpdateGroundContactProbe(void *actor);
#ifdef __cplusplus
}
#endif

/* Multiply two 20.12 fixed-point values with the retail rounding bias. */
static s32 multiplyFx(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/* Decode the confirmed directional input bits into the engine's eight-way index. */
static s32 inputDirection(u16 input)
{
    if ((input & 0x20) != 0) {
        if ((input & 0x40) != 0) return 3;
        return (input & 0x80) != 0 ? 1 : 2;
    }
    if ((input & 0x10) != 0) {
        if ((input & 0x40) != 0) return 5;
        return (input & 0x80) != 0 ? 7 : 6;
    }
    return (input & 0x40) != 0 ? 4 : 0;
}

/* Read the direction-indexed word whose table entries have an eight-byte stride. */
static s32 directionWord(const s32 *table, s32 direction)
{
    return *(const s32 *)((const u8 *)table + direction * 8);
}

/*
 * Advance actor +0x26b/+0x268/+0x280/+0x282 timers and return early while
 * the first two actor cooldowns are active. Timed descriptor IDs 0x73/0x74
 * can allocate manager-owned objects, play descriptor sound, and emit random
 * scene effects. GameWork flag 0x393 controls a temporary +0x230 bit-0x10
 * sound state. Confirmed system input selects one of eight motion vectors;
 * unavailable input instead submits current coordinates through
 * Actor_TryInitializeHeightBandFromPoint.
 * Resource +0x274 scales motion by descriptor +0x0a and IDs 0x67/0x68/0x7b
 * apply additional accumulated-motion rules. The function also updates scale
 * halfword +0xde, invokes Actor_UpdateGroundContactProbe unless bit 0x20000 is set, and clears
 * secondary motion when virtual query +0x30 requests it. Returns no value.
 * Allocation, manager, sound, GameWork, random, scene-effect, and virtual calls
 * have observable engine/SDK effects.
 */
void ActorDerivedType1_UpdateFrameControl(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *descriptor;
    u16 input;
    s16 *counter;

    if ((*(u32 *)(actor + 0x230) & 4) == 0) return;

    if (actor[0x26b] != 0) {
        --actor[0x26b];
        if (actor[0x26b] != 0)
            *(u16 *)(*(u8 **)(actor + 0x54) + 0x36) = 0x300;
        else {
            void *attachment = *(void **)(actor + 0x54);
            (*(void (**)(void *))(*(u8 **)attachment + 0x5c))(attachment);
        }
    }

    counter = (s16 *)(actor + 0x268);
    if (*counter > 0) {
        if ((*(u32 *)(actor + 0x230) & 0x40000) == 0) --*counter;
        return;
    }

    counter = (s16 *)(actor + 0x280);
    if (*counter > 0) {
        --*counter;
        if (*counter == 0 && (*(u32 *)(actor + 0x230) & 0x8000) != 0)
            ActorDerivedType1_TeardownActiveRecord(actor);
        return;
    }

    counter = (s16 *)(actor + 0x282);
    if (*counter > 0) {
        s32 interval;
        u8 kind;
        descriptor = *(u8 **)(actor + 0x27c);
        interval = *(s16 *)(descriptor + 0x0c);
        kind = descriptor[8];
        if (interval <= 0) interval = 30;

        if (*(s16 *)(descriptor + 0x0e) > 0 &&
            func_020ada8c(actor[0x2a1], *(s16 *)(descriptor + 0x0e)) == 0 &&
            kind >= 0x73 && kind <= 0x74) {
            s32 value = -*(s16 *)(descriptor + 0x0e);
            void *object;
            func_02010c00(gLupyContext, value, 0);
            object = Heap_Alloc(0x44, data_020df4a4, 4, &gHeapContext);
            if (object != 0) {
                void *resource = func_02009d78(data_021052fc + 0x2fbc);
                object = func_02022cb0(object, resource, actor, value,
                                      0x2000, -0xc0);
            }
            func_0201ded4(data_021052fc + 0x2f7c, object);
            if (*(u16 *)(descriptor + 0x1a) != 0)
                Sound_Play(gSoundContext, *(u16 *)(descriptor + 0x1a) >> 7,
                           *(u16 *)(descriptor + 0x1a) & 0x7f);
            Type1Actor_TryEnterFailureState(actor);
        }

        if (kind == 0x73 && func_020ada8c(actor[0x2a1], 10) == 0) {
            s32 offset[4];
            s32 position[4];
            s32 randomY = func_020ada8c((s32)(genrand_int32() & 0x7fffffff), 12);
            s32 randomX = func_020ada8c((s32)(genrand_int32() & 0x7fffffff), 6);
            void *allocation;
            void *effect;
            func_0200500c(offset, (randomX << 12) - 0x6000, 0,
                          (randomY << 12) + 0x1e000);
            func_02008378(position, actor + 0x18, offset);
            func_02005058(offset);
            allocation = Heap_Alloc(0x14, data_020df4a4, 4, &gHeapContext);
            if (allocation != 0) {
                void *attachment = *(void **)(actor + 0x54);
                func_0201f864(allocation, position, *(void **)attachment,
                              0x1075, 0x1001, 0x1076, 0, 16, -1, 1);
            }
            effect = func_0201e0ec(data_021052fc + 0x2f7c);
            func_020a28e0(effect, 1, position[1] >> 12,
                          (position[2] >> 12) - (position[3] >> 12), 30);
            func_02005058(position);
        }

        ++actor[0x2a1];
        --*counter;
        if (*counter == 0) ActorDerivedType1_TeardownActiveRecord(actor);
    }

    if ((*(u32 *)(actor + 0xd0) & 0x20) != 0 &&
        GameWork_TestFlag(gGameWork, 0x393) != 0) {
        GameWork_ClearFlag(gGameWork, 0x393);
        if ((*(u32 *)(actor + 0x230) & 0x10) == 0) {
            *(u32 *)(actor + 0x230) |= 0x10;
            *(s16 *)(actor + 0x234) = 60;
            *(u32 *)(actor + 0x10) |= 0x1f0000;
            func_02058d40(gSoundContext, 0x14);
            func_0205958c(gSoundContext, 0x14);
            func_02059278(gSoundContext, 0x39, 0x78);
        }
    } else {
        *(u32 *)(actor + 0x230) &= ~0x10;
        if (Actor_IsAtCachedTerrainHeight(actor) != 0 &&
            *(s16 *)(actor + 0x268) == 0)
            *(u32 *)(actor + 0x10) &= ~0x1f0000;
    }

    input = *(u16 *)(gSystemState + 0x1a);
    if (data_0210568c[0] >= 0 &&
        (*(u16 *)(gSystemState + 6) & 0x100) != 0)
        ActorDerivedType1_StartRecord(actor);

    if (*(s16 *)(actor + 0xd6) == 0x0b) {
        *(s32 *)(actor + 0x8c) = func_020adae4(*(s32 *)(actor + 0x8c) * 98, 100);
        *(s32 *)(actor + 0x90) = func_020adae4(*(s32 *)(actor + 0x90) * 98, 100);
    } else if (*(s16 *)(actor + 0x250) == 0) {
        if (Actor_IsAtCachedTerrainHeight(actor) != 0 &&
            (input & 0xf0) != 0) {
            s32 direction = inputDirection(input);
            s32 state;
            s32 desiredX = directionWord(data_020df254, direction);
            s32 desiredY = directionWord(data_020df258, direction);
            *(u32 *)(actor + 0x230) =
                (*(u32 *)(actor + 0x230) & ~1) | 2;
            state = *(s16 *)(actor + 0xd6);
            if (state == 9 || state == 10) {
                *(s32 *)(actor + 0x3c) = 0;
                *(s32 *)(actor + 0x40) = 0;
                *(s32 *)(actor + 0x8c) =
                    func_020adae4(*(s32 *)(actor + 0x8c) * 9 + desiredX, 10);
                *(s32 *)(actor + 0x90) =
                    func_020adae4(*(s32 *)(actor + 0x90) * 9 + desiredY, 10);
            } else if (state == 7) {
                *(s32 *)(actor + 0x3c) = 0;
                *(s32 *)(actor + 0x40) = 0;
            } else {
                *(s32 *)(actor + 0x3c) = desiredX;
                *(s32 *)(actor + 0x40) = desiredY;
            }
        } else if ((*(u32 *)(actor + 0xd0) & 0x10000) == 0) {
            u8 record[12];
            *(void **)record = gSceneTouchInitialData;
            *(s32 *)(record + 4) = *(s32 *)(actor + 0x1c) >> 12;
            *(s32 *)(record + 8) = *(s32 *)(actor + 0x20) >> 12;
            *(u32 *)(actor + 0x230) =
                (*(u32 *)(actor + 0x230) & ~1) | 2;
            *(u32 *)(actor + 0xd0) &= ~2;
            Actor_TryInitializeHeightBandFromPoint(actor, record);
            *(s32 *)(actor + 0x3c) = 0;
            *(s32 *)(actor + 0x40) = 0;
        }
    }

    descriptor = *(u8 **)(actor + 0x27c);
    if (*(void **)(actor + 0x274) != 0 && descriptor != 0) {
        s32 identity;
        *(s32 *)(actor + 0x3c) =
            multiplyFx(*(s32 *)(actor + 0x3c), *(s16 *)(descriptor + 0x0a));
        *(s32 *)(actor + 0x40) =
            multiplyFx(*(s32 *)(actor + 0x40), *(s16 *)(descriptor + 0x0a));
        identity = *(s16 *)descriptor;
        if (identity == 0x7b) {
            *(s32 *)(actor + 0x9c) += func_020adae4(*(s32 *)(actor + 0x3c), 4);
            *(s32 *)(actor + 0xa0) += func_020adae4(*(s32 *)(actor + 0x40), 4);
        } else if (identity == 0x67 || identity == 0x68) {
            if ((input & 0xc0) != 0) {
                *(s32 *)(actor + 0x8c) =
                    func_020adae4(*(s32 *)(actor + 0x8c) * 96, 100);
            } else {
                s32 value = *(s32 *)(actor + 0x8c) +
                            func_020adae4(*(s32 *)(actor + 0x3c), 8);
                *(s32 *)(actor + 0x8c) = value;
                if (func_020be334(value) > 0x4cd)
                    *(s32 *)(actor + 0x8c) = value > 0 ? 0x4cd : -0x4cd;
            }
        }
    }

    *(u16 *)(actor + 0xde) = actor[0x26b] != 0 ? 0x300 : 0x100;
    if ((*(u32 *)(actor + 0x230) & 0x20000) == 0) Actor_UpdateGroundContactProbe(actor);
    if ((*(u32 *)(actor + 0xd0) & 4) != 0 &&
        (*(s32 (**)(void *))(*(u8 **)actor + 0x30))(actor) != 0) {
        *(s32 *)(actor + 0x8c) = 0;
        *(s32 *)(actor + 0x90) = 0;
        *(s32 *)(actor + 0x94) = 0;
    }
}
