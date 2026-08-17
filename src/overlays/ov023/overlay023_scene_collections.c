#include "tingle/types.h"

/* Overlay 23 global-record grouping and paired navigation-effect configuration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *data_021f5128;
extern const u8 data_ov023_021ffc00[];
extern const u8 data_ov023_021ffc08[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern s32 func_0207b464(void *);
extern s32 func_0207b490(void *);
extern s32 func_0207b4bc(void *);
extern s32 GraphicsSpriteState_TestTouchPoint(void *, void *);
extern void IndexedSelectionController_ConfigureRange(void *, s32, s32, s32);
extern void SpritePresentation_SetAnimation(void *, s32);
extern void SpritePresentation_Show(void *);
extern void SpritePresentation_Hide(void *);
extern void *func_ov023_021fce44(void *, void *, s32);
extern void *func_ov023_021fd024(void *, void *);
extern void func_ov023_021fd104(void *);
extern void *func_ov023_021fd444(void *, void *, s32);
extern void *func_ov023_021fd634(void *, void *);
extern void func_ov023_021fe5f8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Builds the scene's record model from the global table referenced by
 * data_021F5128. It allocates main 0x40-byte collection +0x390 for all +0xCC8
 * records, initializes each row descriptor from its bank, counts distinct bank
 * IDs into +0x3A0/+0x3E8, allocates one 0x50-byte pointer collection per bank
 * at +0x430, distributes records, configures selector +0x480, assigns effect
 * animations, and primes visible main rows. Heap/resource/UI state changes.
 */
extern "C" void func_ov023_021fe39c(void *scene)
{
    u8 *global = (u8 *)data_021f5128;
    s32 record_count = FIELD(s32, global, 0xcc8);
    void *main_collection = Heap_Alloc(0x40, data_ov023_021ffc00,
                                       4, gHeapContext);
    if (main_collection)
        main_collection = func_ov023_021fce44(
            main_collection, data_020f4e14, record_count);
    FIELD(void *, scene, 0x390) = main_collection;
    FIELD(s32, scene, 0x398) = 0;

    for (s32 i = 0; i < record_count; ++i) {
        void *record = global + 0x48 + i * 0x10;
        u8 *entry = (u8 *)func_ov023_021fd024(main_collection, record);
        u32 bank_id = FIELD(u32, FIELD(void *, record, 4), 0xc) & 0xff;
        void *bank = ((void **)global)[bank_id];
        s32 a = func_0207b464((u8 *)bank + 0x668);
        s32 b = func_0207b490((u8 *)bank + 0x668);
        s32 c = func_0207b4bc((u8 *)bank + 0x668);
        func_02071ee0(entry + 4, data_020f4e18, a, b, c);
        FIELD(u16, entry, 0x14) = 0;
        FIELD(u16, entry, 0x16) = (u16)(i * 26);

        s32 group;
        for (group = 0; group < FIELD(s32, scene, 0x398); ++group) {
            if (FIELD(u32, scene, 0x3a0 + group * 4) == bank_id) {
                ++FIELD(s32, scene, 0x3e8 + group * 4);
                break;
            }
        }
        if (group == FIELD(s32, scene, 0x398)) {
            FIELD(u32, scene, 0x3a0 + group * 4) = bank_id;
            FIELD(s32, scene, 0x3e8 + group * 4) = 1;
            ++FIELD(s32, scene, 0x398);
        }
    }

    for (s32 i = 0; i < FIELD(s32, scene, 0x398); ++i) {
        void *collection = Heap_Alloc(0x50, data_ov023_021ffc08,
                                      4, gHeapContext);
        if (collection)
            collection = func_ov023_021fd444(
                collection, data_020f4e14,
                FIELD(s32, scene, 0x3e8 + i * 4));
        FIELD(void *, scene, 0x430 + i * 4) = collection;
    }
    for (s32 i = 0; i < record_count; ++i) {
        void *record = global + 0x48 + i * 0x10;
        u32 bank_id = FIELD(u32, FIELD(void *, record, 4), 0xc) & 0xff;
        for (s32 group = 0; group < FIELD(s32, scene, 0x398); ++group) {
            if (FIELD(u32, scene, 0x3a0 + group * 4) == bank_id) {
                func_ov023_021fd634(FIELD(void *, scene, 0x430 + group * 4),
                                    record);
                break;
            }
        }
    }
    IndexedSelectionController_ConfigureRange((u8 *)scene + 0x480, 0,
                  FIELD(s32, scene, 0x398) - 1, 0);
    func_ov023_021fe5f8(scene);
    func_ov023_021fd104(main_collection);
}

/*
 * Chooses paired effect animations from the number of distinct record groups:
 * with multiple groups +0x380/+0x384 use 8/10, otherwise 9/11. Only effect
 * animation state changes; no value is returned.
 */
extern "C" void func_ov023_021fe5f8(void *scene)
{
    if (FIELD(s32, scene, 0x398) > 1) {
        SpritePresentation_SetAnimation(FIELD(void *, scene, 0x380), 8);
        SpritePresentation_SetAnimation(FIELD(void *, scene, 0x384), 10);
    } else {
        SpritePresentation_SetAnimation(FIELD(void *, scene, 0x380), 9);
        SpritePresentation_SetAnimation(FIELD(void *, scene, 0x384), 11);
    }
}

/*
 * Enables or disables both navigation effects. A true request enables both
 * only when multiple groups exist; otherwise (and for false) both receive the
 * disabled/reset operation. Effect visibility/state changes; returns void.
 */
extern "C" void func_ov023_021fe640(void *scene, s32 enabled)
{
    void *left = FIELD(void *, scene, 0x380);
    void *right = FIELD(void *, scene, 0x384);
    if (enabled && FIELD(s32, scene, 0x398) > 1) {
        SpritePresentation_Show(left);
        SpritePresentation_Show(right);
    } else {
        SpritePresentation_Hide(left);
        SpritePresentation_Hide(right);
    }
}

/*
 * Hit-tests the left navigation effect against scene input +0x30 when more
 * than one group exists. Returns the SDK hit result, or zero for one group.
 */
extern "C" s32 func_ov023_021fe694(void *scene)
{
    if (FIELD(s32, scene, 0x398) <= 1) return 0;
    return GraphicsSpriteState_TestTouchPoint(FIELD(void *, FIELD(void *, scene, 0x380), 0x9c),
                         (u8 *)scene + 0x30);
}

/*
 * Hit-tests the right navigation effect against scene input +0x30 when more
 * than one group exists. Returns the SDK hit result, or zero for one group.
 */
extern "C" s32 func_ov023_021fe6bc(void *scene)
{
    if (FIELD(s32, scene, 0x398) <= 1) return 0;
    return GraphicsSpriteState_TestTouchPoint(FIELD(void *, FIELD(void *, scene, 0x384), 0x9c),
                         (u8 *)scene + 0x30);
}
