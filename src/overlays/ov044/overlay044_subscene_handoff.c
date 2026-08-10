#include "tingle/types.h"

/*
 * Overlay 44 subscene handoff. This recovered state machine transitions into
 * an overlay-15 child scene for the selected item, waits for its lifecycle,
 * destroys it, rebuilds this scene's panel graphics over three frames, and
 * restores the appropriate callback.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_020f4e14;
extern "C" const void *data_ov044_0220d358;
extern "C" void *gHeapContext;
extern "C" void *gGameWork;
extern "C" u32 data_ov044_0220d2c8[2];
extern "C" u32 data_ov044_0220d2c0[2];
extern "C" void func_02092c8c(s32 first, s32 second);
extern "C" s32 DisplayBrightness_IsMainTransitionComplete(void);
extern "C" void *func_ov044_0220bd98(void *panel);
extern "C" void func_02095940(void *presentation);
extern "C" void func_ov044_0220c5c0(void *object);
extern "C" void func_ov044_0220c6dc(void *object);
extern "C" void func_020755bc(void *font);
extern "C" void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                              void *heap);
extern "C" void *func_ov015_021fce58(void *storage, s32 mode, void *item);
extern "C" void func_ov044_0220c880(void *object);
extern "C" s32 func_02091fb0(void *scene, s32 phase);
extern "C" void func_020925f8(void);
extern "C" void func_ov044_0220c3e4(void *object);
extern "C" void func_ov044_0220c610(void *object);
extern "C" void func_ov044_0220c440(void *object);
extern "C" void func_ov044_0220bba4(void *panel);
extern "C" void func_ov044_0220c700(void *object);
extern "C" s32 GameWork_TestFlag(void *work, u32 flag);
extern "C" void func_ov044_0220be38(void *object, u32 first, u32 second);

typedef void (*VirtualDestroy)(void *object);

static void advance_handoff(void *object)
{
    ++FIELD(s32, object, 4);
    FIELD(s32, object, 8) = 0;
}

/*
 * Advance the overlay-15 handoff and always return zero. State 0 starts mode
 * (1,-16) and falls into state 1. Once the global transition reports ready,
 * state 1 captures the selected item, activates presentation +0x17C, preserves
 * and destroys the panel, resets text resources, allocates 0x304 bytes for an
 * overlay-15 scene at +0x23C, starts mode (1,0), and advances. States 2/3 drive
 * child phases zero/one around another (1,-16) transition. State 4 waits for
 * phase zero and global readiness, temporarily clears scene flag 0x400, invokes
 * child virtual slot +0x08, clears +0x23C, restores the flag, and advances.
 * State 5 rebuilds font/resources on frame one, panel rows on frame two, and
 * presentation/callback state on frame three; game-work flag 0x3B0 selects
 * callback data_ov044_0220d2c8, otherwise a final (1,0) transition leads to
 * state 6. State 6 flushes display state and installs data_ov044_0220d2c0 once
 * readiness is reported. Heap, overlay, graphics, and callback state change.
 */
extern "C" s32 func_ov044_0220cf60(void *object)
{
    switch (FIELD(s32, object, 4)) {
    case 0:
        func_02092c8c(1, -16);
        advance_handoff(object);
        /* Intentional same-frame fallthrough. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            void *record = func_ov044_0220bd98(FIELD(void *, object, 0x228));
            void *item = FIELD(void *, record, 0xc);
            func_02095940((u8 *)object + 0x17c);
            func_ov044_0220c5c0(object);
            func_ov044_0220c6dc(object);
            func_020755bc(data_020f4e14);
            void *scene = Heap_Alloc(0x304, data_ov044_0220d358, 4,
                                     gHeapContext);
            if (scene)
                scene = func_ov015_021fce58(scene, 0, item);
            FIELD(void *, object, 0x23c) = scene;
            func_02092c8c(1, 0);
            advance_handoff(object);
        } else {
            func_ov044_0220c880(object);
        }
        break;
    case 2:
        func_02091fb0(FIELD(void *, object, 0x23c), 0);
        if (DisplayBrightness_IsMainTransitionComplete())
            advance_handoff(object);
        break;
    case 3:
        if (func_02091fb0(FIELD(void *, object, 0x23c), 1)) {
            func_02092c8c(1, -16);
            advance_handoff(object);
        }
        break;
    case 4:
        func_02091fb0(FIELD(void *, object, 0x23c), 0);
        if (DisplayBrightness_IsMainTransitionComplete()) {
            FIELD(u32, object, 0x20) &= ~0x400;
            void *scene = FIELD(void *, object, 0x23c);
            if (scene) {
                void *vtable = FIELD(void *, scene, 0);
                FIELD(VirtualDestroy, vtable, 8)(scene);
            }
            FIELD(void *, object, 0x23c) = 0;
            FIELD(u32, object, 0x20) |= 0x400;
            advance_handoff(object);
        }
        break;
    case 5: {
        s32 frame = ++FIELD(s32, object, 8);
        if (frame == 1) {
            func_020755bc(data_020f4e14);
            FIELD(s32, object, 0x48) = 0x1c;
            func_020925f8();
            func_ov044_0220c3e4(object);
            func_ov044_0220c610(object);
        } else if (frame == 2) {
            func_ov044_0220c440(object);
            func_ov044_0220bba4(FIELD(void *, object, 0x228));
        } else if (frame == 3) {
            func_ov044_0220c700(object);
            if (GameWork_TestFlag(gGameWork, 0x3b0)) {
                func_ov044_0220be38(object, data_ov044_0220d2c8[0],
                                    data_ov044_0220d2c8[1]);
            } else {
                func_02092c8c(1, 0);
                advance_handoff(object);
            }
        }
        break;
    }
    case 6:
        func_ov044_0220c880(object);
        if (DisplayBrightness_IsMainTransitionComplete())
            func_ov044_0220be38(object, data_ov044_0220d2c0[0],
                                data_ov044_0220d2c0[1]);
        break;
    }
    return 0;
}
