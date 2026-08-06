#include "tingle/types.h"

/*
 * Recovered spawn helper for the trigger-presentation actor. It builds the
 * common temporary descriptor, allocates an actor, selects its presentation
 * entry, and enables actor flag 0x100.
 */

extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02007f0c(void *context, s32 index);
extern void *func_0202ecd0(void *manager, const void *descriptor);
extern void func_0203ae14(void *destination, ...);
extern void func_0204ea8c(void *actor, u16 selection);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are actor type, presentation selection, a fixed-point position, and
 * five descriptor values. Build the recovered 100-byte descriptor using the
 * final two values as its dimensions, allocate through manager index one,
 * reset presentation state with func_0204ea8c, and set actor flag 0x100.
 * Retail leaves the updated flag word in r0 but recovered callers treat the
 * function as void. Actor-manager state changes; no hardware is touched directly.
 */
void func_0204eb18(u32 type, u32 selection, const void *position,
                   u32 descriptor_arg0, u32 descriptor_arg1,
                   u32 descriptor_arg2, u32 width, u32 height)
{
    u8 descriptor[100];
    func_0203ae14(descriptor, 4, type, descriptor_arg0, descriptor_arg1,
                  descriptor_arg2, 2, 0,
                  FIELD(s32, position, 4) >> 12,
                  FIELD(s32, position, 8) >> 12,
                  FIELD(s32, position, 12) >> 12,
                  width, height, 0, 0, 0, 0, 0, 0xff, 0, 0, 0, 0);
    void *manager = func_02007f0c(data_021052fc, 1);
    void *actor = func_0202ecd0(manager, descriptor);
    func_0204ea8c(actor, selection);
    FIELD(u32, actor, 0x10) |= 0x100;
}

