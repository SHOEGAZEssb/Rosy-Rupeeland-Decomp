#include "tingle/types.h"

/*
 * Overlay 4 variant resource loading. This recovered helper selects and
 * uploads two graphics-resource triplets and configures variant-specific sound.
 */

typedef struct Overlay004GraphicsResourceSet {
    void *first;
    void *second;
    void *third;
} Overlay004GraphicsResourceSet;

typedef struct Overlay004VariantResourceState {
    u8 field_000[0x150];
    s32 variant_150;
    s32 soundId_154;
    s32 soundParameter_158;
} Overlay004VariantResourceState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void *gSoundContext;
extern void GraphicsResourceSet_Init(Overlay004GraphicsResourceSet *set);
extern void GraphicsResourceSet_Load(Overlay004GraphicsResourceSet *set,
                                     void *manager, s32 first, s32 second,
                                     s32 third);
extern void GraphicsResourceSet_Destroy(Overlay004GraphicsResourceSet *set);
extern void *func_02070fd4(void *resource);
extern void func_020b44e8(void *resourceData);
extern void func_02070638(void *resource, s32 layer, s32 value);
extern void func_02070b50(void *resource, s32 offset);
extern void func_02070e0c(void *resource, s32 layer, s32 value);
extern void func_020706c4(void *resource, s32 layer, s32 value);
extern void func_02070bc4(void *resource, s32 offset);
extern void func_02070eac(void *resource, s32 layer, s32 value);
extern void GraphicsResourceSet_ReleaseHandles(Overlay004GraphicsResourceSet *set);
extern void Sound_LoadGroup(void *context, s32 soundId);
#ifdef __cplusplus
}
#endif

static void overlay004_upload_resource_set(Overlay004GraphicsResourceSet *set,
                                            s32 layer, s32 offset)
{
    func_020b44e8(func_02070fd4(set->third));
    func_02070638(set->first, layer, 0);
    func_02070b50(set->second, offset);
    func_02070e0c(set->third, layer, 0);
    func_020706c4(set->first, layer, 0);
    func_02070bc4(set->second, offset);
    func_02070eac(set->third, layer, 0);
}

/*
 * Initialize a temporary resource set. The first triplet is 0xA0E5..0xA0FF
 * for variants 1..9 in consecutive groups of three, otherwise 0xA100..0xA102;
 * upload it to layer 2 at offset 0x4000. The second triplet maps variant pairs
 * 1/2, 3/4, 5/6, and 7/8 to 0xA0D6..0xA0E1, with the remaining variants using
 * 0xA0E2..0xA0E4; upload it to layer 3 at 0x6000 and finalize the set.
 *
 * Store sound IDs/parameters as follows: variants 0..2 use (0xF6,0x7B00),
 * variants 3..10 use IDs 0x217..0x21E and parameters 0x6580, 0x6600, 0x6680,
 * 0x6700, 0x6780, 0x6800, 0x6880, 0x6900. Start the selected sound, destroy
 * the temporary set, and return no value. Graphics upload/cache and sound
 * effects occur through callees; the meaning of soundParameter_158 is inferred.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov004_021fba28(Overlay004VariantResourceState *state)
{
    Overlay004GraphicsResourceSet set;
    s32 finalId;
    s32 variant = state->variant_150;

    GraphicsResourceSet_Init(&set);
    if (variant >= 1 && variant <= 9) {
        finalId = 0xa0e7 + (variant - 1) * 3;
    } else {
        finalId = 0xa102;
    }
    GraphicsResourceSet_Load(&set, data_020f4e18, finalId - 2,
                             finalId - 1, finalId);
    overlay004_upload_resource_set(&set, 2, 0x4000);

    if (variant == 1 || variant == 2) {
        finalId = 0xa0d8;
    } else if (variant == 3 || variant == 4) {
        finalId = 0xa0e1;
    } else if (variant == 5 || variant == 6) {
        finalId = 0xa0db;
    } else if (variant == 7 || variant == 8) {
        finalId = 0xa0de;
    } else {
        finalId = 0xa0e4;
    }
    GraphicsResourceSet_Load(&set, data_020f4e18, finalId - 2,
                             finalId - 1, finalId);
    overlay004_upload_resource_set(&set, 3, 0x6000);
    GraphicsResourceSet_ReleaseHandles(&set);

    switch (variant) {
    case 3: state->soundId_154 = 0x217; state->soundParameter_158 = 0x6580; break;
    case 4: state->soundId_154 = 0x218; state->soundParameter_158 = 0x6600; break;
    case 5: state->soundId_154 = 0x219; state->soundParameter_158 = 0x6680; break;
    case 6: state->soundId_154 = 0x21a; state->soundParameter_158 = 0x6700; break;
    case 7: state->soundId_154 = 0x21b; state->soundParameter_158 = 0x6780; break;
    case 8: state->soundId_154 = 0x21c; state->soundParameter_158 = 0x6800; break;
    case 9: state->soundId_154 = 0x21d; state->soundParameter_158 = 0x6880; break;
    case 10: state->soundId_154 = 0x21e; state->soundParameter_158 = 0x6900; break;
    default: state->soundId_154 = 0xf6; state->soundParameter_158 = 0x7b00; break;
    }
    Sound_LoadGroup(gSoundContext, state->soundId_154);
    GraphicsResourceSet_Destroy(&set);
}
