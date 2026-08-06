#include "tingle/types.h"

/*
 * Recovered extended type-two actor debug overlay. It identifies stored member
 * callbacks and prints the actor's state, positions, handles, flags, and timers.
 */
extern u8 data_020df9e8[];
extern u8 data_020dfac0[], data_020dfb98[], data_020dfba8[];
extern u8 data_020dfb90[], data_020dfb88[], data_020dfb80[];
extern u8 data_020dfaa0[], data_020dfb70[], data_020dfb68[];
extern u8 data_020dfb60[], data_020dfa90[], data_020dfb50[];
extern u8 data_020dfb48[], data_020dfb40[], data_020dfb38[];
extern u8 data_020dfb30[], data_020dfb28[], data_020dfb20[];
extern u8 data_020dfa78[], data_020dfb10[], data_020dfac8[];
extern char data_020e00d0[], data_020e00d8[], data_020e00dc[];
extern char data_020e00e4[], data_020e00ec[], data_020e00f4[];
extern char data_020e00f8[], data_020e0100[], data_020e010c[];
extern char data_020e0110[], data_020e011c[], data_020e0124[];
extern char data_020e012c[], data_020e0134[], data_020e013c[];
extern char data_020e0144[], data_020e0150[], data_020e0158[];
extern char data_020e0160[], data_020e0168[], data_020e016c[];
extern char data_020e0178[], data_020e0184[], data_020e0194[];
extern char data_020e019c[], data_020e01a4[], data_020e01b4[];
extern char data_020e01c4[], data_020e01e4[], data_020e01f4[];
extern char data_020e0204[], data_020e0214[];
extern char *data_020dfce4[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02033b38(void *actor, s32 row);
extern void DebugText_Printf(void *font, s32 x, s32 y, s32 row,
                             const char *format, ...);
#ifdef __cplusplus
}
#endif

typedef struct CallbackDebugName {
    u32 functionOffset;
    const u8 *adjustmentObject;
    const char *name;
} CallbackDebugName;

/* Match the two-word member-function representation, including its null form. */
static s32 callback_pair_matches(u32 first, u32 second,
                                 const CallbackDebugName *entry)
{
    u32 expectedFirst = *(u32 *)(data_020df9e8 + entry->functionOffset);
    if (first != expectedFirst)
        return 0;
    return second == *(const u32 *)(entry->adjustmentObject + 4) || first == 0;
}

/*
 * Invoke base debug routine func_02033b38(actor,row), identify actor callback
 * pair +0x218/+0x21c against 16 known global member-function representations,
 * and print its name at debug line 12 when recognized. Identify +0x220/+0x224
 * against five representations and print line 13. Lines 14..21 then print the
 * state name indexed by signed halfword +0xd6, saved integer position
 * +0x230/+0x234, presence of handle +0x274, flags +0x260, optional object
 * +0x26c's cached +0x26a value split by 60, presence of record set +0x278,
 * +0x24e when the primary callback is the +0xe0 representation, and countdown
 * +0x1fc. All text and formats come from address-preserved data symbols. The
 * routine has no meaningful return value, reads actor state, and mutates only
 * the debug-font output surface through DebugText_Printf.
 */
void func_02042864(void *self, s32 row)
{
    u8 *actor = (u8 *)self;
    const char *name = 0;
    s32 i;
    static const CallbackDebugName primary[] = {
        {0xd8, data_020dfac0, data_020e00d0},
        {0x1b0, data_020dfb98, data_020e00d8},
        {0x1c0, data_020dfba8, data_020e00dc},
        {0x1a8, data_020dfb90, data_020e00e4},
        {0x1a0, data_020dfb88, data_020e00ec},
        {0x198, data_020dfb80, data_020e00f4},
        {0xb8, data_020dfaa0, data_020e00f8},
        {0x188, data_020dfb70, data_020e0100},
        {0x180, data_020dfb68, data_020e010c},
        {0x178, data_020dfb60, data_020e0110},
        {0xa8, data_020dfa90, data_020e011c},
        {0x168, data_020dfb50, data_020e0124},
        {0x160, data_020dfb48, data_020e012c},
        {0x158, data_020dfb40, data_020e0134},
        {0x150, data_020dfb38, data_020e013c}
    };
    static const CallbackDebugName secondary[] = {
        {0x148, data_020dfb30, data_020e0150},
        {0x140, data_020dfb28, data_020e0158},
        {0x138, data_020dfb20, data_020e0160},
        {0x90, data_020dfa78, data_020e0168},
        {0x128, data_020dfb10, data_020e00e4}
    };

    func_02033b38(actor, row);
    for (i = 0; i < (s32)(sizeof(primary) / sizeof(primary[0])); ++i) {
        if (callback_pair_matches(*(u32 *)(actor + 0x218),
                                  *(u32 *)(actor + 0x21c), &primary[i])) {
            name = primary[i].name;
            break;
        }
    }
    if (name != 0)
        DebugText_Printf(gDebugFont, 1, 12, row, data_020e0144, name);

    name = 0;
    for (i = 0; i < (s32)(sizeof(secondary) / sizeof(secondary[0])); ++i) {
        if (callback_pair_matches(*(u32 *)(actor + 0x220),
                                  *(u32 *)(actor + 0x224), &secondary[i])) {
            name = secondary[i].name;
            break;
        }
    }
    if (name != 0)
        DebugText_Printf(gDebugFont, 1, 13, row, data_020e016c, name);

    DebugText_Printf(gDebugFont, 1, 14, row, data_020e0178,
                     data_020dfce4[*(s16 *)(actor + 0xd6)]);
    DebugText_Printf(gDebugFont, 1, 15, row, data_020e0184,
                     *(s32 *)(actor + 0x230) >> 12,
                     *(s32 *)(actor + 0x234) >> 12);
    DebugText_Printf(gDebugFont, 1, 16, row, data_020e01a4,
                     *(void **)(actor + 0x274) ? data_020e0194 : data_020e019c);
    DebugText_Printf(gDebugFont, 1, 17, row, data_020e01b4,
                     *(u32 *)(actor + 0x260));
    if (*(void **)(actor + 0x26c) != 0) {
        u16 value = *(u16 *)(actor + 0x26a);
        DebugText_Printf(gDebugFont, 1, 18, row, data_020e01c4,
                         value / 60, value % 60);
    } else {
        DebugText_Printf(gDebugFont, 1, 18, row, data_020e01e4);
    }
    DebugText_Printf(gDebugFont, 1, 19, row, data_020e01f4,
                     *(void **)(actor + 0x278) ? data_020e0194 : data_020e019c);
    {
        CallbackDebugName progress = {0xe0, data_020dfac8, 0};
        if (callback_pair_matches(*(u32 *)(actor + 0x218),
                                  *(u32 *)(actor + 0x21c), &progress))
            DebugText_Printf(gDebugFont, 1, 20, row, data_020e0204,
                             *(u16 *)(actor + 0x24e));
    }
    DebugText_Printf(gDebugFont, 1, 21, row, data_020e0214,
                     *(s32 *)(actor + 0x1fc));
}
