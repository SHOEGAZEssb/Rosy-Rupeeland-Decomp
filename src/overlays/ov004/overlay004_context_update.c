#include "tingle/types.h"

/*
 * Overlay 4 context update. This recovered helper forwards two presentation
 * fields into the primary renderer context and advances both owned contexts.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay004ContextUpdateState {
    u8 field_000[0x60];
    void *primaryContext_060;
    void *secondaryContext_064;
    u8 field_068[0x14];
    s32 forwarded_07c;
    u8 field_080[0x0c];
    s32 forwarded_08c;
} Overlay004ContextUpdateState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020740a4(void *context);
#ifdef __cplusplus
}
#endif

/*
 * Copy state fields +0x7C/+0x8C to primaryContext_060 offsets +0x18/+0x1C,
 * then pass primaryContext_060 and secondaryContext_064 to func_020740a4.
 * Returns no value. Renderer/animation effects occur in the callee; no direct
 * hardware access is performed here, and the forwarded field semantics remain
 * unconfirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov004_021fbf10(Overlay004ContextUpdateState *state)
{
    FIELD(s32, state->primaryContext_060, 0x18) = state->forwarded_07c;
    FIELD(s32, state->primaryContext_060, 0x1c) = state->forwarded_08c;
    func_020740a4(state->primaryContext_060);
    func_020740a4(state->secondaryContext_064);
}
