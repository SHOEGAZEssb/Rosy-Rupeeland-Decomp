#include "tingle/game_phase_load_scene.h"
#include "tingle/game_work.h"

/* Forward load-scene frame hooks and reset transient phase/debug state. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u16 data_020c3600[12];
extern void *data_021052fc;
extern void *data_020f4e14;
extern void *gDebugFont;
extern void func_0200e9e0(void *runtimeObject);
extern void func_0200ea34(void *runtimeObject, u16 vcount);
extern void func_02075630(void *object);
#ifdef __cplusplus
}
#endif

typedef struct LoadPhaseObjectVTable {
    void *method00;
    void *method04;
    void *method08;
    void (*method0c)(void *self);
    void (*method10)(void *self);
} LoadPhaseObjectVTable;

typedef struct LoadPhaseObject {
    LoadPhaseObjectVTable *vtable;
} LoadPhaseObject;

/*
 * During the load scene's method-0x0c hook, update runtime offset 0x24 when
 * field_3c is set and forward method 0x0c to the owned phase object when
 * field_38 permits it. This hook always returns zero.
 */
s32 func_0200e3d4(GamePhaseLoadScene *self)
{
    if (self->field_3c)
        func_0200e9e0((u8 *)data_021052fc + 0x24);
    if (self->field_38 && self->ownedObject)
        ((LoadPhaseObject *)self->ownedObject)->vtable->method0c(
            self->ownedObject);
    return 0;
}

/*
 * During method 0x10, pass the current VCOUNT to runtime offset 0x24 when
 * field_3c is set and forward method 0x10 to the active phase object when
 * enabled. Returns zero.
 */
s32 func_0200e424(GamePhaseLoadScene *self)
{
    if (self->field_3c)
        func_0200ea34((u8 *)data_021052fc + 0x24,
                      *(volatile u16 *)0x04000006);
    if (self->field_38 && self->ownedObject)
        ((LoadPhaseObject *)self->ownedObject)->vtable->method10(
            self->ownedObject);
    return 0;
}

/*
 * Clear the twelve transient GameWork flags listed at data_020c3600, then
 * reset the two shared debug/text render objects. No value is returned.
 */
void func_0200e480(void)
{
    u32 i;
    for (i = 0; i < 12; i++)
        GameWork_ClearFlag(gGameWork, data_020c3600[i]);
    func_02075630(data_020f4e14);
    func_02075630(gDebugFont);
}
