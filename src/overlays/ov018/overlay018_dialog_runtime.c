#include "tingle/types.h"

/* Overlay 18 dialog allocation, layout, localized text transfer, and input completion handling. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *gGamePhaseRuntime;
extern void *data_021f3ecc;
extern const u8 data_ov018_021ffd60[];
extern void *gGameWork;
extern void *gHeapContext;
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void MIi_CpuCopy16(const void *, void *, u32);
extern void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern void *ActorCollection_FindActorByRuntimeId(void *, s32);
extern u32 LanguageLookupDatabase_GetResourceSize(void *, u16);
extern void *LanguageLookupDatabase_GetResourceById(void *, u16);
extern void *TitleDialog_Init(void *, void *, void *);
extern void TitleDialog_SetText(void *, void *, s32);
extern s32 TitleDialog_UpdateTextPage(void *, void *);
extern void func_ov018_021fd9f8(void *, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Clear dialog counters +0x41C/+0x420, allocate and construct the 0xEC-byte
 * dialog at +0x418 using the resource manager +0x70, and set its layout to
 * X=0x20/Z=0xC0 or X=0x10/Z=0xE0 according to system byte +0x5F; Y=0x83 and
 * the final value 0x2D are shared. Set dialog +0xD0/+0xD4 to 12/0 and +0xBC to
 * -2. Resolve actor/control object +0x18C from global data_021052FC and GameWork
 * +0x3F4. Returns void. Heap, dialog, global SDK, and caller state change; no
 * direct hardware access occurs.
 */
extern "C" void func_ov018_021fd90c(void *state)
{
    void *dialog;
    void *handle;

    FIELD(s32, state, 0x420) = 0;
    FIELD(s32, state, 0x41c) = 0;
    dialog = Heap_Alloc(0xec, data_ov018_021ffd60, 4, gHeapContext);
    if (dialog != 0)
        dialog = TitleDialog_Init(dialog, data_020f4e14,
                               (u8 *)state + 0x70);
    FIELD(void *, state, 0x418) = dialog;
    if (FIELD(u8, gSystemState, 0x5f) == 0)
        func_ov018_021fd9f8(dialog, 0x20, 0x83, 0xc0, 0x2d);
    else
        func_ov018_021fd9f8(dialog, 0x10, 0x83, 0xe0, 0x2d);
    FIELD(s32, dialog, 0xd0) = 0xc;
    FIELD(s32, dialog, 0xd4) = 0;
    FIELD(s32, dialog, 0xbc) = -2;
    handle = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
    FIELD(void *, state, 0x18c) =
        ActorCollection_FindActorByRuntimeId(handle, FIELD(s32, gGameWork, 0x3f4));
}

/*
 * Store four caller layout words at dialog +0xA4/+0xA8/+0xAC/+0xB0. Returns
 * void; only dialog memory changes and no SDK or hardware effects occur.
 */
extern "C" void func_ov018_021fd9f8(void *dialog, s32 valueA4, s32 valueA8,
                                     s32 valueAC, s32 valueB0)
{
    FIELD(s32, dialog, 0xa4) = valueA4;
    FIELD(s32, dialog, 0xa8) = valueA8;
    FIELD(s32, dialog, 0xac) = valueAC;
    FIELD(s32, dialog, 0xb0) = valueB0;
}

/*
 * Resolve caller message ID to its localized byte length and pointer, copy the
 * text into scene buffer +0x1C8 with MIi_CpuCopy16, and submit that buffer to
 * dialog +0x418 using mode 4. Returns void. Scene/dialog and SDK copy state
 * change; no direct hardware access occurs.
 */
extern "C" void func_ov018_021fda10(void *state, u16 messageId)
{
    u32 length = LanguageLookupDatabase_GetResourceSize(data_021f3ecc, messageId);
    void *text = LanguageLookupDatabase_GetResourceById(data_021f3ecc, messageId);
    MIi_CpuCopy16(text, (u8 *)state + 0x1c8, length);
    TitleDialog_SetText(FIELD(void *, state, 0x418),
                  (u8 *)state + 0x1c8, 4);
}

/*
 * Copy the eleven-halfword input record addressed by state +0x2C, then inspect
 * dialog flags +0x38. Return one immediately when flag bit 0 is already set.
 * Otherwise encode scene input bit 5 into copied halfword 1 as bit 0 or bit 1
 * according to dialog bit 1. Without that scene input, dialog bits 8/1 clear
 * actor-control halfword +0x24 bit 1; when neither is set, ensure bit 1 is set
 * and bit 0 clear. Submit the copied record through 0x02093360. Return zero
 * while it remains incomplete; on completion clear actor bit 1 and return one.
 * Dialog, actor-control, and SDK state may change; no direct MMIO occurs.
 */
extern "C" s32 func_ov018_021fda60(void *state)
{
    u16 input[11];
    u16 *source = FIELD(u16 *, state, 0x2c);
    void *dialog = FIELD(void *, state, 0x418);
    u32 flags = FIELD(u32, dialog, 0x38);
    s32 i;

    for (i = 0; i < 11; i++)
        input[i] = source[i];
    if (flags & 1)
        return 1;

    if (FIELD(u32, state, 0x20) & 0x20) {
        input[1] |= (flags & 2) ? 1 : 2;
    } else {
        void *control = FIELD(void *, FIELD(void *, state, 0x18c), 0x54);
        if ((flags & 0x100) || (flags & 2)) {
            FIELD(u16, control, 0x24) &= ~2;
        } else if ((FIELD(u16, control, 0x24) & 2) == 0) {
            FIELD(u16, control, 0x24) |= 2;
            FIELD(u16, control, 0x24) &= ~1;
        }
    }

    if ((TitleDialog_UpdateTextPage(dialog, input) & 1) == 0)
        return 0;
    FIELD(u16, FIELD(void *, FIELD(void *, state, 0x18c), 0x54), 0x24) &= ~2;
    return 1;
}
