#include "tingle/types.h"

/*
 * Overlay 5 context-pair setter. This recovered helper writes two caller
 * values into the cached context owned by a scene-population object.
 */

typedef struct Overlay005ContextPair {
    u8 field_000[0x18];
    s32 first_018;
    s32 second_01c;
} Overlay005ContextPair;

typedef struct Overlay005ContextOwner {
    u8 field_000[0x04];
    Overlay005ContextPair *context_004;
} Overlay005ContextOwner;

/*
 * Store first and second at offsets +0x18 and +0x1C of owner->context_004.
 * Return no value. The original performs no null check, allocation, SDK call,
 * or direct hardware access; field semantics remain unidentified.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov005_021fbd64(Overlay005ContextOwner *owner, s32 first, s32 second)
{
    Overlay005ContextPair *context = owner->context_004;

    context->first_018 = first;
    context->second_01c = second;
}
