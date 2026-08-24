#include "tingle/types.h"

/* Overlay 29 base-object construction and small field configuration helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov029_021fecec[];

#ifdef __cplusplus
extern "C" {
#endif
extern void RecordDescriptor_BindById(void *, void *);
#ifdef __cplusplus
}
#endif

/*
 * Installs vtable 0x021FECEC, clears words +4/+8/+0xC, invokes base constructor
 * 0x0207C460 with the caller's second argument, and returns `object`. Base SDK
 * state may be initialized; the vtable's precise class role is unidentified.
 */
extern "C" void *func_ov029_021fce00(void *object, void *argument)
{
    FIELD(const void *, object, 0) = data_ov029_021fecec;
    FIELD(s32, object, 4) = 0;
    FIELD(s32, object, 8) = 0;
    FIELD(s32, object, 0xc) = 0;
    RecordDescriptor_BindById(object, argument);
    return object;
}

/* No-op callback: ignores `object`, changes no state, and returns void. */
extern "C" void func_ov029_021fce30(void *object)
{
    (void)object;
}

/*
 * Stores four caller values in words +0xA4..+0xB0 and returns void. The fourth
 * value is the first stack argument; no SDK or hardware effects occur.
 */
extern "C" void func_ov029_021fce34(void *object, s32 a, s32 b, s32 c, s32 d)
{
    FIELD(s32, object, 0xa4) = a;
    FIELD(s32, object, 0xa8) = b;
    FIELD(s32, object, 0xac) = c;
    FIELD(s32, object, 0xb0) = d;
}

/*
 * Stores caller values `a`/`b` at +0x24/+0x28 and clears words +4/+8. Returns
 * void; only object memory changes and the value meanings remain unidentified.
 */
extern "C" void func_ov029_021fce4c(void *object, s32 a, s32 b)
{
    FIELD(s32, object, 0x24) = a;
    FIELD(s32, object, 0x28) = b;
    FIELD(s32, object, 4) = 0;
    FIELD(s32, object, 8) = 0;
}
