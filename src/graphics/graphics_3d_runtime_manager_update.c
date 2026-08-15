#include "tingle/types.h"

/* Frame update for a fifteen-slot runtime 3D effect manager. */

#ifdef __cplusplus
extern "C" {
#endif

extern s32 func_020a2bf0(void *manager, s32 group, s32 variant);
extern void func_020a2da8(void *manager);
extern u32 genrand_int32(void);
extern const s8 data_020c9584[];
extern const s16 data_020c9670[];

#ifdef __cplusplus
}
#endif

/*
 * Advance the borrowed manager's mode countdown and its fifteen effect slots.
 * The mode byte at +4 selects which group func_020a2bf0 activates, while +5
 * and +6 retain the signed countdown and countdown-table index. Active slots
 * update their Q12 wave value at +0x10c, phase at +0xd0, and completion state
 * at +0x184. Mode-specific secondary counters at +0x20 use a twelve-byte
 * stride. The function returns no value; random mode timing consumes one value
 * from the game's global PRNG.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_020a2da8(void *manager)
{
    u8 *bytes = (u8 *)manager;
    u8 countdowns[10];
    const u8 *countdownSource = (const u8 *)data_020c9584;
    u8 *countdownDestination = countdowns;
    s32 index;

    for (index = 10; index != 0; index--)
        *countdownDestination++ = *countdownSource++;

    if (*(s32 *)(bytes + 8) == 0) {
        if (*(s8 *)(bytes + 4) == 3) {
            if (func_020a2bf0(manager, 2, 2) != 0)
                *(s32 *)(bytes + 8) = 1;
            *(s8 *)(bytes + 5) = 1;
        }

        if (*(s8 *)(bytes + 4) == 2) {
            --*(s8 *)(bytes + 5);
            if (*(s8 *)(bytes + 5) == 0) {
                func_020a2bf0(manager, 1, 0);
                func_020a2bf0(manager, 1, 1);
                *(s8 *)(bytes + 5) = countdowns[*(s8 *)(bytes + 6)];
                ++*(s8 *)(bytes + 6);
                if ((u32)*(s8 *)(bytes + 6) >= 10)
                    *(s8 *)(bytes + 6) = 9;
            }
        } else if (*(s8 *)(bytes + 4) == 1) {
            --*(s8 *)(bytes + 5);
            if (*(s8 *)(bytes + 5) == 0) {
                func_020a2bf0(manager, 0, 0);
                *(s8 *)(bytes + 5) = (s8)((genrand_int32() & 0x18) + 0x28);
            }
        }
    }

    for (index = 14; index >= 0; index--) {
        u8 *slot = bytes + index * 4;
        s32 state = *(s32 *)(slot + 0x184);

        if (state == 0)
            continue;

        if (state == 1) {
            s64 rounding = 0x800;
            *(s32 *)(slot + 0x10c) =
                (s32)(((s64)data_020c9670[
                            (*(s32 *)(slot + 0xd0) >> 4) * 2] *
                        *(s32 *)(slot + 0x148) + rounding) >> 12);
            *(s32 *)(slot + 0xd0) += 0xb4;
            if (*(s32 *)(slot + 0xd0) > 0x4000) {
                *(s32 *)(slot + 0xd0) = 0x4000;
                ++*(s32 *)(bytes + 8);
            }
        } else {
            s64 rounding = 0x800;
            *(s32 *)(bytes + 0x20 + index * 12) += state;
            *(s32 *)(slot + 0x10c) =
                (s32)(((s64)data_020c9670[
                            (*(s32 *)(slot + 0xd0) >> 4) * 2] *
                        *(s32 *)(slot + 0x148) + rounding) >> 12);
            *(s32 *)(slot + 0xd0) +=
                (*(s8 *)(bytes + 4) == 1) ? 0x96 : 0x12c;
            if (*(s32 *)(slot + 0xd0) > 0x7fff)
                *(s32 *)(slot + 0x184) = 0;
        }
    }
}
