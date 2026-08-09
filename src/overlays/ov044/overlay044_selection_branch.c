#include "tingle/types.h"

/*
 * Overlay 44 selection branch. This recovered helper classifies the selected
 * panel record and routes the scene into either a flagged-record state or the
 * normal selection callback sequence.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 data_ov044_0220d2e8[2];
extern "C" void *func_ov044_0220bd98(void *panel);
extern "C" u32 func_ov044_0220bb48(void *record, u32 mask);
extern "C" void func_02092260(void *object, s32 state);
extern "C" void func_ov044_0220be38(void *object, u32 first, u32 second);

/*
 * Test flag bit one on the selected panel record. For a flagged record, request
 * base state 9, set scene substate +0x04 to 10, and reset +0x08. Otherwise
 * request base state 2 and install callback pair data_ov044_0220d2e8. Scene
 * state changes through both dispatch helpers; no value is returned.
 */
extern "C" void func_ov044_0220caa4(void *object)
{
    void *record = func_ov044_0220bd98(FIELD(void *, object, 0x228));
    if (func_ov044_0220bb48(record, 1)) {
        func_02092260(object, 9);
        FIELD(s32, object, 4) = 10;
        FIELD(s32, object, 8) = 0;
        return;
    }
    func_02092260(object, 2);
    func_ov044_0220be38(object, data_ov044_0220d2e8[0],
                        data_ov044_0220d2e8[1]);
}
