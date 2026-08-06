#include "tingle/types.h"

/*
 * Recovered type-seven animation-selection controller. It filters actor state
 * against several descriptor pairs, chooses an embedded animation index, and
 * advances the embedded controller through its virtual update method.
 */

extern const u8 data_020e16b0[];
extern const u32 data_020e1828[];
extern const u32 data_020e1830[];
extern const u32 data_020e1840[];
extern const u32 data_020e1848[];
extern const u32 data_020e1850[];
extern const u32 data_020e1868[];
extern const u32 data_020e1878[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02035518(void *state, s32 enabled);
extern void func_0204ced8(void *state, u32 index);
extern void func_0204cf28(void *state);
#ifdef __cplusplus
}
#endif

/* The retail comparisons permit a null first word to satisfy the second test. */
#define TYPE7_PAIR_MATCH(actor, tableOffset, descriptor)                    \
    (*(u32 *)((actor) + 0x208) ==                                          \
         *(const u32 *)(data_020e16b0 + (tableOffset))                     \
     && (*(u32 *)((actor) + 0x20c) == (descriptor)[1]                     \
         || *(u32 *)((actor) + 0x208) == 0))

/*
 * Input is a type-seven actor. Disable helper +0x2a8 immediately for blocking
 * +0x268 mask 0x202400 or presentation +0x54 mask 0x14. Bit 0x1000 instead
 * mirrors whether attachment +0x234 is absent. Otherwise compare actor words
 * +0x208/+0x20c with seven recovered global descriptor pairs and combine the
 * result with timer +0x1fc, state +0xd6, counters +0x246/+0x264/+0x266, and
 * flags 0x80/0x800/0x10000000 to choose indices 0..0x1f. Index -1 disables
 * the helper; a selected index resets an active helper, assigns its low byte,
 * and enables it. Always invoke virtual slot two of helper +0x2a8 afterward.
 * Actor-owned animation state changes and descriptor globals are read; there
 * are no direct SDK or hardware effects and no value is returned.
 */
void func_0204b1e0(void *self)
{
    u8 *actor = (u8 *)self;
    u32 flags = *(u32 *)(actor + 0x268);
    void *helper = actor + 0x2a8;
    s32 animation = -1;
    s32 recent;
    s16 state;
    s32 eligible;

    if ((flags & 0x202400) != 0
        || (*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 0x14) != 0) {
        func_02035518(helper, 0);
        goto update;
    }
    if ((flags & 0x1000) != 0) {
        func_02035518(helper, *(void **)(actor + 0x234) == 0);
        goto update;
    }

    recent = *(s32 *)(actor + 0x1fc) < 300;
    eligible = !TYPE7_PAIR_MATCH(actor, 0x1c8, data_020e1878)
        && !TYPE7_PAIR_MATCH(actor, 0x178, data_020e1828)
        && !TYPE7_PAIR_MATCH(actor, 0x1b8, data_020e1868)
        && !TYPE7_PAIR_MATCH(actor, 0x180, data_020e1830)
        && !TYPE7_PAIR_MATCH(actor, 0x190, data_020e1840)
        && (flags & 0x10000000) == 0;

    if (eligible) {
        if (*(s16 *)(actor + 0x246) >= 1) {
            animation = 0x17;
        } else {
            state = *(s16 *)(actor + 0xd6);
            if (state == 0xe) {
                animation = recent ? 0x14 : 1;
            } else if (!TYPE7_PAIR_MATCH(actor, 0x198, data_020e1848)) {
                if (state == 6 || state == 7) {
                    animation = recent ? 0x13 : 0;
                } else if ((flags & 0x800) != 0) {
                    animation = recent ? 0x1e : 3;
                } else if (state == 3) {
                    animation = recent ? 0x15 : 0x12;
                } else if (*(s16 *)(actor + 0x264) >= 1
                           || *(s16 *)(actor + 0x266) >= 1) {
                    animation = recent ? 0x16 : 4;
                } else {
                    if (recent && (state == 1 || state == 2
                                   || state == 8 || state == 10)) {
                        animation = 8;
                    } else if (TYPE7_PAIR_MATCH(actor, 0x1a0,
                                                data_020e1850)) {
                        animation = 0x1f;
                    }
                }
            } else if ((flags & 0x80) != 0) {
                animation = 0x1f;
            } else if (recent) {
                animation = 8;
            }
        }
    }

    if (animation == -1) {
        func_02035518(helper, 0);
    } else {
        if (*(s16 *)(actor + 0x2b6) != 0)
            func_0204cf28(helper);
        func_0204ced8(helper, (u8)animation);
        func_02035518(helper, 1);
    }

update:
    {
        void (**vtable)(void *) = *(void (***)(void *))helper;
        vtable[2](helper);
    }
}

#undef TYPE7_PAIR_MATCH
