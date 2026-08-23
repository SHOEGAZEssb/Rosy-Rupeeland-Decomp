#include "tingle/graphics_3d_presentation.h"
#include "tingle/types.h"

/*
 * Overlay 41 descriptor hit testing. This recovered routine finds an active
 * stationary descriptor near an input point, applies mode-specific scoring and
 * feedback, advances or removes its type, and returns the matched pool index.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 func_020adc40(s32);
void Sound_Play(void *, s32, s32);
void func_ov041_021fec84(void *, s32, s32);
void func_ov070_02212908(void *, s32, s32, s32);
void GraphicsSpriteState_SetAnimationIndex(void *, s32);
s32 func_020a25c8(void *, s32, s32, s32, s32, s32, s32);
extern void *gSoundContext;
extern const u8 data_ov041_02204d00[];
extern const s32 data_ov041_02204c7c[];
}

static s32 fixed_distance(s32 dx, s32 dy)
{
    s32 squared = (s32)(((s64)dx * dx + 0x800) >> 12) +
                  (s32)(((s64)dy * dy + 0x800) >> 12);
    return func_020adc40(squared);
}

/*
 * Search backwards for a live, non-falling descriptor within 0x1E000 of point.
 * Modes 0/2 play feedback, award 100 or 500 units, notify the linked gameplay
 * object, and decrement/remap descriptor type while refreshing any leased
 * renderer. Other modes spawn a 28x28 visual response, add the type's score,
 * remove the entry, and reveal/place the dedicated renderer when the inferred
 * target count reaches zero. Returns the matched index, otherwise -1.
 */
extern "C" s32 func_ov041_02200348(void *object, const void *point)
{
    s16 *typeArray = (s16 *)FIELD(void *, object, 0x80);
    s32 *velocity = (s32 *)FIELD(void *, object, 0x90);
    u8 *positionArray = (u8 *)FIELD(void *, object, 0x84);
    s16 *links = (s16 *)FIELD(void *, object, 0x98);
    void *owner = FIELD(void *, object, 0x48);

    for (s32 i = FIELD(s32, object, 0x1ac) - 1; i >= 0; --i) {
        s32 type = typeArray[i];
        if (type <= -1 || velocity[i] != 0)
            continue;
        u8 *position = positionArray + i * 12;
        s32 dx = FIELD(s32, position, 4) - FIELD(s32, point, 4);
        s32 dy = FIELD(s32, position, 8) - FIELD(s32, point, 8);
        if (dx < -0x20000 || dx > 0x20000 ||
            dy < -0x20000 || dy > 0x20000 ||
            fixed_distance(dx, dy) >= 0x1e000)
            continue;

        s32 mode = FIELD(s32, owner, 0x1f4);
        if (mode == 0 || mode == 2) {
            if (!(type == 1 || (u16)(type - 3) <= 2))
                return i;
            Sound_Play(gSoundContext, 0, 0x0f);
            if ((u16)(type - 4) <= 1) {
                func_ov041_021fec84(owner, 500, 1);
                func_ov070_02212908(FIELD(void *, owner, 8), 1,
                                     FIELD(s32, point, 4),
                                     FIELD(s32, point, 8));
                typeArray[i] = (s16)((type - 4) * 2);
            } else {
                func_ov041_021fec84(owner, 100, 0);
                func_ov070_02212908(FIELD(void *, owner, 8), 0,
                                     FIELD(s32, point, 4),
                                     FIELD(s32, point, 8));
                typeArray[i] = (s16)(type - 1);
            }
            if (links[i] >= 0) {
                void *render = FIELD(void *, object, 0x4c + links[i] * 4);
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, render, 0x0c),
                              data_ov041_02204d00[typeArray[i]]);
            }
        } else {
            s32 effect = func_020a25c8(
                FIELD(void *, owner, 0x18), 0,
                (FIELD(s32, position, 4) >> 12) - 14,
                (FIELD(s32, position, 8) >> 12) - 19,
                28, 28, 4);
            Graphics3dPresentation_SetSpriteEffectVertexDepth(
                (Graphics3dPresentation *)FIELD(void *, owner, 0x18),
                effect, -20);
            FIELD(s32, owner, 0x1d8) += data_ov041_02204c7c[type];
            Sound_Play(gSoundContext, 0, 0x0f);
            typeArray[i] = -1;
            if (--FIELD(s32, object, 0x1bc) == 0) {
                void *special = FIELD(void *, object, 0x7c);
                FIELD(u16, special, 0x42) &= ~4;
                FIELD(s32, special, 0x30) = FIELD(s32, owner, 0x190) + 0x9000;
                FIELD(s32, special, 0x34) = FIELD(s32, owner, 0x194) + 0xc8000;
            }
        }
        return i;
    }
    return -1;
}
