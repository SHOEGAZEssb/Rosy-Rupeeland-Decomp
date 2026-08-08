#include "tingle/types.h"

/* Overlay 37 specialized render-object construction and positional update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fee24[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov037_021fceb0(void *object, void *owner, s32 index,
                                 s32 parameter);
extern void func_020948d4(void *field, s32 value, s32 delta);
extern void func_02094dd4(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the common overlay render object with index 0 and parameter 5,
 * installs the specialized vtable, and retains the third argument at +0xC4.
 * Returns object; common object initialization changes object state.
 */
extern "C" void *func_ov037_021fd554(void *object, void *owner, s32 offset)
{
    func_ov037_021fceb0(object, owner, 0, 5);
    FIELD(const void *, object, 0) = data_ov037_021fee24;
    FIELD(s32, object, 0xc4) = offset;
    return object;
}

/*
 * Updates the field beginning at +0x4C toward +0x50 plus the retained +0xC4
 * offset, passing that offset as the update delta, then runs the common object
 * update. Returns nothing; only object/engine animation state changes.
 */
extern "C" void func_ov037_021fd584(void *object)
{
    s32 offset = FIELD(s32, object, 0xc4);
    func_020948d4((u8 *)object + 0x4c,
                  FIELD(s32, object, 0x50) + offset, offset);
    func_02094dd4(object);
}
