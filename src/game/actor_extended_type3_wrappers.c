#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered extended type-three actor wrappers. They expose destructor forms,
 * extend two interaction gates, and apply axis-specific motion damping.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorExtendedType2_Destroy(void *actor);
extern s32 func_020400a4(void *actor, void *record);
extern s32 func_02040334(void *actor, void *record);
extern s32 ActorExtendedType2_GetDescriptorValue2A(const void *actor);
extern void func_02005030(void *temporary, const void *source);
extern void func_02005058(void *temporary);
extern void func_0203f5c4(void *actor, const void *transform);
#ifdef __cplusplus
}
#endif

/* Invoke base destructor ActorExtendedType2_Destroy and return self; actor state is torn down. */
void *func_02043864(void *self)
{
    ActorExtendedType2_Destroy(self);
    return self;
}

/*
 * Invoke base destructor ActorExtendedType2_Destroy, free self through Heap_Free, and return
 * the original pointer value. Actor storage becomes invalid after the heap call.
 */
void *func_02043878(void *self)
{
    ActorExtendedType2_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Forward actor and record to func_020400a4. When it returns nonzero, copy
 * signed descriptor halfword +0x2a into actor +0x29a.
 * Return the forwarded result; actor/base interaction state may change.
 */
s32 func_02043894(void *self, void *record)
{
    s32 result = func_020400a4(self, record);
    if (result != 0)
        *(u16 *)((u8 *)self + 0x29a) = (u16)ActorExtendedType2_GetDescriptorValue2A(self);
    return result;
}

/*
 * Forward actor and record to func_02040334. When it returns nonzero, copy
 * signed descriptor halfword +0x2a into actor +0x29a.
 * Return the forwarded result; actor/base interaction state may change.
 */
s32 func_020438c0(void *self, void *record)
{
    s32 result = func_02040334(self, record);
    if (result != 0)
        *(u16 *)((u8 *)self + 0x29a) = (u16)ActorExtendedType2_GetDescriptorValue2A(self);
    return result;
}

/*
 * Copy sourceTransform into a temporary transform, pass it with actor to
 * func_0203f5c4, then inspect signed mode +0x298. Mode zero divides actor +0x40
 * by three; mode one divides +0x3c by three. Finalize the temporary transform.
 * The routine has no meaningful return value and may change actor/motion state;
 * no direct hardware operation occurs.
 */
void func_020438ec(void *self, const void *sourceTransform)
{
    u8 *actor = (u8 *)self;
    u32 temporary[4];
    func_02005030(temporary, sourceTransform);
    func_0203f5c4(actor, temporary);
    if (*(s16 *)(actor + 0x298) == 0)
        *(s32 *)(actor + 0x40) /= 3;
    else if (*(s16 *)(actor + 0x298) == 1)
        *(s32 *)(actor + 0x3c) /= 3;
    func_02005058(temporary);
}
