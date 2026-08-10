#include "tingle/types.h"

/* Recovered late-duration presentation-stage selector for an animation-sequenced impulse actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *presentation, u8 stage);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is a sequence actor. Increments signed timer 0x1F8 and selects stage 3,
 * 4, or 5 relative to signed record duration halfword 0x28: stage 5 after
 * duration minus 60, stage 4 after duration minus 120, otherwise stage 3. If
 * the stage differs from presentation byte 0x38, applies it through
 * GraphicsSpriteState_SetAnimationIndex and clears presentation bit 0 at offset 0x24. Returns nothing;
 * presentation state changes but hardware is not accessed directly.
 */
void func_020521e4(void *actor)
{
    s16 timer = ++FIELD(s16, actor, 0x1f8);
    const void *record = FIELD(const void *, actor, 0x1fc);
    s16 duration = FIELD(s16, record, 0x28);
    u8 stage;
    void *presentation;

    if (timer > duration - 0x3c)
        stage = 5;
    else if (timer > duration - 0x78)
        stage = 4;
    else
        stage = 3;
    presentation = FIELD(void *, actor, 0x54);
    if (stage == FIELD(u8, presentation, 0x38))
        return;
    GraphicsSpriteState_SetAnimationIndex(presentation, stage);
    FIELD(u16, presentation, 0x24) &= (u16)~1;
}
