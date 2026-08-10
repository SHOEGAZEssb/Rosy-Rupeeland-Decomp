#include "tingle/types.h"

/* Render diagnostic state and packed terrain data for a type-1 actor. */
extern const char data_020df4ac[];
extern const char *data_020df294[];
extern void *gDebugFont;
extern const char data_020df4b8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02033b38(void *actor, s32 line);
extern s32 Actor_QueryTerrainCell(void *actor, s32 x, s32 y);
extern void DebugText_Printf(void *font, s32 screen, s32 row, s32 column,
                            const char *format, ...);
#ifdef __cplusplus
}
#endif

/*
 * Draw the common actor diagnostic at line, then print the state-name table
 * entry indexed by signed halfword +0xd6. Query terrain at actor X/Y integer
 * coordinates and print the packed result together with fields bits 10..13,
 * bits 5..9, and sign-extended bits 0..4. Returns no value. Debug font output
 * is the only direct observable SDK effect; no actor fields are modified.
 */
void ActorDerivedType1_DrawDebugInfo(void *self, s32 line)
{
    u8 *actor = (u8 *)self;
    s32 packed;

    func_02033b38(actor, line);
    DebugText_Printf(gDebugFont, 1, 0xb, line, data_020df4ac,
                     data_020df294[*(s16 *)(actor + 0xd6)]);
    packed = Actor_QueryTerrainCell(actor, *(s32 *)(actor + 0x1c) >> 16,
                           *(s32 *)(actor + 0x20) >> 16);
    DebugText_Printf(gDebugFont, 1, 0xc, line, data_020df4b8,
                     (packed >> 10) & 0xf, (packed >> 5) & 0x1f,
                     (packed << 27) >> 27, packed, packed);
}
