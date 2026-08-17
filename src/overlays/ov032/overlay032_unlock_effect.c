#include "tingle/types.h"

/* Overlay 32 arrow-state setters and the 40-particle unlock effect lifecycle. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GraphicsSpriteState_SetAnimationIndex(...);
extern void Overlay032Controller_CreateObject(...);
extern u32 genrand_int32(void);
extern s32 func_020bf1f8(...);
extern void func_ov032_022014c0(...);
extern void func_ov032_0220147c(void *);
#ifdef __cplusplus
}
#endif

/* Clears +0x0C and selects the low-byte frame at +0x14 on the wrapped sprite; returns the SDK frame setter's result. */
extern "C" s32 func_ov032_02200180(void *arrow)
{
    FIELD(s32, arrow, 0xc) = 0;
    return GraphicsSpriteState_SetAnimationIndex(FIELD(void *, arrow, 0), (u8)FIELD(u32, arrow, 0x14));
}

/* Sets +0x0C and selects the low-byte frame at +0x10 on the wrapped sprite; returns the SDK frame setter's result. */
extern "C" s32 func_ov032_022001a0(void *arrow)
{
    FIELD(s32, arrow, 0xc) = 1;
    return GraphicsSpriteState_SetAnimationIndex(FIELD(void *, arrow, 0), (u8)FIELD(u32, arrow, 0x10));
}

/*
 * Initializes all forty 0x30-byte effect entries at +0x334 against scene fields
 * +0x00/+0x4C, hides each SDK object with flag bit 2, and assigns a random
 * 1..40-frame delay at entry +0x28. The spawn rectangle at +0xEB4..+0xEC0 is
 * selected from +0xC1C. Returns void.
 */
extern "C" void func_ov032_022001c0(void *scene)
{
    switch (FIELD(s32, scene, 0xc1c)) {
    case 1:
        FIELD(s32, scene, 0xeb4) = 0xaf; FIELD(s32, scene, 0xeb8) = 0x64;
        FIELD(s32, scene, 0xebc) = 0xd7; FIELD(s32, scene, 0xec0) = 0x90;
        break;
    case 2:
        FIELD(s32, scene, 0xeb4) = 0xaa; FIELD(s32, scene, 0xeb8) = 0x50;
        FIELD(s32, scene, 0xebc) = 0xd7; FIELD(s32, scene, 0xec0) = 0x90;
        break;
    default:
        FIELD(s32, scene, 0xeb4) = 0xa0; FIELD(s32, scene, 0xeb8) = 0x28;
        FIELD(s32, scene, 0xebc) = 0xdc; FIELD(s32, scene, 0xec0) = 0x90;
        break;
    }
    for (s32 i = 0; i < 0x28; ++i) {
        u8 *entry = (u8 *)scene + 0x334 + i * 0x30;
        Overlay032Controller_CreateObject(entry, FIELD(void *, scene, 0), (u8 *)scene + 0x4c);
        void *object = FIELD(void *, entry, 0);
        FIELD(u16, object, 0x24) |= 4;
        FIELD(s32, entry, 0x28) = func_020bf1f8(genrand_int32(), 0x28) + 1;
    }
}

static void launch_particle(void *scene, u8 *entry)
{
    s32 x = FIELD(s32, scene, 0xeb4) +
            func_020bf1f8(genrand_int32(), FIELD(s32, scene, 0xebc) - FIELD(s32, scene, 0xeb4));
    s32 y = FIELD(s32, scene, 0xeb8) +
            func_020bf1f8(genrand_int32(), FIELD(s32, scene, 0xec0) - FIELD(s32, scene, 0xeb8));
    func_ov032_022014c0(entry, 3, 0, x, y, 3, 0, 0, 0);
}

/*
 * Updates forty delayed particles. A delay reaching zero launches at a random
 * point in +0xEB4..+0xEC0 and reveals the object; an already-undelayed entry
 * whose SDK flag bit 0 is set is relaunched and has that bit cleared. Returns
 * void after mutating timers, particle controllers, and SDK object flags.
 */
extern "C" void func_ov032_02200284(void *scene)
{
    for (s32 i = 0; i < 0x28; ++i) {
        u8 *entry = (u8 *)scene + 0x334 + i * 0x30;
        s32 delay = FIELD(s32, entry, 0x28);
        void *object = FIELD(void *, entry, 0);
        if (delay != 0) {
            FIELD(s32, entry, 0x28) = --delay;
            if (delay == 0) {
                launch_particle(scene, entry);
                FIELD(u16, object, 0x24) &= ~4;
            }
        } else if (FIELD(u16, object, 0x24) & 1) {
            launch_particle(scene, entry);
            FIELD(u16, object, 0x24) &= ~1;
        }
    }
}

/* Resets the controller embedded in each of the forty 0x30-byte effect entries at +0x334; returns void. */
extern "C" void func_ov032_022003e4(void *scene)
{
    for (s32 i = 0; i < 0x28; ++i) func_ov032_0220147c((u8 *)scene + 0x334 + i * 0x30);
}
