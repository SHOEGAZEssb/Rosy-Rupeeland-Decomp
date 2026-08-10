#include "tingle/types.h"

/*
 * Overlay 41 secondary scene-object construction. This recovered constructor
 * creates four lane renderers, two shared special renderers, four embedded
 * position records, and a randomized ten-by-nine value grid.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void *func_ov041_021ff1cc(void *);
void __construct_array(void *, s32, s32, void *, void *);
void func_ov041_021fd000(void *);
void func_ov041_021fce00(void *);
void *func_0209a208(void *, s32, s32, s32, s32, s32);
void GraphicsSpriteState_SetAnimationIndex(void *, s32);
void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
u32 genrand_int32(void);
extern u8 data_ov041_0220582c;
extern void *data_020f4e14;
}

typedef void (*PlacementCallback)(void *, void *, s32, s32, s32, s32);

static void place_child(void *object, void *render, s32 x, s32 y,
                        s32 resourceMode)
{
    PlacementCallback place = *(PlacementCallback *)FIELD(void *, object, 0);
    place(object, render, x, y, 0, resourceMode);
}

/*
 * Initialize object, construct four 12-byte coordinate records at 0x64, and
 * create four lane resources using IDs 0x23A5..0x23A7. Mode two initially hides
 * those lanes; other modes show them. Two resources using IDs 0x1375..0x1377
 * are placed at (0xF4000,-0x60000), configured non-rendering internally, and
 * exposed as outer objects. A shared resource field is set to 31, the 90
 * halfword cells at 0xA4 receive random values [0,99], and counters are cleared.
 * The object pointer is returned; RNG and graphics-resource state are changed.
 */
extern "C" void *func_ov041_02200660(void *object, void *owner,
                                      void *resourceContext)
{
    func_ov041_021ff1cc(object);
    FIELD(void *, object, 0) = &data_ov041_0220582c;
    __construct_array((u8 *)object + 0x64, 4, 12,
                      (void *)func_ov041_021fd000,
                      (void *)func_ov041_021fce00);
    FIELD(void *, object, 0x48) = owner;

    for (s32 i = 3; i >= 0; --i) {
        void *render = func_0209a208(object, 0x23a5, 0x23a6, 0x23a7,
                                     (s32)resourceContext, 2);
        FIELD(void *, object, 0x4c + i * 4) = render;
        place_child(object, render, i << 18, 0, 0);
        if (FIELD(s32, owner, 0x1f4) == 2)
            FIELD(u16, render, 0x42) |= 4;
        else
            FIELD(u16, render, 0x42) &= ~4;
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, render, 0x0c), (i >> 1) + 3);
        FIELD(s32, object, 0x68 + i * 12) = (i << 18) + 0x20000;
        FIELD(u16, object, 0x94 + i * 2) = (u16)(i * 0x1388);
        FIELD(u16, object, 0x9c + i * 2) = 0x2bc;
    }

    void *first = func_0209a208(object, 0x1375, 0x1376, 0x1377,
                                 (s32)resourceContext, 2);
    FIELD(void *, object, 0x5c) = first;
    place_child(object, first, 0xf4000, -0x60000, 0);
    FIELD(u8, FIELD(void *, first, 0x0c), 0x3a) = 0;
    FIELD(u16, first, 0x42) &= ~4;
    FIELD(s32, first, 0x44) = -0x80;

    void *second = func_0209a208(object, 0x1375, 0x1376, 0x1377,
                                  (s32)resourceContext, 2);
    FIELD(void *, object, 0x60) = second;
    s32 secondMode = FIELD(s32, owner, 0x1f4) == 2 ? 2 : 1;
    place_child(object, second, 0xf4000, -0x60000, secondMode);
    FIELD(u8, FIELD(void *, second, 0x0c), 0x3a) = 0;
    FIELD(u16, second, 0x42) &= ~4;

    void *shared = GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14);
    FIELD(u16, shared, 8) = 0x1f;
    for (s32 row = 0; row < 10; ++row) {
        for (s32 column = 0; column < 9; ++column)
            FIELD(u16, object, 0xa4 + row * 18 + column * 2) =
                (u16)(genrand_int32() % 100);
    }
    FIELD(s32, object, 0x15c) = 0;
    FIELD(s32, object, 0x158) = 0;
    return object;
}
