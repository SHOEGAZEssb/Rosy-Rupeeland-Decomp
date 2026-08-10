#include "tingle/game_phase_runtime.h"

/*
 * Synchronize primary or secondary actor placement with the active area.
 * The retail instruction schedule is retained in the matching assembly file.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02008354(void *output, const void *input);
extern void ActorMotionAreaFollower_Update(void *object, const void *value);
extern void func_020086f8(void *state, GamePhaseRuntime *self);
extern void func_0200875c(void *state, GamePhaseRuntime *self);
extern void func_0200ecbc(void *object, const void *state);
extern void func_02005058(void *state);
extern s32 DisplayController_GetSubScreenVerticalOffset(void);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02008378(void *output, const void *state, const void *offset);
extern void func_02012150(void *actor, const void *state);
extern s32 func_020124f0(void *actor);
extern s32 func_0201250c(void *actor);
extern void ActorMotionGameWork_Update(void *object, const void *value);
#ifdef __cplusplus
}
#endif

/*
 * Synchronize actor zero (the primary actor) or actor one (the optional
 * secondary actor). Primary synchronization derives a compact four-halfword
 * placement from packed gameplay coordinates. Secondary synchronization uses
 * the area's orientation to choose an offset or current actor coordinates,
 * updates runtime placement state, and optionally pushes a full state to the
 * secondary actor. Returns zero for all paths; bit 2 at offset 0x30cc blocks
 * primary synchronization without side effects.
 */
s32 GamePhaseRuntime_SynchronizeActorPlacement(GamePhaseRuntime *self, s32 actorIndex)
{
    u8 *b = (u8 *)self;
    u8 compact[8];
    u8 raw0[8];
    u8 raw1[8];
    u8 full0[16];
    u8 full1[16];
    u8 full2[16];
    u8 offset[16];
    u8 *actor;
    u32 packed;
    s32 orientation;

    if (actorIndex == 0) {
        if (*(u8 *)(b + 0x30cc) & 4)
            return 0;
        packed = *(u32 *)(*(u8 **)(b + 0x2ed4) + 0x20);
        func_020083b0(raw0, 0, 0,
                      (s32)((packed & 0xffff) << 20) >> 16,
                      (s32)((packed >> 16) << 20) >> 16);
        func_02008354(compact, raw0);
        ActorMotionAreaFollower_Update(b + 0x2fbc, compact);
        func_020086f8(full0, self);
        func_0200ecbc(b + 0x24, full0);
        func_02005058(full0);
    } else if (actorIndex == 1) {
        orientation = (*(u32 *)(*(u8 **)(b + 0x30bc) + 0x40) << 12) >> 30;
        if (orientation == 3) {
            func_0200500c(offset, 0, -(DisplayController_GetSubScreenVerticalOffset() << 12), 0);
            func_020086f8(full1, self);
            func_02008378(full2, full1, offset);
            func_02012150(*(void **)(b + 0x2fb8), full2);
            func_02005058(full2);
            func_02005058(full1);
            func_02005058(offset);
        } else {
            if (orientation == 0) {
                actor = *(u8 **)(b + 0x2fb8);
                func_020083b0(raw1, 0, 0,
                              (s16)func_020124f0(actor),
                              (s16)func_0201250c(*(void **)(b + 0x2fb8)));
                func_02008354(compact, raw1);
            } else {
                func_020083b0(raw1, 0, 0, 0, 0);
                func_02008354(compact, raw1);
            }
            ActorMotionGameWork_Update(b + 0x3044, compact);
            if (*(void **)(b + 0x30fc) != 0 &&
                *(void **)(b + 0x2fb8) != 0) {
                func_0200875c(full0, self);
                func_02012150(*(void **)(b + 0x2fb8), full0);
                func_02005058(full0);
            }
        }
    }
    return 0;
}
