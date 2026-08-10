#include "tingle/game_phase_state.h"

/* Initialize and tear down the large state embedded in GamePhaseRuntime. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02006268(void *object);
extern void func_02006280(void *object);
extern void func_0200e5bc(GamePhaseState *self);
extern void func_0200e61c(GamePhaseState *self);
extern void func_0200fa40(void *object);
extern void func_0200fb34(void *object);
extern void func_02011470(void *object);
extern void func_0201155c(void *object);
extern void func_0201dbc8(void *object);
extern void func_0201dc98(void *object);
extern void func_0201df64(void *object);
extern void func_0201e0ec(void *object);
extern void ActorCollection_Init(void *object);
extern void ActorCollection_Destructor(void *object);
extern void ActorCollection_Deinit(void *object);
extern void ActorCollection_UnregisterAndDestroyAllActors(void *object);
extern void ActorFeedback_DestroyPresentations(void);
extern void func_020a2324(void);
#ifdef __cplusplus
}
#endif

typedef struct PhaseOwnedVTable {
    void (*destroy)(void *self);
    void (*destroyAndFree)(void *self);
} PhaseOwnedVTable;

typedef struct PhaseOwned {
    PhaseOwnedVTable *vtable;
} PhaseOwned;

/*
 * Initialize five embedded subsystems, clear the configuration/owned pointer,
 * set flags_2f7c bits 0/1, and initialize the halfword controls at 0x2f90 to
 * 1 and 0x2f92 to 0x0808. Returns self.
 */
GamePhaseState *func_0200e4dc(GamePhaseState *self)
{
    self->configuration = 0;
    ActorCollection_Init(self->storage_0004);
    func_02006268(self->helper_2ea4);
    self->owned_2eb0 = 0;
    func_0200fa40(self->helper_2eb4);
    func_0201dbc8(self->helper_2f58);
    self->flags_2f7c = (self->flags_2f7c & ~1) | 3;
    func_02011470(self->helper_2f80);
    self->field_2f90 = 1;
    self->field_2f92 = (s16)((self->field_2f92 & ~0xff) | 8);
    self->field_2f92 = (s16)((self->field_2f92 & ~0xff00) | 0x800);
    return self;
}

/* Fully release the state's active content and embedded subsystems. */
GamePhaseState *func_0200e574(GamePhaseState *self)
{
    func_0200e5bc(self);
    func_0201155c(self->helper_2f80);
    func_0201dc98(self->helper_2f58);
    func_0200fb34(self->helper_2eb4);
    func_02006280(self->helper_2ea4);
    ActorCollection_Destructor(self->storage_0004);
    return self;
}

/*
 * Tear down currently loaded phase content while retaining the outer state:
 * invoke helper_2eb4's first virtual method, reset graphics/runtime helpers,
 * release owned_2eb0 through its deleting destructor, and clear the pointer.
 */
void func_0200e5bc(GamePhaseState *self)
{
    PhaseOwned *helper = (PhaseOwned *)self->helper_2eb4;
    helper->vtable->destroy(helper);
    func_0201155c(self->helper_2f80);
    func_0200e61c(self);
    ActorCollection_Deinit(self->storage_0004);
    if (self->owned_2eb0 != 0)
        ((PhaseOwned *)self->owned_2eb0)->vtable->destroyAndFree(
            self->owned_2eb0);
    self->owned_2eb0 = 0;
}

/* Reset render/world helpers and the large subsystem rooted at offset 0x0004. */
void func_0200e61c(GamePhaseState *self)
{
    func_0201df64(self->helper_2f58);
    func_0201e0ec(self->helper_2f58);
    func_020a2324();
    ActorFeedback_DestroyPresentations();
    ActorCollection_UnregisterAndDestroyAllActors(self->storage_0004);
}
