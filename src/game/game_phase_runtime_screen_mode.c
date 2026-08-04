#include "tingle/game_phase_runtime.h"

/* Switch runtime screen mode and synchronize the affected actors/hardware. */

extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200eb58(void *object, void *state);
extern void GameWork_SetFlag(void *work, s32 flag);
extern void func_020121f8(void *actor);
extern void func_02008bb8(GamePhaseRuntime *self, void *area, s32 enabled);
extern void func_020088b8(GamePhaseRuntime *self, s32 enabled, s32 value);
extern void func_0201dff0(void *object, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Apply screen mode 0..2. Modes 0/2 force main display mode bits and update
 * state 0x24; modes 1/2 do the corresponding sub-display/secondary-actor
 * work, invoke virtual slot two of object 0x30e8, clear the first sub BG
 * palette entry, and set flag 0x39c. All modes update object 0x2f7c and set
 * flag 0x3f4. Returns no value; volatile display and palette writes are
 * observable hardware effects.
 */
void func_02008570(GamePhaseRuntime *self, s32 mode, void *state)
{
    u8 *b = (u8 *)self;
    volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
    volatile u32 *subDisplay = (volatile u32 *)0x04001000;

    if (mode == 2 || mode == 0) {
        *mainDisplay = (*mainDisplay & ~0x1f00) | 0x1000;
        func_0200eb58(b + 0x24, state);
        GameWork_SetFlag(gGameWork, 0x395);
    }
    if ((u32)(mode - 1) <= 1) {
        void *object;
        volatile u16 *palette = (volatile u16 *)0x05000400;
        void *volatile *workAddress = &gGameWork;
        *subDisplay = (*subDisplay & ~0x1f00) | 0x1000;
        func_020121f8(*(void **)(b + 0x2fb8));
        func_02008bb8(self, *(void **)(b + 0x30bc), 1);
        object = *(void **)(b + 0x30e8);
        (*(void (***)(void *))object)[2](object);
        func_020088b8(self, 1, 0);
        *palette = 0;
        GameWork_SetFlag(*workAddress, 0x39c);
    }
    func_0201dff0(b + 0x2f7c, mode);
    GameWork_SetFlag(gGameWork, 0x3f4);
}
