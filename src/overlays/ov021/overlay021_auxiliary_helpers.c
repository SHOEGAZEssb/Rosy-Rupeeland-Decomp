#include "tingle/types.h"

/* Overlay 21 auxiliary panel lifecycle, availability, marker, and input-layout helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_021e9ac0;
extern const u8 data_ov021_02202fb0[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void Heap_Free(void *);
extern void OverlaySlot_LoadOverlay(void *, s32);
extern void OverlaySlot_UnloadOverlay(void *, s32);
extern s32 func_02062b28(void *);
extern void func_0206563c(void *, s32);
extern void func_02095820(void *, s32, s32);
extern void *func_ov000_021fb6e0(void *, void *, s32);
extern void func_ov001_021fca94(void *, void *);
extern void func_ov002_021fb9c4(void *);
extern void func_ov021_021feac8(void *, const void *);
#ifdef __cplusplus
}
#endif

/*
 * If auxiliary panel +0x358 exists, snapshot its 12-byte state into +0x368,
 * invoke its virtual destructor, clear the pointer, and disable associated
 * object +0x41C with argument zero. Panel/UI ownership changes; returns void,
 * with no direct hardware access.
 */
extern "C" void func_ov021_021fecd0(void *state)
{
    void *panel = FIELD(void *, state, 0x358);
    if (panel != 0) {
        u32 snapshot[3];
        func_ov001_021fca94(snapshot, panel);
        func_ov021_021feac8((u8 *)state + 0x368, snapshot);
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, panel, 0)[1](panel);
        FIELD(void *, state, 0x358) = 0;
        OverlaySlot_UnloadOverlay((u8 *)state + 0x41c, 0);
    }
}

/*
 * Select the secondary global record set through +0x34 using scene field
 * +0x54, then scan its +0x38 array of 0x24-byte records. Return one if any
 * record rejected by func_02062B28 has a nonnull +0x0C member; otherwise zero.
 * Global/scene data are read; SDK selection state may change, with no MMIO.
 */
extern "C" s32 func_ov021_021fed30(void *state)
{
    u8 *collection = (u8 *)data_021e9ac0;
    func_0206563c(collection + 0x34, FIELD(s32, state, 0x54));
    s32 i;
    for (i = 0; i < FIELD(s32, collection, 0x40); i++) {
        void *record = FIELD(u8 *, collection, 0x38) + i * 0x24;
        if (func_02062b28(record) == 0 &&
            FIELD(void *, record, 0xc) != 0)
            return 1;
    }
    return 0;
}

/*
 * If object +0x390 is absent, enable associated object +0x41C with mode 2,
 * allocate 0xB4 bytes, construct the overlay-2 panel using the shared font and
 * zero mode, and store it. Heap/panel/UI ownership changes; returns void and
 * performs no direct hardware access.
 */
extern "C" void func_ov021_021fedac(void *state)
{
    if (FIELD(void *, state, 0x390) != 0)
        return;
    OverlaySlot_LoadOverlay((u8 *)state + 0x41c, 2);
    void *panel = Heap_Alloc(0xb4, data_ov021_02202fb0, 4, gHeapContext);
    if (panel != 0)
        panel = func_ov000_021fb6e0(panel, data_020f4e14, 0);
    FIELD(void *, state, 0x390) = panel;
}

/*
 * If object +0x390 exists, run its overlay-2 teardown, free it, clear the
 * pointer, and disable associated object +0x41C. Heap/panel/UI ownership
 * changes; returns void and performs no direct hardware access.
 */
extern "C" void func_ov021_021fee14(void *state)
{
    void *panel = FIELD(void *, state, 0x390);
    if (panel == 0)
        return;
    func_ov002_021fb9c4(panel);
    Heap_Free(panel);
    FIELD(void *, state, 0x390) = 0;
    OverlaySlot_UnloadOverlay((u8 *)state + 0x41c, 0);
}

/*
 * Set flag bit one at +0x48, show marker sprite +0x98, fix its X to 0x86, and
 * set Y to 0x1C + (selected(+0x14)-firstVisible(+0x0C))*24 using active list
 * +0x2C0. Scene and sprite state change; returns void and has no SDK/MMIO calls.
 */
extern "C" void func_ov021_021fee54(void *state)
{
    FIELD(u32, state, 0x48) |= 2;
    void *sprite = FIELD(void *, state, 0x98);
    FIELD(u16, sprite, 0x24) &= (u16)~4;
    void *controller =
        FIELD(void *, FIELD(void *, state, 0x2c0), 0x58);
    s32 relative = FIELD(s32, controller, 0x14) -
                   FIELD(s32, controller, 0xc);
    FIELD(u16, sprite, 0x2c) = 0x86;
    FIELD(u16, sprite, 0x2e) = (u16)(relative * 0x18 + 0x1c);
}

/*
 * Position two 0xAC-byte input helpers at X=0x80 and Y=0x40+i*0x30. For scene
 * modes 9,12,13 move the second helper to Y=0x60; for mode 17 move the first
 * helper there. Input-helper UI state changes; returns void and no MMIO occurs.
 */
extern "C" void func_ov021_021fefcc(void *state)
{
    s32 i;
    for (i = 0; i < 2; i++)
        func_02095820((u8 *)state + 0x14c + i * 0xac,
                      0x80, 0x40 + i * 0x30);
    s32 mode = FIELD(s32, state, 0x54);
    if (mode == 9 || mode == 12 || mode == 13)
        func_02095820((u8 *)state + 0x1f8, 0x80, 0x60);
    else if (mode == 17)
        func_02095820((u8 *)state + 0x14c, 0x80, 0x60);
}

/*
 * Select one of two list widgets by index, storing index +0x2C4 and pointer
 * +0x2C0. Move every nonselected input helper to X=-64 and its normal Y, then
 * move the selected helper to X=128,Y=170. Input/list selection state changes;
 * returns void and performs no direct hardware access.
 */
extern "C" void func_ov021_021ff050(void *state, s32 index)
{
    FIELD(s32, state, 0x2c4) = index;
    FIELD(void *, state, 0x2c0) =
        FIELD(void *, state, 0x2a4 + index * 4);
    s32 i;
    for (i = 0; i < 2; i++) {
        if (i != index)
            func_02095820((u8 *)state + 0x14c + i * 0xac,
                          -64, 0x40 + i * 0x30);
    }
    func_02095820((u8 *)state + 0x14c + index * 0xac, 0x80, 0xaa);
}

/*
 * Return one when word +0x80 is greater than or equal to word +0x7C, otherwise
 * zero. State is read only and no SDK or hardware effects occur.
 */
extern "C" s32 func_ov021_021ff0c8(void *state)
{
    return FIELD(s32, state, 0x80) >= FIELD(s32, state, 0x7c);
}
