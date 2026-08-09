#include "tingle/types.h"

/*
 * Overlay 42 late-effect dispatch. This recovered helper gates an owner effect
 * emission and alternates between the stored element position and a randomized
 * copy according to an offset-derived frame counter.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_0209a2ac(void *object, s32 selector, s32 enabled);
extern "C" void func_ov042_021fdd48(void *manager, s32 mode,
                                    const void *position);
extern "C" void func_ov042_02203658(void *destination, const void *source);
extern "C" u32 genrand_int32(void);

/*
 * Enable selector zero on object. If state +0x74 is below 100 and not two,
 * emit through owner+0x14: every sixth +0x80 tick uses mode zero and object+0x50
 * directly; other ticks copy that 12-byte position, independently perturb its
 * +4/+8 coordinates by [-18,17] fx32 units, and emit mode one. Owner effect
 * state may change; object is otherwise unchanged and no value is returned.
 */
extern "C" void func_ov042_0220a720(void *object)
{
    func_0209a2ac(object, 0, 1);
    s32 state = FIELD(s32, object, 0x74);
    if (state >= 100 || state == 2)
        return;
    void *manager = FIELD(void *, FIELD(void *, object, 0x48), 0x14);
    if (FIELD(s32, object, 0x80) % 6 == 0) {
        func_ov042_021fdd48(manager, 0, (u8 *)object + 0x50);
        return;
    }
    u8 position[12];
    func_ov042_02203658(position, (u8 *)object + 0x50);
    FIELD(s32, position, 4) += ((s32)(genrand_int32() % 36) - 18) << 12;
    FIELD(s32, position, 8) += ((s32)(genrand_int32() % 36) - 18) << 12;
    func_ov042_021fdd48(manager, 1, position);
}
