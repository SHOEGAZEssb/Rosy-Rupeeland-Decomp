#include "tingle/types.h"

/*
 * Overlay 8 base-object construction. This recovered constructor installs the
 * shared descriptor, constructs two embedded members, and clears base state.
 */

typedef struct Overlay008BaseObject {
    const void *descriptor_000;
    s32 field_004;
    s32 field_008;
    s32 field_00c;
    u8 field_010[0x0c];
    u8 member_01c[0x10];
    u8 member_02c[0x18];
    s32 field_044;
} Overlay008BaseObject;

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020f3058[];
extern void func_02004fe0(void *member);
#ifdef __cplusplus
}
#endif

/*
 * Install data_020f3058 at +0x00, construct members +0x1C and +0x2C through
 * func_02004fe0, clear +0x04/+0x08/+0x0C/+0x44, and return state. Member and
 * field semantics remain unidentified; construction effects are delegated and
 * no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay008BaseObject *func_ov008_021fb6e0(Overlay008BaseObject *state)
{
    state->descriptor_000 = data_020f3058;
    func_02004fe0(state->member_01c);
    func_02004fe0(state->member_02c);
    state->field_004 = 0;
    state->field_008 = 0;
    state->field_00c = 0;
    state->field_044 = 0;
    return state;
}
