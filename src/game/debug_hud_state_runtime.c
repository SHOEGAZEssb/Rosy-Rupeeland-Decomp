#include "tingle/debug_hud_state.h"
#include "tingle/heap.h"

/* Own the debug HUD renderer, input mapping, text rows, and singleton access. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gDebugHudRendererAllocationTag[];
extern void *gDebugHudTextTables[2];
extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gGameWork;
extern u16 gDebugHudTextRows[8][17];
extern u32 gDebugHudStateInitializationFlags;
extern DebugHudState gDebugHudState;
extern void *gDebugHudStateDestructorRecord;
extern const u16 gPadState1[11];
extern void *gTouchPanelManager;
extern void *GraphicsArchive_AcquireVfdResource(void *manager, u32 id);
extern void GraphicsArchive_ReleaseResourceE4(void *manager, void *resource);
extern void *TitleDialog_Init(void *object, void *font, void *resource);
extern void TitleDialog_SetText(void *object, void *textResource, s32 mode);
extern void func_02092f88(void *object, s32 row, const u16 *text);
extern u32 TitleDialog_UpdateTextPage(void *object, const u16 *mapping, s32 value);
extern void GraphicsSpriteText_FormatDecimal(u16 *destination, s32 value, s32 firstPower,
                          s32 mode);
extern void OS_Halt(void);
extern void __register_global_object(void *object, void *destructor,
                                     void *record);
#ifdef __cplusplus
}
#endif

/*
 * Retain constructor arguments, acquire resource 0x7007, allocate a 0xec-byte
 * renderer using the selected font, apply the current rectangle and fixed
 * renderer fields, configure it with the text resource and mode 4, and set
 * GameWork's HUD row count to 12. resetFontOnClose controls cleanup-time font
 * reset.
 */
void DebugHudState_Open(DebugHudState *self, s32 fontSelect, void *textResource,
                        u32 resetFontOnClose)
{
    void *renderer;
    self->resetFontOnClose = resetFontOnClose;
    self->fontSelect = fontSelect;
    self->graphicsResource =
        GraphicsArchive_AcquireVfdResource(data_020f4e18, 0x7007);
    renderer = Heap_Alloc(0xec, (const char *)gDebugHudRendererAllocationTag, 4,
                          &gHeapContext);
    if (renderer)
        renderer = TitleDialog_Init(renderer,
            fontSelect == 0 ? data_020f4e14 : gDebugFont,
            self->graphicsResource);
    self->renderer = renderer;
    DebugHudState_UploadRows(self);
    *(s32 *)((u8 *)renderer + 0xa4) = self->left;
    *(s32 *)((u8 *)renderer + 0xa8) = self->top;
    *(s32 *)((u8 *)renderer + 0xac) = self->width;
    *(s32 *)((u8 *)renderer + 0xb0) = self->height;
    *(s32 *)((u8 *)renderer + 0xd0) = 12;
    *(s32 *)((u8 *)renderer + 0xd4) = 0;
    *(s32 *)((u8 *)renderer + 0xb4) = 0;
    *(s32 *)((u8 *)renderer + 0xbc) = -2;
    TitleDialog_SetText(renderer, textResource, 4);
    *(u16 *)((u8 *)gGameWork + 0x1d2) = 12;
}

/* Release the renderer/resource, optionally reset its font, and clear row heads. */
void DebugHudState_Close(DebugHudState *self)
{
    s32 row;
    if (self->resetFontOnClose)
        DebugHudState_ResetSelectedFont(self);
    if (self->renderer) {
        void *renderer = self->renderer;
        ((void (*)(void *))(*(void ***)renderer)[1])(renderer);
        self->renderer = 0;
    }
    if (self->graphicsResource) {
        GraphicsArchive_ReleaseResourceE4(data_020f4e18,
                                           self->graphicsResource);
        self->graphicsResource = 0;
    }
    for (row = 0; row < 8; row++)
        gDebugHudTextRows[row][0] = 0;
}

/* Build and submit the pad/touch mapping, returning the renderer's input bits. */
u32 DebugHudState_PollInput(DebugHudState *self, s32 forceButtons)
{
    u16 mapping[11];
    s32 i;
    for (i = 0; i < 11; i++)
        mapping[i] = gPadState1[i];
    if (forceButtons)
        mapping[1] |= 3;
    else if (*(s32 *)((u8 *)gTouchPanelManager + 4) == 1) {
        u32 rendererFlags = *(u32 *)((u8 *)self->renderer + 0x38);
        mapping[1] |= (rendererFlags & 2) ? 1 : 2;
    }
    *(s32 *)((u8 *)self->renderer + 0xd0) =
        *(s16 *)((u8 *)gGameWork + 0x1d2);
    *(s32 *)((u8 *)self->renderer + 0xd4) = 0;
    return TitleDialog_UpdateTextPage(self->renderer, mapping, 0);
}

/* Format value right-aligned into one shared row and upload all rows if active. */
void DebugHudState_SetNumberRow(DebugHudState *self, s32 row, s32 value)
{
    s32 digits = DebugHud_CountDecimalDigits(self, value);
    s32 power = 1;
    s32 i;
    for (i = 0; i < digits - 1; i++)
        power *= 10;
    GraphicsSpriteText_FormatDecimal(gDebugHudTextRows[row], value, -power, 0);
    if (self->renderer)
        DebugHudState_UploadRows(self);
}

/* Copy a zero-terminated UTF-16 string into one row and upload if active. */
void DebugHudState_SetTextRow(DebugHudState *self, s32 row, const u16 *text)
{
    u16 *destination = gDebugHudTextRows[row];
    while (*text)
        *destination++ = *text++;
    *destination = 0;
    if (self->renderer)
        DebugHudState_UploadRows(self);
}

/* Return an indexed entry from table 0 or 1; invalid table IDs halt the OS. */
void *DebugHud_GetTextTableEntry(void *unused, s32 table, s32 index)
{
    void **entries;
    (void)unused;
    if (table < 0 || table > 1) {
        OS_Halt();
        return 0;
    }
    entries = (void **)gDebugHudTextTables[table];
    return entries[index];
}

/* Store a rectangle as left/top plus derived width/height. */
void DebugHudState_SetRectangle(DebugHudState *self, const DebugHudRect *rect)
{
    self->left = rect->left;
    self->top = rect->top;
    self->width = rect->right - rect->left;
    self->height = rect->bottom - rect->top;
}

/* Recompute and retain the current display-dependent HUD rectangle. */
void DebugHudState_RefreshRectangle(DebugHudState *self)
{
    DebugHudRect rect;
    DebugHud_GetCurrentRectangle(&rect);
    DebugHudState_SetRectangle(self, &rect);
}

/* Upload all eight shared text rows to the active renderer. */
void DebugHudState_UploadRows(DebugHudState *self)
{
    s32 row;
    for (row = 0; row < 8; row++)
        func_02092f88(self->renderer, row, gDebugHudTextRows[row]);
}

/* Lazily construct, register, and return the process-global DebugHudState. */
DebugHudState *DebugHudState_GetGlobal(void)
{
    if (!(gDebugHudStateInitializationFlags & 1)) {
        DebugHudState_Init(&gDebugHudState);
        __register_global_object(&gDebugHudState, (void *)DebugHudState_Destroy,
                                 gDebugHudStateDestructorRecord);
        gDebugHudStateInitializationFlags |= 1;
    }
    return &gDebugHudState;
}
