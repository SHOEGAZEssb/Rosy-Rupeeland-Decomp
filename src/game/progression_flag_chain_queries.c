#include "tingle/types.h"

/*
 * Ordered progression-flag query chains recovered from the resident ARM9
 * availability callback tables.
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
extern void GameWork_ClearFlag(void *work, s32 flag);

extern s32 ProgressionFlags_TestGateBE5_7DC_7F3_8B5_7A8(void);
extern s32 ProgressionFlags_TestGateBE6_7EB_7FB_8D1_8B3(void);
extern s32 ProgressionFlags_TestGate800_801(void);
extern s32 ProgressionFlags_TestGateBE8_815_82F_817_827_829_8D3_825(void);
extern s32 ProgressionFlags_TestGate8B8_7B9_7F7(void);
extern s32 ProgressionFlags_TestGate8CE_80B(void);
extern s32 ProgressionFlags_TestMilestoneBE4(void);
extern s32 ProgressionFlags_TestGate7FA_7FC(void);

static s32 AllFlags(const u16 *flags, u32 count)
{
    u32 index;

    for (index = 0; index < count; ++index)
        if (!GameWork_TestFlag(gGameWork, flags[index]))
            return 0;
    return 1;
}

/*
 * Establish the initial progression milestone selected by the resident
 * callback tables.  The call borrows gGameWork, sets flags 0x25a, 0x75f,
 * 0x73b, and 0x746, and clears the mutually exclusive flag 0x25d.
 */
void ProgressionFlags_SetInitialMilestone(void)
{
    GameWork_SetFlag(gGameWork, 0x25a);
    GameWork_SetFlag(gGameWork, 0x75f);
    GameWork_ClearFlag(gGameWork, 0x25d);
    GameWork_SetFlag(gGameWork, 0x73b);
    GameWork_SetFlag(gGameWork, 0x746);
}

/*
 * Complete the rupee-pond progression callback by establishing the shared
 * initial milestone, then set its two scene-specific completion flags.
 */
void ProgressionFlags_SetRupeePondCompletion(void)
{
    ProgressionFlags_SetInitialMilestone();
    GameWork_SetFlag(gGameWork, 0x25e);
    GameWork_SetFlag(gGameWork, 0x760);
}

/*
 * Complete the related progression callback by establishing the shared
 * milestone and setting its three retail completion flags. The only borrowed
 * object is gGameWork; the observable effect is the four set/clear operations
 * performed by ProgressionFlags_SetInitialMilestone followed by flags 0x398, 0x76b, and 0x1f0.
 */
void ProgressionFlags_SetRelatedCompletion398_76B_1F0(void)
{
    ProgressionFlags_SetInitialMilestone();
    GameWork_SetFlag(gGameWork, 0x398);
    GameWork_SetFlag(gGameWork, 0x76b);
    GameWork_SetFlag(gGameWork, 0x1f0);
}

/* Set the paired progression flags consumed by the shared 0x02084B10 gate. */
void ProgressionFlags_SetGate755And770(void)
{
    GameWork_SetFlag(gGameWork, 0x755);
    GameWork_SetFlag(gGameWork, 0x770);
}

/* Set the paired progression flags used by the 0x02089020 callback chain. */
void ProgressionFlags_SetGate756And794(void)
{
    GameWork_SetFlag(gGameWork, 0x756);
    GameWork_SetFlag(gGameWork, 0x794);
}

/* Require both retail flags used by the bedroom-to-field availability gate. */
s32 ProgressionFlags_TestGate396_765(void)
{
    static const u16 flags[] = {0x396, 0x765};
    return AllFlags(flags, 2);
}

/* Require the paired retail progression flags 0x25b and 0x764. */
s32 func_02083d38(void)
{
    static const u16 flags[] = {0x25b, 0x764};
    return AllFlags(flags, 2);
}

/* Require the three retail progression flags 0x2c8, 0x767, and 0x74b. */
s32 ProgressionFlags_TestGate2C8_767_74B(void)
{
    static const u16 flags[] = {0x2c8, 0x767, 0x74b};
    return AllFlags(flags, 3);
}

/* Extend the 0x83d38 prerequisite with flags 0x14d and 0x768. */
s32 func_02084080(void)
{
    static const u16 flags[] = {0x14d, 0x768};
    return func_02083d38() && AllFlags(flags, 2);
}

/* Require the paired retail progression flags 0x25c and 0x761. */
s32 func_02083bfc(void)
{
    static const u16 flags[] = {0x25c, 0x761};
    return AllFlags(flags, 2);
}

/* Require the three retail flags used by field-entry availability checks. */
s32 func_020842bc(void)
{
    static const u16 flags[] = {0x25f, 0x76d, 0x8c3};
    return AllFlags(flags, 3);
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
s32 ProgressionFlags_TestMilestoneBE1(void)
{
    static const u16 flags[] = {
        0xbe1, 0x769, 0x078, 0x079, 0x399, 0x770, 0x78c, 0x749
    };
    return func_02083ba4() && AllFlags(flags, 8);
}

/* Extend the chain through the eight flags used at 0x845a0. */
s32 ProgressionFlags_TestMilestoneBE2(void)
{
    static const u16 flags[] = {
        0xbe2, 0x774, 0x78e, 0x77a, 0x78a, 0x7f9, 0x74e, 0x7ae
    };
    return ProgressionFlags_TestMilestoneBE1() && AllFlags(flags, 8);
}

/* Extend the chain through the eight flags used at 0x849f4. */
s32 ProgressionFlags_TestMilestoneBE3(void)
{
    static const u16 flags[] = {
        0xbe3, 0x786, 0x796, 0x79a, 0x7c7, 0x79e, 0x794, 0x7ca
    };
    return ProgressionFlags_TestMilestoneBE2() && AllFlags(flags, 8);
}

/* Return the final indexed-handler milestone state. */
s32 func_020857ac(void)
{
    static const u16 flags[] = {0x7cb, 0x80d};
    return ProgressionFlags_TestMilestoneBE3() && AllFlags(flags, 2);
}

/* Require the paired flags used by the shared 0x84e10 prerequisite. */
s32 ProgressionFlags_TestGate756_794(void)
{
    static const u16 flags[] = {0x756, 0x794};
    return AllFlags(flags, 2);
}

/* Join 0x84b58 and 0x849f4, then require its three ordered flags. */
s32 ProgressionFlags_TestGate795_8B7_7CC(void)
{
    static const u16 flags[] = {0x795, 0x8b7, 0x7cc};
    return ProgressionFlags_TestGate756_794() && ProgressionFlags_TestMilestoneBE3() && AllFlags(flags, 3);
}

/* Extend the 0x8514c milestone with the five flags preceding 0x859e8. */
s32 ProgressionFlags_TestGateBE5_7DC_7F3_8B5_7A8(void)
{
    static const u16 flags[] = {0xbe5, 0x7dc, 0x7f3, 0x8b5, 0x7a8};
    return ProgressionFlags_TestMilestoneBE4() && AllFlags(flags, 5);
}

/* Extend 0x85668 with the five ordered flags used by 0x859e8. */
s32 ProgressionFlags_TestGateBE6_7EB_7FB_8D1_8B3(void)
{
    static const u16 flags[] = {0xbe6, 0x7eb, 0x7fb, 0x8d1, 0x8b3};
    return ProgressionFlags_TestGateBE5_7DC_7F3_8B5_7A8() && AllFlags(flags, 5);
}

/* Extend 0x85f38 through progression flags 0x800 and 0x801. */
s32 ProgressionFlags_TestGate800_801(void)
{
    static const u16 flags[] = {0x800, 0x801};
    return ProgressionFlags_TestGate7FA_7FC() && AllFlags(flags, 2);
}

/* Extend 0x85f38 through the eight flags used by 0x86264. */
s32 ProgressionFlags_TestGateBE8_815_82F_817_827_829_8D3_825(void)
{
    static const u16 flags[] = {
        0xbe8, 0x815, 0x82f, 0x817, 0x827, 0x829, 0x8d3, 0x825
    };
    return ProgressionFlags_TestGate7FA_7FC() && AllFlags(flags, 8);
}

/* Extend 0x84e10 with progression flags 0x8b8, 0x7b9, and 0x7f7. */
s32 ProgressionFlags_TestGate8B8_7B9_7F7(void)
{
    static const u16 flags[] = {0x8b8, 0x7b9, 0x7f7};
    return ProgressionFlags_TestGate795_8B7_7CC() && AllFlags(flags, 3);
}

/* Extend 0x87ddc with progression flags 0x7c0, 0x8cd, and 0x7d2. */
s32 ProgressionFlags_TestGate7C0_8CD_7D2(void)
{
    static const u16 flags[] = {0x7c0, 0x8cd, 0x7d2};
    return ProgressionFlags_TestGate8B8_7B9_7F7() && AllFlags(flags, 3);
}

/* Extend 0x8552c with progression flags 0x8ce and 0x80b. */
s32 ProgressionFlags_TestGate8CE_80B(void)
{
    static const u16 flags[] = {0x8ce, 0x80b};
    return ProgressionFlags_TestGate7C0_8CD_7D2() && AllFlags(flags, 2);
}

/* Extend the shared 0x84b58/0x849f4 prerequisites with flag 0x794. */
s32 ProgressionFlags_TestGate794(void)
{
    return ProgressionFlags_TestGate756_794() && ProgressionFlags_TestMilestoneBE3() &&
           GameWork_TestFlag(gGameWork, 0x794);
}

/* Extend the shared 0x87ddc prerequisite with flag 0x7b9. */
s32 ProgressionFlags_TestGate7B9(void)
{
    return ProgressionFlags_TestGate8B8_7B9_7F7() && GameWork_TestFlag(gGameWork, 0x7b9);
}

/* Extend the shared 0x84e10 prerequisite with flag 0x8b7. */
s32 ProgressionFlags_TestGate8B7(void)
{
    return ProgressionFlags_TestGate795_8B7_7CC() && GameWork_TestFlag(gGameWork, 0x8b7);
}

/* Extend the shared 0x8552c prerequisite with flag 0x8cd. */
s32 ProgressionFlags_TestGate8CD(void)
{
    return ProgressionFlags_TestGate7C0_8CD_7D2() && GameWork_TestFlag(gGameWork, 0x8cd);
}

/* Extend the 0x840dc milestone with flags 0x1ff and 0x76f. */
s32 ProgressionFlags_TestGate1FF_76F(void)
{
    static const u16 flags[] = {0x1ff, 0x76f};
    return ProgressionFlags_TestMilestoneBE1() && AllFlags(flags, 2);
}

/* Require the paired flags used by the shared 0x84b10 prerequisite. */
s32 ProgressionFlags_TestGate755_770(void)
{
    static const u16 flags[] = {0x755, 0x770};
    return AllFlags(flags, 2);
}

/* Return the normalized state of progression flag 0x757. */
s32 ProgressionFlags_TestFlag757(void)
{
    return GameWork_TestFlag(gGameWork, 0x757) != 0;
}

/* Extend the 0x840dc branch through its shared gate and five flags. */
s32 ProgressionFlags_TestGate065_771_805_8CB_7AD(void)
{
    static const u16 flags[] = {0x065, 0x771, 0x805, 0x8cb, 0x7ad};
    return ProgressionFlags_TestMilestoneBE1() && ProgressionFlags_TestGate755_770() && AllFlags(flags, 5);
}

/* Require progression flags 0x78f and 0x778. */
s32 ProgressionFlags_TestGate78F_778(void)
{
    static const u16 flags[] = {0x78f, 0x778};
    return AllFlags(flags, 2);
}

/* Return the normalized state of progression flag 0x78d. */
s32 ProgressionFlags_TestFlag78D(void)
{
    return GameWork_TestFlag(gGameWork, 0x78d) != 0;
}

/* Extend the 0x849f4 milestone with flags 0x797, 0x7e0, and 0x7a8. */
s32 ProgressionFlags_TestGate797_7E0_7A8(void)
{
    static const u16 flags[] = {0x797, 0x7e0, 0x7a8};
    return ProgressionFlags_TestMilestoneBE3() && AllFlags(flags, 3);
}

/* Extend the 0x84404 branch with progression flag 0x7af. */
s32 ProgressionFlags_TestGate7AF_From84404(void)
{
    return ProgressionFlags_TestGate065_771_805_8CB_7AD() && GameWork_TestFlag(gGameWork, 0x7af);
}

/* Extend the 0x845a0 branch with progression flag 0x7af. */
s32 ProgressionFlags_TestGate7AF_From845A0(void)
{
    return ProgressionFlags_TestMilestoneBE2() && GameWork_TestFlag(gGameWork, 0x7af);
}

/* Return the normalized state of progression flag 0x7c9. */
s32 ProgressionFlags_TestFlag7C9(void)
{
    return GameWork_TestFlag(gGameWork, 0x7c9) != 0;
}

/* Extend the 0x8514c milestone with progression flag 0x7d1. */
s32 ProgressionFlags_TestGate7D1(void)
{
    return ProgressionFlags_TestMilestoneBE4() && GameWork_TestFlag(gGameWork, 0x7d1);
}

/* Extend two shared prerequisites with progression flag 0x7a9. */
s32 ProgressionFlags_TestGate7A9(void)
{
    return ProgressionFlags_TestGate797_7E0_7A8() && ProgressionFlags_TestGateBE5_7DC_7F3_8B5_7A8() &&
           GameWork_TestFlag(gGameWork, 0x7a9);
}

/* Extend the shared 0x87ddc prerequisite with progression flag 0x7f8. */
s32 ProgressionFlags_TestGate7F8(void)
{
    return ProgressionFlags_TestGate8B8_7B9_7F7() && GameWork_TestFlag(gGameWork, 0x7f8);
}

/* Extend the shared 0x859e8 prerequisite with its eight ordered flags. */
s32 ProgressionFlags_TestGate7FA_7FC(void)
{
    static const u16 flags[] = {
        0xbe7, 0x80d, 0x7ff, 0x803, 0x805, 0x80f, 0x811, 0x829
    };
    return ProgressionFlags_TestGateBE6_7EB_7FB_8D1_8B3() && AllFlags(flags, 8);
}

/* Join the 0x85f38 and 0x84404 branches, then require flag 0x806. */
s32 ProgressionFlags_TestGate806(void)
{
    return ProgressionFlags_TestGate7FA_7FC() && ProgressionFlags_TestGate065_771_805_8CB_7AD() &&
           GameWork_TestFlag(gGameWork, 0x806);
}

/* Require the standalone ordered progression flags 0x808, 0xc8, and 0x81. */
s32 ProgressionFlags_TestGate808_0C8_081(void)
{
    static const u16 flags[] = {0x808, 0x0c8, 0x081};
    return AllFlags(flags, 3);
}

/* Extend the shared 0x86054 prerequisite with progression flag 0x802. */
s32 ProgressionFlags_TestGate802(void)
{
    return ProgressionFlags_TestGate800_801() && GameWork_TestFlag(gGameWork, 0x802);
}

/* Extend the shared 0x8821c prerequisite with progression flag 0x80c. */
s32 ProgressionFlags_TestGate80C(void)
{
    return ProgressionFlags_TestGate8CE_80B() && GameWork_TestFlag(gGameWork, 0x80c);
}

/* Extend the shared 0x86264 prerequisite with progression flag 0x826. */
s32 ProgressionFlags_TestGate826(void)
{
    return ProgressionFlags_TestGateBE8_815_82F_817_827_829_8D3_825() && GameWork_TestFlag(gGameWork, 0x826);
}

/* Join the 0x85f38/final chains and require progression flag 0x80e. */
s32 ProgressionFlags_TestGate80E(void)
{
    return ProgressionFlags_TestGate7FA_7FC() && func_020857ac() &&
           GameWork_TestFlag(gGameWork, 0x80e);
}

/* Extend the shared 0x859e8 prerequisite with progression flag 0x8b4. */
s32 ProgressionFlags_TestGate8B4(void)
{
    return ProgressionFlags_TestGateBE6_7EB_7FB_8D1_8B3() && GameWork_TestFlag(gGameWork, 0x8b4);
}

/* Preserve the retail repeated 0x770 gate after the shared prerequisites. */
s32 ProgressionFlags_TestGate770(void)
{
    return ProgressionFlags_TestMilestoneBE1() && ProgressionFlags_TestGate755_770() &&
           GameWork_TestFlag(gGameWork, 0x770);
}

/* Return the normalized state of progression flag 0x78c. */
s32 ProgressionFlags_TestFlag78C(void)
{
    return GameWork_TestFlag(gGameWork, 0x78c) != 0;
}

/* Extend the 0x84404 branch with progression flag 0x7ad. */
s32 ProgressionFlags_TestGate7AD(void)
{
    return ProgressionFlags_TestGate065_771_805_8CB_7AD() && GameWork_TestFlag(gGameWork, 0x7ad);
}

/* Extend two shared prerequisites with progression flag 0x7a8. */
s32 ProgressionFlags_TestGate7A8(void)
{
    return ProgressionFlags_TestGate797_7E0_7A8() && ProgressionFlags_TestGateBE5_7DC_7F3_8B5_7A8() &&
           GameWork_TestFlag(gGameWork, 0x7a8);
}

/* Extend the shared 0x87ddc prerequisite with progression flag 0x7f7. */
s32 ProgressionFlags_TestGate7F7(void)
{
    return ProgressionFlags_TestGate8B8_7B9_7F7() && GameWork_TestFlag(gGameWork, 0x7f7);
}

/* Extend the shared 0x859e8 prerequisite with progression flag 0x7fd. */
s32 ProgressionFlags_TestGate7FD(void)
{
    return ProgressionFlags_TestGateBE6_7EB_7FB_8D1_8B3() && GameWork_TestFlag(gGameWork, 0x7fd);
}

/* Extend the shared 0x85f38 prerequisite with progression flag 0x7ff. */
s32 ProgressionFlags_TestGate7FF(void)
{
    return ProgressionFlags_TestGate7FA_7FC() && GameWork_TestFlag(gGameWork, 0x7ff);
}

/* Join the 0x85f38 and 0x84404 branches, then require flag 0x805. */
s32 ProgressionFlags_TestGate805(void)
{
    return ProgressionFlags_TestGate7FA_7FC() && ProgressionFlags_TestGate065_771_805_8CB_7AD() &&
           GameWork_TestFlag(gGameWork, 0x805);
}

/* Return the normalized state of progression flag 0x807. */
s32 ProgressionFlags_TestFlag807(void)
{
    return GameWork_TestFlag(gGameWork, 0x807) != 0;
}

/* Extend the shared 0x86054 prerequisite with progression flag 0x801. */
s32 ProgressionFlags_TestGate801(void)
{
    return ProgressionFlags_TestGate800_801() && GameWork_TestFlag(gGameWork, 0x801);
}

/* Extend the shared 0x8821c prerequisite with progression flag 0x80b. */
s32 ProgressionFlags_TestGate80B(void)
{
    return ProgressionFlags_TestGate8CE_80B() && GameWork_TestFlag(gGameWork, 0x80b);
}

/* Extend the shared 0x86264 prerequisite with progression flag 0x825. */
s32 ProgressionFlags_TestGate825(void)
{
    return ProgressionFlags_TestGateBE8_815_82F_817_827_829_8D3_825() && GameWork_TestFlag(gGameWork, 0x825);
}

/* Join the 0x85f38/final chains and require progression flag 0x80d. */
s32 ProgressionFlags_TestGate80D(void)
{
    return ProgressionFlags_TestGate7FA_7FC() && func_020857ac() &&
           GameWork_TestFlag(gGameWork, 0x80d);
}

/* Extend the shared 0x859e8 prerequisite with progression flag 0x8b3. */
s32 ProgressionFlags_TestGate8B3(void)
{
    return ProgressionFlags_TestGateBE6_7EB_7FB_8D1_8B3() && GameWork_TestFlag(gGameWork, 0x8b3);
}

/* Secondary-table classification paired with the 0x857ac query. */
s32 func_020895a8(void)
{
    return ProgressionFlags_TestMilestoneBE3() && GameWork_TestFlag(gGameWork, 0x7ca);
}

/* Return the normalized state of the bedroom-exit progression flag. */
s32 func_0208869c(void)
{
    return GameWork_TestFlag(gGameWork, 0x73a) != 0;
}

/* Return the normalized state of progression flag 0x740. */
s32 func_020887d4(void)
{
    return GameWork_TestFlag(gGameWork, 0x740) != 0;
}

/* Return the normalized state of progression flag 0x747. */
s32 func_02088b08(void)
{
    return GameWork_TestFlag(gGameWork, 0x747) != 0;
}

/* Test flag 0x73c and return a normalized result. */
s32 func_02088704(void) { return GameWork_TestFlag(gGameWork, 0x73c) != 0; }
/* Test flag 0x73d and return a normalized result. */
s32 func_02088730(void) { return GameWork_TestFlag(gGameWork, 0x73d) != 0; }
/* Test flag 0x73f and return a normalized result. */
s32 func_020887a8(void) { return GameWork_TestFlag(gGameWork, 0x73f) != 0; }
/* Test flag 0x790 and return a normalized result. */
s32 func_020887fc(void) { return GameWork_TestFlag(gGameWork, 0x790) != 0; }
/* Test flag 0x792 and return a normalized result. */
s32 func_02088824(void) { return GameWork_TestFlag(gGameWork, 0x792) != 0; }
/* Test flag 0x7a6 and return a normalized result. */
s32 func_02088850(void) { return GameWork_TestFlag(gGameWork, 0x7a6) != 0; }
/* Test flag 0x7bc and return a normalized result. */
s32 func_0208887c(void) { return GameWork_TestFlag(gGameWork, 0x7bc) != 0; }
/* Test flag 0x7de and return a normalized result. */
s32 func_020888a8(void) { return GameWork_TestFlag(gGameWork, 0x7de) != 0; }
/* Test flag 0x7e6 and return a normalized result. */
s32 func_020888d4(void) { return GameWork_TestFlag(gGameWork, 0x7e6) != 0; }
/* Test flag 0x7fe and return a normalized result. */
s32 func_02088900(void) { return GameWork_TestFlag(gGameWork, 0x7fe) != 0; }
/* Test flag 0x814 and return a normalized result. */
s32 func_0208892c(void) { return GameWork_TestFlag(gGameWork, 0x814) != 0; }
/* Test flag 0x842 and return a normalized result. */
s32 func_02088958(void) { return GameWork_TestFlag(gGameWork, 0x842) != 0; }
/* Test flag 0x844 and return a normalized result. */
s32 func_02088984(void) { return GameWork_TestFlag(gGameWork, 0x844) != 0; }
/* Test flag 0x742 and return a normalized result. */
s32 func_020889ec(void) { return GameWork_TestFlag(gGameWork, 0x742) != 0; }
/* Test flag 0x750 and return a normalized result. */
s32 func_02088e78(void) { return GameWork_TestFlag(gGameWork, 0x750) != 0; }
/* Test flag 0x751 and return a normalized result. */
s32 func_02088ea0(void) { return GameWork_TestFlag(gGameWork, 0x751) != 0; }
/* Test flag 0x752 and return a normalized result. */
s32 func_02088ecc(void) { return GameWork_TestFlag(gGameWork, 0x752) != 0; }
/* Test flag 0x753 and return a normalized result. */
s32 func_02088ef8(void) { return GameWork_TestFlag(gGameWork, 0x753) != 0; }
/* Test flag 0x78e and return a normalized result. */
s32 func_02088f24(void) { return GameWork_TestFlag(gGameWork, 0x78e) != 0; }
/* Test flag 0x75c and return a normalized result. */
s32 func_02088f8c(void) { return GameWork_TestFlag(gGameWork, 0x75c) != 0; }

/* Extend the shared chain through the six flags used at 0x8514c. */
s32 ProgressionFlags_TestMilestoneBE4(void)
{
    static const u16 flags[] = {0xbe4, 0x7ac, 0x7b2, 0x7bd, 0x7d0, 0x8cf};
    return ProgressionFlags_TestMilestoneBE3() && AllFlags(flags, 6);
}

/* Primary-table classification for indexed runtime entry 80. */
s32 func_02085834(void)
{
    return ProgressionFlags_TestMilestoneBE4() && GameWork_TestFlag(gGameWork, 0x7cf);
}

/* Secondary-table classification for indexed runtime entry 80. */
s32 func_02089610(void)
{
    return ProgressionFlags_TestMilestoneBE4() && GameWork_TestFlag(gGameWork, 0x7ce);
}

/* Establish the shared branch leading to indexed runtime entry 41. */
s32 func_02084754(void)
{
    static const u16 flags[] = {0x1f4, 0x77b, 0x788, 0x8aa, 0x8cf};
    return ProgressionFlags_TestMilestoneBE2() && AllFlags(flags, 5);
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
    return ProgressionFlags_TestMilestoneBE2() && AllFlags(flags, 2);
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

/* Extend the initial chain with flag 0x73b. */
s32 func_020886c8(void) { return func_02083af8() && GameWork_TestFlag(gGameWork, 0x73b); }
/* Extend the 0x83d84 gate with flag 0x741. */
s32 func_020889b0(void) { return ProgressionFlags_TestGate396_765() && GameWork_TestFlag(gGameWork, 0x741); }
/* Extend the 0x83d38 gate with flag 0x743. */
s32 func_02088a18(void) { return func_02083d38() && GameWork_TestFlag(gGameWork, 0x743); }
/* Extend the 0x83ba4 chain with flag 0x744. */
s32 func_02088a54(void) { return func_02083ba4() && GameWork_TestFlag(gGameWork, 0x744); }
/* Extend the 0x840dc chain with flag 0x745. */
s32 func_02088a90(void) { return ProgressionFlags_TestMilestoneBE1() && GameWork_TestFlag(gGameWork, 0x745); }
/* Extend the initial chain with flag 0x746. */
s32 func_02088acc(void) { return func_02083af8() && GameWork_TestFlag(gGameWork, 0x746); }
/* Extend the 0x840dc chain with flag 0x749. */
s32 func_02088b60(void) { return ProgressionFlags_TestMilestoneBE1() && GameWork_TestFlag(gGameWork, 0x749); }
/* Extend the 0x840dc chain with flag 0x74a. */
s32 func_02088be4(void) { return ProgressionFlags_TestMilestoneBE1() && GameWork_TestFlag(gGameWork, 0x74a); }
/* Extend the 0x840dc chain with flag 0x759. */
s32 func_02088c5c(void) { return ProgressionFlags_TestMilestoneBE1() && GameWork_TestFlag(gGameWork, 0x759); }
/* Extend the 0x845a0 chain with flag 0x74e. */
s32 func_02088c98(void) { return ProgressionFlags_TestMilestoneBE2() && GameWork_TestFlag(gGameWork, 0x74e); }
/* Extend the 0x845a0 chain with flag 0x77a. */
s32 func_02088d10(void) { return ProgressionFlags_TestMilestoneBE2() && GameWork_TestFlag(gGameWork, 0x77a); }
/* Extend the 0x87c6c chain with flag 0x77c. */
s32 func_02088d4c(void) { return func_02087c6c() && GameWork_TestFlag(gGameWork, 0x77c); }
/* Extend the 0x84d88 chain with flag 0x77e. */
s32 func_02088d88(void) { return func_02084d88() && GameWork_TestFlag(gGameWork, 0x77e); }
/* Extend the 0x845a0 chain with flag 0x785. */
s32 func_02088e3c(void) { return ProgressionFlags_TestMilestoneBE2() && GameWork_TestFlag(gGameWork, 0x785); }
/* Extend the 0x84754 chain with flag 0x787. */
s32 func_02088f50(void) { return func_02084754() && GameWork_TestFlag(gGameWork, 0x787); }
/* Extend the 0x845a0 chain with flag 0x78a. */
s32 func_02088fb8(void) { return ProgressionFlags_TestMilestoneBE2() && GameWork_TestFlag(gGameWork, 0x78a); }
/* Extend the 0x849f4 chain with flag 0x796. */
s32 func_0208906c(void) { return ProgressionFlags_TestMilestoneBE3() && GameWork_TestFlag(gGameWork, 0x796); }
/* Extend the 0x849f4 chain with flag 0x79a. */
s32 func_020890d4(void) { return ProgressionFlags_TestMilestoneBE3() && GameWork_TestFlag(gGameWork, 0x79a); }
/* Extend the 0x849f4 chain with flag 0x79e. */
s32 func_0208913c(void) { return ProgressionFlags_TestMilestoneBE3() && GameWork_TestFlag(gGameWork, 0x79e); }
/* Extend the 0x849f4 chain with flag 0x7aa. */
s32 func_020891e0(void) { return ProgressionFlags_TestMilestoneBE3() && GameWork_TestFlag(gGameWork, 0x7aa); }
/* Extend the 0x845a0 chain with flag 0x7ae. */
s32 func_02089258(void) { return ProgressionFlags_TestMilestoneBE2() && GameWork_TestFlag(gGameWork, 0x7ae); }
/* Extend the 0x8514c chain with flag 0x7b2. */
s32 func_020892bc(void) { return ProgressionFlags_TestMilestoneBE4() && GameWork_TestFlag(gGameWork, 0x7b2); }
/* Extend the 0x8514c chain with flag 0x7bd. */
s32 func_0208948c(void) { return ProgressionFlags_TestMilestoneBE4() && GameWork_TestFlag(gGameWork, 0x7bd); }
/* Extend the 0x8514c chain with flag 0x7bf. */
s32 func_02089504(void) { return ProgressionFlags_TestMilestoneBE4() && GameWork_TestFlag(gGameWork, 0x7bf); }
/* Extend the 0x849f4 chain with flag 0x7c7. */
s32 func_02089540(void) { return ProgressionFlags_TestMilestoneBE3() && GameWork_TestFlag(gGameWork, 0x7c7); }
/* Extend the 0x8514c chain with flag 0x7d0. */
s32 func_0208964c(void) { return ProgressionFlags_TestMilestoneBE4() && GameWork_TestFlag(gGameWork, 0x7d0); }

/* Test flag 0x748 and return a normalized result. */
s32 func_02088b34(void) { return GameWork_TestFlag(gGameWork, 0x748) != 0; }
/* Test flag 0x781 and return a normalized result. */
s32 func_02088e10(void) { return GameWork_TestFlag(gGameWork, 0x781) != 0; }
/* Test flag 0x798 and return a normalized result. */
s32 func_020890a8(void) { return GameWork_TestFlag(gGameWork, 0x798) != 0; }
/* Test flag 0x79c and return a normalized result. */
s32 func_02089110(void) { return GameWork_TestFlag(gGameWork, 0x79c) != 0; }
/* Test flag 0x7a2 and return a normalized result. */
s32 func_02089178(void) { return GameWork_TestFlag(gGameWork, 0x7a2) != 0; }
/* Test flag 0x7b0 and return a normalized result. */
s32 func_02089294(void) { return GameWork_TestFlag(gGameWork, 0x7b0) != 0; }
/* Test flag 0x7bb and return a normalized result. */
s32 func_02089460(void) { return GameWork_TestFlag(gGameWork, 0x7bb) != 0; }
/* Test flag 0x7c8 and return a normalized result. */
s32 func_0208957c(void) { return GameWork_TestFlag(gGameWork, 0x7c8) != 0; }
/* Test flag 0x7cc and return a normalized result. */
s32 func_020895e4(void) { return GameWork_TestFlag(gGameWork, 0x7cc) != 0; }

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
