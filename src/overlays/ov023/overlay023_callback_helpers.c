#include "tingle/types.h"

/* Overlay 23 pointer-element initialization and intentionally empty callback hooks. */

/*
 * Initializes a four-byte pointer element to null. Only the supplied element
 * changes; there is no return value or SDK/hardware effect.
 */
extern "C" void func_ov023_021fd438(void **element)
{
    *element = 0;
}

/*
 * Empty pointer-element destructor hook. The input is untouched, no value is
 * returned, and no heap, SDK, or hardware state changes.
 */
extern "C" void func_ov023_021fd630(void *element)
{
    (void)element;
}

/*
 * Empty scene callback hook. The input is ignored, no state changes, and no
 * value is returned.
 */
extern "C" void func_ov023_021fd9b4(void *scene)
{
    (void)scene;
}

/*
 * Stores four dialog-layout arguments at +0xA4/+0xA8/+0xAC/+0xB0; the fourth
 * argument is read from the caller stack. Only the dialog object changes and
 * there is no return value or SDK/hardware effect.
 */
extern "C" void func_ov023_021fd9b8(void *dialog, s32 a, s32 b, s32 c, s32 d)
{
    *(s32 *)((u8 *)dialog + 0xa4) = a;
    *(s32 *)((u8 *)dialog + 0xa8) = b;
    *(s32 *)((u8 *)dialog + 0xac) = c;
    *(s32 *)((u8 *)dialog + 0xb0) = d;
}

/*
 * Installs a scene callback and argument at +0x24/+0x28, then clears state step
 * +4 and timer +8. The callback is not invoked during this call; no hardware
 * or persistent state changes.
 */
extern "C" void func_ov023_021fd9d0(void *scene, void *callback, void *argument)
{
    *(void **)((u8 *)scene + 0x24) = callback;
    *(void **)((u8 *)scene + 0x28) = argument;
    *(s32 *)((u8 *)scene + 4) = 0;
    *(s32 *)((u8 *)scene + 8) = 0;
}
