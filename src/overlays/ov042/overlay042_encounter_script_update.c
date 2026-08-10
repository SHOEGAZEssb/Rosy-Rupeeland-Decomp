#include "tingle/types.h"

/*
 * Overlay 42 encounter-script update. This recovered controller consumes a
 * packed waypoint script, steers the scene anchor, and coordinates presentation
 * animations plus three families of subordinate effect objects.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s32 func_020adc40(s32 squaredLength);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *animation, u8 index);
extern "C" void func_020a1ec0(void *owner, u32 effect);
extern "C" void func_ov042_021fcf80(void *element);
extern "C" void func_ov042_021ff2f8(void *destination, const void *source);
extern "C" void func_ov042_02207f58(void *object, s32 selector);
extern "C" void func_ov042_022088fc(void *object, s32 selector, s32 mode);
extern "C" void func_ov042_022089e8(void *object);
extern "C" void func_ov042_022091f4(void *object);
extern "C" u16 data_ov042_0220ac90[];
extern "C" u16 data_ov042_0220ae64[];
extern "C" u16 data_ov042_0220b018[];
extern "C" u16 data_ov042_0220b0ac[];

static s32 multiply_fx(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

static void select_main_animation(void *scene, u8 animation, bool loop)
{
    void *resource = FIELD(void *, FIELD(void *, scene, 0x4c), 0x0c);
    GraphicsSpriteState_SetAnimationIndex(resource, animation);
    if (loop)
        FIELD(u16, resource, 0x24) |= 2;
    else
        FIELD(u16, resource, 0x24) &= (u16)~2;
}

/*
 * Given the effect scene, choose the packed script from +0x150: the negative
 * mode uses data_ov042_0220ac90 and modes 0/1/2 use the three longer confirmed
 * tables. Each script halfword stores waypoint index in its low nibble and a
 * phase count in its upper 12 bits; 0xFFFF terminates and wraps the script.
 * When countdown +0xC0 expires, load the next entry, set target +0x158/+0x15C
 * from an eleven-pair fixed coordinate table, reset phase +0xD0, and advance
 * +0xBC (restricted to the first four entries while owner +0x1C8 is nonzero).
 *
 * Damp velocity +0xB4/+0xB8 by factor 0x19A, accelerate it toward the target
 * with normalized strength 0xA4, and integrate anchor +0xA4. On reaching the
 * waypoint, execute phase-count-dependent actions: start variant-2 children,
 * select main animations/effects, activate variant-1 or variant-3 families,
 * decrement +0xE4 in the negative mode, and synchronize auxiliary presentation
 * flags when the main animation completes. The packed phase progresses after
 * 20 ticks and the script countdown is cleared after its non-looping animation
 * finishes. Object, child, SDK animation, and audio/effect state change; no
 * value is returned.
 */
extern "C" void func_ov042_02200bc0(void *scene)
{
    u8 unused[12];
    func_ov042_021fcf80(unused);
    static const s32 waypoints[11][2] = {
        {0, -80}, {-10, -86}, {10, -86}, {0, -60}, {0, -110},
        {-64, -20}, {70, -20}, {-80, -60}, {80, -60},
        {-80, -100}, {90, -110}
    };

    const u16 *script = data_ov042_0220ae64;
    s32 mode = FIELD(s32, scene, 0x150);
    if (mode < 0)
        script = data_ov042_0220ac90;
    else if (mode == 1)
        script = data_ov042_0220b018;
    else if (mode == 2)
        script = data_ov042_0220b0ac;

    if (--FIELD(s32, scene, 0xc0) <= 0) {
        u16 token = script[FIELD(s32, scene, 0xbc)];
        FIELD(s32, scene, 0xc8) = token & 15;
        FIELD(s32, scene, 0xcc) = token >> 4;
        FIELD(s32, scene, 0xd0) = 0;
        s32 waypoint = FIELD(s32, scene, 0xc8);
        FIELD(s32, scene, 0x158) = waypoints[waypoint][0] << 12;
        FIELD(s32, scene, 0x15c) = waypoints[waypoint][1] << 12;
        FIELD(s32, scene, 0xc0) = 1000;
        s32 next = ++FIELD(s32, scene, 0xbc);
        if (script[next] == 0xffff)
            FIELD(s32, scene, 0xbc) = 0;
        if (FIELD(s32, FIELD(void *, scene, 0x48), 0x1c8) != 0 &&
            FIELD(s32, scene, 0xbc) >= 4)
            FIELD(s32, scene, 0xbc) = 0;
    }

    s32 dx = FIELD(s32, scene, 0x158) - FIELD(s32, scene, 0xa8);
    s32 dy = FIELD(s32, scene, 0x15c) - FIELD(s32, scene, 0xac);
    s32 distance = func_020adc40(multiply_fx(dx, dx) + multiply_fx(dy, dy));
    FIELD(s32, scene, 0xb4) -= multiply_fx(FIELD(s32, scene, 0xb4), 0x19a);
    FIELD(s32, scene, 0xb8) -= multiply_fx(FIELD(s32, scene, 0xb8), 0x19a);

    if (FIELD(s32, scene, 0xd0) == 0) {
        if (distance > 0) {
            FIELD(s32, scene, 0xb4) +=
                multiply_fx(func_020adc90(dx, distance), 0xa4);
            FIELD(s32, scene, 0xb8) +=
                multiply_fx(func_020adc90(dy, distance), 0xa4);
            func_ov042_021ff2f8((u8 *)scene + 0xa4,
                                (u8 *)scene + 0xb0);
        }
        if (distance <= 0x5000) {
            s32 phase = FIELD(s32, scene, 0xcc);
            if (phase == 0) {
                FIELD(s32, scene, 0xc0) = 0;
            } else {
                FIELD(s32, scene, 0xd0) = 1;
                phase--;
                if (phase == 0 && mode < 0) {
                    void *variant = FIELD(void *, scene, 0x74);
                    if (FIELD(s32, variant, 0x74) < 100) {
                        FIELD(s32, scene, 0xc0) = 0;
                        phase = -1;
                    }
                } else if (phase == 1) {
                    FIELD(u16, FIELD(void *, scene, 0x58), 0x42) &= (u16)~4;
                    FIELD(s32, scene, 0x16c) = 0;
                    FIELD(s32, scene, 0x164) = 0x14a000;
                    for (s32 i = 2; i >= 0; --i)
                        func_ov042_022088fc(FIELD(void *, scene, 0x78 + i * 4),
                                             i, mode);
                }
                if (phase >= 0) {
                    if (phase == 2)
                        select_main_animation(scene, 6, false);
                    else {
                        select_main_animation(scene, 2, false);
                        func_020a1ec0(FIELD(void *, scene, 0x48), 0xb485);
                    }
                }
            }
        }
    } else {
        s32 phaseTimer = ++FIELD(s32, scene, 0xd0);
        if (phaseTimer == 20) {
            s32 phase = FIELD(s32, scene, 0xcc) - 1;
            if (phase == 0) {
                if (mode < 0) {
                    func_ov042_02207f58(FIELD(void *, scene, 0x74), 4);
                    if (FIELD(s32, scene, 0xe4) > 0)
                        FIELD(s32, scene, 0xe4)--;
                } else {
                    s32 first = mode == 0 ? 2 : 4;
                    for (s32 i = first; i >= 0; --i)
                        func_ov042_02207f58(FIELD(void *, scene, 0x68 + i * 4), i);
                }
            } else if (phase == 1) {
                select_main_animation(scene, 5, false);
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, scene, 0x58), 0x0c), 0);
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xeb8d);
                FIELD(s32, scene, 0x188) = 0;
                FIELD(s32, scene, 0x16c)++;
                for (s32 i = 2; i >= 0; --i)
                    func_ov042_022089e8(FIELD(void *, scene, 0x78 + i * 4));
            } else if (phase == 2) {
                for (s32 i = 1; i >= 0; --i)
                    func_ov042_022091f4(FIELD(void *, scene, 0x84 + i * 4));
            }
        }

        void *mainResource = FIELD(void *, FIELD(void *, scene, 0x4c), 0x0c);
        if ((FIELD(u16, mainResource, 0x24) & 1) != 0) {
            select_main_animation(scene, 0, true);
            void *secondary = FIELD(void *, scene, 0x50);
            void *secondaryResource = FIELD(void *, secondary, 0x0c);
            GraphicsSpriteState_SetAnimationIndex(secondaryResource, 0);
            FIELD(u16, secondaryResource, 0x24) |= 2;
            FIELD(s32, secondary, 0x30) = FIELD(s32, scene, 0x174);
            FIELD(s32, secondary, 0x34) = FIELD(s32, scene, 0x178);
            FIELD(s32, scene, 0x180) = 0;
            FIELD(s32, scene, 0x184) = 0;
            void *tertiary = FIELD(void *, scene, 0x54);
            FIELD(s32, tertiary, 0x34) = 0;
            FIELD(s32, tertiary, 0x30) = 0;
            FIELD(s32, scene, 0x190) = 0;
            FIELD(s32, scene, 0x194) = 0;
            FIELD(s32, scene, 0x19c) = 0;
            FIELD(s32, scene, 0x1a0) = 0;
            FIELD(s32, scene, 0x1a8) = 0;
            FIELD(s32, scene, 0x1ac) = 0;
        }
        if (FIELD(s32, scene, 0xd0) > 20 &&
            FIELD(u8, mainResource, 0x38) == 0)
            FIELD(s32, scene, 0xc0) = 0;
    }
}
