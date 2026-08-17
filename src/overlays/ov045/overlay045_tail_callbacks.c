#include "tingle/types.h"

/*
 * Overlay 45 tail callbacks. These recovered routines stop a nonnegative sound
 * handle, draw a centered selector-dependent debug-font preview, and delete an
 * embedded effect-list node. Matching fallbacks preserve switch/register order.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *gSoundContext;
extern "C" void *gGameWork;
extern "C" void *gDebugFont;
extern "C" u8 data_021f3ecc[];
extern "C" void **data_021f5128;
extern "C" u8 data_020ed6e0[];
extern "C" u8 data_ov045_0220d570[];
extern "C" void Sound_ReleaseGroup(void *context, s32 handle);
extern "C" s32 GameWork_TestFlag(void *work, s32 flag);
extern "C" s32 RetailTextTable_FindRecordById(void *table, s32 id);
extern "C" void *RecordMode_GetMessageGroup(void *entry);
extern "C" s32 GraphicsSpriteRenderer_MeasureText(void *font, void *entry, s32 mode, s32 spacing);
extern "C" void GraphicsSpriteRenderer_DrawText(void *font, void *entry, s32 x, s32 y,
                               s32 color, s32 mode, s32 spacing);
extern "C" void PresentationList_DeleteAll(void *object);
extern "C" void Heap_Free(void *allocation);

/* Stop a nonnegative sound handle through gSoundContext; negative inputs do nothing. */
extern "C" void func_ov045_0220d2d8(s32 handle)
{
    if (handle >= 0)
        Sound_ReleaseGroup(gSoundContext, handle);
}

/*
 * Draw the selector's preview centered around X=0x54 at Y=0xAC. Most selectors
 * resolve data_021f5128[selector] through RecordMode_GetMessageGroup. Selector 9, and
 * selector 8/subtype 0x2C, use flagged lookup ID 0x1B6 plus two when progress
 * flag 0x3A5 is set. Other selector-8 subtypes use data_020ed6e0 records with
 * stride 0x68. Measure with mode 8/spacing -2, halve width toward zero, then
 * draw with color 13 and the same mode/spacing. Font/display state changes.
 */
extern "C" void Overlay045_DrawSelectorPreview(u32 selector, u32 subtype)
{
    void *entry;
    if (selector == 9 && GameWork_TestFlag(gGameWork, 0x3a5)) {
        entry = (u8 *)data_021f3ecc + RetailTextTable_FindRecordById(data_021f3ecc, 0x1b6) + 2;
    } else if (selector == 8) {
        if (subtype == 0x2c && GameWork_TestFlag(gGameWork, 0x3a5))
            entry = (u8 *)data_021f3ecc + RetailTextTable_FindRecordById(data_021f3ecc, 0x1b6) + 2;
        else
            entry = data_020ed6e0 + subtype * 0x68;
    } else {
        entry = RecordMode_GetMessageGroup(data_021f5128[selector]);
    }
    s32 width = GraphicsSpriteRenderer_MeasureText(gDebugFont, entry, 8, -2);
    width = (width + (s32)((u32)width >> 31)) >> 1;
    GraphicsSpriteRenderer_DrawText(gDebugFont, entry, 0x54 - width, 0xac, 13, 8, -2);
}

/*
 * Restore the effect-list vtable, release base state, free the node, and return
 * its former address. The returned pointer must not be dereferenced.
 */
extern "C" void *func_ov045_0220d454(void *object)
{
    FIELD(void *, object, 0) = data_ov045_0220d570;
    PresentationList_DeleteAll(object);
    Heap_Free(object);
    return object;
}
