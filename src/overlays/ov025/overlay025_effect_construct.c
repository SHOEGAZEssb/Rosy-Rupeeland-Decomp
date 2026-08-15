#include "tingle/types.h"

/* Overlay 25 paired-engine animated effect-controller construction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
typedef struct EffectResourceIds {
    u16 first;
    u16 second;
    u16 third;
    u16 unused;
} EffectResourceIds;

/* This resource-ID table is writable overlay data; const changes MWCC scheduling. */
extern EffectResourceIds data_ov025_02202c84[];
extern const u8 data_ov025_02203354[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void __construct_array(void *, s32, s32, void *, void *);
extern u32 genrand_int32(void);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern s32 func_020918f4(u32 *, s32);
extern void Presentation_Init(void *);
extern void func_ov025_021fe4cc(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Construct the effect controller over its base animation object. Construct
 * three resource descriptors with both element constructor and destructor,
 * initialize a fourth descriptor, load their recovered resource-ID triplets,
 * clone shared/debug sprite owners, create two mirrored sprite pairs, seed RNG
 * +0xF8, choose side +0xA4, and enter mode 2/variant 0. Graphics, archive,
 * animation, and RNG state change; the initialized object is returned.
 */
extern "C" void *func_ov025_021fdecc(void *object)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov025_02203354;
    __construct_array((u8 *)object + 0xb0, 3, 0xc,
                      (void *)func_02071ea4, (void *)func_02071eb8);
    func_02071ea4((u8 *)object + 0xd4);

    FIELD(u32, object, 0xf8) = 0;
    for (s32 i = 0; i < 3; ++i) {
        EffectResourceIds *entry = &data_ov025_02202c84[i];
        func_02071ee0((u8 *)object + 0xb0 + i * 0xc, data_020f4e18,
                      entry->first, entry->second, entry->third);
    }

    FIELD(u32, object, 0xf8) = genrand_int32();
    FIELD(void *, object, 0xe0) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    void *debugOwner = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    FIELD(void *, object, 0xe4) = debugOwner;
    FIELD(s32, debugOwner, 0x18) = 0;
    FIELD(s32, debugOwner, 0x1c) = 0x100;

    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, object, 0xe0), (u8 *)object + 0xb0, 2);
    FIELD(void *, object, 0xe8) = sprite;
    FIELD(u8, sprite, 0x3a) = 3;
    FIELD(u16, sprite, 0x28) = 0x2000;
    FIELD(u16, FIELD(void *, object, 0xe8), 0x24) |= 6;

    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, object, 0xe4), (u8 *)object + 0xb0, 2);
    FIELD(void *, object, 0xf0) = sprite;
    FIELD(u8, sprite, 0x3a) = 3;
    FIELD(u16, sprite, 0x28) = 0x2000;
    FIELD(u16, FIELD(void *, object, 0xf0), 0x24) |= 6;

    func_02071ee0((u8 *)object + 0xd4, data_020f4e18,
                  0x1154, 0x1155, 0x1156);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, object, 0xe0), (u8 *)object + 0xd4, 1);
    FIELD(void *, object, 0xec) = sprite;
    FIELD(u8, sprite, 0x3a) = 3;
    FIELD(u16, sprite, 0x28) = 0x2100;
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) |= 6;

    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, object, 0xe4), (u8 *)object + 0xd4, 1);
    FIELD(void *, object, 0xf4) = sprite;
    FIELD(u8, sprite, 0x3a) = 3;
    FIELD(u16, sprite, 0x28) = 0x2100;
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) |= 6;

    FIELD(s32, object, 0xa8) = 0;
    FIELD(s32, object, 0xa4) = func_020918f4((u32 *)object + 0x3e, 2);
    func_ov025_021fe4cc(object, 2, 0);
    return object;
}
