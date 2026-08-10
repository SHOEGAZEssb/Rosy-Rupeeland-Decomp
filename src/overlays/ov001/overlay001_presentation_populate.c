#include "tingle/types.h"

/*
 * Overlay 1 presentation population. This recovered helper binds a gameplay
 * record, draws its two text rows, and creates one or two configured resources.
 */

typedef struct Overlay001PresentationPopulateState {
    void *renderer_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    void *textSource_20;
    void *textSource_24;
    void *textSource_28;
    u8 field_2c[0x18];
    void *presentation_44;
} Overlay001PresentationPopulateState;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gSystemState[];
extern void *data_020f4e18;
extern const u16 *func_020628c8(void *record);
extern void func_02062918(void *record, s32 index);
extern void *func_02062928(void *record);
extern const u16 *func_02062a60(void *record);
extern s32 func_02062ab0(void *record);
extern u32 func_02063064(void);
extern u32 func_02063074(void);
extern u32 func_02063084(void);
extern u32 func_02063190(void);
extern void func_02071ee0(void *resource, void *manager, u32 first,
                          u32 second, u32 third);
extern void *func_02073ffc(void *owner, void *resource, s32 mode);
extern void func_02073e48(void *resource, s32 value, s32 x, s32 y,
                          s32 enabled, s32 field28, s32 flags);
extern void func_02075598(void *renderer, const void *source);
extern void func_02076148(void *renderer, const u16 *text, s32 x, s32 y,
                          s32 mode, s32 advance, s32 spacing);
extern void GraphicsSpriteCanvas_FillRect(void *renderer, s32 left, s32 top, s32 right,
                          s32 bottom, s32 value);
extern void func_02092e9c(void *presentation, void *record, s32 mode);
extern void func_02093360(void *presentation, s32 value);
extern void func_020939d8(void *presentation);
extern void func_ov001_021fb81c(void *state, s32 startAnimation);
#ifdef __cplusplus
}
#endif

/*
 * Close with animation when record is null. Otherwise reset without animation,
 * bind func_02062928(record) to presentation_44, activate it, and draw two
 * record-derived text rows. The first row spans (0x70,0x4C)-(0xE0,0x58 or
 * 0x56); the second spans (0x5C,0x38)-(0xCC,0x48). Create a kind-1 resource at
 * (0x5C,0x48). When createDetail is nonzero, derive a property triplet from
 * record component zero, initialize resource_14, and create a kind-2 resource
 * at (0x48,0x48). Rendering/resource effects occur through engine callees.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fb87c(Overlay001PresentationPopulateState *state,
                         void *record, s32 createDetail)
{
    void *resource;
    u32 first;
    u32 second;
    u32 third;
    s32 bottom;

    if (record == 0) {
        func_ov001_021fb81c(state, 1);
        return;
    }

    func_ov001_021fb81c(state, 0);
    func_02092e9c(state->presentation_44, func_02062928(record), 1);
    func_020939d8(state->presentation_44);
    func_02093360(state->presentation_44, 0);

    bottom = 0x58;
    if (gSystemState[0x5f] != 0) {
        bottom -= 2;
    }
    func_02075598(state->renderer_00, state->textSource_24);
    GraphicsSpriteCanvas_FillRect(state->renderer_00, 0x70, 0x4c, 0xe0, bottom, 0);
    func_02076148(state->renderer_00, func_02062a60(record),
                  0x70, 0x4c, 0xe, 6, 0);

    resource = func_02073ffc(state->spriteOwner_04, state->resource_08, 1);
    func_02073e48(resource, func_02062ab0(record), 0x5c, 0x48, 1, 0, 0);

    func_02075598(state->renderer_00, state->textSource_28);
    GraphicsSpriteCanvas_FillRect(state->renderer_00, 0x5c, 0x38, 0xcc, 0x48, 0);
    func_02076148(state->renderer_00, func_020628c8(record),
                  0x5c, 0x38, 0xe, 6, 0);

    if (createDetail != 0) {
        func_02062918(record, 0);
        first = func_02063064();
        func_02062918(record, 0);
        second = func_02063074();
        func_02062918(record, 0);
        third = func_02063084();
        func_02071ee0(state->resource_14, data_020f4e18,
                      first, second, third);
        resource = func_02073ffc(state->spriteOwner_04, state->resource_14, 2);
        func_02062918(record, 0);
        func_02073e48(resource, func_02063190(), 0x48, 0x48, 1, 0, 0);
    }
}
