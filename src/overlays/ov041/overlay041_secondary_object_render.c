#include "tingle/types.h"

/*
 * Overlay 41 secondary-object render propagation. This recovered routine
 * transforms its lane/special children and generates ten animated, colored
 * nine-column grid strips for the scene renderer.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_0209a2ac(void *, const void *, s32);
void VecFx32Object_InitCopy(void *, const void *);
void VecFx32Object_InitComponents(void *, s32, s32, s32);
void VecFx32Object_Destroy(void *);
s32 func_020befec(s32, s32);
void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
void VecFx32Object_Assign(void *, const void *);
void func_0209c9d4(void *);
void func_0209cb74(void *, const void *, const void *, s32,
                   s32, const void *, s32);
extern void *data_020f4e14;
}

static s32 triangle(s32 value, s32 period)
{
    s32 remainder = value % period;
    return remainder >= period / 2 ? period - remainder : remainder;
}

static u16 grid_color(u16 counter)
{
    s32 value = triangle(counter, 120);
    s32 half = value / 2;
    s32 greenBlue = 31 - half;
    s32 red = 31 - half / 2;
    return (u16)(red | (greenBlue << 5) | (greenBlue << 10));
}

/*
 * Apply transform to the object and four lane renderers. Both special children
 * receive a pure vertical translation of -0xC0000 on capture bank zero, or
 * zero on the alternate bank. Mode two then returns. Other modes optionally
 * issue an inferred clipped marker draw, copy transform into the scene object,
 * advance a six-frame/four-step texture animation, and submit ten grid strips.
 * Each strip has two rows of nine vertices: X is column*54-90, Y combines row
 * spacing, object threshold and a triangular counter wave; texture coordinates
 * mirror across four columns and colors pulse from the same counters. The
 * temporary transforms are destroyed. No value is returned; scene rendering
 * state is updated.
 */
extern "C" void func_ov041_02200ce8(void *object, const void *transform)
{
    func_0209a2ac(object, transform, 1);
    u8 localTransform[0x10];
    VecFx32Object_InitCopy(localTransform, transform);
    for (s32 i = 3; i >= 0; --i)
        func_0209a2ac(FIELD(void *, object, 0x4c + i * 4),
                      localTransform, 1);

    void *owner = FIELD(void *, object, 0x48);
    s32 bankOffset = FIELD(s32, owner, 0x1ec) == 0 ? -0xc0000 : 0;
    u8 specialTransform[0x10];
    VecFx32Object_InitComponents(specialTransform, 0, bankOffset, 0);
    func_0209a2ac(FIELD(void *, object, 0x5c), specialTransform, 1);
    func_0209a2ac(FIELD(void *, object, 0x60), specialTransform, 1);

    if (FIELD(s32, owner, 0x1f4) == 2) {
        VecFx32Object_Destroy(specialTransform);
        VecFx32Object_Destroy(localTransform);
        return;
    }

    if (FIELD(s32, owner, 0x1ec) == 0) {
        s32 span = (FIELD(s32, owner, 0x174) - 4) * 0x60;
        s32 marker = (func_020befec(FIELD(s32, object, 0x15c), span) *
                      0x90 >> 12) + 0x10;
        if (marker < 0xa8)
            GraphicsSpriteCanvas_FillRect(data_020f4e14, 0xf2, marker, 0xf5, 0xaa, 4);
    }

    void *scene = FIELD(void *, owner, 0x18);
    VecFx32Object_Assign((u8 *)scene + 0x84, transform);
    func_0209c9d4(scene);
    s32 animation = ((++FIELD(s32, object, 0x158) / 6) % 4) << 6;

    for (s32 row = 0; row < 10; ++row) {
        s32 positions[36];
        s32 texcoords[36];
        u16 colors[18];
        s32 baseGroup = row / 2 + (row <= 1 ? 2 : 0);
        s32 nextGroup = baseGroup + 1;
        for (s32 column = 0; column < 9; ++column) {
            u16 upper = FIELD(u16, object,
                              0xa4 + row * 18 + column * 2);
            u16 lower = FIELD(u16, object,
                              0xb6 + row * 18 + column * 2);
            s32 vertex = column * 4;
            s32 x = column * 54 - 90;
            positions[vertex + 0] = x;
            positions[vertex + 1] = row * 48 + triangle(upper, 100) / 4 +
                                    (FIELD(s32, object, 0x15c) >> 12) - 38;
            positions[vertex + 2] = x;
            positions[vertex + 3] = (row + 1) * 48 +
                                    triangle(lower, 100) / 4 +
                                    (FIELD(s32, object, 0x15c) >> 12) - 38;

            s32 mirrored = column / 4;
            if (mirrored >= 2)
                mirrored = 4 - mirrored;
            texcoords[vertex + 0] = (mirrored << 17) + (animation << 12);
            texcoords[vertex + 1] = baseGroup << 17;
            texcoords[vertex + 2] = (mirrored << 17) + (animation << 12);
            texcoords[vertex + 3] = nextGroup << 17;
            colors[column * 2 + 0] = grid_color(upper);
            colors[column * 2 + 1] = grid_color(lower);
        }
        func_0209cb74(scene, positions, texcoords, 0x1e, 0x12, colors, 0);
    }
    VecFx32Object_Destroy(specialTransform);
    VecFx32Object_Destroy(localTransform);
}
