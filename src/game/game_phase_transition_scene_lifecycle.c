#include "tingle/game_phase_transition_scene.h"
#include "tingle/heap.h"

/* Construct and destroy a small scene that stages a game-phase transition. */

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020d5350;
#ifdef __cplusplus
}
#endif

/* Initialize the Scene, install its vtable, set value04 to 0x12, and return self. */
GamePhaseTransitionScene *func_0200c680(GamePhaseTransitionScene *self)
{
    Scene_Init(&self->base);
    self->base.vtable = &data_020d5350;
    self->base.value04 = 0x12;
    return self;
}

/* Destroy the Scene base and return self without freeing it. */
GamePhaseTransitionScene *func_0200c6a8(GamePhaseTransitionScene *self)
{
    Scene_Destroy(&self->base);
    return self;
}

/* Destroy the Scene, free self through the game heap, and return its old address. */
GamePhaseTransitionScene *func_0200c6bc(GamePhaseTransitionScene *self)
{
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}
