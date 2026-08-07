#include "tingle/types.h"

/* Overlay 12 indexed draw-record submission for a transform resource. */

#ifdef __cplusplus
extern "C" void func_01ff88c4(s32, void *, u32);
#else
extern void func_01ff88c4(s32, void *, u32);
#endif

/* Select a 12-byte record from resource +0x24 and tail-submit mode 3, its base-relative +0x04 pointer, and word +0x00; returns the callee ABI value. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fcfd4(void *object, s32 index)
{
    u8 *resource = *(u8 **)((u8 *)object + 4);
    u8 *base = *(u8 **)(resource + 0x24);
    u8 *record = base + index * 12;

    func_01ff88c4(3, base + *(u32 *)(record + 4), *(u32 *)record);
}
