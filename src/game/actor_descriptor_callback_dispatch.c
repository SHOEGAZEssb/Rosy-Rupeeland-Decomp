#include "tingle/types.h"

/* Apply the optional script carried by an actor spawn descriptor. */

/*
 * If descriptor+0x2c is null, return without changes. Otherwise, when the actor
 * has a primary attachment at +0x54, clear attachment mask 0x0002 and set mask
 * 0x0001 in its halfword +0x24, then invoke actor vtable slot +0x74 with the
 * borrowed script. All known implementations of that slot assign the primary
 * actor script. Returns no value; the virtual callback updates actor script and
 * presentation state. The descriptor and its script must remain valid for the
 * callback's storage contract.
 */
void Actor_ApplySpawnDescriptorScript(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)self;
    const u8 *descriptorBytes = (const u8 *)descriptor;
    const s8 *script = *(const s8 *const *)(descriptorBytes + 0x2c);
    u8 *primaryAttachment;
    void (*assignScript)(void *, const s8 *);

    if (script == 0) return;
    primaryAttachment = *(u8 **)(actor + 0x54);
    if (primaryAttachment != 0) {
        *(u16 *)(primaryAttachment + 0x24) &= (u16)~0x0002;
        *(u16 *)(primaryAttachment + 0x24) |= 0x0001;
    }
    assignScript =
        *(void (**)(void *, const s8 *))(*(u8 **)actor + 0x74);
    /* Retail rereads +0x2c after the attachment writes. */
    assignScript(actor,
                 *(const s8 *const *)(descriptorBytes + 0x2c));
}
