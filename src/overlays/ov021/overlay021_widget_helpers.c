#include "tingle/types.h"

/* Overlay 21 list-widget persistence, sprite reset, and auxiliary-panel helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021e9ac0;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void OverlaySlot_UnloadOverlay(void *, s32);
extern s32 func_02062b28(void *);
extern void func_02064d90(void *, s32);
extern void func_02074058(void *);
extern void func_02095988(void *, s32);
extern void func_ov000_021fcb4c(void *, void *);
extern void func_ov021_021fd074(void *);
extern void func_ov021_021feac8(void *, const void *);
#ifdef __cplusplus
}
#endif

/*
 * Reset +0x2C0, then for each of two optional list widgets +0x2A4/+0x2A8 save
 * controller first-visible +0x0C into +0x2AC/+0x2B0 and selection +0x14 into
 * +0x2B4/+0x2B8, destroy/free the widget, and clear its pointer. Heap/list/UI
 * ownership changes; returns void and performs no direct hardware access.
 */
extern "C" void func_ov021_021fe63c(void *state)
{
    s32 i;
    FIELD(s32, state, 0x2c0) = 0;
    for (i = 0; i < 2; i++) {
        void *list = FIELD(void *, state, 0x2a4 + i * 4);
        if (list != 0) {
            void *controller = FIELD(void *, list, 0x58);
            FIELD(s32, state, 0x2ac + i * 4) =
                FIELD(s32, controller, 0xc);
            FIELD(s32, state, 0x2b4 + i * 4) =
                FIELD(s32, controller, 0x14);
            func_ov021_021fd074(list);
            Heap_Free(list);
            FIELD(void *, state, 0x2a4 + i * 4) = 0;
        }
    }
}

/*
 * For each of two 0xAC-byte input helpers at +0x14C, choose animation
 * 0x16+i*2 when its corresponding list +0x2A4 exists, otherwise 0x17+i*2.
 * Input-helper/UI state changes through func_02095988; returns void, no MMIO.
 */
extern "C" void func_ov021_021fe84c(void *state)
{
    s32 i;
    for (i = 0; i < 2; i++) {
        s32 animation = i * 2 +
            (FIELD(void *, state, 0x2a4 + i * 4) != 0 ? 0x16 : 0x17);
        func_02095988((u8 *)state + 0x14c + i * 0xac, animation);
    }
}

/*
 * Reset renderer +0x94, clear word +0x9C in each of two 0xAC-byte helper
 * records (absolute +0x1E8/+0x294), and clear sprite/object pointers
 * +0x13C/+0x9C/+0x98. UI/renderer state changes; returns void and no MMIO.
 */
extern "C" void func_ov021_021fe8a8(void *state)
{
    func_02074058(FIELD(void *, state, 0x94));
    s32 i;
    for (i = 0; i < 2; i++)
        FIELD(s32, state, 0x1e8 + i * 0xac) = 0;
    FIELD(s32, state, 0x13c) = 0;
    FIELD(s32, state, 0x9c) = 0;
    FIELD(s32, state, 0x98) = 0;
}

/*
 * If object +0x0C exists, OR the caller mask into its flags at +0x20.
 * Returns void. Only the nested object's flags change; no SDK or MMIO effects.
 */
extern "C" void func_ov021_021fea50(void *object, u32 mask)
{
    void *nested = FIELD(void *, object, 0xc);
    if (nested != 0)
        FIELD(u32, nested, 0x20) |= mask;
}

/*
 * If auxiliary panel +0x354 exists, snapshot its 12-byte state into a temporary
 * record, copy that record to +0x35C, invoke its virtual destructor, clear the
 * panel pointer, and disable associated object +0x41C with argument zero.
 * Panel/UI ownership changes; returns void and performs no direct MMIO.
 */
extern "C" void func_ov021_021fea68(void *state)
{
    void *panel = FIELD(void *, state, 0x354);
    if (panel != 0) {
        u32 snapshot[3];
        func_ov000_021fcb4c(snapshot, panel);
        func_ov021_021feac8((u8 *)state + 0x35c, snapshot);
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, panel, 0)[1](panel);
        FIELD(void *, state, 0x354) = 0;
        OverlaySlot_UnloadOverlay((u8 *)state + 0x41c, 0);
    }
}

/*
 * Copy three words from caller source to destination. The destination record
 * changes; returns void and performs no SDK or hardware operations.
 */
extern "C" void func_ov021_021feac8(void *destination, const void *source)
{
    FIELD(u32, destination, 0) = FIELD(u32, source, 0);
    FIELD(u32, destination, 4) = FIELD(u32, source, 4);
    FIELD(u32, destination, 8) = FIELD(u32, source, 8);
}

/*
 * Select the global record set using scene field +0x54, scan its +8 array of
 * 0x24-byte records, and return one if any record rejected by func_02062B28 has
 * a nonnull +0x0C member; otherwise return zero. The selected global data is
 * read only apart from any SDK-internal selection state; no MMIO occurs.
 */
extern "C" s32 func_ov021_021feae4(void *state)
{
    u8 *collection = (u8 *)data_021e9ac0;
    func_02064d90(collection, FIELD(s32, state, 0x54));
    s32 i;
    for (i = 0; i < FIELD(s32, collection, 0x10); i++) {
        void *record = FIELD(u8 *, collection, 8) + i * 0x24;
        if (func_02062b28(record) == 0 &&
            FIELD(void *, record, 0xc) != 0)
            return 1;
    }
    return 0;
}
