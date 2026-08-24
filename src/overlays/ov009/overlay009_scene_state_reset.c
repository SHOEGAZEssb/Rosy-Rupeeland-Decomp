#include "tingle/types.h"

/*
 * Overlay 9 scene-state reset. This recovered helper restores camera/transform
 * defaults and propagates them to an existing retained object when present.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern void func_02070958(void *member, s32 x, s32 y, s32 z);
extern void GraphicsSpriteRenderer_QueueStatePaletteUploads(void *manager, void *object);
#ifdef __cplusplus
}
#endif

/*
 * Set +0xF0/+0xF4 to 128/96, +0xF8 to 2, +0x10C to 1; clear +0x110,
 * +0x114, halfword +0x108, and +0x118; set +0xFC/+0x100/+0x104 and
 * +0x120/+0x124/+0x128 to 0x100; set +0xE8 to 8 and +0x134 to 16. If +0x88
 * is non-null, submit the latter vector through its +0x18 member and register
 * the object with the manager in data_020f4e14. Return no value. Effects are
 * delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov009_021fd294(void *state)
{
    void *object;

    FIELD(s32, state, 0xf0) = 0x80;
    FIELD(s32, state, 0xf4) = 0x60;
    FIELD(s32, state, 0xf8) = 2;
    FIELD(s32, state, 0x10c) = 1;
    FIELD(s32, state, 0x110) = 0;
    FIELD(s32, state, 0x114) = 0;
    FIELD(u16, state, 0x108) = 0;
    FIELD(s32, state, 0xfc) = 0x100;
    FIELD(s32, state, 0x100) = 0x100;
    FIELD(s32, state, 0x104) = 0x100;
    FIELD(s32, state, 0xe8) = 8;
    FIELD(s32, state, 0x118) = 0;
    FIELD(s32, state, 0x120) = 0x100;
    FIELD(s32, state, 0x124) = 0x100;
    FIELD(s32, state, 0x128) = 0x100;
    FIELD(s32, state, 0x134) = 0x10;

    object = FIELD(void *, state, 0x88);
    if (object != 0) {
        func_02070958(FIELD(void *, object, 0x18),
                      FIELD(s32, state, 0x120),
                      FIELD(s32, state, 0x124),
                      FIELD(s32, state, 0x128));
        GraphicsSpriteRenderer_QueueStatePaletteUploads(data_020f4e14, object);
    }
}
