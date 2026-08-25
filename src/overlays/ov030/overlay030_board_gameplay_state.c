#include "tingle/types.h"

/* Overlay 30 selector-board gameplay, rewards, retries, and countdown pulses. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGamePhaseCurrencyHud;
extern const s32 data_ov030_021ff778[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov030_021fea00(void *);
extern void func_ov030_021fd694(void *, const void *);
extern void func_ov030_021fd720(void *, const void *);
extern s32 func_ov030_021ff574(void *);
extern void func_02092260(void *, s32);
extern void TitleDialog_ClearTextRect(void *);
extern void func_ov030_021fe954(void *, u16);
extern void func_020922f0(void *, s32);
extern s32 GamePhaseCurrencyHud_GetCurrency(const void *);
extern s32 func_ov045_0220b924(void *, s32, s32, s32);
extern void GamePhaseCurrencyHud_AddCurrency(void *, s32, s32);
extern s32 func_ov045_0220b9b8(void *);
extern s32 func_ov045_0220bc34(void *);
extern void SpriteMotionController_Show(void *);
extern s32 SpriteMotionController_BeginHitResponse(void *, void *, s32, s32);
extern void TitleInterpolatedValue_Configure(void *, s32, s32, s32, s32);
extern void func_ov030_021fda14(void *, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void func_ov030_021fd434(void *);
extern void func_ov030_021fe768(void *);
#ifdef __cplusplus
}
#endif

/* Copies or line-traces the live pointer into the selector widget. */
static void update_board_pointer(void *scene)
{
    void *board = FIELD(void *, scene, 0x2c4);
    if ((FIELD(u32, scene, 0x20) & 0x20) != 0)
        func_ov030_021fd694((u8 *)board + 0x1b8, (u8 *)scene + 0x30);
    else if ((FIELD(u32, scene, 0x20) & 0x200) != 0)
        func_ov030_021fd720(board, (u8 *)scene + 0x30);
}

/* Routes the three board timers to their recovered scene transition IDs. */
static void service_board_timers(void *scene, s32 includeSuccessTimers)
{
    void *board = FIELD(void *, scene, 0x2c4);
    if (includeSuccessTimers) {
        if (func_ov030_021ff574((u8 *)board + 0x1d0) != 0)
            func_02092260(scene, 0x31);
        if (func_ov030_021ff574((u8 *)board + 0x1d8) != 0)
            func_02092260(scene, 9);
    }
    if (func_ov030_021ff574((u8 *)board + 0x1e0) != 0)
        func_02092260(scene, 0x26);
}

/* Applies a nonzero recovered reward through the currency HUD and UI object. */
static void apply_reward(void *scene, s32 reward)
{
    if (reward != 0) {
        s32 current = GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud);
        s32 displayed = func_ov045_0220b924(
            FIELD(void *, scene, 0x2c8), current, reward, 0);
        GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud, reward, displayed);
    }
}

/*
 * Main seven-slot board gameplay handler, keyed by substate +4. State 0 seeds
 * board pointer history and falls through to active play. State 1 tracks pointer
 * strokes, emits timer-driven transition IDs 0x31/9/0x26, and after three picks
 * selects a result message, transition 0xE5..0xE7, and optional reward according
 * to success count and mode +0x390: mode 1 rewards 10/500/5000; mode 2 rewards
 * 100/1000/10000. State 2 waits for reward animation, hides appropriate control
 * sprites, and continues collision tracking. State 3 accepts retry/cancel input;
 * retry opens message 0x1FA and starts scroll animation +0x340. States 4 and 5
 * apply that animation to BG offsets +0x338/+0x33C and board scroll +0x1C4,
 * resetting the randomized board between directions. State 6 waits for the
 * overlay-45 animation to settle before returning to state 0. Always services
 * dialog input and the normal frame and returns zero. Scene, widget, timers,
 * dialog, reward context, animation, sprites, and graphics state may change.
 */
extern "C" s32 func_ov030_021ff038(void *scene)
{
    (void)func_ov030_021fea00(scene);
    void *board = FIELD(void *, scene, 0x2c4);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov030_021fd694((u8 *)board + 0x1b8, (u8 *)scene + 0x30);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Recovered control flow intentionally continues into active play. */
    case 1: {
        update_board_pointer(scene);
        service_board_timers(scene, 1);
        void *slots = FIELD(void *, board, 0x1b0);
        if (FIELD(s32, slots, 0) < 3)
            break;
        TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2bc));
        s32 successes = FIELD(s32, slots, 4);
        s32 mode = FIELD(s32, scene, 0x390);
        s32 reward = 0;
        if (successes == 3) {
            if (mode == 1) {
                func_ov030_021fe954(scene, 0x1f4);
                reward = 5000;
            } else {
                func_ov030_021fe954(scene, 0x31c);
                reward = 10000;
            }
            func_020922f0(scene, 0xe5);
        } else if (successes == 2) {
            if (mode == 1) {
                func_ov030_021fe954(scene, 0x1f3);
                reward = 500;
            } else {
                func_ov030_021fe954(scene, 0x31b);
                reward = 1000;
            }
            func_020922f0(scene, 0xe6);
        } else if (successes == 1) {
            if (mode == 1) {
                func_ov030_021fe954(scene, 0x1f2);
                reward = 10;
            } else {
                func_ov030_021fe954(scene, 0x31a);
                reward = 100;
            }
            func_020922f0(scene, 0xe6);
        } else {
            func_ov030_021fe954(scene, 0x1f5);
            func_020922f0(scene, 0xe7);
        }
        apply_reward(scene, reward);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        break;
    }
    case 2:
        if (func_ov045_0220b9b8(FIELD(void *, scene, 0x2c8)) != 0 &&
            func_ov045_0220bc34(FIELD(void *, scene, 0x2c8)) == 0) {
            SpriteMotionController_Show((u8 *)board + 0x104);
            if (FIELD(s32, board, 0x1b4) != 0)
                SpriteMotionController_Show((u8 *)board + 0x58);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        update_board_pointer(scene);
        service_board_timers(scene, 0);
        break;
    case 3:
        if ((FIELD(u32, scene, 0x20) & 0x20) != 0) {
            if (SpriteMotionController_BeginHitResponse((u8 *)board + 0x58,
                              (u8 *)scene + 0x30, 0, 4) != 0) {
                func_02092260(scene, 0xb);
                TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2bc));
                func_ov030_021fe954(scene, 0x1fa);
                TitleInterpolatedValue_Configure((u8 *)scene + 0x340, 2, 0, 0xa8, 0x10);
                ++FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
            } else if (SpriteMotionController_BeginHitResponse((u8 *)board + 0x104,
                                     (u8 *)scene + 0x30, 0, 4) != 0) {
                func_02092260(scene, 3);
                func_ov030_021fda14(scene, data_ov030_021ff778[0],
                                    data_ov030_021ff778[1]);
            }
            func_ov030_021fd694((u8 *)board + 0x1b8, (u8 *)scene + 0x30);
        } else if ((FIELD(u32, scene, 0x20) & 0x200) != 0) {
            func_ov030_021fd720(board, (u8 *)scene + 0x30);
        }
        service_board_timers(scene, 0);
        break;
    case 4: {
        (void)func_ov045_0220b9b8(FIELD(void *, scene, 0x2c8));
        s32 scroll = func_02091c7c((u8 *)scene + 0x340, 1);
        FIELD(s32, scene, 0x33c) = scroll;
        FIELD(s32, scene, 0x338) = scroll;
        FIELD(s32, board, 0x1c4) = scroll;
        if (func_02091cf0((u8 *)scene + 0x340) != 0) {
            TitleInterpolatedValue_Configure((u8 *)scene + 0x340, 2, 0xa8, 0, 0x10);
            func_ov030_021fd434(board);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 5: {
        (void)func_ov045_0220b9b8(FIELD(void *, scene, 0x2c8));
        s32 scroll = func_02091c7c((u8 *)scene + 0x340, 1);
        FIELD(s32, scene, 0x33c) = scroll;
        FIELD(s32, scene, 0x338) = scroll;
        FIELD(s32, board, 0x1c4) = scroll;
        if (func_02091cf0((u8 *)scene + 0x340) != 0) {
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 6:
        if (func_ov045_0220b9b8(FIELD(void *, scene, 0x2c8)) != 0 &&
            func_ov045_0220bc34(FIELD(void *, scene, 0x2c8)) == 0) {
            FIELD(s32, scene, 4) = 0;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    func_ov030_021fe768(scene);
    return 0;
}

/*
 * Advances timer pair `timer` when current word +0 is nonzero. It decrements the
 * current value every call and returns 1 exactly when the pre-decrement value
 * equals reload word +4; otherwise it returns 0. Timer memory changes only while
 * active, with no SDK or hardware effects.
 */
extern "C" s32 func_ov030_021ff574(void *timer)
{
    s32 current = FIELD(s32, timer, 0);
    if (current == 0)
        return 0;
    FIELD(s32, timer, 0) = current - 1;
    return current == FIELD(s32, timer, 4);
}
