#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"

/* Own overlay 33's runtime-bound child scene and synchronize its display object. */

typedef struct Overlay33Child { void **vtable; } Overlay33Child;
typedef struct RuntimeDisplayObject { void **vtable; u8 pad04[0xc]; u32 flags10; u32 flags14; } RuntimeDisplayObject;
typedef struct Overlay33RuntimeScene {
    Scene base;
    u32 parameter24;
    void *selection28;
    RuntimeDisplayObject *display2c;
    OverlaySlot overlay30;
    Overlay33Child *child3c;
} Overlay33RuntimeScene;

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020d5dcc;
extern char data_020d5df8[];
extern u8 data_020d36e1[];
extern void *data_021052fc;
extern void *gLupyContext;
extern Overlay33Child *func_ov033_021fd070(Overlay33Child *self, u32 parameter);
extern void func_ov030_021fd260(Overlay33Child *self);
extern s32 func_ov014_021fd2f8(Overlay33Child *self);
extern s32 func_ov033_021fd37c(Overlay33Child *self);
extern void func_ov033_021fd324(Overlay33Child *self, void *value);
extern void func_02008b50(void *runtime);
extern void func_02007908(void *runtime, u32 value, s32 mode);
extern void func_02007a24(void *runtime, u32 value, s32 mode);
extern void func_02008148(void *runtime, s32 index);
extern void func_0201dcec(void *manager, s32 value);
extern void *func_02009d78(void *object);
extern void func_02010e68(void *context);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the Scene and embedded overlay slot, load overlay 33, allocate its
 * 0xd4-byte child with parameter, bind the runtime display object through its
 * offset-0x74 virtual, set display flag 0x40, snapshot the active selection,
 * set scene flags 0/1, and return self.
 */
Overlay33RuntimeScene *func_0201d688(Overlay33RuntimeScene *self, u32 parameter)
{
    void *runtime;
    Overlay33Child *child;

    Scene_Init(&self->base);
    self->base.vtable = &data_020d5dcc;
    func_02006268(&self->overlay30);
    self->parameter24 = parameter;
    func_020062a0(&self->overlay30, 0x21);
    child = (Overlay33Child *)Heap_Alloc(0xd4, data_020d5df8, 4, &gHeapContext);
    if (child != 0)
        child = func_ov033_021fd070(child, parameter);
    self->child3c = child;
    runtime = data_021052fc;
    self->display2c = *(RuntimeDisplayObject **)((u8 *)runtime + 0x2ea4);
    ((void (*)(void *, void *))self->display2c->vtable[0x1d])(
        self->display2c, data_020d36e1);
    self->display2c->flags14 |= 0x40;
    self->selection28 = **(void ***)((u8 *)runtime + 0x30bc);
    Scene_SetFlags03(&self->base);
    return self;
}

/*
 * Unbind and clear flags 0x40, 0x8, and 0x01000000 on the runtime display;
 * destroy/free the optional overlay child, unload and destroy its slot, destroy
 * the base Scene, and return self.
 */
Overlay33RuntimeScene *func_0201d754(Overlay33RuntimeScene *self)
{
    self->base.vtable = &data_020d5dcc;
    self->display2c->flags14 &= ~0x40;
    ((void (*)(void *, s32))self->display2c->vtable[0x1d])(self->display2c, 0);
    self->display2c->flags10 &= ~0x8;
    self->display2c->flags10 &= ~0x01000000;
    if (self->child3c != 0) {
        func_ov030_021fd260(self->child3c);
        Heap_Free(self->child3c);
    }
    func_020062f8(&self->overlay30);
    func_02006280(&self->overlay30);
    Scene_Destroy(&self->base);
    return self;
}

/* Perform func_0201d754's teardown, free the scene, and return its old address. */
Overlay33RuntimeScene *func_0201d7e8(Overlay33RuntimeScene *self)
{
    self->base.vtable = &data_020d5dcc;
    self->display2c->flags14 &= ~0x40;
    ((void (*)(void *, s32))self->display2c->vtable[0x1d])(self->display2c, 0);
    self->display2c->flags10 &= ~0x8;
    self->display2c->flags10 &= ~0x01000000;
    if (self->child3c != 0) {
        func_ov030_021fd260(self->child3c);
        Heap_Free(self->child3c);
    }
    func_020062f8(&self->overlay30);
    func_02006280(&self->overlay30);
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}

/*
 * Rebind the display object whenever the runtime selection changes, update the
 * runtime and overlay child, destroy this scene if the child finishes, and when
 * its secondary poll is idle refresh two runtime channels, their managers, and
 * Lupy state.  Returns one only when destroyed, otherwise zero.
 */
s32 func_0201d884(Overlay33RuntimeScene *self)
{
    u8 *runtime = (u8 *)data_021052fc;
    void *selection = **(void ***)(runtime + 0x30bc);
    void *value;

    if (self->selection28 != selection) {
        self->selection28 = selection;
        self->display2c = *(RuntimeDisplayObject **)(runtime + 0x2ea4);
        ((void (*)(void *, void *))self->display2c->vtable[0x1d])(
            self->display2c, data_020d36e1);
        func_02008b50(runtime);
    }
    func_02007908(runtime, self->base.value04, 3);
    if (func_ov014_021fd2f8(self->child3c) != 0) {
        if (self != 0)
            self->base.vtable->destroyAndFree(&self->base);
        return 1;
    }
    if (func_ov033_021fd37c(self->child3c) != 0)
        return 0;
    func_02008148(runtime, 0);
    func_02008148(runtime, 1);
    func_0201dcec(runtime + 0x2f7c, 1);
    func_02007a24(runtime, self->base.value04, 3);
    value = func_02009d78(runtime + 0x2fbc);
    func_ov033_021fd324(self->child3c, value);
    func_02010e68(gLupyContext);
    return 0;
}

/* Invoke method 0x0c on the runtime root and return zero. */
s32 func_0201d9c0(void)
{
    Scene *runtime = (Scene *)data_021052fc;
    runtime->vtable->method0C(runtime);
    return 0;
}
