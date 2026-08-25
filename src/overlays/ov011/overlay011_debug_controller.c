#include "tingle/graphics_resources.h"
#include "tingle/types.h"

/*
 * Overlay 11 interactive graphics debugger. It edits resource selections and
 * display parameters from controller input and renders live resource details.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern void *gDebugFont;
extern const char *data_ov011_021fe404[];
extern const char *data_ov011_021fe370[];
extern const s32 data_ov011_021fe3b0[];
extern const char data_ov011_021fe620[];
extern const char data_ov011_021fe624[];
extern const char data_ov011_021fe628[];
extern const char data_ov011_021fe62c[];
extern const char data_ov011_021fe630[];
extern const char data_ov011_021fe634[];
extern const char data_ov011_021fe648[];
extern const char data_ov011_021fe660[];
extern const char data_ov011_021fe678[];
extern const char data_ov011_021fe690[];
extern const char data_ov011_021fe6a0[];
extern const char data_ov011_021fe6b0[];
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *font);
extern void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *set);
extern void Overlay011_SetupResources(void *state);
extern void DebugText_Printf(void *debug, s32 x, s32 y, s32 style, ...);
extern void GraphicsSpriteRenderer_Printf(void *debug, s32 x, s32 y, const char *format, ...);
extern void GraphicsSpriteCanvas_DrawLine(void *font, s32 x, s32 y,
                                          s32 value, ...);
extern s32 GraphicsCharacterResource_GetUploadSize(void *resource);
extern void *GraphicsPaletteResource_GetUploadSize(void *resource);
extern s32 func_ov011_021fdae0(void *resource);
extern void Overlay011_InitSceneFields(void *member, s32 x, s32 y, s32 mode);
#ifdef __cplusplus
}
#endif

/* Toggle the confirmed sub-display mode field between 0x12 and 0x13. */
static void overlay011_toggle_sub_mode(void *state)
{
    volatile u32 *subDispcnt = (volatile u32 *)0x04001000;
    s32 enabled = FIELD(s32, state, 0x104) == 0;

    FIELD(s32, state, 0x104) = enabled;
    *subDispcnt = (*subDispcnt & ~0x1f00) |
                  (enabled ? 0x1300 : 0x1200);
}

/* Invalidate graphics/debug owners and reload the currently selected record. */
static void overlay011_reload_resources(void *state)
{
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    GraphicsResourceSet_ReleaseHandles((GraphicsResourceSet *)((u8 *)state + 0x78));
    Overlay011_SetupResources(state);
}

/*
 * Consume controller words at +0x50. Pressed bit 0x200 toggles the sub display
 * mode; pressed bit 8 clears debug offsets. While held bit 0x100 is active,
 * directional bits adjust +0xFC/+0x100 by two. Otherwise repeat bits 0x40/0x80
 * select one of four menu rows and bits 0x10/0x20 edit, respectively, the
 * active file, record, display mode, or +0xCC resource path, wrapping confirmed
 * ranges and reloading resources when required.
 *
 * Render the active file/record and four menu rows, resource dimensions,
 * addresses/sizes, debug offsets and member coordinates. When the scene flag
 * extracted from +0x44 is set, draw two guide primitives via
 * GraphicsSpriteCanvas_DrawLine.
 * Pressed bit 2 resets the member at +0x24 from descriptor coordinates. Return
 * zero; debug rendering, resource reloads, member mutation, and sub DISPCNT
 * writes are the observable effects.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay011_UpdateDebugController(void *state)
{
    u8 *input = FIELD(u8 *, state, 0x50);
    u16 held = FIELD(u16, input, 0x00);
    u16 pressed = FIELD(u16, input, 0x02);
    u16 repeat = FIELD(u16, input, 0x06);
    GraphicsResourceSet *set =
        (GraphicsResourceSet *)((u8 *)state + 0x78);
    s32 i;

    if (pressed & 0x200)
        overlay011_toggle_sub_mode(state);
    if (pressed & 0x08) {
        FIELD(s32, state, 0xfc) = 0;
        FIELD(s32, state, 0x100) = 0;
    }

    if (held & 0x100) {
        if (held & 0x20)
            FIELD(s32, state, 0xfc) += 2;
        else if (held & 0x10)
            FIELD(s32, state, 0xfc) -= 2;
        if (held & 0x40)
            FIELD(s32, state, 0x100) += 2;
        else if (held & 0x80)
            FIELD(s32, state, 0x100) -= 2;
    } else {
        if (repeat & 0x40) {
            if (--FIELD(s32, state, 0x108) < 0)
                FIELD(s32, state, 0x108) = 3;
        } else if (repeat & 0x80) {
            if (++FIELD(s32, state, 0x108) >= 4)
                FIELD(s32, state, 0x108) = 0;
        }

        if (repeat & 0x30) {
            s32 direction = (repeat & 0x10) ? 1 : -1;
            s32 menu = FIELD(s32, state, 0x108);
            s32 fileIndex = FIELD(s32, state, 0xd0);

            if (menu == 0) {
                fileIndex += direction;
                if (fileIndex >= 5) fileIndex = 0;
                if (fileIndex < 0) fileIndex = 4;
                FIELD(s32, state, 0xd0) = fileIndex;
                overlay011_reload_resources(state);
            } else if (menu == 1) {
                s32 *record = (s32 *)((u8 *)state + 0xe8) + fileIndex;
                s32 count = FIELD(s32, state, 0xd4 + fileIndex * 4);
                *record += direction;
                if (*record >= count) *record = 0;
                if (*record < 0) *record = count - 1;
                overlay011_reload_resources(state);
            } else if (menu == 2) {
                overlay011_toggle_sub_mode(state);
            } else if (menu == 3) {
                FIELD(s32, state, 0xcc) = 1 - FIELD(s32, state, 0xcc);
                overlay011_reload_resources(state);
            }
        }
    }

    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    DebugText_Printf(data_020f4e14, 1, 2, 6,
                     data_ov011_021fe404[FIELD(s32, state, 0xd0)]);
    i = FIELD(s32, state, 0xd0);
    DebugText_Printf(data_020f4e14, 1, 3, 3,
                     FIELD(u8 *, state, 0x84 + i * 4) +
                     FIELD(s32, state, 0xe8 + i * 4) * 0x20 + 0x0c);

    for (i = 0; i < 4; i++) {
        s32 y = i + 5;
        if (i == 0) {
            GraphicsSpriteRenderer_Printf(data_020f4e14, 1, y, data_ov011_021fe370[0],
                          FIELD(s32, state, 0xd0), 5);
        } else if (i == 1) {
            s32 fileIndex = FIELD(s32, state, 0xd0);
            GraphicsSpriteRenderer_Printf(data_020f4e14, 1, y, data_ov011_021fe370[1],
                          FIELD(s32, state, 0xe8 + fileIndex * 4),
                          FIELD(s32, state, 0xd4 + fileIndex * 4));
        } else if (i == 2) {
            GraphicsSpriteRenderer_Printf(data_020f4e14, 1, y, data_ov011_021fe370[2],
                          FIELD(s32, state, 0x104) ? data_ov011_021fe620
                                                  : data_ov011_021fe624);
        } else {
            GraphicsSpriteRenderer_Printf(data_020f4e14, 1, y, data_ov011_021fe370[3],
                          FIELD(s32, state, 0xcc) ? data_ov011_021fe628
                                                 : data_ov011_021fe62c);
        }
    }
    DebugText_Printf(data_020f4e14, 1, FIELD(s32, state, 0x108) + 5, 2,
                     data_ov011_021fe630);

    {
        u8 *meta2 = FIELD(u8 *, set->resource2, 0x20);
        u8 *meta1 = FIELD(u8 *, set->resource1, 0x20);
        GraphicsSpriteRenderer_Printf(data_020f4e14, 1, 10, data_ov011_021fe634,
                      FIELD(s32, meta2, 0x0c), FIELD(s32, meta2, 0x10),
                      FIELD(u16, meta1, 4), FIELD(u16, meta1, 6));
        GraphicsSpriteRenderer_Printf(data_020f4e14, 1, 12, data_ov011_021fe648,
                      FIELD(void *, set->resource0, 0x10),
                      GraphicsCharacterResource_GetUploadSize(set->resource0));
        GraphicsSpriteRenderer_Printf(data_020f4e14, 1, 13, data_ov011_021fe660,
                      FIELD(void *, set->resource1, 0x10),
                      GraphicsPaletteResource_GetUploadSize(set->resource1));
        GraphicsSpriteRenderer_Printf(data_020f4e14, 1, 14, data_ov011_021fe678,
                      FIELD(void *, set->resource2, 0x10),
                      func_ov011_021fdae0(set->resource2));
    }
    GraphicsSpriteRenderer_Printf(data_020f4e14, 1, 0x12, data_ov011_021fe690,
                  FIELD(s32, state, 0xfc), FIELD(s32, state, 0x100));
    GraphicsSpriteRenderer_Printf(data_020f4e14, 1, 0x13, data_ov011_021fe6a0,
                  FIELD(s32, state, 0x58), FIELD(s32, state, 0x5c));
    GraphicsSpriteRenderer_Printf(data_020f4e14, 1, 0x15, data_ov011_021fe6b0);

    if ((FIELD(s32, state, 0x44) << 27) < 0) {
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        GraphicsSpriteCanvas_DrawLine(gDebugFont, 0, 0, 0xff,
                                      FIELD(s32, state, 0x5c), 2);
        GraphicsSpriteCanvas_DrawLine(gDebugFont, 0, 0,
                                      FIELD(s32, state, 0x58), 0xbf, 2);
    }
    if (pressed & 2)
        Overlay011_InitSceneFields((u8 *)state + 0x24,
                            data_ov011_021fe3b0[0],
                            data_ov011_021fe3b0[1] - 0x48, 0);
    return 0;
}
