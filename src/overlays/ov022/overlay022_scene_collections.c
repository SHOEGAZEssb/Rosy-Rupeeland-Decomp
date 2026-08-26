#include "tingle/types.h"

/* Overlay 22 game-work-derived collection construction and state-preserving teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_020d780c[];
extern const u8 data_ov022_022006ec[];
extern const u8 data_ov022_022006f4[];
extern void *gGameWork;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GameWork_TestFlag(void *, u32);
extern void Heap_Free(void *);
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void InventoryScroll_SetSelectedRow(void *, s32);
extern void InventoryScroll_SetFirstVisibleRow(void *, s32);
extern void *Overlay022_EntryCollection_Init(void *, s32);
extern void Overlay022_EntryCollection_AppendIndex(void *, s32);
extern void *Overlay022_Menu_Init(void *, s32);
extern void Overlay022_Menu_Deinit(void *);
extern void Overlay022_Menu_AppendIndex(void *, s32);
#ifdef __cplusplus
}
#endif

static void destroy_polymorphic(void *object)
{
    if (object != 0) {
        void **vtable = FIELD(void **, object, 0);
        ((void (*)(void *))vtable[1])(object);
    }
}

/*
 * Rebuilds both scene collections from persistent game work. For +0x2B4 it
 * counts and appends the 128 records whose bytes at game-work +0x5E94 equal
 * one. For +0x2B8 it counts the eleven 0x34-byte descriptors whose flag ID at
 * +0x20 is set, constructs a menu of that size, restores UI scroll/selection
 * from scene +0x2C4/+0x2C8, and appends those descriptor indices. Empty sets
 * leave the corresponding pointer null. Heap, collection, and UI state change;
 * no value is returned.
 */
extern "C" void func_ov022_021fe688(void *scene)
{
    s32 count = 0;
    for (s32 i = 0; i < 0x80; ++i) {
        if (FIELD(u8, gGameWork, 0x5e94 + i) == 1)
            ++count;
    }
    if (count != 0) {
        void *collection = Heap_Alloc(0x44, data_ov022_022006ec,
                                      4, gHeapContext);
        if (collection != 0)
            collection = Overlay022_EntryCollection_Init(collection, count);
        FIELD(void *, scene, 0x2b4) = collection;
        for (s32 i = 0; i < 0x80; ++i) {
            if (FIELD(u8, gGameWork, 0x5e94 + i) == 1)
                Overlay022_EntryCollection_AppendIndex(collection, i);
        }
    } else {
        FIELD(void *, scene, 0x2b4) = 0;
    }

    count = 0;
    for (s32 i = 0; i < 11; ++i) {
        const u8 *descriptor = data_020d780c + i * 0x34;
        if (GameWork_TestFlag(gGameWork, FIELD(u16, descriptor, 0x20)) != 0)
            ++count;
    }
    if (count != 0) {
        void *menu = Heap_Alloc(0x34, data_ov022_022006f4,
                                4, gHeapContext);
        if (menu != 0)
            menu = Overlay022_Menu_Init(menu, count);
        FIELD(void *, scene, 0x2b8) = menu;
        InventoryScroll_SetFirstVisibleRow(FIELD(void *, menu, 0x30),
                      FIELD(s32, scene, 0x2c4));
        InventoryScroll_SetSelectedRow(FIELD(void *, menu, 0x30),
                      FIELD(s32, scene, 0x2c8));
        for (s32 i = 0; i < 11; ++i) {
            const u8 *descriptor = data_020d780c + i * 0x34;
            if (GameWork_TestFlag(gGameWork,
                                  FIELD(u16, descriptor, 0x20)) != 0)
                Overlay022_Menu_AppendIndex(menu, i);
        }
    } else {
        FIELD(void *, scene, 0x2b8) = 0;
    }
}

/*
 * Tears down both dynamic collections. The +0x2B4 collection is destroyed via
 * its owning virtual destructor and nulled. Before destroying/freeing menu
 * +0x2B8, its UI scroll +0xC and selection +0x14 are saved into scene
 * +0x2C4/+0x2C8. Both scene pointers finish null. Heap and collection state
 * change; no value is returned.
 */
extern "C" void func_ov022_021fe81c(void *scene)
{
    void *collection = FIELD(void *, scene, 0x2b4);
    if (collection != 0) {
        destroy_polymorphic(collection);
        FIELD(void *, scene, 0x2b4) = 0;
    }
    void *menu = FIELD(void *, scene, 0x2b8);
    if (menu == 0)
        return;
    void *ui = FIELD(void *, menu, 0x30);
    FIELD(s32, scene, 0x2c4) = FIELD(s32, ui, 0xc);
    FIELD(s32, scene, 0x2c8) = FIELD(s32, ui, 0x14);
    Overlay022_Menu_Deinit(menu);
    Heap_Free(menu);
    FIELD(void *, scene, 0x2b8) = 0;
}
