#include "tingle/types.h"

/* Overlay 25 halt state, display callbacks, and controller destructor thunks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02203318[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void OS_Halt(void);
extern void Sound_Reset(void *);
extern void func_02092314(void *, s32, s32);
extern void func_020929f4(void *);
extern void func_02092a34(void *, s32);
extern void func_02095308(void *);
extern void func_0209548c(void *);
extern void func_ov025_02200178(void *);
#ifdef __cplusplus
}
#endif

/*
 * Advances from state 0 to 1; state 1 resets global sound and halts the OS.
 * Before halting, and for unknown states, it performs normal scene maintenance.
 * Returns zero on the paths on which OS_Halt returns.
 */
extern "C" s32 func_ov025_02201ed0(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        break;
    case 1:
        Sound_Reset(gSoundContext);
        OS_Halt();
        break;
    }
    func_ov025_02200178(scene);
    return 0;
}

/*
 * Initializes scene command 0xE2 with duration 0x10 in state 0, advances the
 * state, and returns one. Later states have no side effects and also return one.
 */
extern "C" s32 func_ov025_02202b44(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_02092314(scene, 0xe2, 0x10);
        FIELD(s32, scene, 4)++;
        FIELD(s32, scene, 8) = 0;
        break;
    case 1:
        break;
    }
    return 1;
}

/*
 * Frame callback gated by scene flag bit 10. It installs +0x48/+0x4C into
 * DISPCNT A/B display-mode bits 8..12. With no +0x598 owner it also clears
 * main-engine BG3CNT at 0x0400001C; otherwise it updates input object +0x5A0.
 * Returns zero. These volatile writes directly affect Nintendo DS display HW.
 */
extern "C" s32 func_ov025_02202b88(void *scene)
{
    if ((s32)(FIELD(u32, scene, 0x20) << 21) >> 31) {
        volatile u32 *const dispcnt_a = (volatile u32 *)0x04000000;
        volatile u32 *const dispcnt_b = (volatile u32 *)0x04001000;
        *dispcnt_a = (*dispcnt_a & ~0x1f00) |
                     (FIELD(u32, scene, 0x48) << 8);
        *dispcnt_b = (*dispcnt_b & ~0x1f00) |
                     (FIELD(u32, scene, 0x4c) << 8);
        if (!FIELD(void *, scene, 0x598))
            *(volatile u32 *)0x0400001c = 0;
        else
            func_020929f4((u8 *)scene + 0x5a0);
    }
    return 0;
}

/*
 * Companion callback gated by scene flag bit 10. If owner +0x598 exists, it
 * submits zero to input object +0x5A0. Returns zero and may update input state.
 */
extern "C" s32 func_ov025_02202bf0(void *scene)
{
    if (((s32)(FIELD(u32, scene, 0x20) << 21) >> 31) &&
        FIELD(void *, scene, 0x598))
        func_02092a34((u8 *)scene + 0x5a0, 0);
    return 0;
}

/* Runs the +0xDC/+0xE0-style controller destructor, frees it, and returns it. */
extern "C" void *func_ov025_02202c20(void *object)
{
    func_0209548c(object);
    Heap_Free(object);
    return object;
}

/* Runs the controller destructor without freeing storage and returns `object`. */
extern "C" void *func_ov025_02202c3c(void *object)
{
    func_0209548c(object);
    return object;
}

/*
 * Restores vtable data_ov025_02203318, runs the base controller destructor,
 * frees storage, and returns the original pointer as required by the ABI thunk.
 */
extern "C" void *func_ov025_02202c50(void *object)
{
    FIELD(const void *, object, 0) = data_ov025_02203318;
    func_02095308(object);
    Heap_Free(object);
    return object;
}
