#include "tingle/game_work.h"
#include "tingle/types.h"

/*
 * Query the fixed metadata tables used by game phases and their area variants.
 * The 0x58-byte phase record layout and several smaller record formats are
 * only partly confirmed, so accessors retain offset-oriented names while
 * documenting their exact indexing and fallback behavior.
 */
typedef struct GamePhaseMetadata {
    u8 field_00[0x40];
    u32 flags_40;
    s32 field_44;
    u8 field_48[4];
    s8 variant_4c;
    s8 field_4d;
    s8 coordinateX_4e;
    s8 coordinateY_4f;
    u8 field_50[8];
} GamePhaseMetadata;

typedef char GamePhaseMetadataSizeCheck[
    sizeof(GamePhaseMetadata) == 0x58 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
extern const GamePhaseMetadata data_020d8ae4[];
extern const s32 data_020d4850[];
extern const s32 data_020d4854[];
extern const u8 data_020d4860[];
extern const u8 data_020d4864[];
extern const u8 data_020d4640[];
extern const u8 data_020d4740[];
#ifdef __cplusplus
}
#endif

/* Return the indexed 0x58-byte game-phase metadata record. */
const GamePhaseMetadata *func_02028388(s32 index)
{
    return &data_020d8ae4[index];
}

/*
 * For a one-based phase ID, derive two coordinates by subtracting the
 * variant-indexed entries in data_020d4850/54 from record bytes 0x4e/0x4f.
 * Only destination offsets 4 and 8 are modified.
 */
void func_0202839c(void *destination, s32 phaseId)
{
    const GamePhaseMetadata *record = &data_020d8ae4[phaseId - 1];
    *(s32 *)((u8 *)destination + 4) =
        record->coordinateX_4e - data_020d4850[record->variant_4c * 6];
    *(s32 *)((u8 *)destination + 8) =
        record->coordinateY_4f - data_020d4854[record->variant_4c * 6];
}

/*
 * Return a record-derived 16-bit value. Mode bits 18..19 equal to one select
 * the first halfword through the variant's 0x18-byte pointer-table entry;
 * other modes return offset 0x44, replacing -1 with the fixed value 0x9b.
 */
u16 func_02028404(const GamePhaseMetadata *record)
{
    if (((record->flags_40 >> 18) & 3) == 1) {
        const u8 *entry = data_020d4864 + record->variant_4c * 0x18;
        return **(u16 *const *)entry;
    }
    return record->field_44 == -1 ? 0x9b : (u16)record->field_44;
}

/*
 * Return whether a record permits the associated area behavior. Mode two is
 * always permitted. Otherwise a nonnegative variant requires the first flag
 * at pointed-record offset 0x1e to be set and the second at 0x20 to be clear.
 */
s32 func_0202844c(const GamePhaseMetadata *record)
{
    const u8 *entry;
    const u8 *pointed;
    u16 flag0;
    u16 flag1;
    if (((record->flags_40 >> 18) & 3) == 2)
        return 1;
    if (record->variant_4c < 0)
        return 0;
    entry = data_020d4864 + record->variant_4c * 0x18;
    pointed = *(const u8 *const *)entry;
    flag0 = *(const u16 *)(pointed + 0x1e);
    flag1 = *(const u16 *)(pointed + 0x20);
    return GameWork_TestFlag(gGameWork, flag0) &&
           !GameWork_TestFlag(gGameWork, flag1);
}

/* Return an indexed 0x10-byte graphics/resource metadata record. */
const u8 *func_020284e0(s32 index)
{
    return data_020d4640 + index * 0x10;
}

/* Return the 0x1e-byte record selected by phase metadata offset 0x4c. */
const u8 *func_020284f0(const GamePhaseMetadata *record)
{
    return data_020d4740 + record->variant_4c * 0x1e;
}

/* Extract and sign-extend phase flag bits 12..15 for a one-based phase ID. */
s32 func_02028508(s32 phaseId)
{
    return (s32)(data_020d8ae4[phaseId - 1].flags_40 << 16) >> 28;
}

/* Return the pointer stored at variant*0x18 in data_020d4860. */
const void *func_0202852c(s32 variant)
{
    return *(const void *const *)(data_020d4860 + variant * 0x18);
}
