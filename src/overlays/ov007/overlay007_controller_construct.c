#include "tingle/types.h"

/*
 * Overlay 7 controller construction. This recovered derived constructor builds
 * the base object, installs its descriptor, and initializes retained state.
 */

typedef struct Overlay007Controller {
    const void *descriptor_000;
    u8 field_004[0x44];
    void *owner_048;
    s32 field_04c;
    u8 field_050[0x30];
    u8 member_080[0x10];
    s32 field_090;
    s32 field_094;
    u8 field_098[0x3c];
    s32 field_0d4;
} Overlay007Controller;

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_ov007_021fc270[];
extern void *func_ov007_021fb6e0(void *state);
extern void VecFx32Object_Init(void *member);
#ifdef __cplusplus
}
#endif

/*
 * Construct the base through func_ov007_021fb6e0, install
 * data_ov007_021fc270 at +0x00, construct member_080, retain owner at +0x48,
 * clear +0x4C/+0x94/+0xD4, set +0x90 to 10, and return state. Member semantics
 * remain unidentified; construction is delegated and no hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay007Controller *func_ov007_021fb720(Overlay007Controller *state,
                                           void *owner)
{
    func_ov007_021fb6e0(state);
    state->descriptor_000 = data_ov007_021fc270;
    VecFx32Object_Init(state->member_080);
    state->owner_048 = owner;
    state->field_04c = 0;
    state->field_0d4 = 0;
    state->field_090 = 10;
    state->field_094 = 0;
    return state;
}
