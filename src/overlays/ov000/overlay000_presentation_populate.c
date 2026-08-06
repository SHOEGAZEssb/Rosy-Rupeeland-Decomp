#include "tingle/types.h"

/*
 * Overlay 0 presentation population. This recovered routine binds a selected
 * gameplay record to the presentation object, draws several localized text
 * rows, creates two configured sprites, and loads a record-specific resource
 * triplet. Several record accessors remain address-named pending type evidence.
 */

typedef struct Overlay000PresentationState {
    void *renderer_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    void *textSource_20;
    void *textSource_24;
    void *textSource_28;
    u8 rendererState_2c[0x18];
    void *presentation_44;
    u16 label_48[0x10];
} Overlay000PresentationState;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gSystemState[];
extern void *data_020f4e18;
extern u8 data_021f3ecc[];
extern const u8 data_020d780c[];
extern const u16 *func_020628c8(void *record);
extern void func_02062918(void *record, s32 index);
extern void *func_02062928(void *record);
extern s32 func_02062ae4(void *record);
extern u8 *func_02062e00(void *record);
extern u32 func_02063064(void);
extern u32 func_02063074(void);
extern u32 func_02063084(void);
extern u32 func_02063190(void);
extern void *func_02073ffc(void *owner, void *resource, s32 mode);
extern void func_02073e48(void *sprite, s32 animation, s32 x, s32 y,
                          s32 enabled, s32 field28, s32 flags);
extern void func_02075598(void *renderer, const void *source);
extern s32 func_02076148(void *renderer, const u16 *text, s32 x, s32 y,
                         s32 mode, s32 advance, s32 spacing);
extern void func_02076428(void *renderer, s32 x, s32 y, s32 width,
                          s32 height, s32 mode);
extern u8 *func_02079f3c(void *table, u16 resourceId);
extern void func_02092e9c(void *presentation, void *record, s32 mode);
extern void func_02093360(void *presentation, s32 value);
extern void func_020939d8(void *presentation);
extern void func_02071ee0(void *resource, void *manager, u32 first,
                          u32 second, u32 third);
extern void func_ov000_021fb890(void *state, s32 startAnimation);
#ifdef __cplusplus
}
#endif

/*
 * Populate state from record, or close it with animation when record is null.
 * A non-null record is attached to presentation_44, then localized headings,
 * the cached label, and record text are drawn into renderer_00. The special
 * record class identified by byte 2 equal to 3 uses resource 0x1B8 and a
 * shorter label path; other records use 0x1B7 plus a table-selected row.
 * Finally four record resources configure resource_14 and a second sprite.
 * Returns nothing. Heap ownership is unchanged, while renderer, sprite, and
 * resource state are mutated through engine helpers with no direct hardware
 * access in this wrapper.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fb8f0(Overlay000PresentationState *state, void *record)
{
    const u16 *text;
    void *sprite;
    u32 resource0;
    u32 resource1;
    u32 resource2;
    u32 resource3;
    s32 firstHeight;
    s32 textOffset;

    if (record == 0) {
        func_ov000_021fb890(state, 1);
        return;
    }

    func_ov000_021fb890(state, 0);
    func_02092e9c(state->presentation_44, func_02062928(record), 1);
    func_020939d8(state->presentation_44);
    func_02093360(state->presentation_44, 0);

    firstHeight = 0x54;
    textOffset = 0;
    if (gSystemState[0x5f] != 0) {
        firstHeight -= 2;
        textOffset = 4;
    }

    if (func_02062e00(record)[2] == 3) {
        func_02075598(state->renderer_00, state->textSource_24);
        func_02076428(state->renderer_00, 0x70, 0x48, 0xc0,
                      firstHeight, 0);
        text = (const u16 *)(func_02079f3c(data_021f3ecc, 0x1b8) + 2);
        func_02076148(state->renderer_00, text, 0x70, 0x48, 0xe, 4, 0);

        func_02075598(state->renderer_00, state->textSource_20);
        func_02076428(state->renderer_00, 0x38, 0x8a, 0xd8, 0x9a, 0);
        func_02076148(state->renderer_00, state->label_48,
                      0x38, 0x8a, 5, 4, 0);
    } else {
        func_02075598(state->renderer_00, state->textSource_24);
        func_02076428(state->renderer_00, 0x70, 0x48, 0xc0,
                      firstHeight, 0);
        text = (const u16 *)(func_02079f3c(data_021f3ecc, 0x1b7) + 2);
        func_02076148(state->renderer_00, text, 0x70, 0x48, 0xe, 4, 0);

        func_02075598(state->renderer_00, state->textSource_20);
        func_02076428(state->renderer_00, 0x38, 0x8a, 0xd8, 0x9a, 0);
        textOffset += func_02076148(state->renderer_00, state->label_48,
                                   0x38, 0x8a, 0xe, 4, 0);
        text = (const u16 *)(func_02079f3c(
            data_021f3ecc,
            *(const u16 *)(data_020d780c + func_02062ae4(record) * 0x34)) +
            2);
        func_02076148(state->renderer_00, text, textOffset + 0x38,
                      0x8a, 0xe, 4, 0);
    }

    sprite = func_02073ffc(state->spriteOwner_04, state->resource_08, 1);
    func_02073e48(sprite, 1, 0x5c, 0x44, 1, 0, 0);

    func_02075598(state->renderer_00, state->textSource_28);
    func_02076428(state->renderer_00, 0x5c, 0x34, 0xe8, 0x44, 0);
    func_02076148(state->renderer_00, func_020628c8(record),
                  0x5c, 0x34, 0xe, 6, 0);

    func_02062918(record, 0);
    resource0 = func_02063064();
    func_02062918(record, 0);
    resource1 = func_02063074();
    func_02062918(record, 0);
    resource2 = func_02063084();
    func_02071ee0(state->resource_14, data_020f4e18,
                  resource0, resource1, resource2);
    sprite = func_02073ffc(state->spriteOwner_04, state->resource_14, 2);
    func_02062918(record, 0);
    resource3 = func_02063190();
    func_02073e48(sprite, resource3, 0x48, 0x44, 1, 0, 0);
}
