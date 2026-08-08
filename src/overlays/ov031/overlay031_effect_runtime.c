#include "tingle/types.h"

/* Overlay 31 effect-frame animation, particle trajectories, and state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov031_021fe604[];
extern const u8 data_ov031_021fe66c[];
extern const u8 data_ov031_021fe790[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0209189c(void *, s32, s32);
extern void func_020948e4(void *, s32, s32);
extern void func_020740a4(void *);
extern void func_ov031_021fd684(void *, s32);
extern void *func_02073ffc(void *, void *, s32);
extern void func_02072b68(void *, s32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void Heap_Free(void *);
extern void *func_ov031_021fd19c(void *, void *, s32, s32, s32);
extern s32 func_ov031_021fd1e0(void *);
extern void *func_ov031_021fd1c0(void *);
extern void func_02094cf0(void *, const void *, s32);
extern void func_ov031_021fd69c(void *);
extern void func_ov031_021fd798(void *);
#ifdef __cplusplus
}
#endif

typedef s32 (*Overlay031Update)(void *);

/* Calls virtual slot 2, the recovered update/completion method. */
static s32 update_polymorphic(void *object)
{
    void **vtable = FIELD(void **, object, 0);
    return ((Overlay031Update)vtable[2])(object);
}

/*
 * Advances animation object +0xB4. When its virtual update reports an event, it
 * randomizes two channel targets in ranges [-0x400,0x400] and [-0x200,0x200]
 * through controllers +0xC0/+0xD0, then arms +0xB4 with a random 8..16 interval.
 * It converts fixed-point channel values +0xC4/+0xD4 to integer renderer offsets
 * +0x18/+0x1C and renders both +0x54/+0x58. Returns void; PRNG, animation,
 * controller, renderer, and graphics SDK state may change.
 */
extern "C" void func_ov031_021fd5c0(void *effect)
{
    if (update_polymorphic((u8 *)effect + 0xb4) != 0) {
        s32 value = func_0209189c((u8 *)effect + 0x150, -0x400, 0x400);
        func_020948e4((u8 *)effect + 0xc0, 2, value);
        value = func_0209189c((u8 *)effect + 0x150, -0x200, 0x200);
        func_020948e4((u8 *)effect + 0xd0, 2, value);
        value = func_0209189c((u8 *)effect + 0x150, 8, 0x10);
        func_ov031_021fd684((u8 *)effect + 0xb4, value);
    }
    void *renderer = FIELD(void *, effect, 0x54);
    FIELD(s32, renderer, 0x18) = FIELD(s32, effect, 0xc4) / 256;
    FIELD(s32, renderer, 0x1c) = FIELD(s32, effect, 0xd4) / 256;
    func_020740a4(renderer);
    func_020740a4(FIELD(void *, effect, 0x58));
}

/*
 * Arms animation-like object `state` with signed-16 `duration` at +0x7C and
 * clears progress +0x80. Returns void; only object memory changes.
 */
extern "C" void func_ov031_021fd684(void *state, s32 duration)
{
    FIELD(s32, state, 0x7c) = (s16)duration;
    FIELD(s32, state, 0x80) = 0;
}

/*
 * Finds the first free one of sixteen trajectory slots. It creates a sprite from
 * renderer/resource +0x54/+0x5C, assigns a random selector 4..7, byte +0x3A=3,
 * scale halfword +0x28=0x500, and chooses a random horizontal offset/velocity in
 * [-40,40] plus a random Y within +/-48 of composite sprite +0x70/+0x9C. It then
 * allocates and initializes a 0x18-byte trajectory, stores it in the slot, and
 * returns after at most one spawn. Returns void; PRNG, heap, sprite, and slot
 * state may change. If all slots are occupied, nothing changes.
 */
extern "C" void func_ov031_021fd69c(void *effect)
{
    for (s32 i = 0; i < 16; ++i) {
        if (FIELD(void *, effect, 0x74 + i * 4) != 0)
            continue;
        void *sprite = func_02073ffc(FIELD(void *, effect, 0x54),
                                     (u8 *)effect + 0x5c, 1);
        func_02072b68(sprite,
            func_0209189c((u8 *)effect + 0x150, 4, 7) & 0xff);
        FIELD(u8, sprite, 0x3a) = 3;
        FIELD(u16, sprite, 0x28) = 0x500;
        s32 horizontal = func_0209189c((u8 *)effect + 0x150, -40, 40);
        void *centerSprite = FIELD(void *, FIELD(void *, effect, 0x70), 0x9c);
        s32 x = (horizontal + FIELD(s16, centerSprite, 0x2c)) << 8;
        s32 centerY = FIELD(s16, centerSprite, 0x2e);
        s32 y = func_0209189c((u8 *)effect + 0x150,
                              centerY - 0x30, centerY + 0x30) << 8;
        void *motion = Heap_Alloc(0x18, data_ov031_021fe790, 4, gHeapContext);
        if (motion != 0)
            motion = func_ov031_021fd19c(motion, sprite, x, y, horizontal * 2);
        FIELD(void *, effect, 0x74 + i * 4) = motion;
        return;
    }
}

/*
 * Advances every occupied trajectory slot. When a trajectory reports complete,
 * it releases its sprite, frees the trajectory, and clears the slot. Returns
 * void; trajectory, sprite SDK, heap, and slot state may change.
 */
extern "C" void func_ov031_021fd798(void *effect)
{
    for (s32 i = 0; i < 16; ++i) {
        void *motion = FIELD(void *, effect, 0x74 + i * 4);
        if (motion != 0 && func_ov031_021fd1e0(motion) != 0) {
            func_ov031_021fd1c0(motion);
            Heap_Free(motion);
            FIELD(void *, effect, 0x74 + i * 4) = 0;
        }
    }
}

/*
 * Advances trajectories, then drives effect substate +0x68. State 0 arms the
 * composite +0x70 for 30 ticks and falls through; state 1 waits for completion,
 * installs table 0x021FE604 or 0x021FE66C according to mode +0x6C, and advances;
 * state 2 spawns one trajectory per frame until the composite completes, then
 * arms 60 ticks; state 3 waits once more; state 4 returns 1. Other/incomplete
 * states return 0. Composite animation, particles, PRNG, heap, and substate may
 * change through SDK helpers.
 */
extern "C" s32 func_ov031_021fd7fc(void *effect)
{
    func_ov031_021fd798(effect);
    void *composite = FIELD(void *, effect, 0x70);
    switch (FIELD(s32, effect, 0x68)) {
    case 0:
        FIELD(s32, composite, 0x7c) = 30;
        FIELD(s32, composite, 0x80) = 0;
        ++FIELD(s32, effect, 0x68);
        /* Intentional recovered fallthrough into state 1. */
    case 1:
        if (update_polymorphic(composite) != 0) {
            func_02094cf0(composite,
                FIELD(s32, effect, 0x6c) == 0 ? data_ov031_021fe604
                                               : data_ov031_021fe66c, 0);
            ++FIELD(s32, effect, 0x68);
        }
        break;
    case 2:
        func_ov031_021fd69c(effect);
        if (update_polymorphic(composite) != 0) {
            FIELD(s32, composite, 0x7c) = 60;
            FIELD(s32, composite, 0x80) = 0;
            ++FIELD(s32, effect, 0x68);
        }
        break;
    case 3:
        if (update_polymorphic(composite) != 0)
            ++FIELD(s32, effect, 0x68);
        break;
    case 4:
        return 1;
    }
    return 0;
}

/*
 * Stores rectangle edges `left`, `top`, `right`, and `bottom` at offsets
 * +0xA4..+0xB0 of `object`. Returns void; only object memory changes.
 */
extern "C" void func_ov031_021fd91c(void *object, s32 left, s32 top,
                                      s32 right, s32 bottom)
{
    FIELD(s32, object, 0xa4) = left;
    FIELD(s32, object, 0xa8) = top;
    FIELD(s32, object, 0xac) = right;
    FIELD(s32, object, 0xb0) = bottom;
}
