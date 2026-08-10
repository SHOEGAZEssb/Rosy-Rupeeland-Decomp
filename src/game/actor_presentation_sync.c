#include "tingle/types.h"

/*
 * Project actor state into screen attachments, synchronize an optional runtime
 * object, and place the auxiliary height indicator.
 */
typedef struct PresentationPoint {
    void *vtable_00;
    s32 x_04;
    s32 y_08;
} PresentationPoint;

extern u8 gSceneTouchInitialData[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adae4(s32, s32);
extern void *func_020337d4(void *);
extern s32 func_02030b7c(void *);
extern void func_02057394(void *, s32);
extern void Actor_GetCollisionCenter(void *, void *);
extern void func_020571b4(void *, const void *, const void *);
extern void func_02005058(void *);
extern u32 func_02034464(void *, s32, s32);
extern void func_02072b68(void *, s32);
#ifdef __cplusplus
}
#endif

static s32 multiplyFx(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/*
 * Initialize output as a presentation point, derive screen X/Y from actor
 * positions 0x1c/0x20/0x24 and transform offsets 0x04/0x08, optionally applying
 * scale 0x1d0. Bounds halfwords 0x68-0x6e decide visibility, mirrored through
 * actor flag 0x04 and attachment-0x54 flag eight. Update attachment angle and
 * scale fields, synchronize object 0x1e0, and update auxiliary attachment 0xa8
 * from terrain and height deltas. Flag 0x200000 suppresses the pass; flag
 * 0x01000000 selects direct coordinates. Returns no value. The matching body
 * preserves the full peer-overlap gate for object 0x1e0, including its exact
 * temporary-shape schedule; this portable form retains the confirmed public
 * state transitions and helper boundaries.
 */
void func_02031758(PresentationPoint *output, void *actorPointer,
                   const void *transformPointer)
{
    u8 *actor = (u8 *)actorPointer;
    const u8 *transform = (const u8 *)transformPointer;
    u8 *attachment = *(u8 **)(actor + 0x54);
    s32 x;
    s32 y;
    s32 z;
    s32 visible;

    output->vtable_00 = gSceneTouchInitialData;
    output->x_04 = 0;
    output->y_08 = 0;
    if (*(u32 *)(actor + 0x14) & 0x200000) {
        if (attachment)
            *(u16 *)(attachment + 0x24) |= 8;
        return;
    }

    x = *(s32 *)(actor + 0x1c);
    y = *(s32 *)(actor + 0x20);
    z = *(s32 *)(actor + 0x24);
    if (*(u32 *)(actor + 0x14) & 0x01000000) {
        output->x_04 = x >> 12;
        output->y_08 = y >> 12;
    } else {
        if (*(u32 *)(actor + 0x14) & 0x80000) {
            s32 scale = *(s32 *)(actor + 0x1d0);
            x = multiplyFx(x, scale);
            y = multiplyFx(y, scale);
            z = multiplyFx(z, scale);
        }
        output->x_04 = (x >> 12) - (*(s32 *)(transform + 0x04) >> 12);
        output->y_08 = (y >> 12) - (*(s32 *)(transform + 0x08) >> 12) -
                       (z >> 12);
    }

    visible = output->x_04 >= -*(s16 *)(actor + 0x6c) &&
              output->x_04 < 0x100 - *(s16 *)(actor + 0x68) &&
              output->y_08 >= -*(s16 *)(actor + 0x6e) &&
              output->y_08 < 0xc0 - *(s16 *)(actor + 0x6a);
    if (attachment) {
        *(s16 *)(attachment + 0x2c) = (s16)output->x_04;
        *(s16 *)(attachment + 0x2e) = (s16)output->y_08;
        if (visible)
            *(u16 *)(attachment + 0x24) &= ~8;
        else
            *(u16 *)(attachment + 0x24) |= 8;
    }
    if (visible)
        *(u32 *)(actor + 0x10) |= 4;
    else
        *(u32 *)(actor + 0x10) &= ~4;

    if (attachment) {
        if ((*(u32 *)(actor + 0x14) & 0x01000000) ||
            !(*(u32 *)(actor + 0x14) & 0x4000))
            *(s16 *)(attachment + 0x28) =
                (s16)(0x8000 - (y >> 12) + *(s16 *)(actor + 0x5c));
        if (*(u32 *)(actor + 0x10) & 0x04000000) {
            s32 scale = *(s32 *)(actor + 0x1d0);
            *(s16 *)(attachment + 0x32) =
                (s16)func_020adae4(
                    multiplyFx(*(s32 *)(actor + 0x1d4), scale), 0x10);
            *(s16 *)(attachment + 0x34) =
                (s16)func_020adae4(
                    multiplyFx(*(s32 *)(actor + 0x1d8), scale), 0x10);
        }
    }

    if (!(*(u32 *)(actor + 0x14) & 0x01000000) &&
        *(void **)(actor + 0x1e0)) {
        u8 center[0x10];
        s32 enabled = *(void **)(actor + 0x184) &&
                      (func_02030b7c(func_020337d4(actor)) & 1);
        if (!*(void **)(actor + 0x184) &&
            !(*(u32 *)(actor + 0x14) & 0x1000))
            enabled = 0;
        func_02057394(*(void **)(actor + 0x1e0), enabled);
        Actor_GetCollisionCenter(center, actor);
        func_020571b4(*(void **)(actor + 0x1e0), transform, center);
        func_02005058(center);
    }

    attachment = *(u8 **)(actor + 0xa8);
    if (attachment) {
        u32 terrain = func_02034464(actor, *(s32 *)(actor + 0x1c) >> 16,
                                    *(s32 *)(actor + 0x20) >> 16);
        s32 terrainHeight = (s32)(terrain << 27) >> 27;
        s32 baseline = *(s32 *)(actor + 0x1dc);
        s32 delta = *(s32 *)(actor + 0x24) - baseline;
        u32 flags = *(u32 *)(actor + 0x14);

        if (!(flags & 0x10000000) || !(flags & 0x02000000) ||
            (*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 4) || delta <= 0) {
            *(u16 *)(attachment + 0x24) |= 8;
        } else {
            s32 mode = delta < 0x5800 ? 1 : (delta > 0x20000 ? 3 : 2);
            if (attachment[0x38] != mode)
                func_02072b68(attachment, mode);
            *(u16 *)(attachment + 0x24) &= ~8;
            *(s16 *)(attachment + 0x2c) =
                (s16)((*(s32 *)(actor + 0x1c) -
                       *(s32 *)(transform + 0x04)) >> 12);
            *(s16 *)(attachment + 0x2e) =
                (s16)(((*(s32 *)(actor + 0x20) -
                         *(s32 *)(transform + 0x08)) >> 12) - 2 -
                      (baseline >> 12));
            attachment[0x3a] = baseline < (terrainHeight << 16) ? 2 : 1;
            *(s16 *)(attachment + 0x28) =
                (s16)(0x8007 - (((*(s32 *)(actor + 0x20) -
                                    *(s32 *)(transform + 0x08)) >> 12) - 2));
        }
    }
}
