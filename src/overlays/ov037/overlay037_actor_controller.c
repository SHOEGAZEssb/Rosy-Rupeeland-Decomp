#include "tingle/types.h"

/* Overlay 37 actor attachment, transform propagation, and queued mode changes. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fee08[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020955b0(void *controller, void *argument);
extern void func_020720c0(void *state);
extern void func_020956f0(void *controller);
extern void func_02076be8(void *actor, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Writes x/y/z to actor offsets +0x20/+0x24/+0x28. Returns nothing and only
 * changes the supplied actor; no SDK or hardware call is made.
 */
extern "C" void func_ov037_021fd6c0(void *actor, s32 x, s32 y, s32 z)
{
    FIELD(s32, actor, 0x20) = x;
    FIELD(s32, actor, 0x24) = y;
    FIELD(s32, actor, 0x28) = z;
}

/*
 * Initializes the common controller and its embedded +0xA0 state, installs
 * the overlay vtable, and retains actor at +0xAC. Actor flags +0x50 gain bits
 * 1 and 6, while bytes +0x5A/+0x5B become 6 and 24. Returns controller.
 */
extern "C" void *func_ov037_021fd5ac(void *controller, void *argument,
                                      void *actor)
{
    func_020955b0(controller, argument);
    FIELD(const void *, controller, 0) = data_ov037_021fee08;
    func_020720c0((u8 *)controller + 0xa0);
    FIELD(void *, controller, 0xac) = actor;
    FIELD(u16, actor, 0x50) |= 0x42;
    FIELD(u8, actor, 0x5a) = 6;
    FIELD(u8, actor, 0x5b) = 0x18;
    return controller;
}

/*
 * Runs the common update, copies source +0x20/+0x24/+0x28 (adding 16 to z)
 * and +0x34 into the attached actor, then consumes at most one pending flag
 * from +0x98. Bits 0..3 request actor modes 1..4 in priority order. Returns
 * nothing; controller, actor transform, and actor SDK state may change.
 */
extern "C" void func_ov037_021fd600(void *controller)
{
    func_020956f0(controller);
    void *source = FIELD(void *, controller, 0x9c);
    void *actor = FIELD(void *, controller, 0xac);
    func_ov037_021fd6c0(actor, FIELD(s32, source, 0x20),
                        FIELD(s32, source, 0x24),
                        FIELD(s32, source, 0x28) + 0x10);
    s32 facing = FIELD(s32, source, 0x34);
    FIELD(s32, actor, 0x38) = facing;
    FIELD(s32, actor, 0x34) = facing;

    u16 flags = FIELD(u16, controller, 0x98);
    for (s32 bit = 0; bit < 4; ++bit) {
        u16 mask = (u16)(1 << bit);
        if ((flags & mask) != 0) {
            FIELD(u16, controller, 0x98) = flags & (u16)~mask;
            func_02076be8(actor, bit + 1);
            return;
        }
    }
}
