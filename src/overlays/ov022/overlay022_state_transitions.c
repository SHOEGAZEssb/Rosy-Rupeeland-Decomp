#include "tingle/types.h"

/* Overlay 22 dialog input processing and the two short scene transition states. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u8 data_020d780c[];
extern void *data_ov022_02200508[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *gLupyContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseCurrencyHud_SetVisible(void *, s32);
extern void Sound_LoadGroup(void *, s32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern s32 TitleDialog_UpdateTextPage(void *, const void *);
extern void func_02095940(void *);
extern void Sound_Play(void *, s32, s32);
extern s32 GameWork_TestFlag(void *, u16);
extern void GameWork_SetFlag(void *, u16);
extern void func_ov022_021fd4d4(void *);
extern void func_ov022_021fd514(void *);
extern void func_ov022_021fd5d4(void *, void *);
extern s32 func_ov022_021fd6dc(void *);
extern void func_ov022_021fdd1c(void *, void *, void *);
extern void func_ov022_021ff0d0(void *);
extern void func_ov022_021ff220(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Copies the scene's 11-halfword dialog layout at +0x2C to a local mutable
 * template, folds scene flag bit 5 and dialog flag bits 0/1 into that template
 * and status-widget visibility, then advances dialog +0x2CC. Result bit 9
 * displays dialog text +0xE8; result bit 0 acknowledges the status widget and
 * makes the function return one. An already-set dialog bit 0 also returns one
 * immediately. Dialog/status state may change; other returns are zero.
 */
extern "C" s32 func_ov022_021ff368(void *scene)
{
    u16 layout[12];
    for (s32 i = 0; i < 11; ++i)
        layout[i] = FIELD(u16, scene, 0x2c + i * 2);

    void *dialog = FIELD(void *, scene, 0x2cc);
    u32 flags = FIELD(u32, dialog, 0x38);
    if (flags & 1)
        return 1;

    void *status = FIELD(void *, scene, 0x350);
    if (FIELD(u32, scene, 0x20) & 0x20) {
        if (flags & 2) {
            if (func_ov022_021fd6dc(status) != 0)
                func_ov022_021fd4d4(status);
            layout[1] |= 1;
        } else {
            layout[1] |= 2;
        }
    } else if ((flags & 2) && FIELD(s32, status, 0x28) == 2) {
        func_ov022_021fd514(status);
    }

    s32 result = TitleDialog_UpdateTextPage(dialog, layout);
    if (result & 0x200)
        func_ov022_021fd5d4(status, FIELD(void *, dialog, 0xe8));
    if (!(result & 1))
        return 0;
    func_ov022_021fd514(status);
    return 1;
}

/*
 * Exit-transition callback. On state step zero it stops/replays sound 0x122,
 * resets both font contexts, hides controller +0xA8, enables Lupy mode 1,
 * presents message key zero, installs the callback/argument pair at
 * data_ov022_02200508, and sets scene flag bit 0. Every call advances scene
 * teardown and returns zero. Audio, font, UI, callback, and teardown state
 * change.
 */
extern "C" s32 func_ov022_021ff480(void *scene)
{
    if (FIELD(s32, scene, 4) == 0) {
        Sound_LoadGroup(gSoundContext, 0x122);
        Sound_Play(gSoundContext, 0x122, 0);
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        func_02095940((u8 *)scene + 0xa8);
        GamePhaseCurrencyHud_SetVisible(gLupyContext, 1);
        func_ov022_021ff220(scene, 0);
        func_ov022_021fdd1c(scene, data_ov022_02200508[0],
                           data_ov022_02200508[1]);
        FIELD(u32, scene, 0x20) = (FIELD(u32, scene, 0x20) & ~1u) | 1u;
    }
    func_ov022_021ff0d0(scene);
    return 0;
}

/*
 * Completion-transition callback. On step zero it scans eleven 0x34-byte
 * descriptor records and counts entries whose +0x1C flag is set while +0x20
 * is clear; if all eleven qualify it sets persistent flag 0x39E. It then
 * increments state step +4 and clears timer +8. Every call advances teardown
 * and returns one. Persistent game work and scene teardown/state may change.
 */
extern "C" s32 func_ov022_021ff53c(void *scene)
{
    if (FIELD(s32, scene, 4) == 0) {
        s32 count = 0;
        for (s32 i = 0; i < 11; ++i) {
            const u8 *record = data_020d780c + i * 0x34;
            if (GameWork_TestFlag(gGameWork, FIELD(u16, record, 0x1c)) &&
                !GameWork_TestFlag(gGameWork, FIELD(u16, record, 0x20)))
                ++count;
        }
        if (count == 11)
            GameWork_SetFlag(gGameWork, 0x39e);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
    }
    func_ov022_021ff0d0(scene);
    return 1;
}
