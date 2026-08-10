#include "tingle/types.h"

/*
 * Extend the common actor geometry header with runtime motion, render,
 * collision, resource, and per-frame bookkeeping state.
 */
extern u8 data_020df040[];
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorBaseGeometry_Init(void *, const void *);
extern void func_020083b0(void *, s32, s32, s32, s32);
extern void func_02004fe0(void *);
extern void func_0200500c(void *, s32, s32, s32);
extern void func_020050a4(void *, const void *);
extern void func_0201b0f4(void *);
extern void func_02006678(void *);
extern void func_02032228(void *, s32, s32, s32);
extern void *func_02009d78(void *);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the common 0x54-byte base from descriptor, install vtable
 * data_020df040, and initialize recovered fields through 0x1eb. Descriptor
 * bytes 0x5c-0x60 configure packed state at 0x5c/0x60; halfwords 0x1a-0x20
 * configure 0x68; descriptor word 0x48 is retained at 0x1cc. Runtime value
 * objects at 0x78/0x88/0x98/0xb0, resources at 0xec/0x198, scale fields, five
 * pointers at 0x180, and collision halfwords 0x70-0x76 are initialized. A
 * descriptor 0x3c value from zero through three sets actor flag 0x80. The
 * vector at 0x78 is copied from global context offset 0x2fbc. Returns self;
 * helper calls may allocate or initialize SDK-managed value/resource state.
 */
void *func_02030f98(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)self;
    const u8 *desc = (const u8 *)descriptor;
    s32 i;
    s32 expand;

    ActorBaseGeometry_Init(self, descriptor);
    *(void **)(actor + 0x00) = data_020df040;
    *(u32 *)(actor + 0x54) = 0;
    *(u32 *)(actor + 0x58) = 0;
    *(u32 *)(actor + 0x5c) =
        (*(u32 *)(actor + 0x5c) & 0xff000000) | *(u16 *)(desc + 0x60);
    func_020083b0(actor + 0x60, *(s8 *)(desc + 0x5c),
                  *(s8 *)(desc + 0x5d), *(s8 *)(desc + 0x5e),
                  *(s8 *)(desc + 0x5f));
    func_020083b0(actor + 0x68, *(s16 *)(desc + 0x1a),
                  *(s16 *)(desc + 0x1c), *(s16 *)(desc + 0x1e),
                  *(s16 *)(desc + 0x20));
    func_02004fe0(actor + 0x78);
    func_0200500c(actor + 0x88, 0, 0, 0);
    func_0200500c(actor + 0x98, 0, 0, 0);
    *(u32 *)(actor + 0xa8) = 0;
    *(u16 *)(actor + 0xac) = 0xff;
    *(u16 *)(actor + 0xae) = 0;
    func_02004fe0(actor + 0xb0);
    *(u32 *)(actor + 0xc8) = 0;
    *(u32 *)(actor + 0xcc) = 0;
    *(u32 *)(actor + 0xd0) = 0;
    actor[0xd4] = actor[0xd5] = 0;
    *(u16 *)(actor + 0xd6) = *(u16 *)(actor + 0xd8) = 0;
    *(u16 *)(actor + 0xda) = *(u16 *)(actor + 0xdc) = 0;
    *(u16 *)(actor + 0xde) = *(u16 *)(actor + 0xe4) = 0;
    actor[0xe6] = actor[0xe7] = actor[0xe8] = 0;
    func_0201b0f4(actor + 0xec);
    func_02006678(actor + 0x198);
    *(u32 *)(actor + 0x1cc) = *(u32 *)(desc + 0x48);
    *(u32 *)(actor + 0x1d0) = 0x1000;
    *(u32 *)(actor + 0x1d4) = 0x1000;
    *(u32 *)(actor + 0x1d8) = 0x1000;
    *(u32 *)(actor + 0x1dc) = 0;
    *(u32 *)(actor + 0x1e0) = 0;
    actor[0x1e4] = actor[0x1e5] = actor[0x1e6] = 0;
    actor[0x1e7] = 0x0c;
    *(u16 *)(actor + 0x1e8) = 0x100;
    *(u16 *)(actor + 0x1ea) = 0;
    *(u32 *)(actor + 0xc0) = 0;
    *(u32 *)(actor + 0xc4) = 0;
    func_02032228(actor, 0, 0x1000, 0x800);
    func_020050a4(actor + 0x78,
                  func_02009d78((u8 *)data_021052fc + 0x2fbc));
    actor[0x194] = actor[0x195] = 0;
    *(u16 *)(actor + 0x196) = 0;
    for (i = 0; i < 5; i++)
        *(void **)(actor + 0x180 + i * 4) = 0;
    if (*(s16 *)(desc + 0x3c) >= 0 && *(s16 *)(desc + 0x3c) <= 3)
        *(u32 *)(actor + 0x14) |= 0x80;
    expand = *(s16 *)(desc + 0x3e);
    *(s16 *)(actor + 0x70) = *(s8 *)(actor + 0x08) - expand;
    *(s16 *)(actor + 0x72) = *(s8 *)(actor + 0x09) - expand;
    *(s16 *)(actor + 0x74) = *(s8 *)(actor + 0x0a) + expand;
    *(s16 *)(actor + 0x76) = *(s8 *)(actor + 0x0b) + expand;
    return self;
}
