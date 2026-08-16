#include "tingle/graphics_3d_command.h"

/*
 * Direct geometry-engine polygon-attribute command helper. It packs the six
 * caller-supplied fields into the NDS polygon-attribute register word without
 * validating or masking them.
 */

#define REG_G3_POLYGON_ATTR (*(volatile u32 *)0x040004a4)

#ifndef MATCHING
extern void TingleNativeG3_SetPolygonAttr(u32 value);
#endif

/*
 * Write one polygon-attribute command. lightMask occupies bits 0..3,
 * polygonMode bits 4..5, cullMode bits 6..7, alpha bits 16..20, and polygonId
 * bits 24..29; miscFlags is ORed in unchanged. Inputs outside those widths can
 * overlap other fields exactly as in retail. The only state change is the
 * volatile write to the NDS geometry engine at 0x040004a4; there is no return.
 */
void Graphics3DCommand_SetPolygonAttr(u32 lightMask, u32 polygonMode,
                                      u32 cullMode, u32 polygonId, u32 alpha,
                                      u32 miscFlags)
{
    u32 value = lightMask | (polygonMode << 4) | (cullMode << 6) |
                miscFlags | (polygonId << 24) | (alpha << 16);
    REG_G3_POLYGON_ATTR = value;
#ifndef MATCHING
    TingleNativeG3_SetPolygonAttr(value);
#endif
}
