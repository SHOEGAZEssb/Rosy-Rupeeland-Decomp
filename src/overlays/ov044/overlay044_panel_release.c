#include "tingle/types.h"

/*
 * Overlay 44 panel release. This recovered helper preserves the child
 * viewport indices before destroying and freeing the current panel instance.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_ov044_0220b8e4(void *panel);
extern "C" void Heap_Free(void *allocation);

/*
 * Copy child +0x0C/+0x14 into scene +0x230/+0x234, destroy and free panel
 * +0x228 when present, then clear that pointer. The saved indices survive for
 * a later panel rebuild; heap/UI state changes and no value is returned.
 */
extern "C" void func_ov044_0220c5c0(void *object)
{
    void *panel = FIELD(void *, object, 0x228);
    void *child = FIELD(void *, panel, 0x44);
    FIELD(s32, object, 0x230) = FIELD(s32, child, 0xc);
    FIELD(s32, object, 0x234) = FIELD(s32, child, 0x14);
    if (panel) {
        func_ov044_0220b8e4(panel);
        Heap_Free(panel);
    }
    FIELD(void *, object, 0x228) = 0;
}
