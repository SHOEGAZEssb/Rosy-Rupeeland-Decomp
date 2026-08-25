#include "tingle/types.h"

/* Overlay 26 timed transition gate coordinating effect completion and orbit acceleration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov026_0220434c[];
extern const u8 data_ov026_02204098[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void Presentation_SetScript(void *, const void *, s32);
extern s32 Presentation_IsScriptComplete(void *);
extern void func_ov026_022009dc(void *);
extern void func_ov026_02200dd8(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Drives transition substate +0x79C. State 0 starts composite control data
 * 0x0220434C; state 1 waits for completion, starts control +0x368, and arms a
 * 120-tick timer; state 2 waits with mode 2, triggers scene event 0x7B80, and
 * arms 240 ticks; state 3 adds eight to orbit step each frame until the timer
 * completes. It always runs the central update, returning one only on final
 * completion and zero otherwise.
 */
extern "C" s32 func_ov026_02202d1c(void *scene)
{
    s32 state = FIELD(s32, scene, 0x79c);
    if (state == 0) {
        Presentation_SetScript(FIELD(void *, scene, 0x160), data_ov026_0220434c, 0);
        FIELD(s32, scene, 0x79c) = 1;
        state = 1;
    }
    if (state == 1) {
        if (Presentation_IsScriptComplete(FIELD(void *, scene, 0x160)) != 0) {
            Presentation_SetScript(FIELD(void *, scene, 0x160),
                           FIELD(const void *, scene, 0x368), 0);
            func_02091b98((u8 *)scene + 0x7a8, 0x78);
            FIELD(s32, scene, 0x79c) = 2;
        }
    } else if (state == 2) {
        if (func_02091c7c((u8 *)scene + 0x7a8, 2) != 0) {
            SceneSound_PlayPackedEffect(scene, 0x7b80);
            func_02091b98((u8 *)scene + 0x7a8, 0xf0);
            FIELD(s32, scene, 0x79c) = 3;
        }
    } else if (state == 3) {
        func_ov026_02200dd8(scene, 8);
        if (func_02091c7c((u8 *)scene + 0x7a8, 2) != 0) {
            func_ov026_022009dc(scene);
            return 1;
        }
    }
    func_ov026_022009dc(scene);
    return 0;
}

/*
 * Alternate transition using a 24-byte control block copied from 0x02204098.
 * It starts common control 0x0220434C, waits for completion, applies the local
 * control and a 60-tick delay, triggers event 0x7B80, then accelerates orbit by
 * eight until the composite completes. Runs the main update every frame and
 * returns one only at final completion.
 */
extern "C" s32 func_ov026_02202e2c(void *scene)
{
    u8 control[24];
    for (s32 i = 0; i < 24; ++i)
        control[i] = data_ov026_02204098[i];
    s32 state = FIELD(s32, scene, 0x79c);
    if (state == 0) {
        Presentation_SetScript(FIELD(void *, scene, 0x160), data_ov026_0220434c, 0);
        FIELD(s32, scene, 0x79c) = 1;
        state = 1;
    }
    if (state == 1) {
        if (Presentation_IsScriptComplete(FIELD(void *, scene, 0x160)) != 0) {
            Presentation_SetScript(FIELD(void *, scene, 0x160), control, 0);
            func_02091b98((u8 *)scene + 0x7a8, 0x3c);
            FIELD(s32, scene, 0x79c) = 2;
        }
    } else if (state == 2) {
        if (func_02091c7c((u8 *)scene + 0x7a8, 2) != 0) {
            SceneSound_PlayPackedEffect(scene, 0x7b80);
            FIELD(s32, scene, 0x79c) = 3;
        }
    } else if (state == 3) {
        func_ov026_02200dd8(scene, 8);
        if (Presentation_IsScriptComplete(FIELD(void *, scene, 0x160)) != 0) {
            func_ov026_022009dc(scene);
            return 1;
        }
    }
    func_ov026_022009dc(scene);
    return 0;
}
