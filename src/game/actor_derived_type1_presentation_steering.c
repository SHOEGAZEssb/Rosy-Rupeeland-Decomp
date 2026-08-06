#include "tingle/types.h"

/* Synchronize type-1 presentation and steer its recovered X/Y accumulator. */
extern void *gSceneManager;
extern u8 gSceneTouchInitialData[];
extern u8 data_0210568c[4];
extern void *data_02105690[10];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02005030(void *temporary, const void *source);
extern void func_02005058(void *temporary);
extern void func_02031758(void *output, void *actor, const void *position);
extern void *SceneManager_GetCurrent(void *manager);
extern void func_02035518(void *owner, s32 enabled);
extern s32 func_020adae4(s32 dividend, s32 divisor);
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern void func_0206dcac(void *object);
extern void func_02031cac(void *actor, const void *snapshot);
#ifdef __cplusplus
}
#endif

/* Multiply two 20.12 values with the retail +0x800 rounding bias. */
static s32 multiplyFx(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/* Decay both recovered steering accumulators and reset the blend counter. */
static void decaySteering(u8 *actor)
{
    *(s16 *)(actor + 0x24e) = 0;
    *(s32 *)(actor + 0x23c) = multiplyFx(*(s32 *)(actor + 0x23c), 0xf48);
    *(s32 *)(actor + 0x240) = multiplyFx(*(s32 *)(actor + 0x240), 0xf48);
}

/*
 * Copy the supplied position into a temporary, add active object +0x270 offsets
 * +0x1c/+0x20 when its byte +0x10 bit 1 is set, and pass it to func_02031758.
 * Update that object with actor direction byte +0xd4, hide owner state +0x2a8
 * outside scenes 1/0x16, and submit an actor-position temporary whose +8 word
 * is offset by s16 +0x6a times 0xb33. Decay actor+0x244 by 92/100. Unless
 * +0x230 bit 0x20 is set, average globally selected actors carrying +0x260 bit
 * 0x1000 and optionally a local s16 center/radius at +0x29a..+0x29e. Blend the
 * bounded desired vector into accumulators +0x23c/+0x240 over a 600-frame ramp,
 * or decay both by 0xf48/0x1000 when no target contributes. Update optional
 * object +0x26c, copy output X/Y into a gSceneTouchInitialData snapshot for
 * func_02031cac, and destroy temporaries. Returns no value; presentation,
 * scene, owner, and value helpers may modify SDK-managed state.
 */
void func_02035be8(void *output, void *self, const void *position)
{
    u8 *actor = (u8 *)self;
    const u8 *input = (const u8 *)position;
    s32 adjusted[4];
    s32 actorPosition[4];
    void *object;
    u32 i;

    func_02005030(adjusted, input);
    object = *(void **)(actor + 0x270);
    if (object != 0 && (((u8 *)object)[0x10] & 1) != 0) {
        adjusted[1] += *(s32 *)((u8 *)object + 0x1c);
        adjusted[2] += *(s32 *)((u8 *)object + 0x20);
    }
    func_02031758(output, actor, adjusted);
    if (object != 0) {
        void (*updateDirection)(void *, u32) =
            *(void (**)(void *, u32))(*(u8 **)object + 0x0c);
        updateDirection(object, actor[0xd4]);
    }

    {
        s32 scene = *(s32 *)((u8 *)SceneManager_GetCurrent(gSceneManager) + 4);
        if (scene != 1 && scene != 0x16) func_02035518(actor + 0x2a8, 0);
    }
    func_02005030(actorPosition, actor + 0x18);
    actorPosition[2] += *(s16 *)(actor + 0x6a) * 0xb33;
    {
        u8 *owner = actor + 0x2a8;
        void (*submit)(void *, const void *, const void *, s32) =
            *(void (**)(void *, const void *, const void *, s32))
                (*(u8 **)owner + 0x0c);
        submit(owner, input, actorPosition, 0);
    }
    func_02005058(actorPosition);
    *(s32 *)(actor + 0x244) = func_020adae4(*(s32 *)(actor + 0x244) * 0x5c,
                                            0x64);

    if ((*(u32 *)(actor + 0x230) & 0x20) != 0) {
        *(s16 *)(actor + 0x24e) = 0;
    } else if (*(s16 *)(data_0210568c + 2) > 0 ||
               *(s16 *)(actor + 0x29e) > 0) {
        s32 sumX = 0;
        s32 sumY = 0;
        s32 count = 0;
        s32 desiredX;
        s32 desiredY;
        s32 magnitude;
        s32 blend;

        for (i = 0; i < (u32)*(s16 *)(data_0210568c + 2); ++i) {
            u8 *target = (u8 *)data_02105690[i];
            if ((*(u32 *)(target + 0x260) & 0x1000) != 0) {
                void *targetPosition =
                    (*(void *(**)(void *))(*(u8 **)target + 0x1c8))(target);
                sumX += *(s32 *)((u8 *)targetPosition + 4);
                sumY += *(s32 *)((u8 *)targetPosition + 8);
                ++count;
            }
        }

        if (*(s16 *)(actor + 0x29e) > 0) {
            s32 centerX = *(s16 *)(actor + 0x29a);
            s32 centerY = *(s16 *)(actor + 0x29c);
            s32 dx = (*(s32 *)(actor + 0x1c) >> 12) - centerX;
            s32 dy = (*(s32 *)(actor + 0x20) >> 12) - centerY;
            s32 radius = *(s16 *)(actor + 0x29e);
            if (dx * dx + dy * dy < radius * radius) {
                sumX += centerX << 12;
                sumY += centerY << 12;
                ++count;
            }
        }

        if (count == 0) {
            decaySteering(actor);
        } else {
            desiredX = func_020adae4(
                (func_020adae4(sumX, count) - *(s32 *)(actor + 0x1c)) * 2, 5);
            desiredY = func_020adae4(
                (func_020adae4(sumY, count) - *(s32 *)(actor + 0x20)) * 2, 5);
            magnitude = func_0204cfa4(desiredX, desiredY);
            if (magnitude > 0x30000) {
                desiredX = func_020adc90(desiredX * 0x30, magnitude);
                desiredY = func_020adc90(desiredY * 0x30, magnitude);
            }
            if (++*(s16 *)(actor + 0x24e) > 0x258)
                *(s16 *)(actor + 0x24e) = 0x258;
            blend = func_020adae4(*(s16 *)(actor + 0x24e) << 12, 0x258);
            *(s32 *)(actor + 0x23c) =
                multiplyFx(*(s32 *)(actor + 0x23c), 0x1000 - blend) +
                multiplyFx(desiredX, blend);
            *(s32 *)(actor + 0x240) =
                multiplyFx(*(s32 *)(actor + 0x240), 0x1000 - blend) +
                multiplyFx(desiredY, blend);
        }
    } else {
        decaySteering(actor);
    }

    object = *(void **)(actor + 0x26c);
    if (object != 0) func_0206dcac(object);
    {
        u8 snapshot[12];
        *(void **)snapshot = gSceneTouchInitialData;
        *(s32 *)(snapshot + 4) = *(s32 *)((u8 *)output + 4);
        *(s32 *)(snapshot + 8) = *(s32 *)((u8 *)output + 8);
        func_02031cac(actor, snapshot);
    }
    func_02005058(adjusted);
}
