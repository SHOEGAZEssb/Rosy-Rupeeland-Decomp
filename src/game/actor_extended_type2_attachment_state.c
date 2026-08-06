#include "tingle/types.h"

/* Select descriptor- and state-dependent resources and animation for attachment +0x54. */
extern u8 data_020e6c0c[];
extern u8 data_020e6ca4[];
extern u8 data_020e6b74[];
extern u8 data_020e6adc[];
extern u8 data_020df9e8[];
extern u8 data_020dfab0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020337d4(void *actor);
extern void *func_02030acc(void *value);
extern void func_020740c8(void *context, void *attachment,
                          u32 first, u32 second, u32 third);
extern void func_02072b68(void *attachment, u32 animation);
#ifdef __cplusplus
}
#endif

/* Test the recovered two-word state/callback representation. */
static s32 pairMatches(u32 first, u32 second)
{
    return first == *(u32 *)(data_020df9e8 + 0xc8) &&
           (second == *(u32 *)(data_020dfab0 + 4) || first == 0);
}

/*
 * Map signed actor state +0xd6 (0..22) to an animation, resource +0x208 or
 * +0x20c, attachment halfword +0x36, and a flag mode. The mapping uses actor
 * direction byte +0xd4 plus offsets 8, 21, or 22 for several states and
 * descriptor-indexed byte tables for states 5/6/7/17/19. States outside the
 * mapped cases use animation zero, resource +0x208, +0x36 value 0x100, and the
 * ordinary flag mode. The 5/6 resource-one selection additionally requires
 * pair +0x218/+0x21c to match the recovered globals.
 *
 * Resolve context through func_020337d4 then func_02030acc, configure attachment
 * +0x54 through func_020740c8 using resource words +0x04/+0x08/+0x0c, select
 * the animation, store +0x36 and zero +0x30. Special flag mode clears bits
 * zero/one of attachment +0x24; ordinary mode clears bit zero and sets bit one.
 * Returns no value; attachment resource, animation, and flags change.
 */
void func_0203f0bc(void *self)
{
    u8 *actor = (u8 *)self;
    s16 state = *(s16 *)(actor + 0xd6);
    u32 resourceIndex = 0;
    u32 animation = 0;
    s32 specialFlags = 0;
    u16 value36 = 0x100;
    u16 index = *(u16 *)(actor + 0x4e);
    u8 direction = actor[0xd4];
    u32 *resource;
    u8 *attachment;
    void *context;

    switch (state) {
    case 1:
        animation = direction + 8;
        value36 = 0;
        specialFlags = 1;
        break;
    case 2:
    case 3:
    case 4:
        animation = direction + 8;
        break;
    case 5:
    case 6:
        if (pairMatches(*(u32 *)(actor + 0x218),
                        *(u32 *)(actor + 0x21c)) &&
            data_020e6ca4[index] != 0)
            resourceIndex = 1;
        animation = direction;
        break;
    case 7:
        if (data_020e6c0c[index] != 0) {
            animation = direction + 0x15;
            specialFlags = 1;
        }
        break;
    case 8:
    case 9:
        animation = direction;
        break;
    case 11:
        animation = 0x12;
        break;
    case 13:
        animation = direction + 0x16;
        specialFlags = 1;
        break;
    case 17:
        if (data_020e6b74[index] != 0) {
            animation = 0x15;
            specialFlags = 1;
        }
        break;
    case 18:
        animation = 0x10;
        specialFlags = 1;
        break;
    case 19:
        if (data_020e6adc[index] != 0) {
            animation = 0x14;
            specialFlags = 1;
        } else {
            animation = direction + 8;
        }
        break;
    case 22:
        animation = 0x11;
        break;
    default:
        break;
    }

    resource = *(u32 **)(actor + 0x208 + resourceIndex * 4);
    context = func_02030acc(func_020337d4(actor));
    attachment = *(u8 **)(actor + 0x54);
    func_020740c8(context, attachment, resource[1], resource[2], resource[3]);
    func_02072b68(attachment, animation & 0xff);
    *(u16 *)(attachment + 0x36) = value36;
    *(u16 *)(attachment + 0x30) = 0;
    if (specialFlags) {
        *(u16 *)(attachment + 0x24) &= ~3;
    } else {
        *(u16 *)(attachment + 0x24) &= ~1;
        *(u16 *)(attachment + 0x24) |= 2;
    }
}
