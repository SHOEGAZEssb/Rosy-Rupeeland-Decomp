#include "tingle/types.h"

/*
 * Overlay 44 panel population. This recovered helper filters global records,
 * restores a saved selection when requested, constructs the panel, appends
 * eligible and disabled rows, and synchronizes its child viewport indices.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *gGameWork;
extern "C" void *data_021e9ac0;
extern "C" const u8 data_ov044_0220d348[];
extern "C" u8 gHeapContext[];
extern "C" void *data_020f4e14;
extern "C" s32 GameWork_TestFlag(void *work, u32 flag);
extern "C" void GameWork_ClearFlag(void *work, u32 flag);
extern "C" s32 func_02062c00(void *record);
extern "C" void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                              void *heap);
extern "C" void *func_ov044_0220b740(void *storage, void *font, s32 count);
extern "C" void func_ov044_0220b944(void *panel, void *record, s32 disabled);
extern "C" void func_02093d7c(void *child, s32 index);
extern "C" void func_02093d50(void *child, s32 index);
extern "C" void func_ov044_0220ba40(void *panel);
extern "C" void func_ov044_0220b9c8(void *panel);

/*
 * Build and show the list panel, returning no value. If game-work flag 0x3A6
 * is set, clear it and recover a signed saved record ID from game work +0x1CA.
 * Scan the global 0x24-byte records and retain the span through the last one
 * accepted by func_02062c00,
 * and restore both viewport indices when an accepted record's leading u16
 * matches that ID. Allocate a 0x4C-byte panel, append every record through
 * func_ov044_0220b944 (passing disabled=1 for rejected records), clear each
 * record's +0x20 runtime flags, then set the child top/selection indices and
 * show the panel. Heap and UI state change through the called helpers.
 */
extern "C" void func_ov044_0220c440(void *object)
{
    s32 savedId = -1;
    if (GameWork_TestFlag(gGameWork, 0x3a6)) {
        GameWork_ClearFlag(gGameWork, 0x3a6);
        savedId = FIELD(s16, gGameWork, 0x1ca);
    }

    void *collection = data_021e9ac0;
    u8 *records = (u8 *)FIELD(void *, collection, 0x20);
    s32 total = FIELD(s32, collection, 0x28);
    s32 acceptedSpan = 0;
    for (s32 i = 0; i < total; ++i) {
        void *record = records + i * 0x24;
        if (func_02062c00(record)) {
            if (savedId >= 0 && savedId == FIELD(u16, record, 0)) {
                FIELD(s32, object, 0x234) = i;
                FIELD(s32, object, 0x230) = i;
                savedId = -1;
            }
            acceptedSpan = i + 1;
        }
    }

    void *panel = Heap_Alloc(0x4c, data_ov044_0220d348, 4, gHeapContext);
    if (panel)
        panel = func_ov044_0220b740(panel, data_020f4e14, acceptedSpan);
    FIELD(void *, object, 0x228) = panel;
    for (s32 i = 0; i < acceptedSpan; ++i) {
        void *record = records + i * 0x24;
        FIELD(u32, record, 0x20) = 0;
        func_ov044_0220b944(panel, record,
                           func_02062c00(record) ? 0 : 1);
    }
    void *child = FIELD(void *, panel, 0x44);
    func_02093d7c(child, FIELD(s32, object, 0x230));
    func_02093d50(child, FIELD(s32, object, 0x234));
    func_ov044_0220ba40(panel);
    func_ov044_0220b9c8(panel);
}
