#include "tingle/types.h"

/* Overlay 23 list-entry lifetime helpers for embedded resource descriptors. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
#ifdef __cplusplus
}
#endif

/*
 * Initializes the embedded resource descriptor at entry +4, clears pointer
 * fields +0/+0x10 and signed placement halfwords +0x14/+0x16, and returns the
 * original entry. Only entry/resource-descriptor state changes; no hardware
 * or persistent game state is touched.
 */
extern "C" void *func_ov023_021fce00(void *entry)
{
    AnimationResourceState_InitEmbedded((u8 *)entry + 4);
    FIELD(void *, entry, 0) = 0;
    FIELD(void *, entry, 0x10) = 0;
    FIELD(u16, entry, 0x14) = 0;
    FIELD(u16, entry, 0x16) = 0;
    return entry;
}

/*
 * Releases the embedded resource descriptor at entry +4 and returns the
 * original entry. Descriptor-owned SDK resources may change; the allocation
 * itself is not freed here.
 */
extern "C" void *func_ov023_021fce2c(void *entry)
{
    AnimationResourceState_Destroy((u8 *)entry + 4);
    return entry;
}
