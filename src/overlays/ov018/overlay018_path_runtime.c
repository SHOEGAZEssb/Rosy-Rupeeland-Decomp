#include "tingle/types.h"

/* Overlay 18 input-driven path sampling, validation, and closed-path rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define INPUT_BIT(state, bit) ((FIELD(u32, state, 0x20) & (1U << (bit))) != 0)

typedef struct Overlay018Point {
    s16 x;
    s16 y;
} Overlay018Point;

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_SetPackedEffectValue(void *, s32, s32);
extern u32 func_020ae024(s32, s32);
extern void Overlay003_RasterizeLine(void *, s32, s32, s32, s32, u32, u32);
extern void func_ov018_021fdb7c(void *, s32);
extern void func_ov018_021fdbac(void *);
extern void func_ov018_021fdbd4(void *);
extern void func_ov018_021fdbfc(void *);
extern s32 func_ov018_021fdc64(void *);
extern void func_ov018_021fe184(void *, const void *);
extern s32 func_ov018_021fe214(void *);
extern void func_ov018_021ff3cc(void *);
extern s32 func_ov018_021ff408(void *);
extern s32 func_ov018_021ff420(void *);
extern void func_ov018_021ff434(void *, u16, u16);
extern s32 func_ov018_021ff770(void *);
extern void func_ov018_021ff964(void *);
extern s32 func_ov018_021ff984(void *);
extern void func_ov018_021ffbb0(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Process one path-input frame. Bits 4/5/9 of state word +0x20 respectively
 * gate the scene event, start a stroke, and continue a stroke. Valid input is
 * rasterized through overlay 3 using screen coordinates +0x34/+0x38, sampled
 * into point buffer +0x58 after offsets +0x5C/+0x60, and checked for sharp
 * turns and older-segment intersections. A crossing with area in (0x100,
 * 0x8000) is trimmed and rerasterized with a classification-dependent brush;
 * rejected, ended, or full paths are reset or assigned latch value 3 according
 * to the recovered branches. Returns void. Scene, animation, event, raster,
 * point-buffer, and several caller latches may change; math/event helpers are
 * invoked but this function performs no direct hardware access. Event IDs and
 * brush values remain address-confirmed constants whose higher-level meanings
 * are not yet established.
 */
extern "C" void func_ov018_021fdce4(void *state)
{
    void *buffer = FIELD(void *, state, 0x58);

    if (INPUT_BIT(state, 4)) {
        FIELD(s32, state, 0x414) = 0;
        func_ov018_021fdbac(state);
    } else {
        FIELD(s32, state, 0x408) = 1;
        func_ov018_021fdbd4(state);
    }

    if (INPUT_BIT(state, 5)) {
        if (func_ov018_021fdc64(state) && FIELD(s32, state, 0x408)) {
            s32 x = FIELD(s32, state, 0x34);
            s32 y = FIELD(s32, state, 0x38);
            FIELD(s32, state, 0x404) = 1;
            Overlay003_RasterizeLine(FIELD(void *, state, 0x190),
                                x, y, x, y, 2, 1);
            func_ov018_021fe184((u8 *)state + 0x64, (u8 *)state + 0x30);
            func_ov018_021fdbfc(state);
            SceneSound_PlayPackedEffect(state, 0x4b);
            func_ov018_021ff434(buffer,
                x + FIELD(s32, state, 0x5c),
                y + FIELD(s32, state, 0x60));
        }
    } else if (INPUT_BIT(state, 9)) {
        if (func_ov018_021fdc64(state) && FIELD(s32, state, 0x408)) {
            if (FIELD(s32, state, 0x404) == 0) {
                FIELD(s32, state, 0x404) = 1;
                func_ov018_021fe184((u8 *)state + 0x64,
                                    (u8 *)state + 0x30);
            }
            Overlay003_RasterizeLine(FIELD(void *, state, 0x190),
                                FIELD(s32, state, 0x68),
                                FIELD(s32, state, 0x6c),
                                FIELD(s32, state, 0x34),
                                FIELD(s32, state, 0x38), 2, 1);
            func_ov018_021fe184((u8 *)state + 0x64, (u8 *)state + 0x30);
            func_ov018_021fdbfc(state);
            func_ov018_021fdb7c(state, 1);
            SceneSound_SetPackedEffectValue(state, 0x4c, 0x7f);
        } else {
            func_ov018_021fdb7c(state, 0);
            SceneSound_SetPackedEffectValue(state, 0x4c, 0);
            if (!func_ov018_021ff420(buffer)) {
                FIELD(s32, state, 0x404) = 0;
                func_ov018_021ffbb0(buffer, 3);
            }
        }
    } else {
        func_ov018_021fdb7c(state, 0);
        SceneSound_SetPackedEffectValue(state, 0x4c, 0);
    }

    if (!func_ov018_021ff408(buffer) && INPUT_BIT(state, 9) &&
        func_ov018_021fdc64(state) && FIELD(s32, state, 0x404) &&
        FIELD(s32, state, 0x408)) {
        s32 x = FIELD(s32, state, 0x34);
        s32 y = FIELD(s32, state, 0x38);
        func_ov018_021ff434(buffer,
            x + FIELD(s32, state, 0x5c),
            y + FIELD(s32, state, 0x60));

        s32 count = FIELD(s32, buffer, 0x10);
        Overlay018Point *points = FIELD(Overlay018Point *, buffer, 4);
        if (count >= 3) {
            s32 previousDx = points[count - 2].x - points[count - 3].x;
            s32 previousDy = points[count - 2].y - points[count - 3].y;
            s32 newestDx = points[count - 1].x - points[count - 2].x;
            s32 newestDy = points[count - 1].y - points[count - 2].y;
            u32 angleDifference =
                (u16)(func_020ae024(previousDx, previousDy) -
                      func_020ae024(newestDx, newestDy));
            if (angleDifference > 0x8000)
                angleDifference = (u16)(0x10000 - angleDifference);
            if (angleDifference > 0x6000 &&
                newestDx * newestDx + newestDy * newestDy > 0x10)
                SceneSound_PlayPackedEffect(state, 0x4d);
        }

        if (FIELD(s32, buffer, 0x24) == 0 &&
            func_ov018_021ff770(buffer)) {
            s32 area = func_ov018_021ff984(buffer);
            if (area > 0x100 && area < 0x8000) {
                s32 brush = 3;
                func_ov018_021ff964(buffer);
                if (func_ov018_021fe214(state)) {
                    SceneSound_PlayPackedEffect(state, 0x1e);
                    FIELD(s32, state, 0x3c8) = 1;
                    brush = 4;
                } else if (FIELD(s32, state, 0x420) == 2) {
                    SceneSound_PlayPackedEffect(state, 0x1e);
                    brush = 5;
                } else {
                    SceneSound_PlayPackedEffect(state, 0x77);
                }

                points = FIELD(Overlay018Point *, buffer, 4);
                s32 pointX = points[0].x - FIELD(s32, state, 0x5c);
                s32 pointY = points[0].y - FIELD(s32, state, 0x60);
                for (s32 i = 1; i < FIELD(s32, buffer, 0x10); i++) {
                    s32 nextX = points[i].x - FIELD(s32, state, 0x5c);
                    s32 nextY = points[i].y - FIELD(s32, state, 0x60);
                    Overlay003_RasterizeLine(FIELD(void *, state, 0x190),
                                        pointX, pointY, nextX, nextY,
                                        brush, 1);
                    pointX = nextX;
                    pointY = nextY;
                }
                FIELD(s32, state, 0x404) = 0;
                func_ov018_021ffbb0(buffer, 2);
            } else {
                func_ov018_021ff3cc(buffer);
            }
        }
    } else if (func_ov018_021ff408(buffer)) {
        if (INPUT_BIT(state, 4))
            func_ov018_021ff3cc(buffer);
        else {
            FIELD(s32, state, 0x404) = 0;
            func_ov018_021ffbb0(buffer, 3);
        }
    } else if (!INPUT_BIT(state, 4) && !func_ov018_021ff420(buffer)) {
        FIELD(s32, state, 0x404) = 0;
        func_ov018_021ffbb0(buffer, 3);
    }
}
