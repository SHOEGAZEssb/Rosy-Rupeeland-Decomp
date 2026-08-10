#include "tingle/types.h"

/* Overlay 25 record-row and three-way action selection state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u8 data_ov025_02202de8[];
extern const u8 data_ov025_02202df8[];
extern const u8 data_ov025_02202e08[];
extern const u8 data_ov025_02202e40[];
extern const u8 data_ov025_02202ec8[];
extern const u8 data_ov025_02202ed8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02074110(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void func_02091bac(void *, s32, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void func_02092260(void *, s32);
extern s32 func_02092910(void *, void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern void func_ov025_021fd9e4(void *, s32);
extern s32 func_ov025_021fdc4c(void *);
extern void func_ov025_021fdea0(void *, s32);
extern s32 func_ov025_021ff0b0(void *);
extern void func_ov025_021ff254(void *, u32, u32);
extern void func_ov025_02200178(void *);
extern void func_ov025_022001f4(void *);
extern void func_ov025_02200564(void *);
extern void func_ov025_02200648(void *, s32);
extern void func_ov025_02200824(void *, s32);
#ifdef __cplusplus
}
#endif

static void advance_state(void *scene)
{
    ++FIELD(s32, scene, 4);
    FIELD(s32, scene, 8) = 0;
}

static void transition_pair(void *scene, const u32 *pair)
{
    func_ov025_021ff254(scene, pair[0], pair[1]);
}

/*
 * Runs one frame of record/action selection. States 0/1 debounce input, test
 * the three rows and three +0x2F4 action controllers, and either update the
 * selected row or dispatch a callback pair. State 2 waits for a chosen action;
 * states 10/11 animate a repeated row selection and branch by record status.
 * Touch/input, controller, row-owner, audio/UI, and scene state may change.
 * Scene maintenance always runs and the function returns zero.
 */
extern "C" s32 func_ov025_02200fe4(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov025_02200824(scene, 4);
        if (++FIELD(s32, scene, 8) > 20)
            advance_state(scene);
        break;
    case 1:
        func_ov025_02200824(scene, 4);
        if (!(FIELD(u32, scene, 0x20) & 0x20))
            break;
        for (s32 i = 0; i < 3; ++i) {
            void *row = FIELD(void *, scene, 0xe4 + i * 4);
            if (!func_02092910((u8 *)row + 0x10, (u8 *)scene + 0x30))
                continue;
            if (i == FIELD(s32, scene, 0x54)) {
                func_02092260(scene, 2);
                FIELD(s32, scene, 4) = 10;
                FIELD(s32, scene, 8) = 0;
            } else {
                func_02092260(scene, 0x2d02);
                func_ov025_02200648(scene, i);
                func_ov025_022001f4(scene);
                FIELD(s32, scene, 4) = 0;
                FIELD(s32, scene, 8) = 0;
            }
            goto maintained_return;
        }
        for (s32 i = 0; i < 3; ++i) {
            void *controller = (u8 *)scene + 0x2f4 + i * 0xac;
            if (func_02095860(controller, (u8 *)scene + 0x30, 0, 4)) {
                FIELD(s32, scene, 0x5b8) = i;
                func_02092260(scene, 2);
                advance_state(scene);
                goto maintained_return;
            }
        }
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        for (s32 i = 0; i < 3; ++i) {
            void *row = FIELD(void *, scene, 0xe4 + i * 4);
            func_02074110(FIELD(void *, row, 0xc));
            func_ov025_021fd9e4(row, 0);
        }
        FIELD(s32, scene, 0x54) = -1;
        func_ov025_02200564(scene);
        transition_pair(scene, (const u32 *)data_ov025_02202df8);
        break;
    case 2:
        if (func_ov025_021ff0b0((u8 *)scene + 0x2f4 +
                                FIELD(s32, scene, 0x5b8) * 0xac)) {
            static const u8 *const pairs[3] = {
                data_ov025_02202ec8,
                data_ov025_02202e40,
                data_ov025_02202e08,
            };
            s32 choice = FIELD(s32, scene, 0x5b8);
            if ((u32)choice < 3)
                transition_pair(scene, (const u32 *)pairs[choice]);
        }
        break;
    case 10:
        func_02091bac((u8 *)scene + 0x5fc, 3, 0, 4, 6);
        advance_state(scene);
        /* Setup intentionally falls through to the first animation update. */
    case 11: {
        s32 value = func_02091c7c((u8 *)scene + 0x5fc, 1);
        void *row = FIELD(void *, scene, 0xe4 + FIELD(s32, scene, 0x54) * 4);
        func_ov025_021fdea0(row, value);
        if (func_02091cf0((u8 *)scene + 0x5fc)) {
            if (func_ov025_021fdc4c(row))
                transition_pair(scene, (const u32 *)data_ov025_02202de8);
            else
                transition_pair(scene, (const u32 *)data_ov025_02202ed8);
        }
        break;
    }
    }
maintained_return:
    func_ov025_02200178(scene);
    return 0;
}
