#include "tingle/random.h"
#include "tingle/types.h"

/*
 * Advance the registered actor subclass through its idle, timed-effect, and
 * contact states while maintaining its height flag and presentation object.
 */
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorTableRecord_UpdateFrame(void *actor);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern void func_0203d86c(void *actor);
extern void *func_0201e0ec(void *manager);
extern void func_020a28e0(void *effect, s32 kind, s32 x, s32 y, s32 duration);
#ifdef __cplusplus
}
#endif

/*
 * Run the common table-record frame update, then set actor +0x14 bit 0x800000
 * only when Actor_GetCachedTerrainHeight first reports zero, Z +0x24 is positive, and Z is
 * less than a second reported value plus 0x18000. The repeated query is
 * preserved because whether that helper mutates state is not yet confirmed.
 *
 * State halfword +0xd6 selects the remaining behavior. States zero and one
 * enter func_0203d86c when word +0x114 equals one. Otherwise state one advances
 * timer +0x218 until limit +0x21a; on timer values congruent to two modulo 15,
 * it emits a randomized effect near the actor through the manager at global
 * offset +0x2f7c. State two either marks attachment +0x24 bit 0x10 when +0x114
 * is one or resets the actor to state zero, restores the 120-frame limit,
 * clears actor +0x14 bits 0x2/0x4, and sets +0xd0 bit 0x1000. Other states only
 * receive the common update. Returns no value; actor, attachment, random, and
 * effect-manager state can change.
 */
void func_0203d540(void *self)
{
    u8 *actor = (u8 *)self;
    s16 state;

    ActorTableRecord_UpdateFrame(actor);
    if (Actor_GetCachedTerrainHeight(actor) == 0 && *(s32 *)(actor + 0x24) > 0 &&
        *(s32 *)(actor + 0x24) < Actor_GetCachedTerrainHeight(actor) + 0x18000) {
        *(u32 *)(actor + 0x14) |= 0x800000;
    } else {
        *(u32 *)(actor + 0x14) &= ~0x800000;
    }

    state = *(s16 *)(actor + 0xd6);
    if (state == 0) {
        if (*(s32 *)(actor + 0x114) == 1)
            func_0203d86c(actor);
        return;
    }
    if (state == 1) {
        u16 *timer = (u16 *)(actor + 0x218);

        if (*(s32 *)(actor + 0x114) == 1) {
            func_0203d86c(actor);
            return;
        }
        ++timer[0];
        if (timer[0] >= timer[1]) {
            func_0203d86c(actor);
            return;
        }
        if (timer[0] % 15 == 2) {
            u32 random = genrand_int32();
            void *effect = func_0201e0ec(data_021052fc + 0x2f7c);
            s32 x = (*(s32 *)(actor + 0x1c) >> 12) - 2 +
                    (s32)(random & 3);
            s32 y = (*(s32 *)(actor + 0x20) >> 12) -
                    (*(s32 *)(actor + 0x24) >> 12) - 18 +
                    (s32)((random >> 4) & 3);

            func_020a28e0(effect, 1, x, y, 60);
        }
        return;
    }
    if (state == 2) {
        if (*(s32 *)(actor + 0x114) == 1) {
            *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) |= 0x10;
            return;
        }
        *(s16 *)(actor + 0xd6) = 0;
        *(u16 *)(actor + 0x218) = 0;
        *(u16 *)(actor + 0x21a) = 120;
        *(u32 *)(actor + 0x14) &= ~(0x2 | 0x4);
        *(u32 *)(actor + 0xd0) |= 0x1000;
    }
}
