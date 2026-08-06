#include "tingle/heap.h"
#include "tingle/types.h"

/* Construct and configure the extended type-two actor object at size >=0x295. */
extern const void *data_020dfee4;
extern void *data_02105778;
extern const char data_020e00b8[];
extern const char data_020e00c0[];
extern s16 data_020e83a0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203b514(void *actor, const void *config);
extern void func_02004fe0(void *vector);
extern void func_0204cca8(void *object, void *actor);
extern void func_020050a4(void *destination, const void *source);
extern void *func_02045210(void *manager, u32 value);
extern s16 *func_020450dc(void *handle, void *actor);
extern void func_02032e04(void *actor);
extern void func_02045288(void *object, u32 value, s32 x, s32 y);
extern s32 *func_0204539c(void *object);
extern s32 *func_020453b0(void *object);
extern u16 func_020453c8(void *object);
extern void *func_0203de48(void *allocation, u32 value);
extern u8 *func_0206899c(s32 index);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base actor from config, install vtable data_020dfee4, create
 * vectors at +0x22c/+0x23c and helper +0x284, copy position +0x18 to +0x22c,
 * and set type byte +0x4d to two. Copy recovered config fields +0x54/+0x30 to
 * actor halfwords +0x250/+0x272. Config +0x34 optionally creates handle +0x274
 * and supplies X/Y; config +0x38 optionally allocates and initializes object
 * +0x26c, whose queried coordinates and halfword populate +0x230/+0x234/+0x26a.
 * Config +0x40 optionally allocates the 12-byte object initialized by
 * func_0203de48 and stored at +0x278; signed halfword +0x4c is copied to +0x27c.
 *
 * After virtual +0xc4, use actor index +0x4e to query the table rooted at
 * data_020e83a0 and func_0206899c, copying returned word +0x0c to +0x200/+0x1fc.
 * Virtual +0xc8 fills a temporary 0x30-byte record; copy byte +0x24 to +0x27e,
 * halfword +0x22 to byte +0x27f, always set +0x260 bit eight, and set bit
 * 0x8000 when temporary halfword +0x1a has bit 0x40. A non-minus-one +0x1cc
 * sets +0x272 bit 0x800; indices 0x67..0x70 set +0x260 bit 0x100000. Finally,
 * config +0x2c is forwarded to virtual +0x74 when nonzero. Returns self; base,
 * heap, helper, virtual, and optional manager calls mutate owned engine state.
 */
void *func_0203db80(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    const u8 *config = (const u8 *)configuration;
    u8 temporary[0x30];

    func_0203b514(actor, config);
    *(const void **)actor = data_020dfee4;
    func_02004fe0(actor + 0x22c);
    func_02004fe0(actor + 0x23c);
    *(u16 *)(actor + 0x252) = 0;
    *(u32 *)(actor + 0x260) = 0;
    func_0204cca8(actor + 0x284, actor);
    actor[0x294] = 0;
    func_020050a4(actor + 0x22c, actor + 0x18);
    actor[0x4d] = 2;
    if ((*(u32 *)(actor + 0x14) & 0x400) != 0)
        *(u32 *)(actor + 0xd0) |= 4;
    *(u32 *)(actor + 0x26c) = 0;
    *(u16 *)(actor + 0x250) = (u16)*(u32 *)(config + 0x54);
    *(u16 *)(actor + 0x272) = (u16)*(u32 *)(config + 0x30);

    if (*(u32 *)(config + 0x34) != 0) {
        s16 *position;
        void *handle = func_02045210(data_02105778,
                                     *(u32 *)(config + 0x34));
        *(void **)(actor + 0x274) = handle;
        position = func_020450dc(handle, actor);
        *(s32 *)(actor + 0x1c) = *(s32 *)(actor + 0x230) =
            (s32)position[0] << 12;
        *(s32 *)(actor + 0x20) = *(s32 *)(actor + 0x234) =
            (s32)position[1] << 12;
        func_02032e04(actor);
    } else {
        *(void **)(actor + 0x274) = 0;
    }

    if (*(u32 *)(config + 0x38) != 0) {
        void *object = Heap_Alloc(8, data_020e00b8, 4, &gHeapContext);
        if (object != 0)
            *(u32 *)object = 0;
        *(void **)(actor + 0x26c) = object;
        func_02045288(object, *(u32 *)(config + 0x38),
                       *(s32 *)(actor + 0x230) >> 12,
                       *(s32 *)(actor + 0x234) >> 12);
        *(s32 *)(actor + 0x230) = *func_0204539c(object) << 12;
        *(s32 *)(actor + 0x234) = *func_020453b0(object) << 12;
        *(u16 *)(actor + 0x26a) = func_020453c8(object);
    } else {
        *(void **)(actor + 0x26c) = 0;
        *(u16 *)(actor + 0x26a) = 0;
    }

    *(u16 *)(actor + 0x280) = 0;
    *(u32 *)(actor + 0x264) = 0;
    actor[0x268] = 0;
    actor[0x269] = 0;
    if (*(u32 *)(config + 0x40) != 0) {
        void *object = Heap_Alloc(12, data_020e00c0, 4, &gHeapContext);
        if (object != 0)
            object = func_0203de48(object, *(u32 *)(config + 0x40));
        *(void **)(actor + 0x278) = object;
    } else {
        *(void **)(actor + 0x278) = 0;
    }
    *(s16 *)(actor + 0x27c) = *(s16 *)(config + 0x4c);

    (*(void (**)(void *))(*(u8 **)actor + 0xc4))(actor);
    {
        s32 tableIndex = data_020e83a0[*(u16 *)(actor + 0x4e) * 0x18];
        u8 *record = func_0206899c(tableIndex);
        *(u32 *)(actor + 0x200) = *(u32 *)(record + 0x0c);
        *(u32 *)(actor + 0x1fc) = *(u32 *)(record + 0x0c);
    }
    (*(void (**)(void *, void *))(*(u8 **)actor + 0xc8))(actor, temporary);
    actor[0x27e] = (u8)*(s8 *)(temporary + 0x24);
    *(u32 *)(actor + 0x260) |= 8;
    actor[0x27f] = (u8)*(s16 *)(temporary + 0x22);
    if ((*(u16 *)(temporary + 0x1a) & 0x40) != 0)
        *(u32 *)(actor + 0x260) |= 0x8000;
    if (*(s32 *)(actor + 0x1cc) != -1)
        *(u16 *)(actor + 0x272) |= 0x800;
    if (*(u16 *)(actor + 0x4e) >= 0x67 &&
        *(u16 *)(actor + 0x4e) < 0x71)
        *(u32 *)(actor + 0x260) |= 0x100000;
    if (*(u32 *)(config + 0x2c) != 0)
        (*(void (**)(void *, u32))(*(u8 **)actor + 0x74))(
            actor, *(u32 *)(config + 0x2c));
    return actor;
}
