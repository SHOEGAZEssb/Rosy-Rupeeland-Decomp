#include "tingle/types.h"

/*
 * Overlay 0 transient-state cleanup. This recovered helper marks an attached
 * record as released and clears the owner's reference to it.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000TransientOwner {
    u8 field_00[0x1c];
    void *record_1c;
} Overlay000TransientOwner;

/*
 * If owner has a record at field 0x1C, write 0x0100 to that record's halfword
 * at offset 0x32 and clear the reference. The meaning of the halfword is not
 * yet confirmed. The function returns no value and calls no SDK or hardware
 * service.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc3a4(Overlay000TransientOwner *owner)
{
    if (owner->record_1c != 0) {
        FIELD(u16, owner->record_1c, 0x32) = 0x100;
        owner->record_1c = 0;
    }
}
