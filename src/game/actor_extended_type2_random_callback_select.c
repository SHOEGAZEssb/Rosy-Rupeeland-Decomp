#include "tingle/types.h"

/*
 * Recovered extended type-two actor callback-selection helpers. They cancel a
 * target state and randomly select an eligible callback from descriptor flags.
 */
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern u16 func_020453c8(void *object);
extern void ActorExtendedType2_PlayDescriptorSoundIfEnabled(void *actor);
extern void func_020050a4(void *destination, ...);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor +0x260 bit zero, invoke virtual +0xe8, clear halfword +0x254,
 * and return zero. Actor and virtual state may change; no direct SDK or
 * hardware operation occurs.
 */
s32 ActorExtendedType2_CancelTargetState(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x260) &= ~1;
    (*(void (**)(void *))(*(u8 **)actor + 0xe8))(actor);
    *(u16 *)(actor + 0x254) = 0;
    return 0;
}

/*
 * If object +0x26c exists and cached halfword +0x26a is zero, cache the result
 * of func_020453c8. When signed +0x280 is also zero, invoke virtual +0x138 and
 * ActorExtendedType2_PlayDescriptorSoundIfEnabled and install global pair
 * +0xf8/+0xfc at +0x218/+0x21c. Reset transform +0x78 from +0x18, then build
 * a choice list from descriptor +0x18:
 * bit zero contributes 1, any bit in 0x1e contributes 0x1e, bit 0x20 contributes
 * 0x20, and bit 0x100 contributes 0x100 unless actor +0x260 bit 0x400000 is set.
 * A random eligible choice installs member pair +0x238, +0x230, +0x228, or
 * +0x220 respectively; choices 0x1e/0x20 also call
 * ActorExtendedType2_PlayDescriptorSoundIfEnabled, and 0x20 clears +0x256
 * first. Finally clear +0x25a/+0x256 and bit 0x400000. The input
 * data is assumed to provide at least one choice. Always returns zero. Actor,
 * object, random, virtual, and presentation state may change; no direct
 * hardware access occurs.
 */
s32 ActorExtendedType2_SelectRandomDescriptorCallback(void *self, const void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptorRecord;
    s32 choices[16];
    s32 count = 0;
    u16 flags;
    s32 selected;

    if (*(void **)(actor + 0x26c) != 0 && *(u16 *)(actor + 0x26a) == 0) {
        *(u16 *)(actor + 0x26a) = func_020453c8(*(void **)(actor + 0x26c));
        if (*(s16 *)(actor + 0x280) == 0) {
            (*(void (**)(void *))(*(u8 **)actor + 0x138))(actor);
            ActorExtendedType2_PlayDescriptorSoundIfEnabled(actor);
            *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0xf8);
            *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0xfc);
        }
    }

    func_020050a4(actor + 0x78, actor + 0x18);
    flags = *(const u16 *)(record + 0x18);
    if ((flags & 1) != 0)
        choices[count++] = 1;
    if ((flags & 0x1e) != 0)
        choices[count++] = 0x1e;
    if ((flags & 0x20) != 0)
        choices[count++] = 0x20;
    if ((*(u32 *)(actor + 0x260) & 0x400000) == 0 && (flags & 0x100) != 0)
        choices[count++] = 0x100;

    selected = choices[func_020ada8c((s32)(genrand_int32() & 0x7fffffff), count)];
    if (selected == 0 || selected == 1) {
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x238);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x23c);
    } else if (selected == 0x1e) {
        ActorExtendedType2_PlayDescriptorSoundIfEnabled(actor);
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x230);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x234);
    } else if (selected == 0x20) {
        *(u16 *)(actor + 0x256) = 0;
        ActorExtendedType2_PlayDescriptorSoundIfEnabled(actor);
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x228);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x22c);
    } else if (selected == 0x100) {
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x220);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x224);
    }

    *(u16 *)(actor + 0x25a) = 0;
    *(u16 *)(actor + 0x256) = 0;
    *(u32 *)(actor + 0x260) &= ~0x400000;
    return 0;
}
