#include "tingle/types.h"

/*
 * Overlay 0 view-state application. This recovered helper applies a three-word
 * selection record and scroll position, then rebuilds the visible grid state.
 */

typedef struct Overlay000ViewApplyState {
    u8 field_000[0x26c];
    void *controller_26c;
    u8 embedded_270[1];
} Overlay000ViewApplyState;

typedef struct Overlay000ViewRecord {
    s32 field_00;
    s32 field_04;
    s32 field_08;
} Overlay000ViewRecord;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02093d7c(void *controller, s32 value);
extern void func_02093d50(void *controller, s32 value);
extern void func_02094574(void *controller);
extern void IndexedSelectionController_SetValue(void *embeddedState, s32 value);
extern void func_ov000_021fc340(Overlay000ViewApplyState *state, s32 scrollY);
extern void func_ov000_021fc254(Overlay000ViewApplyState *state);
extern void func_ov000_021fc9d4(Overlay000ViewApplyState *state);
extern void func_ov000_021fc714(Overlay000ViewApplyState *state);
#ifdef __cplusplus
}
#endif

/*
 * Send record fields +0, +8, and +4 to controller operation 02093d7c,
 * controller operation 02093d50, and the embedded object at +0x270,
 * respectively, with func_02094574 between the controller and embedded steps.
 * Apply scrollY, recompute visible rows and selection state, then redraw. All
 * presentation effects occur through callees; no hardware is accessed here.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fcae8(Overlay000ViewApplyState *state,
                         const Overlay000ViewRecord *record, s32 scrollY)
{
    func_02093d7c(state->controller_26c, record->field_00);
    func_02093d50(state->controller_26c, record->field_08);
    func_02094574(state->controller_26c);
    IndexedSelectionController_SetValue(state->embedded_270, record->field_04);
    func_ov000_021fc340(state, scrollY);
    func_ov000_021fc254(state);
    func_ov000_021fc9d4(state);
    func_ov000_021fc714(state);
}
