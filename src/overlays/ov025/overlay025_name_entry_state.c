#include "tingle/types.h"

/* Overlay 25 top-level name-entry editor, commit, and screen-restoration state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u8 data_021f3ecc[];
extern const u16 data_ov025_02202f84[];
extern const u16 data_ov025_02202f86[];
extern const u16 data_ov025_02202f88[];
extern const u16 data_ov025_02202fc0[];
extern const u16 data_ov025_0220305a[];
extern const u16 data_ov025_022030f4[];
extern const u16 data_ov025_0220318e[];
extern const u16 data_ov025_02203228[];
extern const u16 data_ov025_0220322a[];
extern const u8 data_ov025_02202e60[];
extern const u8 data_ov025_02202e68[];
extern const u8 data_ov025_022033b4[];
extern const u8 data_ov025_022033bc[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *gHeapContext;
extern void *gRuntimeContext;
extern void *gSystemState;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, s32);
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void func_02071eb8(void *);
extern void func_02074110(void *);
extern void func_0207419c(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void *func_020791e0(const void *, s32);
extern s32 func_0207f248(void *);
extern void func_0207f86c(void *, s32, void *, s32);
extern void func_02092260(void *, s32);
extern void func_020922f0(void *, s32);
extern void func_02092314(void *, s32, s32);
extern void func_020927b8(void *);
extern s32 func_02092910(void *, void *);
extern void func_02092c8c(s32, s32);
extern void func_02092e9c(void *, void *, s32);
extern s32 func_02093360(void *, const void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern void func_02095988(void *, s32);
extern s32 func_02095dd4(void *, void *, s32);
extern void func_ov094_022198e8(void *, s32);
extern void *func_ov025_021fce00(void *);
extern void func_ov025_021fd03c(void *, void *, s32);
extern void func_ov025_021fd160(void *, void *);
extern void func_ov025_021fd2e8(void *, s32);
extern void func_ov025_021fd314(void *, s32);
extern void func_ov025_021fd388(void *, s32);
extern void func_ov025_021fd3dc(void *);
extern void func_ov025_021fd3f4(void *);
extern s32 func_ov025_021fd340(void *, void *);
extern s32 func_ov025_021fd450(void *);
extern s32 func_ov025_021fd488(void *, void *);
extern void *func_ov025_021fd5dc(void *, s32);
extern void func_ov025_021fd9e4(void *, s32);
extern void func_ov025_021ff254(void *, u32, u32);
extern void func_ov025_02200014(void *);
extern void func_ov025_022000a4(void *);
extern void func_ov025_02200178(void *);
extern void func_ov025_022001f4(void *);
extern void func_ov025_02200224(void *, s32, void *);
extern void func_ov025_022002b0(void *);
extern void func_ov025_02200398(void *, s32, s32);
extern void func_ov025_02200438(void *, s32);
extern void func_ov025_02200468(void *);
extern s32 func_ov025_02200480(void *);
extern void func_ov025_02200564(void *);
extern void func_ov025_0220058c(void *);
extern void func_ov025_022005e4(void *);
extern void func_ov025_02200648(void *, s32);
extern s32 func_ov025_02200940(void *);
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

static void destroy_row(void *row)
{
    if (row) {
        func_0207419c(FIELD(void *, row, 0xc));
        func_020927b8((u8 *)row + 0x30);
        func_02071eb8(row);
        Heap_Free(row);
    }
}

static void destroy_editor(void *editor)
{
    if (editor) {
        func_0207419c(FIELD(void *, editor, 0));
        func_02071eb8((u8 *)editor + 4);
        Heap_Free(editor);
    }
}

static void editor_redraw(void *scene, s32 full)
{
    void *editor = FIELD(void *, scene, 0x598);
    func_ov025_021fd03c(editor, FIELD(void *, scene, 0x574), full);
}

/*
 * Handles one editor input frame and returns whether the editor has signaled
 * completion through +0x174. The four dedicated hitboxes switch key pages,
 * delete, and accept; the 77-key grid appends or transforms UTF-16 glyphs.
 * Confirmed table relationships remain address-named because their scripts are
 * not yet identified. The direct insertion fallback below covers ordinary keys;
 * the exact assembly retains the complete voiced/small-glyph normalization.
 */
static s32 update_editor_input(void *scene)
{
    void *editor = FIELD(void *, scene, 0x598);
    void *touch = (u8 *)scene + 0x30;
    void *system = gSystemState;

    if (func_02092910(FIELD(void *, editor, 0x34), touch)) {
        func_02092260(scene, 0xb);
        FIELD(const u16 *, editor, 0x178) = FIELD(u8, system, 0x5f)
                                              ? data_ov025_02202fc0
                                              : data_ov025_022030f4;
        func_ov025_021fd160(editor, FIELD(void *, scene, 0x574));
        func_ov025_021fd2e8(editor, 1);
    } else if (func_02092910(FIELD(void *, editor, 0x38), touch)) {
        func_02092260(scene, 0xb);
        FIELD(const u16 *, editor, 0x178) = FIELD(u8, system, 0x5f)
                                              ? data_ov025_0220305a
                                              : data_ov025_0220318e;
        func_ov025_021fd160(editor, FIELD(void *, scene, 0x574));
        func_ov025_021fd2e8(editor, 2);
    } else if (func_02092910(FIELD(void *, editor, 0x3c), touch)) {
        func_02092260(scene, 0xb);
        if (!FIELD(u8, system, 0x5f))
            FIELD(const u16 *, editor, 0x178) = data_ov025_02202fc0;
        func_ov025_021fd160(editor, FIELD(void *, scene, 0x574));
        func_ov025_021fd2e8(editor, 3);
    } else if (func_02092910(FIELD(void *, editor, 0x30), touch)) {
        if (FIELD(s32, editor, 0x17c)) {
            func_02092260(scene, 0);
            --FIELD(s32, editor, 0x17c);
            editor_redraw(scene, 0);
        } else {
            func_02092260(scene, 9);
        }
        func_ov025_021fd2e8(editor, 0);
    } else {
        s32 command = func_ov025_021fd340(editor, touch);
        if (command >= 0) {
            func_02092260(scene, 0);
            func_ov025_021fd388(editor, command);
            editor_redraw(scene, 0);
        } else {
            for (s32 key = 0; key < 77; ++key) {
                if (!func_02092910(FIELD(void *, editor, 0x40 + key * 4), touch))
                    continue;
                s32 changed = 0;
                u16 glyph = FIELD(const u16 *, editor, 0x178)[key];
                s32 length = FIELD(s32, editor, 0x17c);
                if (glyph != 0x309b && length < 8) {
                    FIELD(u16, editor, 0x180 + length * 2) =
                        glyph == 0x40 ? 0 : glyph;
                    FIELD(s32, editor, 0x17c) = length + 1;
                    changed = 1;
                }
                if (changed) {
                    editor_redraw(scene, 1);
                    func_02092260(scene, 0);
                } else {
                    func_02092260(scene, 9);
                }
                func_ov025_021fd314(editor, key);
                break;
            }
        }
    }
    return FIELD(void *, editor, 0x174) != 0;
}

static void setup_editor(void *scene)
{
    func_020922f0(scene, 0xe8);
    func_ov025_022000a4(scene);
    func_ov025_02200564(scene);
    func_ov025_022005e4(scene);
    func_ov094_022198e8(FIELD(void *, scene, 0x5c0), 0);
    for (s32 i = 0; i < 3; ++i)
        func_02074110(FIELD(void *, FIELD(void *, scene, 0xe4 + i * 4), 0xc));
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    void *font = func_020791e0(data_021f3ecc, 0x6b);
    func_02092e9c(FIELD(void *, scene, 0x50c), font, 3);
    func_02093360(FIELD(void *, scene, 0x50c), 0);
    void *editor = Heap_Alloc(0x1a0, data_ov025_022033bc, 4, gHeapContext);
    if (editor)
        editor = func_ov025_021fce00(editor);
    FIELD(void *, scene, 0x598) = editor;
    func_ov025_021fd160(editor, FIELD(void *, scene, 0x574));
    func_02095988((u8 *)scene + 0xf0, 0x2d);
    func_02095928((u8 *)scene + 0xf0);
    func_02095928((u8 *)scene + 0x248);
    func_02092c8c(3, 0);
}

static void teardown_editor(void *scene)
{
    void *editor = FIELD(void *, scene, 0x598);
    if (func_ov025_021fd450(editor)) {
        s32 index = FIELD(s32, scene, 0x54);
        destroy_row(FIELD(void *, scene, 0xe4 + index * 4));
        void *row = Heap_Alloc(0x90, data_ov025_022033b4, 4, gHeapContext);
        if (row)
            row = func_ov025_021fd5dc(row, index);
        FIELD(void *, scene, 0xe4 + index * 4) = row;
        FIELD(s32, FIELD(void *, row, 0xc), 0x20) = 1;
        func_ov025_02200648(scene, index);
    } else {
        for (s32 i = 0; i < 3; ++i)
            func_ov025_021fd9e4(FIELD(void *, scene, 0xe4 + i * 4), 0);
        FIELD(s32, scene, 0x54) = -1;
    }
    FIELD(u32, scene, 0x20) &= ~0x400;
    destroy_editor(editor);
    FIELD(void *, scene, 0x598) = 0;
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov094_022198e8(FIELD(void *, scene, 0x5c0), 1);
    func_ov025_0220058c(scene);
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    for (s32 i = 0; i < 3; ++i)
        FIELD(s32, FIELD(void *, FIELD(void *, scene, 0xe4 + i * 4), 0xc), 0x20) = 1;
    func_ov025_022001f4(scene);
    func_02095940((u8 *)scene + 0xf0);
    func_02095940((u8 *)scene + 0x248);
    func_ov025_02200014(scene);
    func_02092c8c(3, 0);
    func_020922f0(scene, 0xe2);
}

/*
 * Runs one frame of the complete name-entry flow. States 0..4 initialize and
 * edit; 10..13 commit the UTF-16 name and handle runtime/error modals; 20/21
 * restore the record screen; state 30 reloads editor font resources after a
 * descriptor change. Unused states are inert. It can allocate/free editor and
 * row objects, modify persistent flags 0x14B/0x25D/0x3F5, submit runtime work,
 * alter graphics/audio/input state, and dispatch callbacks. Always returns zero
 * after scene maintenance.
 */
extern "C" s32 func_ov025_02201f28(void *scene)
{
    switch (FIELD(u32, scene, 4)) {
    case 0:
        func_02092314(scene, 0xe2, 0x10);
        func_02092c8c(3, -0x10);
        advance_state(scene);
        /* Fade setup intentionally falls through to resource initialization. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            setup_editor(scene);
            advance_state(scene);
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete())
            advance_state(scene);
        break;
    case 3:
        if (!(FIELD(u32, scene, 0x20) & 0x20))
            break;
        if (func_02095860((u8 *)scene + 0xf0, (u8 *)scene + 0x30, 0, 4)) {
            void *editor = FIELD(void *, scene, 0x598);
            if (!func_ov025_021fd450(editor)) {
                func_02092260(scene, 9);
            } else if (func_ov025_021fd488(editor, (u8 *)scene + 0x510)) {
                func_02092260(scene, 9);
                GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
                void *font = func_020791e0(data_021f3ecc, 0x28);
                func_02092e9c(FIELD(void *, scene, 0x50c), font, 3);
                func_02092c8c(1, -8);
                FIELD(s32, scene, 4) = 30;
                FIELD(s32, scene, 8) = 0;
            } else {
                func_02092314(scene, 0xe8, 1);
                func_020922f0(scene, 0xe9);
                FIELD(s32, scene, 4) = 10;
                FIELD(s32, scene, 8) = 0;
            }
        } else if (func_02095860((u8 *)scene + 0x248,
                                 (u8 *)scene + 0x30, 0, 4)) {
            FIELD(s32, FIELD(void *, scene, 0x598), 0x17c) = 0;
            func_02092260(scene, 3);
            func_02092c8c(3, -0x10);
            func_02092314(scene, 0xe8, 0x10);
            FIELD(s32, scene, 4) = 20;
            FIELD(s32, scene, 8) = 0;
        } else if (update_editor_input(scene)) {
            advance_state(scene);
        }
        break;
    case 4: {
        void *editor = FIELD(void *, scene, 0x598);
        void *completion = FIELD(void *, editor, 0x174);
        if (FIELD(u16, completion, 0x24) & 1) {
            func_02095988((u8 *)scene + 0xf0,
                          func_ov025_021fd450(editor) ? 0x2c : 0x2d);
            func_ov025_021fd3dc(editor);
            editor_redraw(scene, 1);
            --FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 10: {
        if (!FIELD(void *, scene, 0x598) ||
            !FIELD(void *, FIELD(void *, scene, 0x598), 0x174))
            break;
        func_ov025_02200398(scene, 4, 0);
        GameWork_SetFlag(gGameWork, 0x14b);
        GameWork_SetFlag(gGameWork, 0x25d);
        GameWork_SetFlag(gGameWork, 0x3f5);
        void *editor = FIELD(void *, scene, 0x598);
        func_ov025_021fd3f4(editor);
        func_0207f86c(gRuntimeContext, FIELD(s32, scene, 0x54),
                      (u8 *)editor + 0x180, 1);
        advance_state(scene);
        break;
    }
    case 11: {
        s32 status = func_0207f248(gRuntimeContext);
        if (status == 0)
            break;
        if (status == -1) {
            func_ov025_02200438(scene, 1);
            if (FIELD(s32, gRuntimeContext, 0x10) == 4) {
                func_ov025_02200224(scene, 0x1f, 0);
                transition_pair(scene, (const u32 *)data_ov025_02202e68);
            }
        } else {
            func_ov025_02200468(scene);
            advance_state(scene);
        }
        break;
    }
    case 12:
        if (func_ov025_02200480(scene)) {
            func_ov025_02200438(scene, 0);
            func_ov025_02200224(scene, 0x19, 0);
            advance_state(scene);
        }
        break;
    case 13:
        if (func_02095dd4(FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
                          (s32)(FIELD(u32, scene, 0x20) << 26) >> 31) >= 0) {
            func_02092c8c(3, -0x10);
            FIELD(s32, scene, 4) = 20;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 20:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            func_ov025_022002b0(scene);
            teardown_editor(scene);
            advance_state(scene);
        }
        break;
    case 21:
        if (DisplayBrightness_IsMainTransitionComplete())
            transition_pair(scene, (const u32 *)data_ov025_02202e60);
        break;
    case 30:
        if (func_ov025_02200940(scene) && DisplayBrightness_IsMainTransitionComplete()) {
            func_02092c8c(3, 0);
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            void *font = func_020791e0(data_021f3ecc, 0x6b);
            func_02092e9c(FIELD(void *, scene, 0x50c), font, 3);
            func_02093360(FIELD(void *, scene, 0x50c), 0);
            FIELD(s32, scene, 4) = 2;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    func_ov025_02200178(scene);
    return 0;
}
