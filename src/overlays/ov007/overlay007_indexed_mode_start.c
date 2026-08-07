#include "tingle/types.h"

/*
 * Overlay 7 indexed-object mode trigger. This recovered helper marks one of
 * the controller's indexed records active and derives an odd mode value from
 * the supplied signed index.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02072b68(void *member, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Use state and index to select the four-byte-strided record, set its word
 * +0xA4 to one, and submit 2 * (index % 4) + 1 through the pointer held by its
 * +0x50 object's +0x0C field. Return no value; the callee owns object effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov007_021fc19c(void *state, s32 index)
{
    state = (u8 *)state + index * 4;
    *(s32 *)((u8 *)state + 0xa4) = 1;
    func_02072b68(*(void **)(*(u8 **)((u8 *)state + 0x50) + 0x0c),
                  (u8)(2 * (index % 4) + 1));
}
