#include "tingle/types.h"

/*
 * Overlay 0 presentation-layout field initializer. This recovered helper
 * installs four caller-provided coordinate or extent values in a larger
 * overlay-owned object; their precise semantics remain unconfirmed.
 */

typedef struct Overlay000LayoutOwner {
    u8 field_000[0xa4];
    s32 field_0a4;
    s32 field_0a8;
    s32 field_0ac;
    s32 field_0b0;
} Overlay000LayoutOwner;

/*
 * Store valueA through valueD in fields 0xA4, 0xA8, 0xAC, and 0xB0 of owner.
 * The owner is mutated and nothing is returned. No SDK service or hardware is
 * accessed; interpretation of the four values is still inferred from callers.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fb710(Overlay000LayoutOwner *owner, s32 valueA,
                         s32 valueB, s32 valueC, s32 valueD)
{
    owner->field_0a4 = valueA;
    owner->field_0a8 = valueB;
    owner->field_0ac = valueC;
    owner->field_0b0 = valueD;
}
