#include "tingle/types.h"

/* Overlay 36 terminal scene-state callbacks for entry and completion handling. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov036_02205ad8[];
extern void *gSoundContext;
extern u8 gSystemState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059230(void *sound, s32 first, s32 second);
extern void func_ov036_022045ac(void *state, s32 value24, s32 value28);
extern s32 func_ov036_021fce5c(void *controller);
extern void func_ov036_02204ae0(void *scene);
#ifdef __cplusplus
}
#endif

/*
 * Advances entry state +4. State zero resets sound with (1,+0x58), advances
 * state, clears +8, and falls through. State one sets scene flag +0x20 bit
 * zero and initializes +0x24/+0x28 from data_ov036_02205ad8. Other states do
 * nothing. Always returns zero; sound, flags, and pair state may change.
 */
extern "C" s32 func_ov036_02204b80(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_02059230(gSoundContext, 1, FIELD(s32, scene, 0x58));
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* The recovered branch intentionally continues into state one. */
    case 1:
        FIELD(u32, scene, 0x20) |= 1;
        func_ov036_022045ac(scene,
                            data_ov036_02205ad8[0],
                            data_ov036_02205ad8[1]);
        break;
    }
    return 0;
}

/*
 * Advances completion state +4 while rendering every call. State zero copies
 * gSystemState +0x64 to scene +0x4BC, advances, and clears +8. State one waits
 * for controller +0x60's common completion predicate, then advances and clears
 * +8. State two renders and returns one. Other paths render and return zero;
 * state, saved system value, controller, and GX state may change.
 */
extern "C" s32 func_ov036_02204bf8(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        FIELD(s32, scene, 0x4bc) = FIELD(s32, &gSystemState, 0x64);
        FIELD(s32, scene, 4) = 1;
        FIELD(s32, scene, 8) = 0;
        /* The recovered branch intentionally continues into state one. */
    case 1:
        if (func_ov036_021fce5c(FIELD(void *, scene, 0x60)) != 0) {
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 2:
        func_ov036_02204ae0(scene);
        return 1;
    }
    func_ov036_02204ae0(scene);
    return 0;
}
