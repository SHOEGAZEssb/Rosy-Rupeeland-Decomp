#include "tingle/types.h"

/* Overlay 30 startup and main menu-selection state handlers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern void *gDebugFont;
extern void *gLupyContext;
extern const s32 data_ov030_021ff780[];
extern const s32 data_ov030_021ff7a0[];
extern const s32 data_ov030_021ff768[];
extern const s32 data_ov030_021ff7b8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020755bc(void *);
extern void GamePhaseCurrencyHud_SetVisible(void *, s32);
extern void func_02075598(void *, void *);
extern void func_ov045_0220d2f8(s32, s32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 func_ov045_0220c9e8(s32, s32);
extern void func_ov030_021feb0c(void *);
extern void func_ov030_021fda14(void *, s32, s32);
extern void func_ov030_021fe768(void *);
extern s32 func_ov030_021fea00(void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern void func_020939d8(void *);
extern void func_02092260(void *, s32);
extern void func_02092c8c(s32, s32, void *);
#ifdef __cplusplus
}
#endif

/*
 * Startup state handler keyed by scene state +4. State 0 clears the sprite and
 * debug-font canvases, enables global Lupy mode 1, refreshes the font, begins
 * overlay-45 transition (8,0x21), sets scene flag bit 0, advances to state 1,
 * and clears timer +8. State 1 waits for the transition helper, then stores its
 * returned handle at +0x35C, opens the count-dependent initial dialog, and seeds
 * coordinates from table 0x021FF780. Every call services the normal frame and
 * returns zero; renderer, global context, dialog, transition, and scene state
 * may change.
 */
extern "C" s32 func_ov030_021feb64(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_020755bc(data_020f4e14[0]);
        func_020755bc(gDebugFont);
        GamePhaseCurrencyHud_SetVisible(gLupyContext, 1);
        func_02075598(gDebugFont, FIELD(void *, scene, 0x54));
        func_ov045_0220d2f8(8, 0x21);
        FIELD(u32, scene, 0x20) |= 1;
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        break;
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            FIELD(s32, scene, 0x35c) = func_ov045_0220c9e8(8, 0x21);
            func_ov030_021feb0c(scene);
            func_ov030_021fda14(scene, data_ov030_021ff780[0],
                                data_ov030_021ff780[1]);
        }
        break;
    }
    func_ov030_021fe768(scene);
    return 0;
}

/*
 * Main selection state handler. It first services dialog/input bridging, then:
 * state 0 enables renderer +0x78 and falls through to transition wait state 1;
 * state 2 accepts cancel controller +0x210 or either catalog controller +0xB8/
 * +0x164 when scene flag 0x20 is set; and state 3 delays ten frames before
 * returning to state 2. Selecting a nonempty catalog stores mode 1/2 at +0x390,
 * records the selected 0x24-byte catalog entry at +0x394, configures it with
 * arguments (1,-16) or (1,-16), and changes the coordinate target. Empty choices
 * route through scene state 9 and advance the local substate. Always services
 * the frame and returns zero; scene, dialog, renderer, controller, and catalog
 * selection state may change. The first argument to 0x02092C8C is observed as 1
 * for both branches even though +0x390 distinguishes modes.
 */
extern "C" s32 func_ov030_021fec44(void *scene)
{
    (void)func_ov030_021fea00(scene);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        FIELD(s32, FIELD(void *, scene, 0x78), 0x20) = 1;
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* The recovered control flow intentionally continues into state 1. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 2:
        if ((FIELD(u32, scene, 0x20) & 0x20) == 0)
            break;
        if (func_02095860((u8 *)scene + 0x210,
                          (u8 *)scene + 0x30, 0, 4) != 0) {
            func_020939d8(FIELD(void *, scene, 0x2bc));
            func_02092260(scene, 3);
            func_ov030_021fda14(scene, data_ov030_021ff7a0[0],
                                data_ov030_021ff7a0[1]);
            break;
        }
        if (func_02095860((u8 *)scene + 0xb8,
                          (u8 *)scene + 0x30, 0, 4) != 0) {
            if (FIELD(s32, scene, 0x384) != 0) {
                func_02092260(scene, 2);
                FIELD(s32, scene, 0x390) = 1;
                u8 *records = FIELD(u8 *, FIELD(void *, scene, 0x37c), 8);
                void *record = records + FIELD(s32, scene, 0x380) * 0x24;
                FIELD(void *, scene, 0x394) = record;
                func_02092c8c(1, -16, record);
                func_ov030_021fda14(scene, data_ov030_021ff768[0],
                                    data_ov030_021ff768[1]);
            } else {
                func_02092260(scene, 9);
                ++FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
            }
            break;
        }
        if (func_02095860((u8 *)scene + 0x164,
                          (u8 *)scene + 0x30, 0, 4) != 0) {
            if (FIELD(s32, scene, 0x38c) != 0) {
                func_02092260(scene, 2);
                FIELD(s32, scene, 0x390) = 2;
                u8 *records = FIELD(u8 *, FIELD(void *, scene, 0x37c), 8);
                void *record = records + FIELD(s32, scene, 0x388) * 0x24;
                FIELD(void *, scene, 0x394) = record;
                func_02092c8c(1, -16, record);
                func_ov030_021fda14(scene, data_ov030_021ff7b8[0],
                                    data_ov030_021ff7b8[1]);
            } else {
                func_02092260(scene, 9);
                ++FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
            }
        }
        break;
    case 3:
        if (++FIELD(s32, scene, 8) > 10) {
            --FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    func_ov030_021fe768(scene);
    return 0;
}
