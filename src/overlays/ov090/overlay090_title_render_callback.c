#include "tingle/graphics_sprite_position.h"
#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Sprite-position callback for the retail phase-90 title controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021052fc;
extern void func_02031758(void);

/*
 * Run the inherited presentation callback, place the main title sprite at the
 * global actor's world position, and hide it below the retail depth threshold
 * unless controller flag bit 2 overrides the check. States 0x0e/0x0f also
 * position the secondary sprite along the timer-driven diagonal title path.
 */
void func_ov090_0221a544(void *context, void *self,
                         const GraphicsPositionSource *origin)
{
    void *actor;

    func_02031758();
    actor = FIELD(void *, data_021052fc, 0x2ea4);
    if (FIELD(GraphicsSpriteState *, self, 0x200) != 0) {
        u8 state = FIELD(u8, self, 0x1ec);
        s32 offset = state == 0x1f ? -0x18000 : 0;
        GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(
            FIELD(GraphicsSpriteState *, self, 0x200), origin,
            FIELD(s32, actor, 0x1c), FIELD(s32, actor, 0x20) + offset,
            FIELD(s32, actor, 0x24), 8);
        if (FIELD(s32, actor, 0x20) < 0x200000 ||
            (FIELD(u8, self, 0x222) & 4) != 0) {
            FIELD(u8, FIELD(void *, self, 0x200), 0x3a) = 0;
            FIELD(u16, FIELD(void *, self, 0x200), 0x28) = 0;
        }
    }

    if ((u8)(FIELD(u8, self, 0x1ec) + 0xf2) <= 1) {
        VecFx32Object position;
        s32 factor;

        VecFx32Object_InitCopy(&position,
                               (const VecFx32Object *)((u8 *)actor + 0x18));
        if (FIELD(u8, self, 0x1ec) == 0x0e)
            factor = 0x80;
        else
            factor = 0x7f - FIELD(u16, self, 0x1f0);
        position.value.z -= factor * 0x4cd;
        position.value.y -= factor * (0x4cd >> 1) + 0x10000;
        GraphicsSpriteState_SetDepthOrderedWorldPosition(
            FIELD(GraphicsSpriteState *, self, 0x248), position.value.x,
            position.value.y, position.value.z, 4);
        FIELD(u16, FIELD(void *, self, 0x248), 0x24) &= ~0x10;
        FIELD(u8, FIELD(void *, self, 0x248), 0x3a) = 0;
        FIELD(u16, FIELD(void *, self, 0x248), 0x28) = 0x10;
        VecFx32Object_Destroy(&position);
    } else {
        FIELD(u16, FIELD(void *, self, 0x248), 0x24) |= 0x10;
    }
}
