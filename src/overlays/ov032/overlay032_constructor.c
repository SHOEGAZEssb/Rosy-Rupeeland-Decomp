#include "tingle/types.h"
#include "tingle/display_controller.h"

/* Overlay 32 large composite gameplay/UI object construction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern void *gGameWork;
extern void *gDebugFont;
extern void *data_020f4e18[];
extern void *data_020f4e14[];
extern DisplayBrightnessPair gDisplayBrightnessPair;
extern const u8 data_ov032_02202340[];
extern const u8 data_ov032_02202220[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071ea4(void *);
extern void func_ov032_0220142c(void *);
extern void func_ov032_021fce00(void *);
extern void __construct_array(void *, s32, s32, void *, void *);
extern void GraphicsResourceSet_Init(void *);
extern void func_ov032_021fd7a4(void *);
extern void func_02092364(void *);
extern void func_ov032_021fd7c0(void *);
extern void func_ov032_021fd7e0(void *);
extern s32 func_020adc90(s32, s32);
extern void func_0205974c(void *, s32);
extern void func_02058eb8(void *, s32, s32, s32, s32);
extern void *func_02027f94(void);
extern s32 func_02027854(void *);
extern u32 genrand_int32(void);
extern void *func_02071980(void *, s32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void *func_02092cc0(void *, void *, void *);
extern void func_ov032_021fce08(void *, s32, s32, s32, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void func_ov032_02200f88(void *, void *, s32, void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_ov032_02201450(void *, void *, void *);
extern void func_ov032_022014c0(void *, s32, s32, s32, s32, s32, s32, s32, s32);
extern void GameWork_ClearFlag(void *, s32);
#ifdef __cplusplus
}
#endif

typedef struct Overlay032ControllerSpec {
    u16 offset;
    u16 rendererOffset;
    u16 resourceOffset;
    s16 first;
    s16 second;
    s16 x;
    s16 y;
    s16 type;
    s16 flags;
    s16 parameter;
    s16 extra;
} Overlay032ControllerSpec;

/* Constructs and configures one recovered 0x30-byte controller. */
static void setup_controller(void *object, const Overlay032ControllerSpec *spec)
{
    void *controller = (u8 *)object + spec->offset;
    func_ov032_02201450(controller,
        FIELD(void *, object, spec->rendererOffset),
        (u8 *)object + spec->resourceOffset);
    func_ov032_022014c0(controller, spec->first, spec->second,
        spec->x, spec->y, spec->type, spec->flags, spec->parameter, spec->extra);
}

/*
 * Constructs the large overlay-32 gameplay/UI aggregate in `object`. Confirmed
 * layout includes six resource sets +0x1C..+0x58; fifteen 0x30-byte controllers
 * +0x64..+0x304; forty more controllers +0x334; three late controllers +0xAB4/
 * +0xAE4/+0xB14; resource sets +0xB44/+0xF18; helper objects +0xB54/+0xBE8;
 * five 0x6C-byte children +0xC44; another controller +0xEDC; dialog +0x10; and
 * renderers +0/+4. It seeds audio, random, transition, archive, map/counter, and
 * GameWork-derived fields; loads six resource triples; initializes all eighteen
 * configured controllers at their recovered coordinates/indices; clears runtime
 * counters and GameWork flag 0x3FB; and copies initial position words from table
 * 0x02202220 to +0xB6C/+0xB70. Returns `object`. Heap, audio, PRNG, transition,
 * archive, dialog, renderer, resource, sprite/controller, and persistent flag
 * state change; no direct MMIO occurs. Offset names remain address-derived where
 * the child classes' semantic roles are not yet confirmed.
 */
extern "C" void *func_ov032_021fce20(void *object)
{
    static const u16 resourceOffsets[6] = { 0x1c, 0x28, 0x34, 0x40, 0x4c, 0x58 };
    static const s32 resourceIds[6][3] = {
        { 0x14ef, 0x14f0, 0x14f1 }, { 0x5b, 8, 0x5c },
        { 0x26, 0x27, 0x28 }, { 0x136f, 0x1370, 0x1371 },
        { 0x21e3, 0x21e4, 0x21e5 }, { 0x3345, 0x3346, 0x3347 }
    };
    static const Overlay032ControllerSpec specs[18] = {
        {0x064,4,0x1c, 0,0,128, 76,3, 0,0, 0},
        {0x094,4,0x1c, 1,1,148, 76,3, 0,0, 0},
        {0x0c4,4,0x1c, 2,2,136,103,3, 0,0, 0},
        {0x0f4,0,0x28, 2,3,128, 88,2, 0,4, 0},
        {0x124,0,0x28, 4,5,128,120,2,16,4, 0},
        {0x154,0,0x28, 6,7,216,160,2, 0,4,-1},
        {0x184,0,0x28, 0,1,128, 56,2,16,4, 0},
        {0x1b4,0,0x28,20,20,173,46,2, 0,4, 0},
        {0x1e4,0,0x28,20,20,173,110,2,0,4, 0},
        {0x214,0,0x28, 8,9, 80, 96,2, 0,4, 0},
        {0x244,0,0x28,10,11,176,96,2, 0,4, 0},
        {0x274,0,0x28,15,16, 64,132,2, 0,4, 0},
        {0x2a4,0,0x28,17,18,228,132,2, 0,4, 0},
        {0x2d4,0,0x28,12,12, 56, 60,2, 0,4, 0},
        {0x304,0,0x58, 2,2, 32,144,2, 0,4, 0},
        {0xab4,0,0x40, 0,1,100,100,2, 0,4, 0},
        {0xae4,0,0x40, 2,3,150,100,2, 0,4, 0},
        {0xb14,0,0x28,13,14,128,108,2, 0,4, 0}
    };

    for (s32 i = 0; i < 6; ++i)
        func_02071ea4((u8 *)object + resourceOffsets[i]);
    for (s32 offset = 0x64; offset <= 0x304; offset += 0x30)
        func_ov032_0220142c((u8 *)object + offset);
    __construct_array((u8 *)object + 0x334, 0x28, 0x30,
                      (void *)func_ov032_0220142c,
                      (void *)func_ov032_021fce00);
    func_ov032_0220142c((u8 *)object + 0xab4);
    func_ov032_0220142c((u8 *)object + 0xae4);
    func_ov032_0220142c((u8 *)object + 0xb14);
    GraphicsResourceSet_Init((u8 *)object + 0xb44);
    func_ov032_021fd7a4((u8 *)object + 0xb54);
    func_02092364((u8 *)object + 0xbe8);
    __construct_array((u8 *)object + 0xc44, 5, 0x6c,
                      (void *)func_ov032_021fd7c0,
                      (void *)func_ov032_021fd7e0);
    func_ov032_0220142c((u8 *)object + 0xedc);
    GraphicsResourceSet_Init((u8 *)object + 0xf18);

    FIELD(s32, object, 0xf2c) = 0;
    FIELD(s32, object, 0xe64) = 0x49;
    for (s32 i = 2; i < 0x15; ++i)
        FIELD(s32, object, 0xe60 + i * 4) = i + 0x4c;
    FIELD(s32, object, 0xc30) = func_020adc90(0xf000, 0x28000);
    FIELD(s32, object, 0xc38) = func_020adc90(0x100000, 0x3c000);
    func_0205974c(gSoundContext, 0x81);
    func_02058eb8(gSoundContext, 1, 0, 0x14, 0x1e);
    FIELD(s32, object, 0xc1c) = FIELD(s16, gGameWork, 0x1ce);
    FIELD(s32, object, 0xc20) = func_02027854(func_02027f94());
    FIELD(s32, object, 0xc24) = FIELD(s32, object, 0xc1c);
    FIELD(s32, object, 0xb74) = 0;
    FIELD(s32, object, 0xc2c) = 0;
    FIELD(s32, object, 0xbd8) = 0;
    FIELD(s32, object, 0xb78) = 0;
    FIELD(s32, object, 0xf28) = 0;
    FIELD(s32, object, 0xbdc) = genrand_int32() % 0x78;
    FIELD(void *, object, 0xbe0) =
        DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 0);
    FIELD(void *, object, 0xbe4) =
        DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1);
    FIELD(void *, object, 8) = func_02071980(data_020f4e18[0], 0x7007);

    void *dialog = Heap_Alloc(0xec, data_ov032_02202340, 4, gHeapContext);
    if (dialog != 0)
        dialog = func_02092cc0(dialog, gDebugFont, FIELD(void *, object, 8));
    FIELD(void *, object, 0x10) = dialog;
    func_ov032_021fce08(dialog, 0x20, 0x7e, 0xbe, 0x32);
    FIELD(s32, dialog, 0xb4) = 0;
    FIELD(s32, dialog, 0xbc) = -2;
    FIELD(s32, dialog, 0xd0) = 0xc;
    FIELD(s32, dialog, 0xd4) = 0;
    FIELD(void *, object, 4) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, object, 4));
    FIELD(void *, object, 0) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14[0]);
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, object, 0));
    for (s32 i = 0; i < 5; ++i)
        func_ov032_02200f88((u8 *)object + 0xc44 + i * 0x6c,
                            object, i, FIELD(void *, object, 0));

    for (s32 i = 0; i < 6; ++i)
        func_02071ee0((u8 *)object + resourceOffsets[i], data_020f4e18[0],
                      resourceIds[i][0], resourceIds[i][1], resourceIds[i][2]);
    for (s32 i = 0; i < 18; ++i)
        setup_controller(object, &specs[i]);

    FIELD(s32, object, 0xb84) = 0;
    FIELD(s32, object, 0xb80) = 0;
    FIELD(s32, object, 0xbcc) = 0;
    FIELD(s32, object, 0xbc8) = 0;
    FIELD(s32, object, 0xbd0) = 0;
    FIELD(s32, object, 0xbd4) = 0;
    GameWork_ClearFlag(gGameWork, 0x3fb);
    FIELD(s32, object, 0xb6c) = FIELD(s32, data_ov032_02202220, 0x18);
    FIELD(s32, object, 0xb70) = FIELD(s32, data_ov032_02202220, 0x1c);
    FIELD(s32, object, 0xb64) = 0;
    return object;
}
