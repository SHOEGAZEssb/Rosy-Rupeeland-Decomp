#include "tingle/debug_phase_selector.h"
#include "tingle/debug_menu.h"
#include "tingle/game_phase.h"
#include "tingle/heap.h"
#include "tingle/system.h"

/* Handle input, rendering, fades, and launch behavior for the phase selector. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020d52f8[];
extern void DebugText_BeginFrame(void);
extern void DisplayBrightness_StartMainTransition(s32 screen, s32 frames);
extern void DisplayBrightness_StartSubTransition(s32 screen, s32 frames);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void *ScenarioSelectMenu_Construct(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Draw the grid and process the two-state selector. In state 0, B returns to
 * DebugMenu; a preselected phase or A starts a screen-2 fade; Select launches
 * an address-derived 0xb8-byte debug object; R cycles three 90-phase pages;
 * repeated D-pad input wraps through 10 columns and 9 rows. In state 1, once
 * the fade completes, destroy this scene and start selectedPhase+1 with mode 0.
 * Returns 1 only when this scene hands off control, otherwise 0. The function
 * mutates debug graphics, scene ownership, display control, and game-phase
 * state through the noted helpers.
 */
s32 DebugPhaseSelector_Update(DebugPhaseSelector *self)
{
    u16 pressed;

    DebugText_BeginFrame();
    ActorRuntimeGridCanvas_DrawPage(&self->grid, self->column, self->row);
    if (self->state == 0) {
        pressed = gSystemState.pads[0].pressed;
        if (pressed & 2) {
            if (self != 0)
                self->base.vtable->destroyAndFree(&self->base);
            DebugMenu_Create();
            return 1;
        }
        if (self->selectedPhase != -1) {
            DisplayBrightness_StartMainTransition(2, 0x10);
            DisplayBrightness_StartSubTransition(2, 0x10);
            self->state++;
        } else if (pressed & 4) {
            volatile u32 *subDisplayControl = (volatile u32 *)0x04001000;
            u32 mode = (*subDisplayControl & 0x1f00) >> 8;
            void *debugObject;

            *subDisplayControl = (*subDisplayControl & ~0x1f00) |
                                 ((mode & ~4) << 8);
            DebugText_BeginFrame();
            debugObject = Heap_Alloc(0xb8, (const char *)data_020d52f8, 4,
                                     &gHeapContext);
            if (debugObject != 0)
                ScenarioSelectMenu_Construct(debugObject);
        } else if (pressed & 1) {
            self->selectedPhase = self->grid.pageIndex * 90 +
                                  self->row * 10 + self->column;
            DisplayBrightness_StartMainTransition(2, 0x10);
            DisplayBrightness_StartSubTransition(2, 0x10);
            self->state++;
        } else if (pressed & 0x100) {
            self->grid.pageIndex++;
            if (self->grid.pageIndex > 2)
                self->grid.pageIndex = 0;
            ActorRuntimeGridCanvas_DrawGrid(&self->grid);
        } else {
            u16 repeated = gSystemState.pads[0].repeated;

            if (repeated & 0x40) {
                if (--self->row < 0)
                    self->row = 8;
            } else if (repeated & 0x80) {
                if (++self->row >= 9)
                    self->row = 0;
            } else if (repeated & 0x20) {
                if (--self->column < 0)
                    self->column = 9;
            } else if (repeated & 0x10) {
                if (++self->column >= 10)
                    self->column = 0;
            }
        }
    } else if (self->state == 1 && DisplayBrightness_IsMainTransitionComplete()) {
        s32 phase = self->selectedPhase;
        DebugText_BeginFrame();
        if (self != 0)
            self->base.vtable->destroyAndFree(&self->base);
        GamePhase_Start(phase + 1, 0);
        return 1;
    }
    return 0;
}
