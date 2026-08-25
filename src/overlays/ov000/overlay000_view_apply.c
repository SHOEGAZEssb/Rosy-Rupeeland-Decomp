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
extern void InventoryScroll_SetFirstVisibleRow(void *controller, s32 value);
extern void InventoryScroll_SetSelectedRow(void *controller, s32 value);
extern void InventoryScroll_UpdatePresentation(void *controller);
extern void IndexedSelectionController_SetValue(void *embeddedState, s32 value);
extern void Overlay000_Grid_Scroll(Overlay000ViewApplyState *state, s32 scrollY);
extern void func_ov000_021fc254(Overlay000ViewApplyState *state);
extern void Overlay000_SyncSelection(Overlay000ViewApplyState *state);
extern void Overlay000_Grid_Render(Overlay000ViewApplyState *state);
#ifdef __cplusplus
}
#endif

/*
 * Send record fields +0, +8, and +4 to controller operation 02093d7c,
 * controller operation 02093d50, and the embedded object at +0x270,
 * respectively, with InventoryScroll_UpdatePresentation between the controller and embedded steps.
 * Apply scrollY, recompute visible rows and selection state, then redraw. All
 * presentation effects occur through callees; no hardware is accessed here.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fcae8(Overlay000ViewApplyState *state,
                         const Overlay000ViewRecord *record, s32 scrollY)
{
    InventoryScroll_SetFirstVisibleRow(state->controller_26c, record->field_00);
    InventoryScroll_SetSelectedRow(state->controller_26c, record->field_08);
    InventoryScroll_UpdatePresentation(state->controller_26c);
    IndexedSelectionController_SetValue(state->embedded_270, record->field_04);
    Overlay000_Grid_Scroll(state, scrollY);
    func_ov000_021fc254(state);
    Overlay000_SyncSelection(state);
    Overlay000_Grid_Render(state);
}
