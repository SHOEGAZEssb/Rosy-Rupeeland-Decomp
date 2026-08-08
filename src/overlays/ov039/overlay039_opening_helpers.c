#include "tingle/types.h"

/*
 * Overlay 39 opening object helpers. These recovered constructors initialize
 * the overlay's base transform-like state and its small paired helper records.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_020f3058[];
extern const u8 data_ov039_022083fc[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02004fe0(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Install the address-derived base vtable, initialize embedded objects at
 * +0x1C and +0x2C, clear words +4/+8/+0x0C/+0x44, and return the input object.
 * Embedded subsystem state changes through func_02004fe0.
 */
extern "C" void *func_ov039_021fce00(void *object)
{
    FIELD(const void *, object, 0) = data_020f3058;
    func_02004fe0((u8 *)object + 0x1c);
    func_02004fe0((u8 *)object + 0x2c);
    FIELD(u32, object, 4) = 0;
    FIELD(u32, object, 8) = 0;
    FIELD(u32, object, 0x0c) = 0;
    FIELD(u32, object, 0x44) = 0;
    return object;
}

/* Install the helper vtable and clear words +4/+8; returns no value. */
extern "C" void func_ov039_021fce40(void *helper)
{
    FIELD(const void *, helper, 0) = data_ov039_022083fc;
    FIELD(u32, helper, 4) = 0;
    FIELD(u32, helper, 8) = 0;
}

/* No-op array-element destructor; it changes no state and returns no value. */
extern "C" void func_ov039_021fce5c(void)
{
}

/*
 * Initialize helper records at +0 and +0x0C, store count/value 4 at +0x18,
 * and return the enclosing object. Only the two embedded records change.
 */
extern "C" void *func_ov039_021fce60(void *object)
{
    func_ov039_021fce40(object);
    func_ov039_021fce40((u8 *)object + 0x0c);
    FIELD(u32, object, 0x18) = 4;
    return object;
}
