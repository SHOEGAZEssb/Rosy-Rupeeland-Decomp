#include "tingle/types.h"

/*
 * Recovered extended type-two actor completion gate. It waits for either an
 * attachment flag or a timed fallback, then installs the completion callback
 * and emits descriptor-indexed presentation effects.
 */
extern u8 data_020e6c0c[];
extern u8 data_020df9e8[];
extern u16 data_020e7318[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorExtendedType2_PlayDescriptorSoundIfEnabled(void *actor);
extern void func_0205940c(void *soundContext, s32 group, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor +0x260 bit zero, set mode byte +0x24c to one, and abort with zero
 * if virtual +0x38 reports busy. For descriptor indices whose data_020e6c0c
 * byte is nonzero, completion requires attachment +0x24 bit zero; other indices
 * increment signed counter +0x25a and complete after it exceeds 30. Completion
 * clears +0x25a/+0x256, installs global pair +0x2a0/+0x2a4 at +0x218/+0x21c,
 * sets +0x260 bit two, optionally submits the packed data_020e7318 sound value
 * unless it is 0xffff, invokes
 * ActorExtendedType2_PlayDescriptorSoundIfEnabled, and puts index 0x30 in
 * state seven.
 * It returns one only on completion. Actor, virtual, sound, and presentation
 * state may change; func_0205940c is the only external subsystem boundary.
 */
s32 ActorExtendedType2_TryCompleteAttachmentGate(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *attachment;
    u16 index;
    s32 complete = 0;

    *(u32 *)(actor + 0x260) &= ~1;
    actor[0x24c] = 1;
    if ((*(s32 (**)(void *))(*(u8 **)actor + 0x38))(actor) != 0)
        return 0;

    index = *(u16 *)(actor + 0x4e);
    if (data_020e6c0c[index] != 0) {
        attachment = *(u8 **)(actor + 0x54);
        if ((*(u16 *)(attachment + 0x24) & 1) != 0)
            complete = 1;
    } else {
        ++*(s16 *)(actor + 0x25a);
        if (*(s16 *)(actor + 0x25a) > 30)
            complete = 1;
    }

    if (!complete)
        return 0;

    *(u16 *)(actor + 0x25a) = 0;
    *(u16 *)(actor + 0x256) = 0;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x2a0);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x2a4);
    *(u32 *)(actor + 0x260) |= 4;

    {
        u16 packed = data_020e7318[index];
        if (packed != 0xffff)
            func_0205940c(gSoundContext, packed >> 7, packed & 0x7f);
    }
    ActorExtendedType2_PlayDescriptorSoundIfEnabled(actor);
    if (*(u16 *)(actor + 0x4e) == 0x30)
        *(u16 *)(actor + 0xd6) = 7;
    return 1;
}
