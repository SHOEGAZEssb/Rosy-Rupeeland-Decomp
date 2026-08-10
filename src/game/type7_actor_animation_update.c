#include "tingle/types.h"

/* Recovered type-seven actor animation/resource update selected by state +0xd6. */
extern u8 data_020e16b0[];
extern u8 data_020e1720[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetCollection(void *actor);
extern void *func_02030acc(void *value);
extern void func_020740c8(void *context, void *resource, void *first,
                          void *second, void *third);
extern void func_02072b68(void *resource, u32 animation);
#ifdef __cplusplus
}
#endif

/*
 * Refresh actor resource +0x54 through func_020740c8 using the transformed
 * Actor_GetCollection context and actor fields +0x1f0/+0x1f4/+0x1f8. Select animation
 * from signed state +0xd6: states 1,2,3,6,7,11 use actor byte +0xd4 plus eight;
 * 4,5,17 use 0x21; 12 uses 0x12; 13 uses 0x11; 15 uses 0x10; state 16 ensures
 * 0x24; and state 18 ensures 0x1a. The ordinary/default path ensures animation
 * byte +0xd4. Ordinary looping paths clear resource +0x24 bit zero and set bit
 * one. State 16 clears bit zero on animation change and always clears bit one.
 * State 18 clears both bits only when changing animation. Output halfword +0x36
 * normally becomes 0x100. State 14 uses 0x180 when callback +0x208/+0x20c
 * matches data_020e16b0+0x70/data_020e1720+4, otherwise 0x140; ordinary states
 * also force 0x140 when actor +0x268 bit 0x400000 is set. Returns no value;
 * animation/render resource state changes but no direct hardware access occurs.
 */
void func_02046208(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *resource = *(u8 **)(actor + 0x54);
    void *context = func_02030acc(Actor_GetCollection(actor));
    s32 state;
    u16 scale = 0x100;
    u32 animation;
    s32 ordinary = 0;

    func_020740c8(context, resource, *(void **)(actor + 0x1f0),
                  *(void **)(actor + 0x1f4), *(void **)(actor + 0x1f8));
    state = *(s16 *)(actor + 0xd6);
    switch (state) {
    case 1: case 2: case 3: case 6: case 7: case 11:
        animation = (actor[0xd4] + 8) & 0xff;
        func_02072b68(resource, animation);
        *(u16 *)(resource + 0x24) &= (u16)~1;
        *(u16 *)(resource + 0x24) |= 2;
        break;
    case 4: case 5: case 17:
        func_02072b68(resource, 0x21);
        *(u16 *)(resource + 0x24) &= (u16)~1;
        *(u16 *)(resource + 0x24) |= 2;
        break;
    case 12:
        func_02072b68(resource, 0x12);
        *(u16 *)(resource + 0x24) &= (u16)~1;
        *(u16 *)(resource + 0x24) |= 2;
        break;
    case 13:
        func_02072b68(resource, 0x11);
        *(u16 *)(resource + 0x24) &= (u16)~1;
        *(u16 *)(resource + 0x24) |= 2;
        break;
    case 15:
        func_02072b68(resource, 0x10);
        *(u16 *)(resource + 0x24) &= (u16)~1;
        *(u16 *)(resource + 0x24) |= 2;
        break;
    case 14:
        if (*(void **)(actor + 0x208) == *(void **)(data_020e16b0 + 0x70)
            && (*(void **)(actor + 0x20c) == *(void **)(data_020e1720 + 4)
                || *(void **)(actor + 0x208) == 0)) {
            scale = 0x180;
        } else {
            scale = 0x140;
        }
        ordinary = 1;
        break;
    case 16:
        if (resource[0x38] != 0x24) {
            func_02072b68(resource, 0x24);
            *(u16 *)(resource + 0x24) &= (u16)~1;
        }
        *(u16 *)(resource + 0x24) &= (u16)~2;
        break;
    case 18:
        if (resource[0x38] != 0x1a) {
            func_02072b68(resource, 0x1a);
            *(u16 *)(resource + 0x24) &= (u16)~3;
        }
        break;
    default:
        ordinary = 1;
        break;
    }
    if (ordinary) {
        if (actor[0xd4] != resource[0x38])
            func_02072b68(resource, actor[0xd4]);
        *(u16 *)(resource + 0x24) &= (u16)~1;
        *(u16 *)(resource + 0x24) |= 2;
        if ((*(u32 *)(actor + 0x268) & 0x400000) != 0)
            scale = 0x140;
    }
    *(u16 *)(resource + 0x36) = scale;
}
