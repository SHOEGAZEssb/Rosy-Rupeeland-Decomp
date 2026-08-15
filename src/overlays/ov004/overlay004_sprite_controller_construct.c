#include "tingle/types.h"

/*
 * Overlay 4 sprite/controller construction. This recovered helper builds the
 * fixed label sprites, a decimal value row, and its controller-side companion.
 */

typedef struct Overlay004SpriteControllerState {
    u8 field_000[0x54];
    u8 resource_054[0x0c];
    void *primaryContext_060;
    void *fontContext_064;
    void *child_068;
    u8 controller_06c[0xe0];
    s32 value_14c;
    s32 variant_150;
} Overlay004SpriteControllerState;

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_ov004_021fcdd0[];
extern const char data_ov004_021fcdd8[];
extern void *gHeapContext;
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *context, void *resource, s32 kind);
extern void func_02073e48(void *sprite, s32 value, s32 x, s32 y, s32 mode,
                          s32 scale, s32 extra);
extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment,
                        void *context);
extern void SpritePresentation_Init(void *child, void *sprite);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void SpritePresentation_SyncPosition(void *child);
extern void SpritePresentation_Hide(void *child);
extern s32 func_020b35b0(char *output, const char *format, s32 value);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *context);
#ifdef __cplusplus
}
#endif

static void *overlay004_create_sprite(void *context, void *resource, s32 value,
                                      s32 x, s32 y)
{
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(context, resource, 1);
    func_02073e48(sprite, value, x, y, 0, 0, 0);
    return sprite;
}

/*
 * Create a font-context sprite using value 0x18, allocate a 0xA0-byte child
 * object with data_ov004_021fcdd0, bind the sprite when allocation succeeds,
 * position it at fixed-point (0x78000,-0x20000,0), and run its two setup calls.
 * Create primary-context labels 0x17 and the two decimal digits of variant_150.
 * Format value_14c using data_ov004_021fcdd8, center the resulting row around
 * X=0xAA, emit its digits at 16-pixel spacing, insert glyph 0x0A four places
 * from the end, and add the confirmed special 0x19/0 pair when value_14c < 10.
 * Add leading/trailing glyphs 0x0B/0x0C, finalize primaryContext_060, and set
 * controller_06c to (0,0xC0,0). Returns no value. Heap, sprite, renderer, and
 * controller effects occur through callees; the displayed punctuation meaning
 * of glyphs 0x0A and 0x19 is inferred from layout rather than named as fact.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov004_021fbf40(Overlay004SpriteControllerState *state)
{
    char text[32];
    void *sprite;
    void *child;
    s32 length;
    s32 width;
    s32 x;
    s32 i;

    sprite = overlay004_create_sprite(state->fontContext_064,
                                      state->resource_054, 0x18, 0, 0);
    child = Heap_Alloc(0xa0, data_ov004_021fcdd0, 4, gHeapContext);
    if (child != 0) {
        SpritePresentation_Init(child, sprite);
    }
    state->child_068 = child;
    Presentation_SetPosition(child, 0x78000, -0x20000, 0);
    SpritePresentation_SyncPosition(child);
    SpritePresentation_Hide(child);

    overlay004_create_sprite(state->primaryContext_060, state->resource_054,
                             0x17, 0x67, 0x41);
    overlay004_create_sprite(state->primaryContext_060, state->resource_054,
                             state->variant_150 / 10 + 0x0d, 0xab, 0x42);
    overlay004_create_sprite(state->primaryContext_060, state->resource_054,
                             state->variant_150 % 10 + 0x0d, 0xc3, 0x42);

    length = func_020b35b0(text, data_ov004_021fcdd8, state->value_14c);
    width = length * 16 + 0x64;
    if (length >= 4) {
        width += 8;
    }
    if (state->value_14c < 10) {
        width += 16;
    }
    x = 0xaa - width / 2;
    overlay004_create_sprite(state->primaryContext_060, state->resource_054,
                             0x0b, x, 0x62);
    x += 0x32;
    for (i = 0; i < length; i++) {
        overlay004_create_sprite(state->primaryContext_060,
                                 state->resource_054, text[i] - '0', x, 0x61);
        if (length - i != 4) {
            x += 0x10;
        } else {
            overlay004_create_sprite(state->primaryContext_060,
                                     state->resource_054, 0x0a, x + 0x0c,
                                     0x61);
            x += 0x18;
        }
    }
    if (state->value_14c < 10) {
        overlay004_create_sprite(state->primaryContext_060,
                                 state->resource_054, 0x19, x - 4, 0x61);
        overlay004_create_sprite(state->primaryContext_060,
                                 state->resource_054, 0, x + 8, 0x61);
        x += 0x18;
    }
    overlay004_create_sprite(state->primaryContext_060, state->resource_054,
                             0x0c, x, 0x61);
    GraphicsSpriteGroup_ReleaseIndexedEntries(state->primaryContext_060);
    Presentation_SetPosition(state->controller_06c, 0, 0xc0, 0);
}
