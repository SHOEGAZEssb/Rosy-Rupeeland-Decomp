#include "tingle/types.h"

/*
 * Overlay 40 object and meter updates. This recovered routine synchronizes a
 * six-object group and redraws two horizontal debug-font meter regions.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0209a2ac(void *object, const void *transform, s32 enabled);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern void func_02076428(void *canvas, s32 left, s32 top, s32 right,
                          s32 bottom, s32 color);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void GraphicsSpriteState_SetAnimationIndex(void *renderer, u8 orientation);
extern void *gDebugFont;
extern void func_ov040_022021dc(void *output, const void *left,
                                const void *right);
extern void Sound_Play(void *sound, s32 parameter, s32 id);
extern void *gSoundContext;
extern void func_ov040_021ff514(void *scene);
extern void func_ov040_021ff42c(void *scene);
extern void func_ov040_02202214(void *scene, s32 value, s32 unused2,
                                s32 unused3);
extern void func_ov040_02202244(void *scene, s32 mode);
extern void func_020050a4(void *destination, const void *source);
extern void func_ov040_02202f1c(void *owner, s32 type, s32 x, s32 y);
extern u32 genrand_int32(void);
extern s32 func_020bf1f8(u32 value, s32 modulus);
extern void func_ov040_021fcea0(void *object, s32 x, s32 y, s32 z);
extern void func_ov040_021fceb0(void *object, s32 first, s32 second);
extern void func_020a2614(void *context, s32 type, s32 x, s32 y, s32 value);
extern void func_020a27a0(void *context, s32 type, s32 x, s32 y);
extern s32 ActorRuntimeFlags_Test(const void *input, s32 mask);
extern void func_0209c3b4(void *context);
extern void func_0209c430(void *context, const void *position,
                          const void *scale, u16 value, const void *bounds,
                          s32 zero1, const void *region, s32 mask, s32 zero2);
extern const u8 gActorRuntimeFlags[];
extern const s32 data_ov040_02207d48[];
#ifdef __cplusplus
}

/*
 * Advance four effect timers at +0xAF8. Frames 18..45 reveal each referenced
 * object at +0xAE8, choose its orientation from +0xBD4, move it vertically by
 * +/-0xA000, and set scale halfwords +0x3C/+0x3E; frame 46 resets the timer and
 * hides the object again. When +0xB08 is active and the +0xB94/+0xB88/+0xB9C
 * gates are all clear, either decrement +0xB28 by 23 and enter presentation
 * state 1, or arm +0xB88/+0xB8C and start delayed value 3 for early +0xB7C
 * states. Returns no value; scene and renderer state may change.
 */
extern "C" void func_ov040_02200eb8(void *scene)
{
    for (s32 index = 3; index >= 0; index--) {
        s32 *timer = (s32 *)((u8 *)scene + 0xaf8 + index * 4);
        if (*timer <= 0) continue;
        (*timer)++;
        void *object = FIELD(void *, scene, 0xae8 + index * 4);
        if (*timer < 0x2e) {
            if (*timer > 0x11) {
                s32 scale = 0x16 - index * 5;
                scale *= scale;
                if (scale < 0x100) scale = 0x100;
                if (*timer == 0x12) {
                    FIELD(u16, object, 0x42) &= (u16)~4;
                    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x0c),
                                  FIELD(s32, scene, 0xbd4) != 0);
                }
                FIELD(s32, object, 0x30) +=
                    FIELD(s32, scene, 0xbd4) == 0 ? 0xa000 : -0xa000;
                FIELD(u16, object, 0x3c) = 0x100;
                FIELD(s16, object, 0x3e) = (s16)scale;
            }
        } else {
            *timer = 0;
            FIELD(u16, object, 0x42) |= 4;
        }
    }

    if (FIELD(s32, scene, 0xb08) == 0 || FIELD(s32, scene, 0xb94) != 0 ||
        FIELD(s32, scene, 0xb88) != 0 || FIELD(s32, scene, 0xb9c) != 0)
        return;
    s32 state = FIELD(s32, scene, 0xb7c);
    s32 transition = (state == 3 &&
                      FIELD(s32, FIELD(void *, scene, 0xb44), 0x34) > 0x8c000);
    if (state == 0 || FIELD(s32, scene, 0xb84) != 8) transition = 1;
    if (transition) {
        FIELD(s32, scene, 0xb28) -= 0x17;
        func_ov040_021ff514(scene);
    } else if (state < 0x11) {
        FIELD(s32, scene, 0xb88) = 1;
        FIELD(s32, scene, 0xb8c) = 0;
        func_ov040_02202214(scene, 3, 0, 0);
    }
}

/*
 * Update all 80 active slot records from high to low. Add 0x19A to vertical
 * velocity, manage per-slot lifetime +0x6E4, bounce at a state-dependent
 * threshold, and integrate position +0xAA8/+0xAAC plus halfword angle +0x504.
 * States below seven use a fixed -0x668 bounce adjustment and expire after
 * 480 frames; later states halve horizontal velocity, reverse half vertical
 * velocity, play sound 7, and expire after 30 frames. A temporary vector
 * difference detects horizontal bounds outside 0..0x100000 and is destroyed
 * each iteration. Returns no value; active slot motion and audio may change.
 */
extern "C" void func_ov040_02203150(void *owner)
{
    for (s32 index = 0x4f; index >= 0; index--) {
        s32 state = FIELD(s32, owner, 0x824 + index * 4);
        if (state <= 0) continue;

        FIELD(s32, owner, 0x0c + index * 0x10) += 0x19a;
        s32 *lifetime = (s32 *)((u8 *)owner + 0x6e4 + index * 4);
        if (*lifetime != 0) {
            (*lifetime)++;
            if ((state < 7 && *lifetime > 0x1e0) ||
                (state >= 7 && *lifetime > 0x1e))
                FIELD(s32, owner, 0x824 + index * 4) = 0;
        }

        s32 *velocityX = (s32 *)((u8 *)owner + 8 + index * 0x10);
        s32 *velocityY = (s32 *)((u8 *)owner + 0x0c + index * 0x10);
        s32 threshold = 0xbe000;
        if (state == 1) threshold = 0xb3000;
        if (state == 2) threshold -= 0x5000;
        if (*velocityY + FIELD(s32, owner, 0xaac + index * 0x10) > threshold) {
            if (state < 7) {
                s32 adjusted = *velocityY - 0x668;
                *velocityY = -adjusted;
                if (adjusted != 0x1000 && *velocityY > -0x1001)
                    *velocityY = -0x1000;
                if (*lifetime == 0) *lifetime = 1;
            } else {
                *velocityX >>= 1;
                *velocityY = -(*velocityY >> 1);
                Sound_Play(gSoundContext, 300, 7);
                (*lifetime)++;
            }
        }

        u32 difference[4];
        func_ov040_022021dc(difference,
                            (u8 *)owner + 0xaa4 + index * 0x10,
                            (u8 *)owner + 4 + index * 0x10);
        if ((s32)difference[1] < 0 || (s32)difference[1] > 0x100000)
            *velocityX = -*velocityX;
        FIELD(s32, owner, 0xaa8 + index * 0x10) += *velocityX;
        FIELD(s32, owner, 0xaac + index * 0x10) += *velocityY;
        FIELD(s16, owner, 0x504 + index * 2) +=
            (s16)FIELD(s32, owner, 0x5a4 + index * 4);
        func_02005058(difference);
    }
}

/*
 * Advance the scene sequence selected by state +0xB30 after countdown +0xBC0
 * expires. State 1 selects motion-bounds mode 0x14/0x15 from +0xBD4 and puts
 * the primary renderer in mode 9. States 2..4 copy a source vector into
 * +0xB54, emit effect types 0..2 at the fixed-point +0xB58/+0xB5C position,
 * clear progressively different byte ranges in +0x642, and arm delays of 30,
 * 30, and 600 frames. State 5 requests primary mode 3. Returns no value;
 * scene sequence, renderer, effect-owner, and byte-array state may change.
 */
extern "C" void func_ov040_02201060(void *scene)
{
    s32 state = FIELD(s32, scene, 0xb30);
    if (state == 1) {
        if (--FIELD(s32, scene, 0xbc0) > 0) return;
        func_ov040_02202244(scene,
                           FIELD(s32, scene, 0xbd4) == 0 ? 0x14 : 0x15);
        FIELD(s32, FIELD(void *, FIELD(void *, scene, 0x48), 0x0c), 0x7c) = 9;
        FIELD(s32, scene, 0xbc0) = 100;
        FIELD(s32, scene, 0xb30)++;
        return;
    }

    s32 effectType;
    s32 clearFirst;
    s32 clearEnd;
    const void *source;
    s32 delay;
    if (state == 2) {
        effectType = 0;
        clearFirst = 13;
        clearEnd = 22;
        source = (u8 *)scene + 0x680;
        delay = 30;
    } else if (state == 3) {
        effectType = 1;
        clearFirst = 7;
        clearEnd = 13;
        source = (u8 *)scene + 0x670;
        delay = 30;
    } else if (state == 4) {
        effectType = 2;
        clearFirst = 0;
        clearEnd = 29;
        source = (u8 *)scene + 0x670;
        delay = 600;
    } else if (state == 5) {
        if (--FIELD(s32, scene, 0xbc0) > 0) return;
        FIELD(s32, FIELD(void *, scene, 0x48), 0x3c) = 3;
        FIELD(s32, scene, 0xb30)++;
        return;
    } else {
        return;
    }

    if (--FIELD(s32, scene, 0xbc0) > 0) return;
    func_020050a4((u8 *)scene + 0xb54, source);
    func_ov040_02202f1c((u8 *)scene + 0xbd8, effectType,
                        FIELD(s32, scene, 0xb58) >> 12,
                        FIELD(s32, scene, 0xb5c) >> 12);
    for (s32 index = clearFirst; index < clearEnd; index++)
        FIELD(u8, scene, 0x642 + index) = 0;
    FIELD(s32, scene, 0xbc0) = delay;
    FIELD(s32, scene, 0xb30)++;
}

/*
 * Allocate inactive entries from the 80-slot effect pool at owner +0x824 and
 * launch a type-dependent batch at integer coordinates x/y (converted to
 * 20.12 fixed point). Types 0..2 attempt 20 entries, type 3 attempts five,
 * and later types attempt one; type 0 skips a prefix derived from the nested
 * +0x4C count. Each allocated entry receives randomized velocity and angular
 * speed, an animation/state value selected from data_ov040_02207d48 or the
 * type-specific random ranges, zero lifetime, and palette marker 0xFF. Type 3
 * also increments the nested +0x4C count. Returns no value; the pool, random
 * generator, and (for type 3) the nested counter are modified.
 */
extern "C" void func_ov040_02202f1c(void *owner, s32 type, s32 x, s32 y)
{
    s32 first = 0;
    s32 remaining = type <= 2 ? 20 : (type == 3 ? 5 : 1);
    if (type == 0) {
        void *scene = FIELD(void *, owner, 0);
        first = func_020befec(FIELD(s32, scene, 0x4c), 5);
    }

    const s32 *stateTable = data_ov040_02207d48 + type * 10;
    s32 positionX = x << 12;
    s32 positionY = y << 12;
    for (s32 batchIndex = remaining; batchIndex >= first; batchIndex--) {
        s32 slot;
        for (slot = 79; slot >= 0; slot--) {
            if (FIELD(s32, owner, 0x824 + slot * 4) == 0) break;
        }
        if (slot < 0) continue;

        FIELD(s32, owner, 0xaa8 + slot * 16) = positionX;
        FIELD(s32, owner, 0xaac + slot * 16) = positionY;
        FIELD(s32, owner, 0xab0 + slot * 16) = 0;
        if (type == 2) {
            u32 sample = genrand_int32() & 0xfff;
            FIELD(s32, owner, 8 + slot * 16) =
                (s32)(((u64)sample * 0x2666 + 0x800) >> 12) - 0x1333;
            FIELD(s32, owner, 0x0c + slot * 16) =
                (s32)(genrand_int32() & 0x1fff) - 0x5000;
        } else {
            FIELD(s32, owner, 8 + slot * 16) =
                (s32)(genrand_int32() & 0xfff) * 2 - 0x1000;
            FIELD(s32, owner, 0x0c + slot * 16) =
                (s32)(genrand_int32() & 0xfff) - 0x4000;
        }
        FIELD(s32, owner, 0x10 + slot * 16) = 0;
        FIELD(s16, owner, 0x504 + slot * 2) = 0;
        FIELD(s32, owner, 0x5a4 + slot * 4) =
            (s32)(genrand_int32() & 0x1ff) - 0x100;

        s32 state;
        if (type <= 2)
            state = batchIndex < 10
                        ? stateTable[batchIndex]
                        : (s32)(genrand_int32() & 3) + 7;
        else if (type == 3)
            state = func_020bf1f8(genrand_int32(), 3) + 4;
        else
            state = (s32)(genrand_int32() & 3) + 7;
        FIELD(s32, owner, 0x824 + slot * 4) = state;
        FIELD(s32, owner, 0x6e4 + slot * 4) = 0;
        FIELD(s32, owner, 0x964 + slot * 4) = 0xff;
        if (type == 3) {
            void *scene = FIELD(void *, owner, 0);
            FIELD(s32, scene, 0x4c)++;
        }
    }
}
#endif

/*
 * Update the rising object at +0xAC0 and its follow-up object at +0xAC4.
 * Positive +0xAD4 values step through arming, launch, ascent, and handoff;
 * +0xAD8 then shrinks the follow-up after frame 30. While the follow-up is
 * visible and input/state gates permit it, proximity to +0xB44 decrements
 * +0xB28 and selects presentation state 0 or 1. Returns no value. Object,
 * renderer, effect, and scene-presentation helpers have observable effects.
 */
extern "C" void func_ov040_02200bf4(void *scene)
{
    s32 ascent = FIELD(s32, scene, 0xad4);
    void *rising = FIELD(void *, scene, 0xac0);
    void *followup = FIELD(void *, scene, 0xac4);

    if (ascent > 0) {
        if (ascent == 1) {
            FIELD(s32, scene, 0xad4) = 2;
        } else if (ascent == 2) {
            FIELD(s32, scene, 0xad4) = 0x50;
            FIELD(s32, scene, 0xacc) = FIELD(s32, scene, 0x684);
            FIELD(s32, scene, 0xad0) = FIELD(s32, scene, 0x688) + 0x30000;
            FIELD(u16, rising, 0x42) &= (u16)~4;
            func_ov040_021fceb0(rising, 0x50, 0x50);
            func_020a2614(FIELD(void *, FIELD(void *, scene, 0x48), 0x10),
                          1, FIELD(s32, scene, 0xacc) >> 12,
                          FIELD(s32, scene, 0xad0) >> 12, 6);
        } else {
            s32 product = FIELD(s32, scene, 0x848) * 0x14;
            /* Signed bias implements the retail truncation before >>12. */
            s32 step = (product + (s32)((u32)(product >> 11) >> 20)) >> 12;
            ascent += step;
            if (ascent > 0x1ff) ascent = 0x1ff;
            FIELD(s32, scene, 0xad4) = ascent;
            FIELD(s32, scene, 0xad0) += 0x4000;
            func_ov040_021fceb0(rising, ascent, ascent);
            if (FIELD(s32, scene, 0xad0) > 0xb4000) {
                void *owner = FIELD(void *, scene, 0x48);
                FIELD(s32, owner, 0x34) = 0x0f;
                FIELD(s32, owner, 0x38) = 3;
                func_020a27a0(FIELD(void *, owner, 0x10), 2,
                              FIELD(s32, scene, 0xacc) >> 12,
                              (FIELD(s32, scene, 0xad0) >> 12) + 0x0c);
                FIELD(u16, rising, 0x42) |= 4;
                FIELD(u16, followup, 0x42) &= (u16)~4;
                func_ov040_021fcea0(followup, FIELD(s32, scene, 0xacc),
                                    0xb7000, 0);
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, followup, 0x0c), 1);
                FIELD(u16, followup, 0x3c) = 0x100;
                FIELD(u16, followup, 0x3e) = 0x180;
                FIELD(s32, scene, 0xad4) = 0;
                FIELD(s32, scene, 0xad8) = 0;
            }
        }
        FIELD(s32, rising, 0x30) = FIELD(s32, scene, 0xacc);
        FIELD(s32, rising, 0x34) = FIELD(s32, scene, 0xad0);
    }

    if ((FIELD(u16, followup, 0x42) & 4) == 0) {
        if (ActorRuntimeFlags_Test(gActorRuntimeFlags, 0x80) == 0 &&
            FIELD(s32, scene, 0xb94) == 0 &&
            FIELD(s32, scene, 0xad4) == 0 &&
            FIELD(s32, scene, 0xb9c) == 0) {
            s32 distance = FIELD(s32, scene, 0xacc) -
                           FIELD(s32, FIELD(void *, scene, 0xb44), 0x30);
            if (distance < 0x19000 && distance > -0x1e000) {
                FIELD(s32, scene, 0xb28) -= 0x1d;
                if (FIELD(s32, scene, 0xb28) <= 0)
                    func_ov040_021ff514(scene);
                else
                    func_ov040_021ff42c(scene);
                FIELD(s32, scene, 0x6c) = 0;
                FIELD(s32, scene, 0x70) = 10;
            }
        }

        void *renderer = FIELD(void *, followup, 0x0c);
        if ((FIELD(u16, renderer, 0x24) & 1) != 0) {
            GraphicsSpriteState_SetAnimationIndex(renderer, 2);
            FIELD(u16, renderer, 0x24) &= (u16)~2;
        }

        s32 timer = ++FIELD(s32, scene, 0xad8);
        s32 scale = 0x100 - (timer - 0x1e) * 0x14;
        if (scale < 10) {
            FIELD(u16, followup, 0x42) |= 4;
        } else if (timer > 0x1e) {
            FIELD(s16, followup, 0x3c) = (s16)scale;
            FIELD(u16, followup, 0x3e) = 0x180;
        }
    }
}

/*
 * Unless owner +0x50 is one, enable owner and its six children using a zero
 * vector. Clamp two signed values at nested scene offsets +0xB2C/+0xB28 to
 * zero, redraw their meter backgrounds and filled spans on gDebugFont, and
 * update child orientations +0x5C and +0x58 when their quantized values have
 * changed. Destroy the temporary vector and return no value. Canvas drawing
 * uses the shared software-font surface; object renderer state may change.
 */
extern "C" void func_ov040_02202cb4(void *owner)
{
    if (FIELD(s32, owner, 0x50) == 1) return;

    u32 zeroVector[4];
    func_0209a2ac(owner, 0, 1);
    func_0200500c(zeroVector, 0, 0, 0);
    for (s32 offset = 0x58; offset <= 0x6c; offset += 4)
        func_0209a2ac(FIELD(void *, owner, offset), zeroVector, 1);

    void *scene = FIELD(void *, FIELD(void *, owner, 0x48), 8);
    s32 leftValue = FIELD(s32, scene, 0xb2c);
    if (leftValue < 0) leftValue = 0;
    func_02076428(gDebugFont, 0, 0x90, 0x6f - leftValue, 0xa7, 0);
    if (leftValue > 0)
        func_02076428(gDebugFont, 0x6f - leftValue, 0x90, 0x6f, 0xa7, 4);
    s32 orientation = 5 - func_020befec(leftValue, 0x26);
    void *renderer = FIELD(void *, FIELD(void *, owner, 0x5c), 0x0c);
    if ((u8)orientation != FIELD(u8, renderer, 0x38))
        GraphicsSpriteState_SetAnimationIndex(renderer, (u8)orientation);

    s32 rightValue = FIELD(s32, scene, 0xb28);
    if (rightValue < 0) rightValue = 0;
    func_02076428(gDebugFont, rightValue + 0x90, 0x90, 0x100, 0xa7, 0);
    if (rightValue > 0)
        func_02076428(gDebugFont, 0x90, 0x90, rightValue + 0x90, 0xa7, 4);
    orientation = 2 - func_020befec(rightValue, 0x26);
    renderer = FIELD(void *, FIELD(void *, owner, 0x58), 0x0c);
    if ((u8)orientation != FIELD(u8, renderer, 0x38))
        GraphicsSpriteState_SetAnimationIndex(renderer, (u8)orientation);
    func_02005058(zeroVector);
}

/* Apply a non-negative pending orientation and consume it by writing -1. */
static void apply_pending_orientation(void *owner, u32 pendingOffset,
                                      u32 objectOffset)
{
    s32 pending = FIELD(s32, owner, pendingOffset);
    if (pending >= 0) {
        void *renderer = FIELD(void *, FIELD(void *, owner, objectOffset), 0x0c);
        if ((u32)pending != FIELD(u8, renderer, 0x38))
            GraphicsSpriteState_SetAnimationIndex(renderer, (u8)pending);
        FIELD(s32, owner, pendingOffset) = -1;
    }
}

/*
 * Consume pending orientations +0x70/+0x74/+0x78/+0x7C/+0x84 for the object
 * group at +0x58..+0x6C. A +0x7C change arms the 90-frame cycle at +0x80;
 * expiration walks renderer +0x6C through its confirmed orientation sequence.
 * Pending +0x84 also drives the paired renderer at +0x68. Timer +0x88 resets
 * that pair to orientations 0 and 3. Owner +0x50 equal to one disables all
 * processing. Returns no value; renderer orientation state may change.
 */
extern "C" void func_ov040_02202a50(void *owner)
{
    if (FIELD(s32, owner, 0x50) == 1) return;

    apply_pending_orientation(owner, 0x70, 0x58);
    apply_pending_orientation(owner, 0x74, 0x5c);
    apply_pending_orientation(owner, 0x78, 0x60);

    s32 pending = FIELD(s32, owner, 0x7c);
    if (pending >= 0) {
        void *renderer = FIELD(void *, FIELD(void *, owner, 0x6c), 0x0c);
        if ((u32)pending != FIELD(u8, renderer, 0x38)) {
            GraphicsSpriteState_SetAnimationIndex(renderer, (u8)pending);
            FIELD(s32, owner, 0x80) = 0x5a;
            if (pending == 0x0b)
                FIELD(s32, owner, 0x84) = 1;
            else if (pending == 9)
                FIELD(s32, owner, 0x84) = 2;
        }
        FIELD(s32, owner, 0x7c) = -1;
    }

    if (FIELD(s32, owner, 0x80) > 0 && --FIELD(s32, owner, 0x80) <= 0) {
        void *renderer = FIELD(void *, FIELD(void *, owner, 0x6c), 0x0c);
        switch (FIELD(u8, renderer, 0x38)) {
        case 6:
            GraphicsSpriteState_SetAnimationIndex(renderer, 0x0c);
            FIELD(s32, owner, 0x80) = 0x3c;
            break;
        case 7:
            GraphicsSpriteState_SetAnimationIndex(renderer, 8);
            FIELD(s32, owner, 0x80) = 0x3c;
            break;
        case 8:
            GraphicsSpriteState_SetAnimationIndex(renderer, 7);
            FIELD(s32, owner, 0x80) = 0x3c;
            break;
        case 9:
            GraphicsSpriteState_SetAnimationIndex(renderer, 10);
            FIELD(s32, owner, 0x80) = 0x3c;
            break;
        case 10:
            GraphicsSpriteState_SetAnimationIndex(renderer, 9);
            FIELD(s32, owner, 0x80) = 0x3c;
            break;
        default:
            GraphicsSpriteState_SetAnimationIndex(renderer, 6);
            FIELD(s32, owner, 0x84) = 0;
            FIELD(s32, owner, 0x80) = 0xa0;
            break;
        }
    }

    pending = FIELD(s32, owner, 0x84);
    if (pending >= 0) {
        void *renderer = FIELD(void *, FIELD(void *, owner, 0x64), 0x0c);
        if ((u32)pending != FIELD(u8, renderer, 0x38)) {
            GraphicsSpriteState_SetAnimationIndex(renderer, (u8)pending);
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, owner, 0x68), 0x0c),
                          (u8)(pending + 3));
        }
        FIELD(s32, owner, 0x84) = -1;
    }

    if (FIELD(s32, owner, 0x88) > 0 && --FIELD(s32, owner, 0x88) <= 0) {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, owner, 0x64), 0x0c), 0);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, owner, 0x68), 0x0c), 3);
    }
}

/* Confirmed four-value regions selected by each slot's state +0x824. */
static const s32 slotRegions[11][4] = {
    {0x68000, 0xc8000, 0x78000, 0xd8000},
    {0xc0000, 0xc8000, 0xe8000, 0xf0000},
    {0x98000, 0xd8000, 0xb0000, 0xf0000},
    {0xb0000, 0xd8000, 0xc0000, 0xe8000},
    {0x98000, 0xf0000, 0xa8000, 0x100000},
    {0xc8000, 0xf0000, 0xd8000, 0x100000},
    {0xd8000, 0xf0000, 0xe8000, 0x100000},
    {0x20000, 0x58000, 0x30000, 0x78000},
    {0x20000, 0x58000, 0x30000, 0x78000},
    {0x20000, 0x58000, 0x30000, 0x78000},
    {0x20000, 0x58000, 0x30000, 0x78000}
};

/* Confirmed signed bounds paired with slotRegions; their units are unknown. */
static const s32 slotBounds[11][4] = {
    {-8, -8, 8, 8},       {-20, -20, 20, 20},
    {-12, -12, 12, 12},   {-8, -8, 8, 8},
    {-8, -8, 8, 8},       {-8, -8, 8, 8},
    {-8, -8, 8, 8},       {-10, -10, 10, 10},
    {-10, -12, 10, 12},   {-12, -12, 12, 12},
    {-8, -8, 8, 8}
};

/*
 * Submit eligible members of the 80-slot array to the renderer at owner
 * +0/+0x10. A slot must have state +0x824 >= 1 and either an age +0x6E4 below
 * 0x1B3 or the confirmed alternating-age condition. Position comes from the
 * 16-byte records at +0xAA8, scale is identity, +0x504 supplies a per-slot
 * halfword, and state selects the tables above. Returns no value. Rendering
 * and temporary-vector destruction have their usual SDK effects.
 */
extern "C" void func_ov040_0220332c(void *owner)
{
    void *context = FIELD(void *, FIELD(void *, owner, 0), 0x10);
    func_0209c3b4(context);

    for (s32 slot = 0x4f; slot >= 0; slot--) {
        s32 state = FIELD(s32, owner, 0x824 + slot * 4);
        s32 age = FIELD(s32, owner, 0x6e4 + slot * 4);
        if (state < 1) continue;
        /* Confirmed assembly tests bit 1 of non-negative ages at/above 0x1B3. */
        if (age >= 0x1b3 && (((u32)age >> 1) & 1) != 0) continue;

        s32 position[4];
        s32 scale[4];
        u8 *record = (u8 *)owner + 0xaa8 + slot * 0x10;
        func_0200500c(position, FIELD(s32, record, 0),
                      FIELD(s32, record, 4), -FIELD(s32, record, 8) >> 12);
        func_0200500c(scale, 0x1000, 0x1000, 0x1000);
        func_0209c430(context, position, scale,
                      FIELD(u16, owner, 0x504 + slot * 2),
                      slotBounds[state], 0, slotRegions[state], 0x7fff, 0);
        func_02005058(scale);
        func_02005058(position);
    }
}
