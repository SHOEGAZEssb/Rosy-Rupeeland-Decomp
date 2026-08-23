#include "tingle/types.h"

/* Overlay 18 actor-list visibility control and completion-gated debug timer activation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern s32 data_020c37e4;
extern const u8 data_020d7a48[];
extern void *data_021052fc;
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern void *ActorCollection_GetSpriteGroup(void *);
extern void func_02091b98(void *, s32);
#ifdef __cplusplus
}
#endif

/* No-op visibility callback: accepts state, changes nothing, and returns void without SDK or hardware effects. */
extern "C" void func_ov018_021fe5a8(void *state)
{
    (void)state;
}

/*
 * Resolve global actor collection 2, traverse its +0x0C list through link +8,
 * and clear flag bit 4 at node +0x24 whenever nested type node+0x18/+0x10 is
 * 0x70. Returns void. Matching actor state changes; SDK/global state is read
 * and no direct hardware access occurs.
 */
extern "C" void func_ov018_021fe5ac(void *state)
{
    void *collection;
    void *node;
    (void)state;

    collection = ActorCollection_GetSpriteGroup(GamePhaseRuntime_GetActorCollection(data_021052fc, 2));
    node = FIELD(void *, collection, 0xc);
    while (node != 0) {
        if (FIELD(s32, FIELD(void *, node, 0x18), 0x10) == 0x70)
            FIELD(u16, node, 0x24) &= ~0x10;
        node = FIELD(void *, node, 8);
    }
}

/*
 * Resolve global actor collection 2, traverse its +0x0C list through link +8,
 * and set flag bit 4 at node +0x24 whenever nested type node+0x18/+0x10 is
 * 0x70. Returns void. Matching actor state changes; SDK/global state is read
 * and no direct hardware access occurs.
 */
extern "C" void func_ov018_021fe5f8(void *state)
{
    void *collection;
    void *node;
    (void)state;

    collection = ActorCollection_GetSpriteGroup(GamePhaseRuntime_GetActorCollection(data_021052fc, 2));
    node = FIELD(void *, collection, 0xc);
    while (node != 0) {
        if (FIELD(s32, FIELD(void *, node, 0x18), 0x10) == 0x70)
            FIELD(u16, node, 0x24) |= 0x10;
        node = FIELD(void *, node, 8);
    }
}

/*
 * If completion latch +0x400 is clear, scan data_020D7A48's 0x24-byte records
 * up to global count data_020C37E4. Count records whose signed first halfword
 * equals state +0x19C, and among those count index zero plus nonzero indices
 * whose GameWork byte at +0x5E94+index is nonzero. When both counts match
 * (including zero matches), set +0x3FC/+0x400 to one and start timer +0x3E0 at
 * 120. Returns void. Scene/timer state may change; globals are read only and no
 * direct hardware effects occur.
 */
extern "C" void func_ov018_021fe644(void *state)
{
    s32 matching = 0;
    s32 eligible = 0;
    s32 i;

    if (FIELD(s32, state, 0x400) != 0)
        return;
    for (i = 0; i < data_020c37e4; i++) {
        if (FIELD(s16, data_020d7a48, i * 0x24) ==
            FIELD(s32, state, 0x19c)) {
            matching++;
            if (i == 0 || FIELD(u8, gGameWork, 0x5e94 + i) != 0)
                eligible++;
        }
    }
    if (matching == eligible) {
        FIELD(s32, state, 0x3fc) = 1;
        FIELD(s32, state, 0x400) = 1;
        func_02091b98((u8 *)state + 0x3e0, 0x78);
    }
}
