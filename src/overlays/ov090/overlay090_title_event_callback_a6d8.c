#include "tingle/types.h"

/* Event-code callback that feeds the active phase-90 title controller state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*TitleVirtualMethodC4)(void *self, s32 value);

extern void func_ov090_0221a784(void *self, void *event);

/*
 * While state 0x0b is active and byte +0x247 is clear, interpret the signed
 * event code reached through +0x1fc. Code 19 invokes virtual method +0xc4 with
 * 100; code 21 advances through the retail transition callback.
 */
void func_ov090_0221a6d8(void *self, void *event)
{
    u8 state = FIELD(u8, self, 0x1ec);
    s16 eventCode;

    if (state != 0x0b || FIELD(u8, self, 0x247) != 0)
        return;

    eventCode = **(s16 **)((u8 *)event + 0x1fc);
    switch (eventCode) {
    case 0x13: {
        TitleVirtualMethodC4 method =
            (TitleVirtualMethodC4)(*(void ***)self)[0xc4 / 4];
        method(self, 100);
        break;
    }
    case 0x14:
        break;
    case 0x15:
        if (state == 0x0b)
            func_ov090_0221a784(self, event);
        break;
    }
}
