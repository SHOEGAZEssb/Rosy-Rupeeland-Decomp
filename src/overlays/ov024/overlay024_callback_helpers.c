#include "tingle/types.h"

/* Overlay 24 empty controller hook and scene callback installation helper. */

/* Empty controller lifecycle hook; input and all external state are unchanged. */
extern "C" void func_ov024_021fce00(void *controller)
{
    (void)controller;
}

/*
 * Stores callback/argument at scene +0x24/+0x28 and clears step +4/timer +8.
 * The callback is not invoked; only scene state changes and there is no return.
 */
extern "C" void func_ov024_021fce04(void *scene, void *callback, void *argument)
{
    *(void **)((u8 *)scene + 0x24) = callback;
    *(void **)((u8 *)scene + 0x28) = argument;
    *(s32 *)((u8 *)scene + 4) = 0;
    *(s32 *)((u8 *)scene + 8) = 0;
}
