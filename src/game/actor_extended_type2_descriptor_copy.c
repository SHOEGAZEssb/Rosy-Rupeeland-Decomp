#include "tingle/types.h"

/* Copy and conditionally amend a descriptor record for an extended type-two actor. */
extern u8 data_020e8380[];
extern u8 *data_021052fc;

/* Return whether an actor's virtual +0xa8 reports nonzero. */
static s32 actorIsActive(void *object)
{
    return (*(s32 (**)(void *))(*(u8 **)object + 0xa8))(object) != 0;
}

/*
 * Copy the complete 0x30-byte record selected by actor halfword +0x4e from
 * data_020e8380 to output. For output halfword +0x1a, actor +0x260 bit 0x200
 * forces bit zero clear. Otherwise bit zero is set when actor +0x14 bit
 * 0x10000 is set, or when bit 0x20000 is set and primary runtime actor +0x2ea4
 * passes virtual +0xa8. If descriptor bit 0x80 is set, set bit four when the
 * primary actor passes that virtual; if it does not, try non-null secondary
 * actor +0x2ea8. Returns no value; output changes and runtime actor virtuals
 * may have observable effects. Descriptor field meanings remain unconfirmed.
 */
void func_0203f2ec(const void *self, void *output)
{
    const u8 *actor = (const u8 *)self;
    u8 *destination = (u8 *)output;
    const u8 *record = data_020e8380 + *(const u16 *)(actor + 0x4e) * 0x30;
    s32 index;

    for (index = 0; index < 0x30; ++index)
        destination[index] = record[index];

    if ((*(const u32 *)(actor + 0x260) & 0x200) != 0) {
        *(u16 *)(destination + 0x1a) &= ~1;
    } else if ((*(const u32 *)(actor + 0x14) & 0x10000) != 0 ||
               ((*(const u32 *)(actor + 0x14) & 0x20000) != 0 &&
                actorIsActive(*(void **)(data_021052fc + 0x2ea4)))) {
        *(u16 *)(destination + 0x1a) |= 1;
    }

    if ((*(u16 *)(destination + 0x1a) & 0x80) != 0) {
        void *primary = *(void **)(data_021052fc + 0x2ea4);
        s32 set = actorIsActive(primary);
        if (!set) {
            void *secondary = *(void **)(data_021052fc + 0x2ea8);
            if (secondary != 0)
                set = actorIsActive(secondary);
        }
        if (set)
            *(u16 *)(destination + 0x1a) |= 4;
    }
}
