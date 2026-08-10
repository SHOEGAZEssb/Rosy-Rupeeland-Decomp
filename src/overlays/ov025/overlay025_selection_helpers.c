#include "tingle/types.h"

/* Overlay 25 record-row selection, edit-mode visibility, and event/audio helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u16 data_ov025_02202c78[];
extern const u8 data_ov025_022033b4[];
extern void *gGameWork;
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void GameWork_SetFlag(void *, s32);
extern void func_020593ac(void *, s32, s32, s32, s32, s32);
extern void func_02071eb8(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern s32 func_0209189c(void *, s32, s32);
extern s32 func_020918f4(void *, s32);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern void func_020927b8(void *);
extern s32 func_02093360(void *, const u16 *);
extern void func_020954e0(void *);
extern void func_020954f4(void *);
extern void func_02095940(void *);
extern void func_02095988(void *, s32);
extern void *func_ov025_021fd5dc(void *, s32);
extern void func_ov025_021fd9e4(void *, s32);
extern void func_ov025_021fdb18(void *, s32);
extern s32 func_ov025_021fdc4c(void *);
extern void func_ov025_021fde58(void *);
extern void func_ov025_021ff140(void *);
extern void func_ov025_02200498(void *, s32);
extern void func_ov025_0220088c(void *);
#ifdef __cplusplus
}
#endif

/* Selects animations 0x21, 0x23, and 0x25 on the three +0x2F4 controllers. */
extern "C" void func_ov025_02200534(void *scene)
{
    for (s32 i = 0; i < 3; ++i)
        func_02095988((u8 *)scene + 0x2f4 + i * 0xac, i * 2 + 0x21);
}

/* Hides the three 0xAC-byte controllers beginning at scene offset +0x2F4. */
extern "C" void func_ov025_02200564(void *scene)
{
    for (s32 i = 0; i < 3; ++i)
        func_02095940((u8 *)scene + 0x2f4 + i * 0xac);
}

/*
 * Enters the confirmed edit display: starts effect +0x508, enables controllers
 * +0xDC/+0xE0, shows sprites +0xC4..+0xD8, and hides sprite +0xC0.
 */
extern "C" void func_ov025_0220058c(void *scene)
{
    func_ov025_021ff140(FIELD(void *, scene, 0x508));
    func_020954e0(FIELD(void *, scene, 0xdc));
    func_020954e0(FIELD(void *, scene, 0xe0));
    for (s32 i = 0; i < 6; ++i)
        FIELD(u16, FIELD(void *, scene, 0xc4 + i * 4), 0x24) &= (u16)~4;
    FIELD(u16, FIELD(void *, scene, 0xc0), 0x24) |= 4;
}

/*
 * Leaves the edit display: stops the two effect sprites owned by +0x508,
 * disables controllers +0xDC/+0xE0, hides the six edit sprites, and restores
 * sprite +0xC0. The +0xE0/+0xE4 owner fields are established by its constructor.
 */
extern "C" void func_ov025_022005e4(void *scene)
{
    void *effect = FIELD(void *, scene, 0x508);
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, effect, 0xe0));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, effect, 0xe4));
    func_020954f4(FIELD(void *, scene, 0xdc));
    func_020954f4(FIELD(void *, scene, 0xe0));
    for (s32 i = 0; i < 6; ++i)
        FIELD(u16, FIELD(void *, scene, 0xc4 + i * 4), 0x24) |= 4;
    FIELD(u16, FIELD(void *, scene, 0xc0), 0x24) &= (u16)~4;
}

/*
 * Stores the selected record index at +0x54, raises its row by 16 pixels, and
 * lowers the other rows. Inactive records hide all choice controllers;
 * otherwise their layout is rebuilt for the selected index.
 */
extern "C" void func_ov025_02200648(void *scene, s32 selected)
{
    FIELD(s32, scene, 0x54) = selected;
    for (s32 i = 0; i < 3; ++i) {
        void *row = FIELD(void *, scene, 0xe4 + i * 4);
        if (i == FIELD(s32, scene, 0x54))
            func_ov025_021fd9e4(row, 0x10);
        else
            func_ov025_021fdb18(row, 0);
    }
    if (func_ov025_021fdc4c(FIELD(void *, scene, 0xe4 + selected * 4)))
        func_ov025_02200564(scene);
    else
        func_ov025_02200498(scene, selected);
}

static void destroy_record_row(void *row)
{
    if (row) {
        GraphicsSpriteGroup_Destroy(FIELD(void *, row, 0xc));
        func_020927b8((u8 *)row + 0x30);
        func_02071eb8(row);
        Heap_Free(row);
    }
}

static void *create_record_row(s32 index)
{
    void *row = Heap_Alloc(0x90, data_ov025_022033b4, 4, gHeapContext);
    if (row)
        row = func_ov025_021fd5dc(row, index);
    return row;
}

/*
 * Deletes and recreates the row selected at +0x54, marks its backing owner
 * ready, returns all rows to y=0, and clears the selection to -1.
 */
extern "C" void func_ov025_022006c4(void *scene)
{
    func_ov025_02200564(scene);
    s32 index = FIELD(s32, scene, 0x54);
    void *row = FIELD(void *, scene, 0xe4 + index * 4);
    func_ov025_021fde58(row);
    destroy_record_row(row);
    row = create_record_row(index);
    FIELD(void *, scene, 0xe4 + index * 4) = row;
    FIELD(s32, FIELD(void *, row, 0xc), 0x20) = 1;
    for (s32 i = 0; i < 3; ++i)
        func_ov025_021fd9e4(FIELD(void *, scene, 0xe4 + i * 4), 0);
    FIELD(s32, scene, 0x54) = -1;
}

/* Recreates the row indexed at +0x58 and marks its backing owner ready. */
extern "C" void func_ov025_02200794(void *scene)
{
    s32 index = FIELD(s32, scene, 0x58);
    destroy_record_row(FIELD(void *, scene, 0xe4 + index * 4));
    void *row = create_record_row(index);
    FIELD(void *, scene, 0xe4 + index * 4) = row;
    FIELD(s32, FIELD(void *, row, 0xc), 0x20) = 1;
}

/*
 * If event object +0x5C4 is in state 2, optionally commits `value` to object
 * +0x5E0 when it too is in state 2, sets game flag 0x3D3, then runs the sound
 * selection helper. Returns void and may update persistent game state/audio.
 */
extern "C" void func_ov025_02200824(void *scene, s32 value)
{
    if (!func_02091c7c((u8 *)scene + 0x5c4, 2))
        return;
    if (func_02091c7c((u8 *)scene + 0x5e0, 2)) {
        GameWork_SetFlag(gGameWork, 0x3d3);
        func_02091b98((u8 *)scene + 0x5e0, value);
    }
    func_ov025_0220088c(scene);
}

/*
 * When event object +0x618 is in state 2, chooses one of six packed sound IDs
 * from +0x634, plays it through the global sound context, advances +0x634,
 * and stores the result in +0x618. Returns void; exact table meaning is unknown.
 */
extern "C" void func_ov025_0220088c(void *scene)
{
    if (func_02091c7c((u8 *)scene + 0x618, 2)) {
        u16 sounds[6];
        for (s32 i = 0; i < 6; ++i)
            sounds[i] = data_ov025_02202c78[i];
        s32 choice = func_020918f4((u8 *)scene + 0x634, 6);
        u16 packed = sounds[choice];
        func_020593ac(gSoundContext, packed >> 7, packed & 0x7f, 0x20, 0, 0);
        s32 result = func_0209189c((u8 *)scene + 0x634, 10, 30);
        func_02091b98((u8 *)scene + 0x618, result);
    }
}

/*
 * Tests a copied 11-halfword descriptor from object +0x2C against owner +0x50C.
 * Returns true immediately for owner flag bit 0; otherwise applies the inferred
 * descriptor bit adjustment and returns bit 0 of func_02093360's result.
 */
extern "C" s32 func_ov025_02200940(void *object)
{
    u16 descriptor[11];
    for (s32 i = 0; i < 11; ++i)
        descriptor[i] = FIELD(u16, object, 0x2c + i * 2);
    void *owner = FIELD(void *, object, 0x50c);
    u32 flags = FIELD(u32, owner, 0x38);
    if (flags & 1)
        return 1;
    if ((FIELD(u32, object, 0x20) & 0x20) && (flags & 2))
        descriptor[1] |= 1;
    return func_02093360(owner, descriptor) & 1;
}
