#include "tingle/graphics_3d_light.h"

/*
 * Initialization and direct NDS geometry-engine submission for one 0x10-byte
 * directional light. Coordinates are retained as 32-bit fields but retail
 * consumes their low signed 16 bits and converts them to packed signed 10-bit
 * light-vector components.
 */

#define REG_G3_LIGHT_VECTOR (*(volatile u32 *)0x040004c8)
#define REG_G3_LIGHT_COLOR (*(volatile u32 *)0x040004cc)

/* Clear all coordinates, RGB555 color, and the 16-bit enabled selector. */
void Graphics3DLight_Init(Graphics3DLight *light)
{
    light->z = 0;
    light->y = 0;
    light->x = 0;
    light->color = 0;
    light->enabled = 0;
}

/* No-op element destructor; it changes no state and performs no hardware access. */
void Graphics3DLight_DestroyNoOp(Graphics3DLight *light)
{
    (void)light;
}

/*
 * If enabled is exactly one, convert each low signed halfword from the stored
 * scale by shifting right three, pack the low ten bits as X/Y/Z, OR lightId
 * into bits 30..31, and write LIGHT_VECTOR followed by LIGHT_COLOR. Other
 * enabled values produce no writes. lightId is not masked before shifting.
 */
void Graphics3DLight_Apply(const Graphics3DLight *light, u32 lightId)
{
    s32 x;
    s32 y;
    s32 z;

    if (light->enabled != 1) {
        return;
    }
    x = (s16)light->x >> 3;
    y = (s16)light->y >> 3;
    z = (s16)light->z >> 3;
    REG_G3_LIGHT_VECTOR = ((u32)x & 0x3ff) | (((u32)y & 0x3ff) << 10) |
                          (((u32)z & 0x3ff) << 20) | (lightId << 30);
    REG_G3_LIGHT_COLOR = light->color | (lightId << 30);
}
