#include "tingle/types.h"

/*
 * Ordered progression-flag query chain recovered from ARM9 0x02083AF8 through
 * 0x020857AC.
 *
 * These callbacks back the resident indexed-handler tables used by the phase
 * script VM.  Each stage requires all earlier milestones and its own ordered
 * GameWork flags.  The one exclusion at flag 0x25d is preserved: that flag
 * makes the first stage false.  Calls borrow gGameWork and return normalized
 * zero/one values without changing save state.
 */

extern void *gGameWork;
extern s32 GameWork_TestFlag(void *work, s32 flag);
extern void GameWork_SetFlag(void *work, s32 flag);

static s32 AllFlags(const u16 *flags, u32 count)
{
    u32 index;

    for (index = 0; index < count; ++index)
        if (!GameWork_TestFlag(gGameWork, flags[index]))
            return 0;
    return 1;
}

/* Test the initial milestone set, including the retail 0x25d exclusion. */
s32 func_02083af8(void)
{
    static const u16 required[] = {0x25a, 0x75f};
    static const u16 trailing[] = {0x73b, 0x746};

    if (!AllFlags(required, 2) || GameWork_TestFlag(gGameWork, 0x25d))
        return 0;
    return AllFlags(trailing, 2);
}

/* Extend the initial milestone with flags 0x25e and 0x760. */
s32 func_02083ba4(void)
{
    static const u16 flags[] = {0x25e, 0x760};
    return func_02083af8() && AllFlags(flags, 2);
}

/* Extend the chain through the eight area/progression flags used at 0x840dc. */
s32 func_020840dc(void)
{
    static const u16 flags[] = {
        0xbe1, 0x769, 0x078, 0x079, 0x399, 0x770, 0x78c, 0x749
    };
    return func_02083ba4() && AllFlags(flags, 8);
}

/* Extend the chain through the eight flags used at 0x845a0. */
s32 func_020845a0(void)
{
    static const u16 flags[] = {
        0xbe2, 0x774, 0x78e, 0x77a, 0x78a, 0x7f9, 0x74e, 0x7ae
    };
    return func_020840dc() && AllFlags(flags, 8);
}

/* Extend the chain through the eight flags used at 0x849f4. */
s32 func_020849f4(void)
{
    static const u16 flags[] = {
        0xbe3, 0x786, 0x796, 0x79a, 0x7c7, 0x79e, 0x794, 0x7ca
    };
    return func_020845a0() && AllFlags(flags, 8);
}

/* Return the final indexed-handler milestone state. */
s32 func_020857ac(void)
{
    static const u16 flags[] = {0x7cb, 0x80d};
    return func_020849f4() && AllFlags(flags, 2);
}

/* Secondary-table classification paired with the 0x857ac query. */
s32 func_020895a8(void)
{
    return func_020849f4() && GameWork_TestFlag(gGameWork, 0x7ca);
}

/* Extend the shared chain through the six flags used at 0x8514c. */
s32 func_0208514c(void)
{
    static const u16 flags[] = {0xbe4, 0x7ac, 0x7b2, 0x7bd, 0x7d0, 0x8cf};
    return func_020849f4() && AllFlags(flags, 6);
}

/* Primary-table classification for indexed runtime entry 80. */
s32 func_02085834(void)
{
    return func_0208514c() && GameWork_TestFlag(gGameWork, 0x7cf);
}

/* Secondary-table classification for indexed runtime entry 80. */
s32 func_02089610(void)
{
    return func_0208514c() && GameWork_TestFlag(gGameWork, 0x7ce);
}

/* Establish the shared branch leading to indexed runtime entry 41. */
s32 func_02084754(void)
{
    static const u16 flags[] = {0x1f4, 0x77b, 0x788, 0x8aa, 0x8cf};
    return func_020845a0() && AllFlags(flags, 5);
}

/* Extend the branch through the three flags used at 0x87c6c. */
s32 func_02087c6c(void)
{
    static const u16 flags[] = {0x8ab, 0x77c, 0x299};
    return func_02084754() && AllFlags(flags, 3);
}

/* Extend the branch through the three flags used at 0x8480c. */
s32 func_0208480c(void)
{
    static const u16 flags[] = {0x1fc, 0x77d, 0x77f};
    return func_02087c6c() && AllFlags(flags, 3);
}

/* Establish the parallel prerequisite branch used at 0x84884. */
s32 func_02084d88(void)
{
    static const u16 flags[] = {0x78b, 0x77e};
    return func_020845a0() && AllFlags(flags, 2);
}

/* Extend the parallel prerequisite through three additional flags. */
s32 func_02084884(void)
{
    static const u16 flags[] = {0x1fd, 0x775, 0x77f};
    return func_02084d88() && AllFlags(flags, 3);
}

/* Primary-table classification for indexed runtime entry 41. */
s32 func_02084900(void)
{
    static const u16 flags[] = {0x1fe, 0x780, 0x16a, 0x81d};
    return func_02084884() && func_0208480c() && AllFlags(flags, 4);
}

/* Secondary-table classification for indexed runtime entry 41. */
s32 func_02088dc4(void)
{
    return func_02084884() && func_0208480c() &&
           GameWork_TestFlag(gGameWork, 0x77f);
}

/* Set the retail progression flag selected by callback 0x0208EAC0. */
void func_0208eac0(void)
{
    GameWork_SetFlag(gGameWork, 0x73a);
}

/* Set the retail progression flag selected by callback 0x0208EB04. */
void func_0208eb04(void)
{
    GameWork_SetFlag(gGameWork, 0x73c);
}

/* Set the retail progression flag selected by callback 0x0208EB24. */
void func_0208eb24(void)
{
    GameWork_SetFlag(gGameWork, 0x73d);
}

/* Set the retail progression flag selected by callback 0x0208EBBC. */
void func_0208ebbc(void)
{
    GameWork_SetFlag(gGameWork, 0x73f);
}

/* Set flag 0x740 through callback 0x0208EBDC. */
void func_0208ebdc(void) { GameWork_SetFlag(gGameWork, 0x740); }
/* Set flag 0x790 through callback 0x0208EBF8. */
void func_0208ebf8(void) { GameWork_SetFlag(gGameWork, 0x790); }
/* Set flag 0x792 through callback 0x0208EC14. */
void func_0208ec14(void) { GameWork_SetFlag(gGameWork, 0x792); }
/* Set flag 0x7a6 through callback 0x0208EC34. */
void func_0208ec34(void) { GameWork_SetFlag(gGameWork, 0x7a6); }
/* Set flag 0x7bc through callback 0x0208EC54. */
void func_0208ec54(void) { GameWork_SetFlag(gGameWork, 0x7bc); }
/* Set flag 0x7de through callback 0x0208EC74. */
void func_0208ec74(void) { GameWork_SetFlag(gGameWork, 0x7de); }
/* Set flag 0x7e6 through callback 0x0208EC94. */
void func_0208ec94(void) { GameWork_SetFlag(gGameWork, 0x7e6); }
/* Set flag 0x7fe through callback 0x0208ECB4. */
void func_0208ecb4(void) { GameWork_SetFlag(gGameWork, 0x7fe); }
/* Set flag 0x814 through callback 0x0208ECD4. */
void func_0208ecd4(void) { GameWork_SetFlag(gGameWork, 0x814); }
/* Set flag 0x842 through callback 0x0208ECF4. */
void func_0208ecf4(void) { GameWork_SetFlag(gGameWork, 0x842); }
/* Set flag 0x844 through callback 0x0208ED14. */
void func_0208ed14(void) { GameWork_SetFlag(gGameWork, 0x844); }

/* Set the retail progression flag selected by callback 0x0208ED7C. */
void func_0208ed7c(void) { GameWork_SetFlag(gGameWork, 0x742); }

/* Set the retail progression flag selected by callback 0x0208F1DC. */
void func_0208f1dc(void) { GameWork_SetFlag(gGameWork, 0x75c); }

/* Set flag 0x750 through callback 0x0208F11C. */
void func_0208f11c(void) { GameWork_SetFlag(gGameWork, 0x750); }
/* Set flag 0x751 through callback 0x0208F138. */
void func_0208f138(void) { GameWork_SetFlag(gGameWork, 0x751); }
/* Set flag 0x752 through callback 0x0208F158. */
void func_0208f158(void) { GameWork_SetFlag(gGameWork, 0x752); }
/* Set flag 0x753 through callback 0x0208F178. */
void func_0208f178(void) { GameWork_SetFlag(gGameWork, 0x753); }
/* Set flag 0x78e through callback 0x0208F198. */
void func_0208f198(void) { GameWork_SetFlag(gGameWork, 0x78e); }
