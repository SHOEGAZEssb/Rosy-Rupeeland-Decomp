#include "tingle/types.h"

/* Forward an extended type-two render callback and update its helper position. */
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *manager);
extern void func_020a25c8(void *effect, s32 kind, s32 x, s32 y,
                          s32 width, s32 height, s32 duration);
extern void Actor_UpdatePresentation(void *screenPosition, void *actor,
                                     const void *viewPosition);
extern void VecFx32Object_InitCopy(void *vector, const void *source);
extern void VecFx32Object_Destroy(void *vector);
#ifdef __cplusplus
}
#endif

/*
 * When actor +0x260 bit 0x100000 is set and attachment +0x24 has none of bits
 * 0x04/0x08/0x10, increment byte +0x294. After it exceeds 20, emit a kind-zero
 * effect through manager +0x2f7c at actor X-16 and Y-Z-24 (shifted down 12),
 * using constants 32,24,70, then reset the byte. Always forward the screen
 * position, actor, and view position to Actor_UpdatePresentation. Copy actor
 * vector +0x18 to a temporary vector,
 * add signed halfword +0x6a times 0xb33 to its Z component, invoke helper
 * +0x284 virtual +0x0c with the view position, temporary vector, and zero, then destroy
 * the temporary vector. Returns no value; effect, actor, helper, and temporary
 * vector state may change.
 */
void ActorExtendedType2_RunRenderCallback(void *screenPosition, void *self,
                                          const void *viewPosition)
{
    u8 *actor = (u8 *)self;
    s32 position[4];

    if ((*(u32 *)(actor + 0x260) & 0x100000) != 0 &&
        (*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 0x1c) == 0) {
        ++actor[0x294];
        if (actor[0x294] > 20) {
            void *effect = RuntimePresentationManager_GetGraphics3dPresentation(data_021052fc + 0x2f7c);
            func_020a25c8(effect, 0,
                          (*(s32 *)(actor + 0x1c) >> 12) - 16,
                          (*(s32 *)(actor + 0x20) >> 12) -
                              (*(s32 *)(actor + 0x24) >> 12) - 24,
                          32, 24, 70);
            actor[0x294] = 0;
        }
    }

    Actor_UpdatePresentation(screenPosition, actor, viewPosition);
    VecFx32Object_InitCopy(position, actor + 0x18);
    position[2] += *(s16 *)(actor + 0x6a) * 0xb33;
    {
        u8 *helper = actor + 0x284;
        (*(void (**)(void *, const void *, void *, s32))(
            *(u8 **)helper + 0x0c))(helper, viewPosition, position, 0);
    }
    VecFx32Object_Destroy(position);
}
