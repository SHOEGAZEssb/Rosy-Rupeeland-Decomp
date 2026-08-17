#include "tingle/types.h"

/*
 * Overlay 5 graphics setup. This recovered routine configures sub-display
 * background/blend hardware and loads two temporary graphics-resource sets.
 */

typedef struct Overlay005GraphicsResourceSet {
    void *first;
    void *second;
    void *third;
} Overlay005GraphicsResourceSet;

typedef struct Overlay005GraphicsState {
    u8 field_000[0x4c];
    s32 field_04c;
    u8 field_050[0x18];
    s32 primaryIndex_068;
    s32 secondaryIndex_06c;
    u8 field_070[0x14];
    u16 field_084;
} Overlay005GraphicsState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void func_020925dc(s32 value);
extern void func_02092618(void);
extern void func_02092688(s32 first, s32 second, s32 third, s32 fourth);
extern void func_020afce8(volatile void *registers, s32 first, s32 second);
extern void GraphicsResourceSet_Init(Overlay005GraphicsResourceSet *set);
extern void GraphicsResourceSet_Load(Overlay005GraphicsResourceSet *set,
                                     void *manager, s32 first, s32 second,
                                     s32 third);
extern void func_020b44e8(void);
extern void GraphicsResourceSet_Apply(Overlay005GraphicsResourceSet *set,
                                      s32 first, s32 second);
extern void func_02070f34(void *resource, s32 value);
extern void func_020706c4(void *resource, s32 first, s32 second);
extern void func_02070bc4(void *resource, s32 value);
extern void func_02070eac(void *resource, s32 first, s32 second);
extern u16 *GraphicsBgResourceData_GetDecoded(void *resource);
extern void TitlePalette_SetSubBackdrop(void);
extern void GraphicsResourceSet_Destroy(Overlay005GraphicsResourceSet *set);
#ifdef __cplusplus
}
#endif

/* Select the confirmed first/third IDs; every triplet uses 0xB087 second. */
static void overlay005_select_resource_ids(const Overlay005GraphicsState *state,
                                            s32 *first, s32 *third)
{
    if (state->primaryIndex_068 >= 1 && state->primaryIndex_068 <= 4) {
        if (state->secondaryIndex_06c == 1) {
            *first = 0xb086; *third = 0xb088;
        } else if (state->secondaryIndex_06c == 2) {
            *first = 0xb089; *third = 0xb08a;
        } else if (state->secondaryIndex_06c == 3) {
            *first = 0xb08b; *third = 0xb08c;
        } else {
            *first = 0xb08d; *third = 0xb08e;
        }
    } else if (state->primaryIndex_068 >= 5 &&
               state->primaryIndex_068 <= 7) {
        if (state->secondaryIndex_06c == 5) {
            *first = 0xb091; *third = 0xb092;
        } else if (state->secondaryIndex_06c == 6) {
            *first = 0xb093; *third = 0xb094;
        } else {
            *first = 0xb095; *third = 0xb096;
        }
    } else {
        if (state->secondaryIndex_06c == 8) {
            *first = 0xb099; *third = 0xb09a;
        } else if (state->secondaryIndex_06c == 9) {
            *first = 0xb09b; *third = 0xb09c;
        } else {
            *first = 0xb09d; *third = 0xb09e;
        }
    }
}

/*
 * Set +0x4C to 0x19 and call func_020925dc(0). Configure sub-engine BG0CNT
 * 0x04001008 and BG3CNT 0x0400100E with the confirmed masks/values, invoke
 * func_02092618 and func_02092688(2,2,2,3), select sub DISPCNT mode bit 15
 * while clearing bits 13..15 first, set sub BLDCNT through
 * func_020afce8(0x04001050,0x19,0), and set both six-bit fields of register
 * 0x0400104A to 0x39 and 0x19.
 *
 * Initialize a temporary resource set and select a triplet from +0x68/+0x6C:
 * primary groups 1..4, 5..7, and all others use the documented 0xB0xx ID
 * branches, always with middle ID 0xB087. Load, synchronize, and apply that
 * set with arguments 0/0. Then load fixed IDs 0xC00C..0xC00E; configure the
 * third resource with 0x0F, synchronize, configure first as 3/0, second as
 * 0x1E0, and third as 3/0. Cache the first halfword returned for the second
 * resource at +0x84, call TitlePalette_SetSubBackdrop, destroy the temporary set, and return
 * no value. All MMIO and resource IDs are confirmed; SDK helper semantics are
 * described only to the level visible here.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov005_021fc278(Overlay005GraphicsState *state)
{
    Overlay005GraphicsResourceSet set;
    s32 first;
    s32 third;
    volatile u16 *bg0cnt = (volatile u16 *)0x04001008;
    volatile u16 *bg3cnt = (volatile u16 *)0x0400100e;
    volatile u16 *field104a = (volatile u16 *)0x0400104a;
    volatile u32 *subDispcnt = (volatile u32 *)0x04001000;

    state->field_04c = 0x19;
    func_020925dc(0);
    *bg0cnt = (*bg0cnt & 0x43) | 0x08 | 0xe000;
    *bg3cnt = (*bg3cnt & 0x43) | 0x04 | 0x0400;
    func_02092618();
    func_02092688(2, 2, 2, 3);
    *subDispcnt = (*subDispcnt & ~0xe000) | 0x8000;
    func_020afce8((volatile void *)0x04001050, 0x19, 0);
    *field104a = (*field104a & ~0x3f00) | 0x3900;
    *field104a = (*field104a & ~0x003f) | 0x0019;

    GraphicsResourceSet_Init(&set);
    overlay005_select_resource_ids(state, &first, &third);
    GraphicsResourceSet_Load(&set, data_020f4e18, first, 0xb087, third);
    func_020b44e8();
    GraphicsResourceSet_Apply(&set, 0, 0);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xc00c, 0xc00d, 0xc00e);
    func_02070f34(set.third, 0x0f);
    func_020b44e8();
    func_020706c4(set.first, 3, 0);
    func_02070bc4(set.second, 0x1e0);
    func_02070eac(set.third, 3, 0);
    state->field_084 = *GraphicsBgResourceData_GetDecoded(set.second);
    TitlePalette_SetSubBackdrop();
    GraphicsResourceSet_Destroy(&set);
}
