#include "tingle/types.h"

/*
 * Overlay 46 selection-panel construction. This recovered subsystem owns the
 * font state, four graphics-resource owner blocks, one header sprite, 32 item
 * sprites, and one auxiliary sprite. The exact build uses a documented
 * matching fallback because the original constructor's long live ranges and
 * array-construction calls are compiler-sensitive.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_020d77fc[];
extern "C" u8 data_020d780c[];
extern "C" void *gGameWork;
extern "C" void *data_020f4e14;
extern "C" void func_02071ea4(void *owner);
extern "C" void func_02071eb8(void *owner);
extern "C" void func_02071ee0(void *owner, void *font, u32 character,
                               u32 palette, u32 cell);
extern "C" void *__construct_array(void *array, s32 count, s32 stride,
                                     void (*construct)(void *),
                                     void (*destroy)(void *));
extern "C" void *func_020742cc(void *font);
extern "C" void *func_02073ffc(void *fontState, void *owner, s32 index);
extern "C" void func_02073e48(void *sprite, s32 a, s32 b, s32 c, s32 d,
                               s32 e, s32 f);
extern "C" bool GameWork_TestFlag(void *gameWork, u16 flag);
extern "C" void func_ov046_0220bac0(void *object);

/*
 * Construct a selection-panel UI object in caller-owned storage and return
 * that storage. `font` supplies the shared sprite-font state and `mode` is
 * retained at +0x114. The routine initializes owner blocks at +8, +0x14, and
 * +0x2C; acquires the font state at +4; creates sprites at +0x38, +0x3C..
 * +0xB8, and +0xBC; initializes the three selection slots at +0xC8/+0xD4;
 * and classifies eleven entries at +0xE0 from GameWork flags. It then loads
 * graphics and configures display hardware through func_ov046_0220bac0.
 *
 * The table fields below remain offset-derived: the two halfwords in each
 * data_020d77fc record are confirmed resource IDs, while data_020d780c's
 * +0x1E/+0x20 halfwords are confirmed GameWork flag IDs. Their semantic names
 * are not yet established.
 */
extern "C" void *func_ov046_0220b7bc(void *object, void *font, s32 mode)
{
    func_02071ea4((u8 *)object + 8);
    __construct_array((u8 *)object + 0x14, 2, 0x0c, func_02071ea4,
                      func_02071eb8);
    func_02071ea4((u8 *)object + 0x2c);

    FIELD(void *, object, 0) = font;
    FIELD(void *, object, 4) = func_020742cc(font);
    FIELD(s32, object, 0x114) = mode;
    FIELD(s32, object, 0xc0) = 0x18;
    FIELD(s32, object, 0x10c) = 0;
    FIELD(s32, object, 0x110) = 0;
    s32 entryCount = FIELD(s16, gGameWork, 0x12e);
    FIELD(s32, object, 0xc4) = entryCount > 10 ? 10 : entryCount;

    func_02071ee0((u8 *)object + 8, data_020f4e14, 0x3326, 0x3327, 0x3328);
    for (s32 i = 0; i < 2; ++i) {
        u16 *ids = (u16 *)(data_020d77fc + i * 8);
        func_02071ee0((u8 *)object + 0x14 + i * 0x0c, data_020f4e14,
                      ids[0], ids[1], ids[2]);
    }
    func_02071ee0((u8 *)object + 0x2c, data_020f4e14,
                  0x400c, 0x400d, 0x400e);

    void *sprite = func_02073ffc(FIELD(void *, object, 4),
                                  (u8 *)object + 8, 1);
    FIELD(void *, object, 0x38) = sprite;
    func_02073e48(sprite, 2, 0, 0, 2, 0, 6);
    for (s32 i = 0; i < 3; ++i) {
        FIELD(s32, object, 0xc8 + i * 4) = -1;
        FIELD(s32, object, 0xd4 + i * 4) = 0;
    }
    for (s32 i = 0; i < 32; ++i) {
        sprite = func_02073ffc(FIELD(void *, object, 4),
                               (u8 *)object + 0x14, 1);
        FIELD(void *, object, 0x3c + i * 4) = sprite;
        func_02073e48(sprite, 0, 0, 0, 2, 0x100, 4);
    }

    for (s32 i = 0; i < 11; ++i) {
        u16 firstFlag = FIELD(u16, data_020d780c, i * 0x34 + 0x1e);
        u16 secondFlag = FIELD(u16, data_020d780c, i * 0x34 + 0x20);
        s32 state = i < FIELD(s32, object, 0xc4) ? 1 : 0;
        if (mode != 0 && firstFlag != 0 &&
            GameWork_TestFlag(gGameWork, firstFlag)) {
            state = 2;
        } else if (secondFlag != 0 && GameWork_TestFlag(gGameWork, secondFlag)) {
            state = 2;
        }
        FIELD(s32, object, 0xe0 + i * 4) = state;
    }

    sprite = func_02073ffc(FIELD(void *, object, 4),
                           (u8 *)object + 0x2c, 1);
    FIELD(void *, object, 0xbc) = sprite;
    func_02073e48(sprite, 0, 0, 0, 2, 0, 6);
    func_ov046_0220bac0(object);
    return object;
}
