#include "tingle/game_phase_state.h"

/* Propagate active-phase control values to the owned object and helpers. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200fe0c(void *object, s32 value);
extern void func_02010094(void *object, s32 value);
extern void func_0201e054(void *object, s32 value);
extern void func_0202d68c(void *object, s32 value);
#ifdef __cplusplus
}
#endif

typedef void (*PhaseControlMethod)(void *self, s32 value);

/*
 * Send enabled through owned virtual method 0x24 and synchronize the helpers
 * at offsets 0x0004, 0x2eb4, and 0x2f58. No value is returned.
 */
void func_0200ec6c(GamePhaseState *self, s32 enabled)
{
    void **vtable = *(void ***)self->owned_2eb0;
    ((PhaseControlMethod)vtable[9])(self->owned_2eb0, enabled);
    func_0202d68c(self->storage_0004, enabled);
    func_02010094(self->helper_2eb4, enabled);
    func_0201e054(self->helper_2f58, enabled);
}

/*
 * Send value through owned virtual method 0x18 and synchronize helper_2eb4.
 * No value is returned.
 */
void func_0200ecbc(GamePhaseState *self, s32 value)
{
    void **vtable = *(void ***)self->owned_2eb0;
    ((PhaseControlMethod)vtable[6])(self->owned_2eb0, value);
    func_0200fe0c(self->helper_2eb4, value);
}
