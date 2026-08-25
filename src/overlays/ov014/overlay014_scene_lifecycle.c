#include "tingle/types.h"

/*
 * Overlay 14 controller lifecycle. The recovered object owns a graphics handle
 * at +0x54, a subordinate at +0x78, a three-word parameter at +0x7C, and a
 * small presentation at +0x88.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 data_ov014_021fd994[];
extern const char data_ov014_021fd9a8[];
extern const char data_ov014_021fd9b0[];
extern const s32 data_ov014_021fd960[];
extern void *gDebugFont;
extern void *data_020f4e14;
extern void *data_021e9ac0;
extern u8 gHeapContext[];
#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Init(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void TitleCharacterResourceCollection_Append(void *, s32);
extern void TitleCharacterResourceCollection_Destroy(void *);
extern void *Heap_Alloc(u32, const char *, s32, void *);
extern void Heap_Free(void *);
extern void *func_ov000_021fb728(void *, void *);
extern void func_ov000_021fb848(void *);
extern void InventoryRecordCollection_Sort(void *, s32);
extern void *func_ov000_021fbcc4(void *, void *);
extern void func_ov000_021fcae8(void *, void *, s32);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void func_ov014_021fce00(void *);
extern void func_ov014_021fcf50(void *, const void *);
extern void func_ov014_021fd07c(void *);
extern void func_ov014_021fce14(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay014Destructor)(void *);

/*
 * Construct state in caller-owned storage and return it. Initialize the base
 * and graphics handle +0x54, clear parameter +0x7C, perform the dual-screen
 * graphics setup, and bind resource 0x7005. Allocate/construct the 0x68-byte
 * presentation at +0x88, optionally copy argument two into +0x7C, disable the
 * global runtime mode, allocate/construct the 0x2B0-byte subordinate at +0x78,
 * attach +0x7C to it, clear +0x8C, set flag bit 0x400 at +0x20, and install
 * callback data_ov014_021fd960. Allocation, graphics, and global mode effects
 * pass through their callees; semantic object names are inferred.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov014_021fce3c(void *state, const void *parameters)
{
    void *object;

    SceneInputBase_Init(state);
    FIELD(const void *, state, 0) = data_ov014_021fd994;
    TitleCharacterResourceCollection_Init((u8 *)state + 0x54);
    func_ov014_021fce00((u8 *)state + 0x7c);
    func_ov014_021fd07c(state);
    TitleCharacterResourceCollection_Append((u8 *)state + 0x54, 0x7005);
    object = Heap_Alloc(0x68, data_ov014_021fd9a8, 4, gHeapContext);
    if (object != 0)
        object = func_ov000_021fb728(object, gDebugFont);
    FIELD(void *, state, 0x88) = object;
    if (parameters != 0)
        func_ov014_021fcf50((u8 *)state + 0x7c, parameters);

    InventoryRecordCollection_Sort(data_021e9ac0, 0);
    object = Heap_Alloc(0x2b0, data_ov014_021fd9b0, 4, gHeapContext);
    if (object != 0)
        object = func_ov000_021fbcc4(object, data_020f4e14);
    FIELD(void *, state, 0x78) = object;
    func_ov000_021fcae8(object, (u8 *)state + 0x7c, 0);
    FIELD(s32, state, 0x8c) = 0;
    FIELD(u32, state, 0x20) |= 0x400;
    func_ov014_021fce14(state, data_ov014_021fd960[0],
                        data_ov014_021fd960[1], 0);
    return state;
}

/*
 * Destroy state-owned resources without freeing state and return it. Clear
 * flag bit 0x400, destroy/free +0x88, invoke vtable slot +4 on non-null +0x78,
 * clear the two global graphics managers, and destroy +0x54. These operations
 * may release heap storage and unregister graphics state.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov014_021fcf6c(void *state)
{
    void *object;

    FIELD(const void *, state, 0) = data_ov014_021fd994;
    FIELD(u32, state, 0x20) &= ~0x400u;
    object = FIELD(void *, state, 0x88);
    if (object != 0) {
        func_ov000_021fb848(object);
        Heap_Free(object);
    }
    object = FIELD(void *, state, 0x78);
    if (object != 0) {
        void **vtable = FIELD(void **, object, 0);
        ((Overlay014Destructor)vtable[1])(object);
    }
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);
    GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont);
    TitleCharacterResourceCollection_Destroy((u8 *)state + 0x54);
    return state;
}

/* Call func_ov014_021fcf6c, free state itself, and return its former address; heap state changes are observable. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov014_021fcff0(void *state)
{
    func_ov014_021fcf6c(state);
    Heap_Free(state);
    return state;
}
