/* Resident sprite-effect instance construction and owned particle storage. */

#include "tingle/heap.h"
#include "tingle/sprite_effect.h"
#include "tingle/vec_fx32.h"

/*
 * Construct one caller-allocated resident sprite effect. The instance borrows
 * owner and config data, owns all nine arrays it allocates, and may seed up to
 * count04 particles through the canonical spawn routine. Allocation failure
 * is retained as a null owned-array pointer, matching retail behavior.
 */

extern const char data_020f3300[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020c09cc(void *allocation, u32 count, u32 elementSize,
                           u32 headerSize, void *constructor,
                           void *destructor);
extern void func_020a3804(SpriteEffectInstance *effect, u32 count);

SpriteEffectInstance *func_020a3480(SpriteEffectInstance *effect, void *owner,
                                    const SpriteEffectConfig *config)
{
    void *allocation;
    u32 count;
    s32 index;
    s32 range;

    effect->owner00 = owner;
    effect->field6e = 0;
    effect->enabled6c = 1;
    effect->field72 = 0;
    effect->count04 = config->count02;
    effect->mode70 = config->mode00;
    effect->distribution4b = config->distribution40;
    func_020a376c(&effect->bounds5c, &config->bounds04);
    effect->lifetime54 = config->lifetime28;
    effect->lifetimeRange56 = config->lifetimeRange2a;
    range = config->startRange2e;
    effect->start58 = config->start2c -
                      ((range + (s32)((u32)range >> 31)) >> 1);
    effect->startRange5a = config->startRange2e;
    effect->angle30 = config->angle24;
    range = config->angle24;
    effect->acceleration2c = config->acceleration20 -
                             ((range + (s32)((u32)range >> 31)) >> 1);
    effect->descriptor34 = (u16)config->descriptor1c;
    effect->scaleRange38 = config->scaleRange32;
    range = config->scaleRange32;
    effect->scale36 = config->scale30 -
                      ((range + (s32)((u32)range >> 31)) >> 1);
    effect->velocity3c = config->velocity14;
    effect->velocity40 = config->velocity18;
    effect->inverseAngleRange3a = (s16)(0x1000 - config->angleRange26);
    effect->flags44 = config->flags34;
    effect->color46 = config->color36;
    effect->animation48 = config->animation41;
    effect->tiles49 = config->tiles42;
    effect->palettes4a = config->palettes43;
    effect->field4c = config->field38;
    effect->field4e = config->field3a;
    effect->field50 = 0;
    effect->alpha52 = config->alpha3c;

    count = effect->count04;
    allocation = func_02003e20(count * 0x10 + 8, data_020f3300, 4,
                               &gHeapContext);
    if (allocation != 0)
        allocation = func_020c09cc(allocation, count, 0x10, 8,
                                   (void *)VecFx32Object_Init,
                                   (void *)VecFx32Object_Destroy);
    effect->positions08 = allocation;

    allocation = func_02003e20(count * 0x10 + 8, data_020f3300, 4,
                               &gHeapContext);
    if (allocation != 0)
        allocation = func_020c09cc(allocation, count, 0x10, 8,
                                   (void *)VecFx32Object_Init,
                                   (void *)VecFx32Object_Destroy);
    effect->velocities0c = allocation;
    effect->state10 = (s16 *)func_02003e20(count * 2, data_020f3300, 4,
                                           &gHeapContext);
    effect->values14 = (s32 *)func_02003e20(count * 4, data_020f3300, 4,
                                            &gHeapContext);
    effect->field18 = (s16 *)func_02003e20(count * 2, data_020f3300, 4,
                                           &gHeapContext);
    effect->active1c = (s16 *)func_02003e20(count * 2, data_020f3300, 4,
                                            &gHeapContext);
    effect->field20 = (s16 *)func_02003e20(count * 2, data_020f3300, 4,
                                           &gHeapContext);
    effect->field24 = (s16 *)func_02003e20(count * 2, data_020f3300, 4,
                                           &gHeapContext);
    effect->field28 = (s32 *)func_02003e20(count * 4, data_020f3300, 4,
                                           &gHeapContext);

    for (index = (s32)effect->count04 - 1; index >= 0; --index)
        effect->active1c[index] = 0;

    count = config->initialCount3e;
    if (count != 0) {
        if (count > effect->count04)
            count = effect->count04;
        while (count-- != 0)
            func_020a3804(effect, config->initialCount3e);
        if (effect->distribution4b == 2)
            effect->distribution4b = 1;
    }
    return effect;
}

#ifdef __cplusplus
}
#endif
