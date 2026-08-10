#include "tingle/types.h"

/* Overlay 36 top-level scene teardown and an adjacent resource-owner delete helper. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG16(address) (*(volatile u16 *)(address))

typedef void (*DeleteCallback)(void *object);

extern const u8 data_ov036_02206124[];
extern void *data_020f4e14;
extern void *gDebugFont;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DResourceOwner_Destroy(void *owner);
extern void Heap_Free(void *allocation);
extern void func_02075020(void *resource);
extern void func_02092418(void *state);
extern void GX_SetGraphicsMode(s32 mode, s32 bgMode, s32 bg0Mode);
extern void func_02059230(void *sound, s32 first, s32 second);
extern void func_ov048_0220b7b4(void *state);
extern void func_020923a0(void *state);
extern void GraphicsResourceSetVariant_Destroy(void *resourceSet);
#ifdef __cplusplus
}
#endif

static void delete_controller_if_present(void *controller)
{
    if (controller != 0)
        (*(DeleteCallback *)((u8 *)FIELD(void *, controller, 0) + 4))(
            controller);
}

static void teardown_scene(void *scene)
{
    FIELD(u32, scene, 0x20) &= ~0x400;
    delete_controller_if_present(FIELD(void *, scene, 0x60));
    void *owner = FIELD(void *, scene, 0x5c);
    if (owner != 0) {
        Graphics3DResourceOwner_Destroy(owner);
        Heap_Free(owner);
    }
    func_02075020(data_020f4e14);
    func_02075020(gDebugFont);
    func_02092418((u8 *)scene + 0x64);
    GX_SetGraphicsMode(1, 0, 0);
    REG16(0x04000050) = 0;
    REG16(0x04001050) = 0;
    func_02059230(gSoundContext, 0, 0);
    func_ov048_0220b7b4((u8 *)scene + 0x98);
    func_020923a0((u8 *)scene + 0x64);
}

/*
 * Destroys the top-level scene without freeing it. It clears flag +0x20 bit
 * 0x400, deletes controller +0x60 virtually, destroys/frees owner +0x5C,
 * unloads the main archive and debug font, tears down state +0x64/+0x98,
 * restores graphics mode (1,0,0), clears main/sub blend-control registers,
 * and resets sound through (0,0). Returns scene; heap, resource, renderer/GX,
 * display-register, and sound state change.
 */
extern "C" void *func_ov036_022048d8(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov036_02206124;
    teardown_scene(scene);
    return scene;
}

/*
 * Destroys resource set +0xCC and frees object. Returns the now-invalid
 * original pointer; resource ownership and heap state change.
 */
extern "C" void *func_ov036_022049a8(void *object)
{
    GraphicsResourceSetVariant_Destroy((u8 *)object + 0xcc);
    Heap_Free(object);
    return object;
}

/*
 * Fully deletes the top-level scene by performing the same controller, owner,
 * resource, renderer/GX, display, and sound teardown as func_ov036_022048d8,
 * then freeing it. Returns the now-invalid scene pointer.
 */
extern "C" void *func_ov036_022049c8(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov036_02206124;
    teardown_scene(scene);
    Heap_Free(scene);
    return scene;
}
