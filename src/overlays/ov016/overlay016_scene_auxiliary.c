#include "tingle/types.h"

/* Overlay 16 auxiliary selector, actor-group, and list lifecycle management. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const char data_ov016_02201598[];
extern const char data_ov016_022015a0[];
extern const char data_ov016_022015a8[];
extern void *gDebugFont;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void *InventoryRecord_GetMetadata(void *);
extern void *func_ov000_021fb728(void *, void *);
extern void func_ov000_021fb848(void *);
extern void *Overlay000_Grid_Init(void *, void *);
extern void func_ov000_021fc59c(void *);
extern void *func_ov000_021fcab4(void *, s32);
extern void func_ov000_021fcae8(void *, void *, s32);
extern void Overlay000_CaptureViewState(void *, void *);
extern void Overlay000_GetViewRecordFromIndex(void *, void *, s32);
extern void *Overlay016_ActorGroup_Init(void *, s32);
extern void *Overlay016_ActorGroup_Destroy(void *);
extern void Overlay016_SetAuxiliaryEntryFlags(void *, u32);
extern void Overlay016_ClearAuxiliaryEntryFlags(void *, u32);
#ifdef __cplusplus
}
#endif

/*
 * Allocate and construct auxiliary objects at state +0x450 (0x68 bytes),
 * +0x470 (0xE8-byte overlay-16 actor group), and +0x44C (0x2B0 bytes), using
 * the debug owner, table index +0x58, and main owner respectively. Iterate the
 * +0x44C object's entries: entries without a child at +0x0C are skipped. When
 * selection +0x468 exists, disable every entry then re-enable those whose child
 * key matches a +0x28 key in the selected record's 0x24-byte entries. Otherwise
 * re-enable entries whose lookup record has byte +2 clear and count them at
 * +0x46C. Select the first re-enabled entry into fields +0x454..+0x45C, finalize
 * the list with stride 0x18, and refresh it. Return void. Heap and UI/actor state
 * change; no direct hardware access occurs.
 */
extern "C" void Overlay016_PopulateAuxiliaryList(void *state)
{
    void *object;
    s32 chooseFirst = 1;
    s32 index;

    object = Heap_Alloc(0x68, data_ov016_02201598, 4, gHeapContext);
    if (object != 0) {
        object = func_ov000_021fb728(object, gDebugFont);
    }
    FIELD(void *, state, 0x450) = object;

    object = Heap_Alloc(0xe8, data_ov016_022015a0, 4, gHeapContext);
    if (object != 0) {
        object = Overlay016_ActorGroup_Init(object, FIELD(s32, state, 0x58));
    }
    FIELD(void *, state, 0x470) = object;
    FIELD(s32, state, 0x46c) = 0;

    object = Heap_Alloc(0x2b0, data_ov016_022015a8, 4, gHeapContext);
    if (object != 0) {
        object = Overlay000_Grid_Init(object, data_020f4e14);
    }
    FIELD(void *, state, 0x44c) = object;

    for (index = 0; index < FIELD(s32, object, 0x254); index++) {
        void *entry = func_ov000_021fcab4(object, index);
        void *child = FIELD(void *, entry, 0xc);

        if (child == 0) {
            continue;
        }
        if (FIELD(void *, state, 0x468) != 0) {
            void *record = FIELD(void *, FIELD(void *, state, 0x468), 0);
            s32 recordIndex;

            Overlay016_SetAuxiliaryEntryFlags(entry, 1);
            for (recordIndex = 0; recordIndex < FIELD(s32, record, 0x100);
                 recordIndex++) {
                if (FIELD(u16, (u8 *)record + recordIndex * 0x24, 0x28) ==
                    FIELD(u16, child, 0)) {
                    Overlay016_ClearAuxiliaryEntryFlags(entry, 1);
                    if (chooseFirst != 0) {
                        Overlay000_GetViewRecordFromIndex(object, (u8 *)state + 0x454,
                                           index);
                        chooseFirst = 0;
                    }
                    break;
                }
            }
        } else if (FIELD(u8, InventoryRecord_GetMetadata(child), 2) == 0) {
            FIELD(s32, state, 0x46c)++;
            Overlay016_ClearAuxiliaryEntryFlags(entry, 1);
            if (chooseFirst != 0) {
                Overlay000_GetViewRecordFromIndex(object, (u8 *)state + 0x454, index);
                chooseFirst = 0;
            }
        } else {
            Overlay016_SetAuxiliaryEntryFlags(entry, 1);
        }
    }
    func_ov000_021fcae8(object, (u8 *)state + 0x454, 0x18);
    func_ov000_021fc59c(object);
}

/*
 * OR mask into field +0x20 of the child at entry +0x0C when present. Inputs are
 * the entry and mask; the child flag word may change. Return void, with no SDK
 * calls or hardware effects.
 */
extern "C" void Overlay016_SetAuxiliaryEntryFlags(void *entry, u32 mask)
{
    void *child = FIELD(void *, entry, 0xc);
    if (child != 0) {
        FIELD(u32, child, 0x20) |= mask;
    }
}

/*
 * Clear mask from field +0x20 of the child at entry +0x0C when present. Inputs
 * are the entry and mask; the child flag word may change. Return void, with no
 * SDK calls or hardware effects.
 */
extern "C" void Overlay016_ClearAuxiliaryEntryFlags(void *entry, u32 mask)
{
    void *child = FIELD(void *, entry, 0xc);
    if (child != 0) {
        FIELD(u32, child, 0x20) &= ~mask;
    }
}

/*
 * Destroy and free auxiliary objects +0x450 and +0x470. Snapshot three words
 * from object +0x44C into state +0x454..+0x45C through 0x021FCB4C, delete that
 * object through vtable slot +4 when present, and clear all three owned pointers.
 * Return void. Heap and UI/actor resources are released; no MMIO occurs.
 */
extern "C" void Overlay016_DestroyAuxiliaryObjects(void *state)
{
    typedef void (*DeleteFunction)(void *);
    u32 saved[3];
    void *object;

    object = FIELD(void *, state, 0x450);
    if (object != 0) {
        func_ov000_021fb848(object);
        Heap_Free(object);
    }
    FIELD(void *, state, 0x450) = 0;

    object = FIELD(void *, state, 0x470);
    if (object != 0) {
        Overlay016_ActorGroup_Destroy(object);
        Heap_Free(object);
    }
    FIELD(void *, state, 0x470) = 0;

    object = FIELD(void *, state, 0x44c);
    Overlay000_CaptureViewState(saved, object);
    FIELD(u32, state, 0x454) = saved[0];
    FIELD(u32, state, 0x458) = saved[1];
    FIELD(u32, state, 0x45c) = saved[2];
    if (object != 0) {
        DeleteFunction *vtable = *(DeleteFunction **)object;
        vtable[1](object);
    }
    FIELD(void *, state, 0x44c) = 0;
}
