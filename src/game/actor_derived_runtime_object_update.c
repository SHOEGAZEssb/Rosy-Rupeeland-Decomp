#include "tingle/types.h"

/* Advance derived actor track motion, auxiliary motion, height correction, and virtual frame work. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02031748(void *actor);
extern s32 func_02034164(void *actor);
extern void *func_020050a4(void *destination, const void *source);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern void func_020050c8(void *destination, const void *delta);
extern void func_020067b0(void *track);
extern void *func_020067fc(void *track);
extern s32 func_02006804(void *track);
extern void *func_020068ac(void *track);
extern void Actor_UpdateTerrainMotionFeedback(void *actor);
#ifdef __cplusplus
}
#endif

/* Clear vector at the supplied actor offset through the recovered temporary-vector lifecycle. */
static void clearActorVector(u8 *actor, u32 offset)
{
    s32 zero[4];
    func_0200500c(zero, 0, 0, 0);
    func_020050a4(actor + offset, zero);
    func_02005058(zero);
}

/*
 * Run base frame helper func_02031748 and return early when func_02034164 says
 * the actor is inactive. Copy position +0x18 to +0x28. While +0x10 bit 0x40
 * permits track processing (with the recovered bit-one/+0x14 bit-0x10 gate),
 * advance track +0x198 and copy sampled components +4/+8/+0xc to motion
 * +0x3c/+0x40/+0x44, retaining Z when +0x10 bit 0x400 is set. A completed
 * track clears bit 0x40 and motion +0x38, then copies its terminal vector to
 * +0x28 and +0x18. An incomplete track can instead be cancelled when byte
 * +0x4b or virtual +0xa0 is true and +0x14 bit 0x40000000 is set.
 *
 * Invoke Actor_UpdateTerrainMotionFeedback for +0x14 bit 0x100000, add motion +0x38 to position,
 * and process the +0x10 bit-0x400 height correction unless +0x14 bit 0x40 is
 * set. Above floor +0x1dc, subtract virtual +0xb0 from vertical motion +0x44;
 * at or below it, clamp a strictly lower height, clear +0x14 bit 0x20000000,
 * clear correction bit 0x400, and zero +0x44. Finish with virtual +0x20.
 * Returns no value; track, vector, correction, and virtual calls mutate actor
 * and presentation state.
 */
void func_0203b798(void *self)
{
    u8 *actor = (u8 *)self;
    func_02031748(actor);
    if (func_02034164(actor) == 0)
        return;
    func_020050a4(actor + 0x28, actor + 0x18);

    if ((*(u32 *)(actor + 0x10) & 0x40) != 0 &&
        ((*(u32 *)(actor + 0x10) & 1) == 0 ||
         (*(u32 *)(actor + 0x14) & 0x10) != 0)) {
        u8 *sample;
        func_020067b0(actor + 0x198);
        sample = (u8 *)func_020067fc(actor + 0x198);
        *(s32 *)(actor + 0x3c) = *(s32 *)(sample + 4);
        sample = (u8 *)func_020067fc(actor + 0x198);
        *(s32 *)(actor + 0x40) = *(s32 *)(sample + 8);
        if ((*(u32 *)(actor + 0x10) & 0x400) == 0) {
            sample = (u8 *)func_020067fc(actor + 0x198);
            *(s32 *)(actor + 0x44) = *(s32 *)(sample + 0x0c);
        }
        if (func_02006804(actor + 0x198) != 0) {
            void *terminal;
            *(u32 *)(actor + 0x10) &= ~0x40;
            clearActorVector(actor, 0x38);
            terminal = func_020068ac(actor + 0x198);
            func_020050a4(actor + 0x28, terminal);
            func_020050a4(actor + 0x18, actor + 0x28);
        } else {
            s32 cancel = actor[0x4b] != 0;
            if (!cancel)
                cancel = (*(s32 (**)(void *))(*(u8 **)actor + 0xa0))(actor);
            if (cancel && (*(u32 *)(actor + 0x14) & 0x40000000) != 0) {
                *(u32 *)(actor + 0x10) &= ~0x40;
                clearActorVector(actor, 0x38);
            }
        }
    }
    if ((*(u32 *)(actor + 0x14) & 0x100000) != 0)
        Actor_UpdateTerrainMotionFeedback(actor);
    func_020050c8(actor + 0x18, actor + 0x38);
    if ((*(u32 *)(actor + 0x14) & 0x40) == 0 &&
        (*(u32 *)(actor + 0x10) & 0x400) != 0) {
        s32 floor = *(s32 *)(actor + 0x1dc);
        if (*(s32 *)(actor + 0x24) > floor) {
            s32 delta = (*(s32 (**)(void *))(*(u8 **)actor + 0xb0))(actor);
            *(s32 *)(actor + 0x44) -= delta;
        } else {
            if (*(s32 *)(actor + 0x24) < floor) {
                *(s32 *)(actor + 0x24) = floor;
                *(u32 *)(actor + 0x14) &= ~0x20000000;
            }
            *(u32 *)(actor + 0x10) &= ~0x400;
            *(s32 *)(actor + 0x44) = 0;
        }
    }
    (*(void (**)(void *))(*(u8 **)actor + 0x20))(actor);
}
