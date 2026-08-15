#include "tingle/types.h"

/*
 * Overlay 1 view-state application. This recovered helper applies a saved
 * selection record and scroll position, then rebuilds visible grid state.
 */

typedef struct Overlay001ViewApplyState {
    u8 field_000[0x1bc];
    void *controller_1bc;
    u8 embedded_1c0[1];
} Overlay001ViewApplyState;

typedef struct Overlay001ViewRecord {
    s32 field_00;
    s32 field_04;
    s32 field_08;
} Overlay001ViewRecord;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02093d7c(void *controller, s32 value);
extern void func_02093d50(void *controller, s32 value);
extern void func_02094574(void *controller);
extern void IndexedSelectionController_SetValue(void *embeddedState, s32 value);
extern void func_ov001_021fc154(Overlay001ViewApplyState *state, s32 scrollY);
extern void func_ov001_021fc068(Overlay001ViewApplyState *state);
extern void func_ov001_021fc644(Overlay001ViewApplyState *state);
#ifdef __cplusplus
}
#endif

/*
 * Send record fields +0, +8, and +4 to controller operation 02093d7c,
 * controller operation 02093d50, and the embedded object at +0x1C0,
 * respectively, with func_02094574 between the controller and embedded steps.
 * Apply scrollY, recompute visible rows, and synchronize selection/cursors.
 * Returns no value; presentation effects occur through the callees.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fca38(Overlay001ViewApplyState *state,
                          const Overlay001ViewRecord *record, s32 scrollY)
{
    func_02093d7c(state->controller_1bc, record->field_00);
    func_02093d50(state->controller_1bc, record->field_08);
    func_02094574(state->controller_1bc);
    IndexedSelectionController_SetValue(state->embedded_1c0, record->field_04);
    func_ov001_021fc154(state, scrollY);
    func_ov001_021fc068(state);
    func_ov001_021fc644(state);
}
