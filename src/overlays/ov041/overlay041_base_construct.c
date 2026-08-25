#include "tingle/types.h"

/*
 * Overlay 41 base construction. These recovered entry helpers create the
 * overlay controller, its embedded resource arrays and vector records, and a
 * small address-derived three-word child record.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020a6940(void *object);
extern void __construct_array(void *array, u32 count, u32 stride,
                              void (*constructor)(void *),
                              void (*destructor)(void *));
extern void GraphicsResourceSet_Init(void *set);
extern void GraphicsResourceSet_Destroy(void *set);
extern void VecFx32Object_Init(void *vector);
extern void Graphics3dPresentation_LoadResourceProfile(void *object, s32 value);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *manager);
extern void *func_02003e14(s32 size, void *heap, s32 alignment, void *context);
extern void *func_ov070_0220fd60(void *storage, void *owner, void *context);
extern void *func_ov041_0220106c(void *storage, void *owner, void *context);
extern void *func_ov041_021ff20c(void *storage, void *owner, void *context);
extern void *func_ov041_02200660(void *storage, void *owner, void *context);
extern void func_ov041_021fd01c(void *owner);
extern void *data_020f4e14;
extern void *data_ov041_022058ec;
extern void *gHeapContext;
extern const void *data_ov041_02205858;
#ifdef __cplusplus
}
#endif

/* Empty overlay entry hook; it accepts no inputs and has no observable effect. */
extern "C" void func_ov041_021fce00(void)
{
}

/*
 * Initialize the three-word embedded record with its address-derived vtable
 * and clear both payload words. Returns no value and changes only `record`.
 */
extern "C" void func_ov041_021fd000(void *record)
{
    FIELD(const void *, record, 0) = data_ov041_02205858;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 8) = 0;
}

/*
 * Construct the overlay controller. `mode` is retained at +0x40, `argument`
 * at +0x18, and the fourth callback argument is unused by the portable form.
 * Construct resource arrays at +0x48/+0x90/+0xF0, vectors at +0x18C/+0x19C,
 * the child record at +0x1B8, acquire the shared context, allocate four owned
 * controllers (the second is omitted in mode two), clear runtime state, then
 * invoke func_ov041_021fd01c. Returns `owner`; heaps, resources, and owned
 * controller state may change.
 */
extern "C" void *func_ov041_021fce04(void *owner, s32 mode, void *argument,
                                      s32 unused)
{
    (void)unused;
    func_020a6940((u8 *)owner + 0x1c);
    __construct_array((u8 *)owner + 0x48, 6, 0x0c,
                      GraphicsResourceSet_Init, GraphicsResourceSet_Destroy);
    __construct_array((u8 *)owner + 0x90, 8, 0x0c,
                      GraphicsResourceSet_Init, GraphicsResourceSet_Destroy);
    __construct_array((u8 *)owner + 0xf0, 10, 0x0c,
                      GraphicsResourceSet_Init, GraphicsResourceSet_Destroy);
    VecFx32Object_Init((u8 *)owner + 0x18c);
    VecFx32Object_Init((u8 *)owner + 0x19c);
    func_ov041_021fd000((u8 *)owner + 0x1b8);
    FIELD(s32, owner, 0x40) = mode;
    FIELD(void *, owner, 0x18) = argument;
    FIELD(s32, owner, 0x1ec) = 1;
    FIELD(s32, owner, 0x1f0) = 0;
    Graphics3dPresentation_LoadResourceProfile(argument, 4);
    FIELD(s32, owner, 0x1f4) = mode == 2 ? 2 : 0;
    for (s32 offset = 0x16c; offset <= 0x1fc; offset += 4)
        if (offset != 0x1ec && offset != 0x1f4) FIELD(s32, owner, offset) = 0;

    FIELD(void *, owner, 0) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    void *storage = func_02003e14(0x208, data_ov041_022058ec, 4, gHeapContext);
    FIELD(void *, owner, 8) = storage ? func_ov070_0220fd60(storage, owner, FIELD(void *, owner, 0)) : 0;
    if (mode == 2) FIELD(void *, owner, 0x0c) = 0;
    else {
        storage = func_02003e14(0x95c, data_ov041_022058ec, 4, gHeapContext);
        FIELD(void *, owner, 0x0c) = storage ? func_ov041_0220106c(storage, owner, FIELD(void *, owner, 0)) : 0;
        FIELD(s32, owner, 0x1cc) = 1;
    }
    storage = func_02003e14(0x1c0, data_ov041_022058ec, 4, gHeapContext);
    FIELD(void *, owner, 0x10) = storage ? func_ov041_021ff20c(storage, owner, FIELD(void *, owner, 0)) : 0;
    storage = func_02003e14(0x160, data_ov041_022058ec, 4, gHeapContext);
    FIELD(void *, owner, 0x14) = storage ? func_ov041_02200660(storage, owner, FIELD(void *, owner, 0)) : 0;
    FIELD(s32, owner, 0x1c4) = 0;
    func_ov041_021fd01c(owner);
    return owner;
}
