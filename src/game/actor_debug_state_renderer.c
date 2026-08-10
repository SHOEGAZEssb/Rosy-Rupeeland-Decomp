#include "tingle/types.h"

/* Render recovered actor, attachment, motion, and collection state as debug text. */
extern void *gDebugFont;
extern const char *data_020defec[];
extern const char *data_020defc0[];
extern const char *data_020defd0[];
extern char data_020df100[];
extern char data_020df114[];
extern char data_020df12c[];
extern char data_020df140[];
extern char data_020df158[];
extern char data_020df174[];
extern char data_020df18c[];
extern char data_020df1a8[];
extern char data_020df1c0[];
extern char data_020df1d8[];
extern char data_020df1f0[];
extern char data_020df1f8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void DebugText_Printf(void *font, s32 page, s32 row, s32 column,
                             const char *format, ...);
extern void *Actor_GetCollection(void *actor);
extern s32 func_020adcac(const void *first, const void *second);
#ifdef __cplusplus
}
#endif

/* Map the sparse actor type byte to the confirmed eight-entry debug label table. */
static u32 actorTypeLabelIndex(u8 type)
{
    switch (type) {
    case 1: return 0;
    case 2: return 1;
    case 3: return 2;
    case 5: return 3;
    case 7: return 4;
    case 9: return 5;
    case 4: return 6;
    default: return 7;
    }
}

/*
 * Draw actor diagnostics at the supplied debug-text column. Rows 1..9 show
 * type/subtype, actor flags, attachment flags and animation values (or explicit
 * missing-attachment messages), integer position/cached height, three motion
 * vectors scaled by 512, and distance to collection field 0x2e7c. Row 22
 * reports the inverse state of actor flag 0x80000000. Returns no value; writes
 * only through the debug-font renderer and reads the actor's collection.
 */
void func_02033b38(void *self, s32 column)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);
    u32 attachmentFlags;
    u8 *collection;
    u8 *reference;
    s32 distance;

    DebugText_Printf(gDebugFont, 1, 1, column, data_020df100,
                     data_020defec[actorTypeLabelIndex(actor[0x4d])],
                     *(u16 *)(actor + 0x4e));
    DebugText_Printf(gDebugFont, 1, 2, column, data_020df114,
                     *(u32 *)(actor + 0x14), *(u32 *)(actor + 0x10));

    if (attachment != 0) {
        attachmentFlags = *(u16 *)(attachment + 0x24);
        DebugText_Printf(gDebugFont, 1, 3, column, data_020df12c,
                         attachmentFlags,
                         data_020defc0[(attachmentFlags & 0x0c) != 0 ? 5 : 4]);
        DebugText_Printf(gDebugFont, 1, 4, column, data_020df140,
                         *(u16 *)(attachment + 0x28), attachment[0x3a]);
    } else {
        DebugText_Printf(gDebugFont, 1, 3, column, data_020df158);
        DebugText_Printf(gDebugFont, 1, 4, column, data_020df174);
    }

    DebugText_Printf(gDebugFont, 1, 5, column, data_020df18c,
                     *(s32 *)(actor + 0x1c) >> 12,
                     *(s32 *)(actor + 0x20) >> 12,
                     *(s32 *)(actor + 0x24) >> 12,
                     *(s32 *)(actor + 0x1dc) >> 12);
    DebugText_Printf(gDebugFont, 1, 6, column, data_020df1a8,
                     *(s32 *)(actor + 0x3c) >> 9,
                     *(s32 *)(actor + 0x40) >> 9,
                     *(s32 *)(actor + 0x44) >> 9);
    DebugText_Printf(gDebugFont, 1, 7, column, data_020df1c0,
                     *(s32 *)(actor + 0x8c) >> 9,
                     *(s32 *)(actor + 0x90) >> 9,
                     *(s32 *)(actor + 0x94) >> 9);
    DebugText_Printf(gDebugFont, 1, 8, column, data_020df1d8,
                     *(s32 *)(actor + 0x9c) >> 9,
                     *(s32 *)(actor + 0xa0) >> 9,
                     *(s32 *)(actor + 0xa4) >> 9);

    collection = (u8 *)Actor_GetCollection(actor);
    reference = *(u8 **)(collection + 0x2e7c);
    distance = func_020adcac(reference + 0x1c, actor + 0x1c);
    DebugText_Printf(gDebugFont, 1, 9, column, data_020df1f0,
                     distance >> 12);
    DebugText_Printf(gDebugFont, 1, 22, column, data_020df1f8,
                     data_020defd0[(*(u32 *)(actor + 0x14) & 0x80000000) == 0]);
}
