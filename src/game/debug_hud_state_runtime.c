#include "tingle/debug_hud_state.h"
#include "tingle/heap.h"

/* Own the debug HUD renderer, input mapping, text rows, and singleton access. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gDebugHudRendererAllocationTag[];
extern void *data_020d5554[2];
extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gGameWork;
extern u16 data_0210548c[8][17];
extern u32 data_02105458;
extern DebugHudState data_02105468;
extern void *data_0210545c;
extern const u16 gPadState1[11];
extern void *gTouchPanelManager;
extern void *func_02071980(void *manager, u32 id);
extern void func_02071d4c(void *manager, void *resource);
extern void *func_02092cc0(void *object, void *font, void *resource);
extern void func_02092e9c(void *object, u32 parameter, s32 mode);
extern void func_02092f88(void *object, s32 row, const u16 *text);
extern u32 func_02093360(void *object, const u16 *mapping, s32 value);
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
 * renderer fields, configure it with parameter/mode 4, and set GameWork's HUD
 * row count to 12. resetFontOnClose controls cleanup-time font reset.
 */
void DebugHudState_Open(DebugHudState *self, s32 fontSelect, u32 parameter,
                        u32 resetFontOnClose)
{
    void *renderer;
    self->resetFontOnClose = resetFontOnClose;
    self->fontSelect = fontSelect;
    self->resourceHandle = (u32)func_02071980(data_020f4e18, 0x7007);
    renderer = Heap_Alloc(0xec, (const char *)gDebugHudRendererAllocationTag, 4,
                          &gHeapContext);
    if (renderer)
        renderer = func_02092cc0(renderer,
            fontSelect == 0 ? data_020f4e14 : gDebugFont,
            (void *)self->resourceHandle);
    self->rendererHandle = (u32)renderer;
    DebugHudState_UploadRows(self);
    *(s32 *)((u8 *)renderer + 0xa4) = self->left;
    *(s32 *)((u8 *)renderer + 0xa8) = self->top;
    *(s32 *)((u8 *)renderer + 0xac) = self->width;
    *(s32 *)((u8 *)renderer + 0xb0) = self->height;
    *(s32 *)((u8 *)renderer + 0xd0) = 12;
    *(s32 *)((u8 *)renderer + 0xd4) = 0;
    *(s32 *)((u8 *)renderer + 0xb4) = 0;
    *(s32 *)((u8 *)renderer + 0xbc) = -2;
    func_02092e9c(renderer, parameter, 4);
    *(u16 *)((u8 *)gGameWork + 0x1d2) = 12;
}

/* Release the renderer/resource, optionally reset its font, and clear row heads. */
void DebugHudState_Close(DebugHudState *self)
{
    s32 row;
    if (self->resetFontOnClose)
        DebugHudState_ResetSelectedFont(self);
    if (self->rendererHandle) {
        void *renderer = (void *)self->rendererHandle;
        ((void (*)(void *))(*(void ***)renderer)[1])(renderer);
        self->rendererHandle = 0;
    }
    if (self->resourceHandle) {
        func_02071d4c(data_020f4e18, (void *)self->resourceHandle);
        self->resourceHandle = 0;
    }
    for (row = 0; row < 8; row++)
        data_0210548c[row][0] = 0;
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
        u32 rendererFlags = *(u32 *)((u8 *)self->rendererHandle + 0x38);
        mapping[1] |= (rendererFlags & 2) ? 1 : 2;
    }
    *(s32 *)((u8 *)self->rendererHandle + 0xd0) =
        *(s16 *)((u8 *)gGameWork + 0x1d2);
    *(s32 *)((u8 *)self->rendererHandle + 0xd4) = 0;
    return func_02093360((void *)self->rendererHandle, mapping, 0);
}

/* Format value right-aligned into one shared row and upload all rows if active. */
void DebugHudState_SetNumberRow(DebugHudState *self, s32 row, s32 value)
{
    s32 digits = DebugHud_CountDecimalDigits(self, value);
    s32 power = 1;
    s32 i;
    for (i = 0; i < digits - 1; i++)
        power *= 10;
    GraphicsSpriteText_FormatDecimal(data_0210548c[row], value, -power, 0);
    if (self->rendererHandle)
        DebugHudState_UploadRows(self);
}

/* Copy a zero-terminated UTF-16 string into one row and upload if active. */
void DebugHudState_SetTextRow(DebugHudState *self, s32 row, const u16 *text)
{
    u16 *destination = data_0210548c[row];
    while (*text)
        *destination++ = *text++;
    *destination = 0;
    if (self->rendererHandle)
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
    entries = (void **)data_020d5554[table];
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
        func_02092f88((void *)self->rendererHandle, row, data_0210548c[row]);
}

/* Lazily construct, register, and return the process-global DebugHudState. */
DebugHudState *DebugHudState_GetGlobal(void)
{
    if (!(data_02105458 & 1)) {
        DebugHudState_Init(&data_02105468);
        __register_global_object(&data_02105468, (void *)DebugHudState_Destroy,
                                 data_0210545c);
        data_02105458 |= 1;
    }
    return &data_02105468;
}
