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
extern u8 gHeapContext[];
extern void *gRuntimeContext;
extern u8 gSystemState[];

typedef struct TransitionPair {
    u32 callback;
    u32 argument;
} TransitionPair;

typedef struct GlyphPair {
    u16 first;
    u16 second;
} GlyphPair;

typedef struct GlyphTriplet {
    u16 first;
    u16 second;
    u16 third;
} GlyphTriplet;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, s32);
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void AnimationResourceState_Destroy(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void *LanguageLookupDatabase_GetResourceById(const void *, s32);
extern s32 RetailSaveContext_PollOperation(void *);
extern void RetailSaveContext_BeginNamedRecordWrite(void *, s32, void *, s32);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_PlayDirectSequence(void *, s32);
extern void SceneSound_StopDirectSequence(void *, s32, s32);
extern void TitleCharacterResourceCollection_Destroy(void *);
extern s32 GraphicsSpriteState_TestTouchPoint(void *, void *);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_SetText(void *, void *, s32);
extern s32 TitleDialog_UpdateTextPage(void *, const void *);
extern s32 SpriteMotionController_BeginHitResponse(void *, void *, s32, s32);
extern void SpriteMotionController_Show(void *);
extern void SpriteMotionController_Hide(void *);
extern void SpriteMotionController_SetAnimation(void *, s32);
extern s32 ModalState_UpdateInput(void *, void *, s32);
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
extern s32 func_ov025_021ff0b0(void *);
extern void func_ov025_021ff254(void *, TransitionPair);
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

/*
 * Runs one frame of the complete name-entry flow. States 0..4 initialize and
 * edit; 10..13 commit the UTF-16 name and handle runtime/error modals; 20/21
 * restore the record screen; state 30 reloads editor font resources after a
 * descriptor change. The editor applies the retail dakuten and handakuten
 * conversion tables before appending ordinary glyphs. Unused states are inert.
 * It can allocate/free editor and row objects, modify persistent flags
 * 0x14B/0x25D/0x3F5, submit runtime work, alter graphics/audio/input state, and
 * dispatch callbacks. Always returns zero after scene maintenance.
 */
extern "C" s32 func_ov025_02201f28(void *scene)
{
    /* These shared temporaries retain the retail lifetime grouping for MWCC. */
    s32 i;
    u16 first;
    const GlyphPair *pairs;
    s32 changed;
    u16 value;
    void *editor;

    switch (FIELD(s32, scene, 4)) {
    case 0:
        SceneSound_StopDirectSequence(scene, 0xe2, 0x10);
        DisplayBrightness_StartMaskedTransitions(3, -0x10);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Fade setup intentionally falls through to resource initialization. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            SceneSound_PlayDirectSequence(scene, 0xe8);
            func_ov025_022000a4(scene);
            func_ov025_02200564(scene);
            func_ov025_022005e4(scene);
            func_ov094_022198e8(FIELD(void *, scene, 0x5c0), 0);
            for (i = 0; i < 3; ++i) {
                GraphicsSpriteGroup_ReleaseIndexedEntries(
                    FIELD(void *,
                          FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0xc));
            }
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            void *font = LanguageLookupDatabase_GetResourceById(data_021f3ecc, 0x6b);
            TitleDialog_SetText(FIELD(void *, scene, 0x50c), font, 3);
            TitleDialog_UpdateTextPage(FIELD(void *, scene, 0x50c), 0);
            void *new_editor = Heap_Alloc(
                0x1a0, data_ov025_022033bc, 4, gHeapContext);
            if (new_editor)
                new_editor = func_ov025_021fce00(new_editor);
            FIELD(void *, scene, 0x598) = new_editor;
            func_ov025_021fd160(new_editor, FIELD(void *, scene, 0x574));
            SpriteMotionController_SetAnimation((u8 *)scene + 0xf0, 0x2d);
            SpriteMotionController_Show((u8 *)scene + 0xf0);
            SpriteMotionController_Show((u8 *)scene + 0x248);
            DisplayBrightness_StartMaskedTransitions(3, 0);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 3:
        if (!((s32)(FIELD(u32, scene, 0x20) << 26) >> 31))
            break;
        if (SpriteMotionController_BeginHitResponse((u8 *)scene + 0xf0, (u8 *)scene + 0x30, 0, 4)) {
            if (func_ov025_021fd450(FIELD(void *, scene, 0x598))) {
                if (func_ov025_021fd488(
                        FIELD(void *, scene, 0x598),
                        (u8 *)scene + 0x510)) {
                    SceneSound_PlayPackedEffect(scene, 9);
                    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
                    void *font = LanguageLookupDatabase_GetResourceById(data_021f3ecc, 0x28);
                    TitleDialog_SetText(FIELD(void *, scene, 0x50c), font, 3);
                    DisplayBrightness_StartMaskedTransitions(1, -8);
                    FIELD(s32, scene, 4) = 30;
                    FIELD(s32, scene, 8) = 0;
                    goto maintained_return;
                } else {
                    SceneSound_StopDirectSequence(scene, 0xe8, 1);
                    SceneSound_PlayDirectSequence(scene, 0xe9);
                    FIELD(s32, scene, 4) = 10;
                    FIELD(s32, scene, 8) = 0;
                    goto maintained_return;
                }
            } else {
                SceneSound_PlayPackedEffect(scene, 9);
                goto maintained_return;
            }
        } else if (SpriteMotionController_BeginHitResponse((u8 *)scene + 0x248,
                                 (u8 *)scene + 0x30, 0, 4)) {
            FIELD(s32, FIELD(void *, scene, 0x598), 0x17c) = 0;
            SceneSound_PlayPackedEffect(scene, 3);
            DisplayBrightness_StartMaskedTransitions(3, -0x10);
            SceneSound_StopDirectSequence(scene, 0xe8, 0x10);
            FIELD(s32, scene, 4) = 20;
            FIELD(s32, scene, 8) = 0;
            goto maintained_return;
        } else if (GraphicsSpriteState_TestTouchPoint(
                       FIELD(void *, FIELD(void *, scene, 0x598), 0x34),
                       (u8 *)scene + 0x30)) {
            SceneSound_PlayPackedEffect(scene, 0xb);
            if (FIELD(u8, gSystemState, 0x5f)) {
                FIELD(const u16 *, FIELD(void *, scene, 0x598), 0x178) =
                    data_ov025_02202fc0;
            } else {
                FIELD(const u16 *, FIELD(void *, scene, 0x598), 0x178) =
                    data_ov025_022030f4;
            }
            func_ov025_021fd160(FIELD(void *, scene, 0x598),
                                FIELD(void *, scene, 0x574));
            func_ov025_021fd2e8(FIELD(void *, scene, 0x598), 1);
        } else if (GraphicsSpriteState_TestTouchPoint(
                       FIELD(void *, FIELD(void *, scene, 0x598), 0x38),
                       (u8 *)scene + 0x30)) {
            SceneSound_PlayPackedEffect(scene, 0xb);
            if (FIELD(u8, gSystemState, 0x5f)) {
                FIELD(const u16 *, FIELD(void *, scene, 0x598), 0x178) =
                    data_ov025_0220305a;
            } else {
                FIELD(const u16 *, FIELD(void *, scene, 0x598), 0x178) =
                    data_ov025_0220318e;
            }
            func_ov025_021fd160(FIELD(void *, scene, 0x598),
                                FIELD(void *, scene, 0x574));
            func_ov025_021fd2e8(FIELD(void *, scene, 0x598), 2);
        } else if (GraphicsSpriteState_TestTouchPoint(
                       FIELD(void *, FIELD(void *, scene, 0x598), 0x3c),
                       (u8 *)scene + 0x30)) {
            SceneSound_PlayPackedEffect(scene, 0xb);
            if (!FIELD(u8, gSystemState, 0x5f)) {
                FIELD(const u16 *, FIELD(void *, scene, 0x598), 0x178) =
                    data_ov025_02202fc0;
            }
            func_ov025_021fd160(FIELD(void *, scene, 0x598),
                                FIELD(void *, scene, 0x574));
            func_ov025_021fd2e8(FIELD(void *, scene, 0x598), 3);
        } else if (GraphicsSpriteState_TestTouchPoint(
                       FIELD(void *, FIELD(void *, scene, 0x598), 0x30),
                       (u8 *)scene + 0x30)) {
            if (FIELD(s32, FIELD(void *, scene, 0x598), 0x17c)) {
                SceneSound_PlayPackedEffect(scene, 0);
                --FIELD(s32, FIELD(void *, scene, 0x598), 0x17c);
                func_ov025_021fd03c(FIELD(void *, scene, 0x598),
                                    FIELD(void *, scene, 0x574), 1);
            } else {
                SceneSound_PlayPackedEffect(scene, 9);
            }
            func_ov025_021fd2e8(FIELD(void *, scene, 0x598), 0);
        } else {
            s32 command = func_ov025_021fd340(
                FIELD(void *, scene, 0x598), (u8 *)scene + 0x30);
            if (command >= 0) {
                SceneSound_PlayPackedEffect(scene, 0);
                func_ov025_021fd388(FIELD(void *, scene, 0x598), command);
                func_ov025_021fd03c(FIELD(void *, scene, 0x598),
                                    FIELD(void *, scene, 0x574), 0);
            } else {
                for (i = 0; i < 77; ++i) {
                    editor = FIELD(void *, scene, 0x598);
                    if (!GraphicsSpriteState_TestTouchPoint(
                            FIELD(void *, (u8 *)editor + i * 4, 0x40),
                            (u8 *)scene + 0x30)) {
                        continue;
                    }
                    editor = FIELD(void *, scene, 0x598);
                    const u16 *keymap =
                        FIELD(const u16 *, editor, 0x178);
                    u16 glyph = keymap[i];
                    changed = 0;
                    if (glyph == 0x309b) {
                        s32 length = FIELD(s32, editor, 0x17c);
                        if (length != 0) {
                            s32 previous = length - 1;
                            u8 *character =
                                (u8 *)editor + previous * 2 + 0x100;
                            pairs = (const GlyphPair *)
                                data_ov025_02203228;
                            for (s32 j = 0; j < 41; ++j) {
                                value = FIELD(u16, character, 0x80);
                                first = pairs[j].first;
                                if (first == value) {
                                    FIELD(u16, (u16 *)editor + previous,
                                          0x180) =
                                        ((const GlyphPair *)
                                             data_ov025_0220322a)[j].first;
                                    changed = 1;
                                    break;
                                }
                                if (pairs[j].second == value) {
                                    FIELD(u16, (u16 *)editor + previous,
                                          0x180) = first;
                                    changed = 1;
                                    break;
                                }
                            }
                            if (!changed) {
                                const GlyphTriplet *triplets =
                                    (const GlyphTriplet *)
                                        data_ov025_02202f84;
                                for (s32 j = 0; j < 10; ++j) {
                                    editor = FIELD(void *, scene, 0x598);
                                    u8 *candidate =
                                        (u8 *)editor + previous * 2 + 0x100;
                                    if (triplets[j].third ==
                                        FIELD(u16, candidate, 0x80)) {
                                        FIELD(u16, candidate, 0x80) =
                                            ((const GlyphTriplet *)
                                                 data_ov025_02202f86)[j].first;
                                        changed = 1;
                                        break;
                                    }
                                }
                            }
                        }
                    } else if (glyph == 0x309c) {
                        s32 length = FIELD(s32, editor, 0x17c);
                        if (length != 0) {
                            s32 previous = length - 1;
                            u8 *character =
                                (u8 *)editor + previous * 2 + 0x100;
                            const GlyphTriplet *triplets =
                                (const GlyphTriplet *)data_ov025_02202f84;
                            for (s32 j = 0; j < 10; ++j) {
                                value = FIELD(u16, character, 0x80);
                                first = triplets[j].first;
                                if (first == value) {
                                    FIELD(u16, (u16 *)editor + previous,
                                          0x180) =
                                        ((const GlyphTriplet *)
                                             data_ov025_02202f88)[j].first;
                                    changed = 1;
                                    break;
                                }
                                if (triplets[j].second == value) {
                                    FIELD(u16, (u16 *)editor + previous,
                                          0x180) =
                                        ((const GlyphTriplet *)
                                             data_ov025_02202f88)[j].first;
                                    changed = 1;
                                    break;
                                }
                                if (triplets[j].third == value) {
                                    FIELD(u16, (u16 *)editor + previous,
                                          0x180) = first;
                                    changed = 1;
                                    break;
                                }
                            }
                        }
                    } else if (FIELD(s32, editor, 0x17c) < 8) {
                        s32 length = FIELD(s32, editor, 0x17c);
                        if (glyph == 0x40) {
                            FIELD(u16,
                                  (u8 *)editor + length * 2 + 0x100,
                                  0x80) = (u16)changed;
                        } else {
                            FIELD(u16,
                                  (u8 *)editor + length * 2 + 0x100,
                                  0x80) = glyph;
                        }
                        ++FIELD(s32, FIELD(void *, scene, 0x598), 0x17c);
                        changed = 1;
                    }
                    if (changed) {
                        func_ov025_021fd03c(FIELD(void *, scene, 0x598),
                                            FIELD(void *, scene, 0x574), 1);
                        SceneSound_PlayPackedEffect(scene, 0);
                    } else {
                        SceneSound_PlayPackedEffect(scene, 9);
                    }
                    func_ov025_021fd314(FIELD(void *, scene, 0x598), i);
                    break;
                }
            }
        }
        if (FIELD(void *, FIELD(void *, scene, 0x598), 0x174)) {
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 4: {
        void *active_editor = FIELD(void *, scene, 0x598);
        void *completion = FIELD(void *, active_editor, 0x174);
        u16 completed = FIELD(u16, completion, 0x24) & 1;
        if (completed) {
            if (func_ov025_021fd450(active_editor)) {
                SpriteMotionController_SetAnimation((u8 *)scene + 0xf0, 0x2c);
            } else {
                SpriteMotionController_SetAnimation((u8 *)scene + 0xf0, 0x2d);
            }
            func_ov025_021fd3dc(FIELD(void *, scene, 0x598));
            func_ov025_021fd03c(FIELD(void *, scene, 0x598),
                                FIELD(void *, scene, 0x574), 1);
            --FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 10: {
        if (!func_ov025_021ff0b0((u8 *)scene + 0xf0))
            break;
        func_ov025_02200398(scene, 4, 0);
        GameWork_SetFlag(gGameWork, 0x14b);
        GameWork_SetFlag(gGameWork, 0x25d);
        GameWork_SetFlag(gGameWork, 0x3f5);
        func_ov025_021fd3f4(FIELD(void *, scene, 0x598));
        RetailSaveContext_BeginNamedRecordWrite(gRuntimeContext, FIELD(s32, scene, 0x54),
                      (u8 *)FIELD(void *, scene, 0x598) + 0x180, 1);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        break;
    }
    case 11: {
        s32 status = RetailSaveContext_PollOperation(gRuntimeContext);
        if (status == 0)
            break;
        if (status == -1) {
            func_ov025_02200438(scene, 1);
            if (FIELD(s32, gRuntimeContext, 0x10) == 4) {
                func_ov025_02200224(scene, 0x1f, 0);
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202e68);
            }
        } else {
            func_ov025_02200468(scene);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 12:
        if (func_ov025_02200480(scene)) {
            func_ov025_02200438(scene, 0);
            func_ov025_02200224(scene, 0x19, 0);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 13:
        if (ModalState_UpdateInput(FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
                          (s32)(FIELD(u32, scene, 0x20) << 26) >> 31) >= 0) {
            DisplayBrightness_StartMaskedTransitions(3, -0x10);
            FIELD(s32, scene, 4) = 20;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 20:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            func_ov025_022002b0(scene);
            if (func_ov025_021fd450(FIELD(void *, scene, 0x598))) {
                s32 index = FIELD(s32, scene, 0x54);
                void *row = FIELD(void *,
                                  (u8 *)scene + index * 4, 0xe4);
                if (row) {
                    GraphicsSpriteGroup_Destroy(FIELD(void *, row, 0xc));
                    TitleCharacterResourceCollection_Destroy((u8 *)row + 0x30);
                    AnimationResourceState_Destroy(row);
                    Heap_Free(row);
                }
                row = Heap_Alloc(
                    0x90, data_ov025_022033b4, 4, gHeapContext);
                if (row)
                    row = func_ov025_021fd5dc(
                        row, FIELD(s32, scene, 0x54));
                FIELD(void *,
                      (u8 *)scene + FIELD(s32, scene, 0x54) * 4,
                      0xe4) = row;
                FIELD(s32,
                      FIELD(void *,
                            FIELD(void *,
                                  (u8 *)scene +
                                      FIELD(s32, scene, 0x54) * 4,
                                  0xe4),
                            0xc),
                      0x20) = 1;
                func_ov025_02200648(scene, FIELD(s32, scene, 0x54));
            } else {
                for (s32 row_index = 0; row_index < 3; ++row_index) {
                    func_ov025_021fd9e4(
                        FIELD(void *, (u8 *)scene + row_index * 4, 0xe4), 0);
                }
                FIELD(s32, scene, 0x54) = -1;
            }
            FIELD(u32, scene, 0x20) &= ~0x400;
            void *retired_editor = FIELD(void *, scene, 0x598);
            if (retired_editor) {
                GraphicsSpriteGroup_Destroy(FIELD(void *, retired_editor, 0));
                AnimationResourceState_Destroy((u8 *)retired_editor + 4);
                Heap_Free(retired_editor);
            }
            FIELD(void *, scene, 0x598) = 0;
            FIELD(u32, scene, 0x20) |= 0x400;
            func_ov094_022198e8(FIELD(void *, scene, 0x5c0), 1);
            func_ov025_0220058c(scene);
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            for (s32 row_index = 0; row_index < 3; ++row_index) {
                FIELD(s32,
                      FIELD(void *,
                            FIELD(void *, (u8 *)scene + row_index * 4, 0xe4),
                            0xc),
                      0x20) = 1;
            }
            func_ov025_022001f4(scene);
            SpriteMotionController_Hide((u8 *)scene + 0xf0);
            SpriteMotionController_Hide((u8 *)scene + 0x248);
            func_ov025_02200014(scene);
            DisplayBrightness_StartMaskedTransitions(3, 0);
            SceneSound_PlayDirectSequence(scene, 0xe2);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 21:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202e60);
        }
        break;
    case 30:
        if (func_ov025_02200940(scene) && DisplayBrightness_IsMainTransitionComplete()) {
            DisplayBrightness_StartMaskedTransitions(3, 0);
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            void *font = LanguageLookupDatabase_GetResourceById(data_021f3ecc, 0x6b);
            TitleDialog_SetText(FIELD(void *, scene, 0x50c), font, 3);
            TitleDialog_UpdateTextPage(FIELD(void *, scene, 0x50c), 0);
            FIELD(s32, scene, 4) = 2;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
maintained_return:
    func_ov025_02200178(scene);
    return 0;
}
