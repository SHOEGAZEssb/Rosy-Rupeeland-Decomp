#include "tingle/types.h"

/* Overlay 94 construction for the title/menu's paired sprite effect. */

extern u8 *data_021052fc;
extern const u8 data_ov094_02219e9c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020948e4(void *motion, s32 mode, s32 coordinate);
extern void func_02094bbc(void *effect, s32 x, s32 y, s32 z);
extern void func_020953c8(void *effect, void *firstState);
#ifdef __cplusplus
}
#endif

/*
 * Initializes the inherited paired-state effect with the first sprite state,
 * installs its dispatch record, records the second state, and sets its base
 * position from firstCoordinate. The +0x1C motion member receives
 * secondCoordinate. Both states then receive the area-dependent affine mode
 * and 15-bit parameter derived from that coordinate. thirdCoordinate is
 * narrowed to a signed halfword for +0x7C, +0x80 is cleared, and +0x88 is set.
 * Returns the effect; helper calls update sprite/effect state without direct
 * hardware access.
 */
extern "C" void *func_ov094_02219344(void *effect, void *firstState,
                                      void *secondState,
                                      s32 firstCoordinate,
                                      s32 secondCoordinate,
                                      s32 thirdCoordinate)
{
    func_020953c8(effect, firstState);
    *(const void **)effect = data_ov094_02219e9c;
    *(s32 *)((u8 *)effect + 0xa0) = 0;
    *(void **)((u8 *)effect + 0xa4) = secondState;
    func_02094bbc(effect, firstCoordinate, -0x110000, 0);
    func_020948e4((u8 *)effect + 0x1c, 1, secondCoordinate);

    u16 parameter = (u16)(0x7fff - secondCoordinate / 0x1000);
    void *area = *(void **)(data_021052fc + 0x30bc);
    firstState = *(void **)((u8 *)effect + 0x9c);
    if (*(s32 *)area == 0xa7) {
        *(volatile u8 *)((u8 *)firstState + 0x3a) = 0;
        *(volatile u16 *)((u8 *)firstState + 0x28) = 0xffff;
        secondState = *(void **)((u8 *)effect + 0xa4);
        *(volatile u8 *)((u8 *)secondState + 0x3a) = 0;
        *(volatile u16 *)((u8 *)secondState + 0x28) = 0xffff;
    } else {
        *(volatile u8 *)((u8 *)firstState + 0x3a) = 1;
        *(volatile u16 *)((u8 *)firstState + 0x28) = parameter;
        secondState = *(void **)((u8 *)effect + 0xa4);
        *(volatile u8 *)((u8 *)secondState + 0x3a) = 1;
        *(volatile u16 *)((u8 *)secondState + 0x28) = parameter;
    }

    *(s32 *)((u8 *)effect + 0x7c) = (s16)thirdCoordinate;
    *(s32 *)((u8 *)effect + 0x80) = 0;
    *(s32 *)((u8 *)effect + 0x88) = 1;
    return effect;
}
