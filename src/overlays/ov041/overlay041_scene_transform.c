#include "tingle/types.h"

/*
 * Overlay 41 scene transform propagation. This recovered routine applies the
 * parent transform to render children; mode one additionally builds rotated
 * per-type geometry used by the scene/collision presentation subsystem.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_0209a2ac(void *, const void *, s32);
void func_02005030(void *, const void *);
void func_02005058(void *);
void func_0209b7a0(void *, const void *);
void func_0209c7e8(void *, s32);
void func_0209c87c(void *, const void *, const void *, s32, s32);
extern const s32 data_ov041_02204c58[9];
extern const s16 data_020c9670[];
}

static s32 fixed_mul(s32 a, s32 b)
{
    return (s32)(((s64)a * b) >> 12);
}

/*
 * Apply transform to the object and increment its frame counter. Modes 0/2
 * pass the same transform to all twelve reusable render children. Mode one
 * updates the linked scene transform and generates an eight-word rotated shape
 * for each active descriptor using its type scale and 16-bit phase angle,
 * dispatching the shape with a type-specific four-word geometry record. The
 * dedicated render child also receives the transform. No value is returned.
 *
 * The exact fallback preserves the compiler-sensitive fixed-point expansion;
 * the portable form expresses the confirmed rotation relationship directly.
 */
extern "C" void func_ov041_021fffc8(void *object, const void *transform)
{
    func_0209a2ac(object, transform, 1);
    u8 localTransform[0x10];
    func_02005030(localTransform, transform);
    ++FIELD(s32, object, 0x1a8);

    void *owner = FIELD(void *, object, 0x48);
    s32 mode = FIELD(s32, owner, 0x1f4);
    if (mode == 0 || mode == 2) {
        for (s32 i = 11; i >= 0; --i)
            func_0209a2ac(FIELD(void *, object, 0x4c + i * 4),
                          localTransform, 1);
    } else if (mode == 1) {
        static const s32 geometry[9][4] = {
            {0, 0, 0xf000, 0xf000},
            {0x10000, 0, 0x1f000, 0xf000},
            {0x20000, 0, 0x2f000, 0xf000},
            {0, 0x10000, 0xf000, 0x1f000},
            {0x10000, 0x10000, 0x1f000, 0x1f000},
            {0x20000, 0x10000, 0x2f000, 0x1f000},
            {0x30000, 0, 0x47000, 0x17000},
            {0x48000, 0, 0x5f000, 0x17000},
            {0x60000, 0, 0x7f000, 0x1f000}
        };
        void *scene = FIELD(void *, owner, 0x18);
        func_0209b7a0(scene, transform);
        func_0209c7e8(scene, 0x1c);

        for (s32 i = FIELD(s32, object, 0x1ac) - 1; i >= 0; --i) {
            s32 type = ((s16 *)FIELD(void *, object, 0x80))[i];
            if (type < 0 || type > 0x7fff)
                continue;
            s32 scale = data_ov041_02204c58[type];
            u16 phase = ((u16 *)FIELD(void *, object, 0x94))[i];
            s32 angle = phase >> 4;
            s32 sine = data_020c9670[angle * 2];
            s32 cosine = -data_020c9670[angle * 2 + 1];
            u8 *position = (u8 *)FIELD(void *, object, 0x84) + i * 12;
            s32 shape[8];

            /* Four rotated corner/axis pairs around the descriptor position. */
            shape[0] = fixed_mul(FIELD(s32, position, 4) +
                                 (-scale) * (-cosine - sine), 1);
            shape[1] = fixed_mul(FIELD(s32, position, 8) +
                                 (-scale) * (sine - cosine), 1);
            shape[2] = fixed_mul(FIELD(s32, position, 4) +
                                 cosine * scale - sine * -cosine, 1);
            shape[3] = fixed_mul(FIELD(s32, position, 8) +
                                 sine * scale + cosine * -cosine, 1);
            shape[4] = fixed_mul(FIELD(s32, position, 4) +
                                 scale * (-cosine - sine), 1);
            shape[5] = fixed_mul(FIELD(s32, position, 8) +
                                 scale * (sine - cosine), 1);
            shape[6] = fixed_mul(FIELD(s32, position, 4) +
                                 cosine * scale + sine * -cosine, 1);
            shape[7] = fixed_mul(FIELD(s32, position, 8) +
                                 sine * scale - cosine * -cosine, 1);
            func_0209c87c(scene, shape, geometry[type], type, -i);
        }
        func_0209a2ac(FIELD(void *, object, 0x7c), transform, 1);
    }
    func_02005058(localTransform);
}
