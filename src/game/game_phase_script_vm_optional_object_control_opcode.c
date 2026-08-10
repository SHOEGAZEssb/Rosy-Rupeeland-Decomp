#include "tingle/game_phase_script_vm.h"

/* Control the optional singleton object returned by ActorDerivedType1_GetSingletonObject. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorDerivedType1_GetSingletonObject(void);
extern void func_ov088_02218130(void *object, s32 first, s32 second);
extern void func_ov088_0221a8c4(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Consume two unused operands, then pop second, first, enable, and mode.
 * Mode 0 invokes the object's two-value overlay operation; mode 2 invokes a
 * second operation when the object exists.  Modes 3..5 update bits 0x8000,
 * 0x8, and 0x4 in halfword 0x21a respectively (mode 3 uses inverted enable
 * semantics).  Mode 1 and unsupported modes do nothing.  Return zero.
 */
s32 func_0201a1f0(GamePhaseActorScriptVm *self)
{
    s32 second;
    s32 first;
    s32 enabled;
    s32 mode;
    u8 *object;
    (void)func_02012704(&self->base);
    (void)func_02012704(&self->base);
    second = (s32)func_02012704(&self->base);
    first = (s32)func_02012704(&self->base);
    enabled = (s32)func_02012704(&self->base);
    mode = (s32)func_02012704(&self->base);
    object = (u8 *)ActorDerivedType1_GetSingletonObject();

    switch (mode) {
    case 0:
        func_ov088_02218130(object, first, second);
        break;
    case 2:
        if (object)
            func_ov088_0221a8c4(object);
        break;
    case 3:
        if (object) {
            u16 *flags = (u16 *)(object + 0x21a);
            if (enabled)
                *flags &= (u16)~0x8000;
            else
                *flags |= 0x8000;
        }
        break;
    case 4:
        if (object) {
            u16 *flags = (u16 *)(object + 0x21a);
            if (enabled)
                *flags |= 8;
            else
                *flags &= (u16)~8;
        }
        break;
    case 5:
        if (object) {
            u16 *flags = (u16 *)(object + 0x21a);
            if (enabled)
                *flags |= 4;
            else
                *flags &= (u16)~4;
        }
        break;
    }
    return 0;
}
