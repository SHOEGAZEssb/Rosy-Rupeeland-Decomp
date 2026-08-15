#include "tingle/types.h"

/* Overlay 27 compact state-record initialization and teardown helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov027_021fee60[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *);
#ifdef __cplusplus
}
#endif

/* Installs vtable 0x021FEE60 and clears words +4/+8/+0xC. Returns void. */
extern "C" void func_ov027_021fd9c8(void *record)
{
    FIELD(const void *, record, 0) = data_ov027_021fee60;
    FIELD(s32, record, 8) = 0;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 0xc) = 0;
}

/* Restores vtable 0x021FEE60, runs common teardown, and returns `record`. */
extern "C" void *func_ov027_021fd9e8(void *record)
{
    FIELD(const void *, record, 0) = data_ov027_021fee60;
    PresentationList_DeleteAll(record);
    return record;
}

/* Stores inputs at +0x24/+0x28 and clears state words +4/+8. Returns void. */
extern "C" void func_ov027_021fda08(void *record, s32 value24, s32 value28)
{
    FIELD(s32, record, 0x24) = value24;
    FIELD(s32, record, 0x28) = value28;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 8) = 0;
}
