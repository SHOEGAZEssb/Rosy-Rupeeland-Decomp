#include "tingle/types.h"

/*
 * Overlay 44 presentation update. This recovered helper tracks the selected
 * panel row in a cached binding and advances the secondary presentation and
 * scene-specific display update each frame.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_02095928(void *presentation);
extern "C" void func_ov044_0220c80c(void *object);

/*
 * If cached binding +0xCC exists, write its +0x2E halfword to 0x20 plus 24
 * times the difference between child selection +0x14 and top row +0x0C.
 * Then advance presentation +0x17C and invoke func_ov044_0220c80c. Binding,
 * presentation, and downstream graphics state may change; no value is
 * returned.
 */
extern "C" void func_ov044_0220c700(void *object)
{
    void *binding = FIELD(void *, object, 0xcc);
    if (binding) {
        void *panel = FIELD(void *, object, 0x228);
        void *child = FIELD(void *, panel, 0x44);
        s32 row = FIELD(s32, child, 0x14) - FIELD(s32, child, 0xc);
        FIELD(u16, binding, 0x2e) = (u16)(row * 24 + 0x20);
    }
    func_02095928((u8 *)object + 0x17c);
    func_ov044_0220c80c(object);
}
