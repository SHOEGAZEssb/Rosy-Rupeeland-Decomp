#include "tingle/graphics_resources.h"

/* Configure a sub-engine text background while preserving retail's temporary resource lifecycle. */

#ifdef __cplusplus
extern "C" {
#endif
extern void OS_Halt(void);
extern void func_0201c338(s32 charBase, s32 colorMode, s32 screenBase, s32 size,
                          s32 bit13);
extern void func_0201c36c(s32 charBase, s32 colorMode, s32 screenBase, s32 size,
                          s32 bit13);
extern void func_0201c3a0(s32 charBase, s32 colorMode, s32 screenBase, s32 size);
extern void func_0201c3cc(s32 charBase, s32 colorMode, s32 screenBase, s32 size);
#ifdef __cplusplus
}
#endif

/*
 * Configure sub background 0..3 in the recovered text mode, set its priority,
 * and return zero.  Size outside 0..7 halts; charBase is required to be 0..3.
 * Retail initializes and destroys an otherwise-unused resource set around the
 * register writes, a lifecycle side effect retained by the portable form.
 */
s32 func_0201c3f8(s32 background, s32 charBase, s32 priority, s32 size)
{
    GraphicsResourceSet resources;
    s32 mappedCharBase;
    s32 mappedSize;
    volatile u16 *control;

    switch (charBase) {
    case 0: mappedCharBase = 0; break;
    case 1: mappedCharBase = 1; break;
    case 2: mappedCharBase = 2; break;
    case 3: mappedCharBase = 3; break;
    }
    switch (size) {
    case 0: mappedSize = 0; break;
    case 1: mappedSize = 1; break;
    case 2: mappedSize = 2; break;
    case 3: mappedSize = 3; break;
    case 4: mappedSize = 4; break;
    case 5: mappedSize = 5; break;
    case 6: mappedSize = 6; break;
    case 7: mappedSize = 7; break;
    default: OS_Halt(); break;
    }

    GraphicsResourceSet_Init(&resources);
    if ((u32)background <= 3) {
        if (background == 0)
            func_0201c338(mappedCharBase, 0, 0x18, mappedSize, 0);
        else if (background == 1)
            func_0201c36c(mappedCharBase, 0, 0x1a, mappedSize, 0);
        else if (background == 2)
            func_0201c3a0(mappedCharBase, 0, 0x1c, mappedSize);
        else
            func_0201c3cc(mappedCharBase, 0, 0x1e, mappedSize);
        control = (volatile u16 *)(0x04001008 + background * 2);
        *control = (u16)((*control & ~3) | priority);
    }
    GraphicsResourceSet_Destroy(&resources);
    return 0;
}
