#include "tingle/game_phase_load_scene.h"
#include "tingle/heap.h"

/* Construct and destroy the scene that performs full game-phase loading. */

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020d5460;
extern void *gLupyContext;
extern void OverlaySlot_Init(void *object);
extern void OverlaySlot_Destroy(void *object);
extern void func_02092364(void *object);
extern void func_020923a0(void *object);
#ifdef __cplusplus
}
#endif

typedef struct OwnedObjectVTable {
    void *method00;
    void *method04;
    void (*release)(void *self);
} OwnedObjectVTable;

typedef struct OwnedObject {
    OwnedObjectVTable *vtable;
} OwnedObject;

/*
 * Initialize the Scene and its four embedded helpers, retain the requested
 * phase values, enable Scene flags 0/1, and snapshot POWCNT1 bit 15. The flag
 * at Lupy offset 0xb0 determines field_34 with inverted bit-0 polarity.
 */
GamePhaseLoadScene *func_0200cf00(GamePhaseLoadScene *self, s32 phase,
                                  s32 field30)
{
    u16 lupyFlags;

    Scene_Init(&self->base);
    self->base.vtable = &data_020d5460;
    func_02092364(self->field_40);
    OverlaySlot_Init(self->field_74);
    OverlaySlot_Init(self->field_80);
    OverlaySlot_Init(self->field_8c);
    self->base.value04 = 9;
    self->phase = phase;
    self->field_30 = field30;
    self->ownedObject = 0;
    self->state = 0;
    self->field_38 = 0;
    self->field_3c = 1;
    Scene_SetFlags03(&self->base);
    lupyFlags = *(u16 *)((u8 *)gLupyContext + 0xb0);
    self->field_34 = (lupyFlags & 1) ? 0 : 1;
    self->powerControlBit = (*(volatile u16 *)0x04000304 & 0x8000) >> 15;
    return self;
}

/*
 * Release the optional owned object, destroy embedded helpers in reverse
 * construction order, destroy the Scene base, and return self without freeing.
 */
GamePhaseLoadScene *func_0200cfb0(GamePhaseLoadScene *self)
{
    self->base.vtable = &data_020d5460;
    self->field_38 = 0;
    if (self->ownedObject != 0)
        ((OwnedObject *)self->ownedObject)->vtable->release(self->ownedObject);
    OverlaySlot_Destroy(self->field_8c);
    OverlaySlot_Destroy(self->field_80);
    OverlaySlot_Destroy(self->field_74);
    func_020923a0(self->field_40);
    Scene_Destroy(&self->base);
    return self;
}

/* Free a previously destroyed load-scene allocation and return its old address. */
GamePhaseLoadScene *func_0200d014(GamePhaseLoadScene *self)
{
    Heap_Free(self);
    return self;
}

/* Perform full lifecycle cleanup, free the Scene allocation, and return it. */
GamePhaseLoadScene *func_0200d028(GamePhaseLoadScene *self)
{
    self->base.vtable = &data_020d5460;
    self->field_38 = 0;
    if (self->ownedObject != 0)
        ((OwnedObject *)self->ownedObject)->vtable->release(self->ownedObject);
    OverlaySlot_Destroy(self->field_8c);
    OverlaySlot_Destroy(self->field_80);
    OverlaySlot_Destroy(self->field_74);
    func_020923a0(self->field_40);
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}
