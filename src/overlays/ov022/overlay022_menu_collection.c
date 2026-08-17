#include "tingle/types.h"

/* Overlay 22 menu presentation object, indexed option array, and availability updates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u8 data_020d780c[];
extern const s32 data_020d7830[];
extern const u8 data_ov022_022006c4[];
extern const u8 data_ov022_022006cc[];
extern void *gHeapContext;
extern void *gLupyContext;
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void *func_02003e20(u32, const void *, u32, void *);
extern s32 GamePhaseCurrencyHud_GetCurrency(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void *func_02094154(void *, void *, s32, s32, ...);
extern void InventoryScroll_SetSpritePriority(void *, s32);
extern void InventoryScroll_UpdatePresentation(void *);
extern void func_020c09cc(void *, s32, s32, s32, void (*)(void *), void *);
extern void func_020c0c24(void *, s32, s32, void (*)(void *));
#ifdef __cplusplus
}
#endif

extern "C" void func_ov022_021fd894(void *entry);
extern "C" void func_ov022_021fda78(void *entry);

static void destroy_polymorphic(void *object)
{
    if (object != 0) {
        void **vtable = FIELD(void **, object, 0);
        ((void (*)(void *))vtable[1])(object);
    }
}

/*
 * Initializes one 8-byte menu option by clearing its descriptor pointer and
 * availability flag. The entry changes in place; no return value, SDK call,
 * allocation, or hardware access occurs.
 */
extern "C" void func_ov022_021fd894(void *entry)
{
    FIELD(void *, entry, 0) = 0;
    FIELD(s32, entry, 4) = 0;
}

/*
 * Constructs a menu presentation object for the requested option capacity.
 * It initializes inherited input state, allocates/constructs an 8-byte option
 * array at +0x24 when capacity is nonzero, allocates an 0x80-byte UI object at
 * +0x30 with count-dependent arguments/placement, initializes and hides its
 * +0x50 child, and loads input resource 0x7006 or 0x7007 according to system
 * state byte +0x5F. Heap, SDK UI, and input-resource state change. The
 * caller-owned menu pointer is returned.
 */
extern "C" void *func_ov022_021fd8a4(void *menu, s32 capacity)
{
    TitleCharacterResourceCollection_Init(menu);
    FIELD(s32, menu, 0x28) = capacity;
    FIELD(s32, menu, 0x2c) = 0;
    if (capacity != 0) {
        void *entries = func_02003e20(capacity * 8 + 8,
                                      data_ov022_022006c4, 4, gHeapContext);
        if (entries != 0)
            func_020c09cc(entries, capacity, 8, 8,
                          func_ov022_021fd894, 0);
        FIELD(void *, menu, 0x24) = entries;
        void *ui = Heap_Alloc(0x80, data_ov022_022006cc, 4, gHeapContext);
        if (ui != 0)
            ui = func_02094154(ui, data_020f4e14, capacity, 4,
                              0xda, 0x18, -12);
        FIELD(void *, menu, 0x30) = ui;
    } else {
        FIELD(void *, menu, 0x24) = 0;
        void *ui = Heap_Alloc(0x80, data_ov022_022006cc, 4, gHeapContext);
        if (ui != 0)
            ui = func_02094154(ui, data_020f4e14, 1, 1,
                              0xda, 0x18, 12);
        FIELD(void *, menu, 0x30) = ui;
    }
    InventoryScroll_SetSpritePriority(FIELD(void *, menu, 0x30), 0);
    InventoryScroll_UpdatePresentation(FIELD(void *, menu, 0x30));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, FIELD(void *, menu, 0x30), 0x50));
    func_02092814(menu, gSystemState[0x5f] != 0 ? 0x7006 : 0x7007);
    return menu;
}

/*
 * Destroys a caller-owned menu presentation object. It invokes the UI object's
 * virtual destructor, destroys the 8-byte option array with the no-op element
 * hook, releases inherited input resources, and returns the menu address. The
 * menu storage itself is retained.
 */
extern "C" void *func_ov022_021fda28(void *menu)
{
    destroy_polymorphic(FIELD(void *, menu, 0x30));
    if (FIELD(void *, menu, 0x24) != 0)
        func_020c0c24(FIELD(void *, menu, 0x24),
                      8, 8, func_ov022_021fda78);
    func_020927b8(menu);
    return menu;
}

/*
 * Empty destructor hook for one menu option. The entry is intentionally left
 * untouched; there is no return value or observable side effect.
 */
extern "C" void func_ov022_021fda78(void *entry)
{
    (void)entry;
}

/*
 * Appends the indexed global menu descriptor while capacity remains. The
 * descriptor is selected from 0x34-byte records at data_020D780C. Its option
 * flag is set when the corresponding threshold in data_020D7830 is greater
 * than or equal to current Lupy currency, then count +0x2C advances. Full or
 * unallocated arrays are unchanged; no value is returned.
 */
extern "C" void func_ov022_021fda7c(void *menu, s32 index)
{
    void *entries = FIELD(void *, menu, 0x24);
    s32 count = FIELD(s32, menu, 0x2c);
    if (entries == 0 || count >= FIELD(s32, menu, 0x28))
        return;
    s32 offset = index * 0x34;
    void *entry = (u8 *)entries + count * 8;
    FIELD(const void *, entry, 0) = data_020d780c + offset;
    if (data_020d7830[offset / 4] >= GamePhaseCurrencyHud_GetCurrency(gLupyContext))
        FIELD(s32, entry, 4) = 1;
    FIELD(s32, menu, 0x2c) = count + 1;
}

/*
 * Updates the menu UI child's visibility/readiness. With no appended options,
 * it hides/resets child +0x50 through the SDK. Otherwise it compares UI object
 * fields +4/+8 and sets child +0x20 to one while +8 is below +4. Menu/UI state
 * may change and no value is returned.
 */
extern "C" void func_ov022_021fdafc(void *menu)
{
    void *ui = FIELD(void *, menu, 0x30);
    if (FIELD(s32, menu, 0x2c) != 0) {
        if (FIELD(s32, ui, 8) < FIELD(s32, ui, 4))
            FIELD(s32, FIELD(void *, ui, 0x50), 0x20) = 1;
    } else {
        GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, ui, 0x50));
    }
}
