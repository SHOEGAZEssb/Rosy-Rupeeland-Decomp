#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Manage a short overlay-backed prompt presentation.  It temporarily changes
 * currency-HUD runtime mode, owns a shared resource and optional 0x88-byte overlay
 * worker, waits for GameWork flag 0x408, and forwards two render callbacks.
 */

typedef struct OverlayPromptPresentation {
    void **vtable; u32 dispatchState; s32 state08; void *worker0c;
    u8 sharedResource10[0x0c]; s32 restoreMode1c; s32 callbacksActive20;
} OverlayPromptPresentation;
typedef void (*WorkerMethod)(void *);

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d653c;
extern const char gOverlayPromptWorkerAllocationTag[];
extern u8 *gGamePhaseCurrencyHud;
extern void *gGameWork;
extern void *gDebugFont;

extern void OverlaySlot_Init(void *);
extern void OverlaySlot_Destroy(void *);
extern void OverlaySlot_LoadOverlay(void *, s32);
extern void OverlaySlot_UnloadOverlay(void *);
extern void GamePhaseCurrencyHud_SetVisible(void *, s32);
extern void func_02092c8c(s32, s32);
extern s32 DisplayBrightness_IsSubTransitionComplete(void);
extern void *func_ov001_021fbe6c(void *);
extern void SceneInputBase_Update(void *, s32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GameWork_ClearFlag(void *, s32);
extern s32 GameWork_TestFlag(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the FieldEffect base and embedded shared resource, clear worker/state/callback
 * fields, and set restoreMode1c when currency-HUD halfword 0xb0 has bit 0 clear.
 * Enable recovered object flags, clear GameWork flag 0x408, and return self.
 */
OverlayPromptPresentation *func_0202225c(OverlayPromptPresentation *self)
{
    FieldEffect_Init(self);
    self->vtable = (void **)data_020d653c;
    OverlaySlot_Init(self->sharedResource10);
    self->worker0c = 0; self->callbacksActive20 = 0; self->state08 = 0;
    self->restoreMode1c = ((*(u16 *)(gGamePhaseCurrencyHud + 0xb0) & 1) == 0);
    self->dispatchState = ((self->dispatchState | 2) & ~1) | 1;
    GameWork_ClearFlag(gGameWork, 0x408);
    return self;
}

static OverlayPromptPresentation *teardown_prompt(OverlayPromptPresentation *self)
{
    self->vtable = (void **)data_020d653c;
    self->callbacksActive20 = 0;
    if (self->worker0c != 0) {
        ((WorkerMethod)(*(void ***)self->worker0c)[2])(self->worker0c);
        OverlaySlot_UnloadOverlay(self->sharedResource10);
    }
    if (self->restoreMode1c != 0) GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 1);
    OverlaySlot_Destroy(self->sharedResource10);
    FieldEffect_DestroyBase(self);
    return self;
}

/* Disable callbacks, destroy worker/resource/FieldEffect state, restore currency-HUD mode if needed, and return self. */
OverlayPromptPresentation *func_020222dc(OverlayPromptPresentation *self)
{ return teardown_prompt(self); }

/* Perform func_020222dc teardown, free self, and return its old address. */
OverlayPromptPresentation *func_02022354(OverlayPromptPresentation *self)
{ teardown_prompt(self); Heap_Free(self); return self; }

/*
 * State zero enables callbacks and starts transition (2,-16). State one waits
 * for DisplayBrightness_IsSubTransitionComplete, changes currency-HUD mode, acquires shared resource ID 5, allocates
 * and constructs the overlay worker, resets transition (2,0), and advances.
 * State two steps the worker and, on flag 0x408, clears it, refreshes debug-font
 * state, destroys the worker, releases the shared resource and advances. State
 * three returns one; all other live paths return zero.
 */
s32 func_020223d4(OverlayPromptPresentation *self)
{
    switch (self->state08) {
    case 0:
        self->callbacksActive20 = 1;
        func_02092c8c(2, -16);
        self->state08++;
        /* Retail falls through into the readiness check. */
    case 1:
        if (!DisplayBrightness_IsSubTransitionComplete()) return 0;
        GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 0);
        OverlaySlot_LoadOverlay(self->sharedResource10, 5);
        self->worker0c = Heap_Alloc(0x88, gOverlayPromptWorkerAllocationTag, 4, &gHeapContext);
        if (self->worker0c != 0) func_ov001_021fbe6c(self->worker0c);
        func_02092c8c(2, 0);
        self->state08++;
        return 0;
    case 2:
        SceneInputBase_Update(self->worker0c, 1);
        if (!GameWork_TestFlag(gGameWork, 0x408)) return 0;
        GameWork_ClearFlag(gGameWork, 0x408);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        self->callbacksActive20 = 0;
        if (self->worker0c != 0)
            ((WorkerMethod)(*(void ***)self->worker0c)[2])(self->worker0c);
        self->worker0c = 0;
        OverlaySlot_UnloadOverlay(self->sharedResource10);
        self->state08++;
        return 0;
    case 3: return 1;
    }
    return 0;
}

/* If callbacks are active and worker exists, invoke worker vtable slot 3. */
void func_02022530(OverlayPromptPresentation *self)
{ if (self->callbacksActive20 && self->worker0c) ((WorkerMethod)(*(void ***)self->worker0c)[3])(self->worker0c); }

/* If callbacks are active and worker exists, invoke worker vtable slot 4. */
void func_02022558(OverlayPromptPresentation *self)
{ if (self->callbacksActive20 && self->worker0c) ((WorkerMethod)(*(void ***)self->worker0c)[4])(self->worker0c); }
