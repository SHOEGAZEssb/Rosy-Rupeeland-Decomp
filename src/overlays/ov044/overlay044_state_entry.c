#include "tingle/types.h"

/*
 * Overlay 44 scene entry state. This recovered state handler prepares the
 * normal populated-panel presentation or, for an empty panel, starts an
 * auxiliary flow and waits for it to finish before installing the next state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_020f4e14;
extern "C" void *gDebugFont;
extern "C" u32 data_ov044_0220d2a8[2];
extern "C" u32 data_ov044_0220d2f0[2];
extern "C" void GraphicsSpriteRenderer_ClearTextBuffer(void *font);
extern "C" void func_ov044_0220c74c(void *object, u32 messageId);
extern "C" void func_ov044_0220bba4(void *panel);
extern "C" void func_ov044_0220c700(void *object);
extern "C" void func_ov044_0220be38(void *object, u32 first, u32 second);
extern "C" void func_02095940(void *presentation);
extern "C" void func_ov044_0220c8d0(void *object, void *content,
                                     s32 enabled, void *configuration);
extern "C" s32 func_02095dd4(void *auxiliary, void *position,
                               s32 direction);

/*
 * Advance scene substate +0x04 and always return zero. In substate zero, reset
 * both fonts and draw message 0x2A. A nonempty panel is rendered and updated,
 * then callback pair data_ov044_0220d2a8 is installed. An empty panel activates
 * presentation +0xD0, sets binding flag bit 2, clears layer flag bit 2 in
 * +0x48/+0x4C, creates an auxiliary with content token 12 and enabled mode,
 * advances to substate one, and resets counter +0x08. Object flag bit zero is
 * set after either entry path. In substate one, poll auxiliary +0x238 using
 * position +0x30 and the sign-expanded object flag bit five; on nonnegative
 * completion install callback pair data_ov044_0220d2f0.
 */
extern "C" s32 func_ov044_0220c97c(void *object)
{
    switch (FIELD(s32, object, 4)) {
    case 0: {
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        func_ov044_0220c74c(object, 0x2a);
        void *panel = FIELD(void *, object, 0x228);
        if (FIELD(s32, panel, 0x40) != 0) {
            func_ov044_0220bba4(panel);
            func_ov044_0220c700(object);
            func_ov044_0220be38(object, data_ov044_0220d2a8[0],
                                data_ov044_0220d2a8[1]);
        } else {
            func_02095940((u8 *)object + 0xd0);
            void *binding = FIELD(void *, object, 0xcc);
            FIELD(u16, binding, 0x24) |= 4;
            FIELD(u32, object, 0x48) &= ~4;
            FIELD(u32, object, 0x4c) &= ~4;
            func_ov044_0220c8d0(object, (void *)12, 1, 0);
            ++FIELD(s32, object, 4);
            FIELD(s32, object, 8) = 0;
        }
        FIELD(u32, object, 0x20) |= 1;
        break;
    }
    case 1: {
        s32 direction = (FIELD(u32, object, 0x20) & 0x20) ? -1 : 0;
        if (func_02095dd4(FIELD(void *, object, 0x238),
                          (u8 *)object + 0x30, direction) >= 0) {
            func_ov044_0220be38(object, data_ov044_0220d2f0[0],
                                data_ov044_0220d2f0[1]);
        }
        break;
    }
    }
    return 0;
}
