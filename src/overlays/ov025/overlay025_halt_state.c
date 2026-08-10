#include "tingle/types.h"

/* Overlay 25 terminal sound-reset and Nintendo DS halt state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void OS_Halt(void);
extern void Sound_Reset(void *);
extern void func_ov025_02200178(void *);
#ifdef __cplusplus
}
#endif

/*
 * Advances state zero to one. State one resets global sound and invokes the
 * SDK OS halt boundary. Scene maintenance runs on returning paths; returns zero.
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
