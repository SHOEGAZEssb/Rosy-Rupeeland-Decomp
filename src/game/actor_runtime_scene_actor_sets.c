#include "tingle/actor_runtime_scene.h"

/* Deactivate or selectively reactivate actors in shared context banks 1 and 2. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *func_02007f0c(void *context, s32 index);
extern void func_02032c4c(void *actor);
extern void func_02032cac(void *actor, s32 active);
#ifdef __cplusplus
}
#endif

/*
 * For context banks 1 and 2, deactivate every nonnull actor whose type byte
 * 0x4d is not 1. Type-3 actors carrying all of flag bits 0x100, 0x1, and 0x40
 * at offset 0x10 receive func_02032c4c first. The bank count is read at offset
 * 0x2e74 and entries begin at offset zero. Returns no value; actor state changes
 * occur through the called helpers and self is unused.
 */
void func_0200b8cc(ActorRuntimeScene *self)
{
    s32 bank;

    (void)self;
    for (bank = 1; bank <= 2; bank++) {
        u8 *context = (u8 *)func_02007f0c(data_021052fc, bank);
        s32 count = *(s32 *)(context + 0x2e74);
        s32 index;

        for (index = 0; index < count; index++) {
            u8 *actor = ((u8 **)context)[index];

            if (actor == 0 || actor[0x4d] == 1)
                continue;
            if (actor[0x4d] == 3) {
                u32 flags = *(u32 *)(actor + 0x10);
                if ((flags & 0x100) && (flags & 1) && (flags & 0x40))
                    func_02032c4c(actor);
            }
            func_02032cac(actor, 0);
        }
    }
}

/*
 * For context banks 1 and 2, activate each nonnull non-type-1 actor carrying
 * bit 0x8000 at offset 0x14. Returns no value; self is unused and actor state
 * changes are delegated to func_02032cac.
 */
void func_0200ba00(ActorRuntimeScene *self)
{
    s32 bank;

    (void)self;
    for (bank = 1; bank <= 2; bank++) {
        u8 *context = (u8 *)func_02007f0c(data_021052fc, bank);
        s32 count = *(s32 *)(context + 0x2e74);
        s32 index;

        for (index = 0; index < count; index++) {
            u8 *actor = ((u8 **)context)[index];

            if (actor != 0 && actor[0x4d] != 1 &&
                (*(u32 *)(actor + 0x14) & 0x8000))
                func_02032cac(actor, 1);
        }
    }
}
